#include "reqs.h"
#include "csapp.h"
#include "conns.h"
#include "proxy.h"
#include "network.h"
#include "hashmap.h"
#include "text.h"
#include "cache.h"
#include "MITLogModule.h"

#define CHECK_CRLF(header, len)                                 \
  (((len) == 1 && header[0] == '\n') ||                         \
   ((len) == 2 && header[0] == '\r' && header[1] == '\n'))
#define CHECK_LWS(header, len)                                  \
  ((len) > 0 && (header[0] == ' ' || header[0] == '\t'))

int socket_nonblocking (int sock)
{
    int flags;
    assert (sock >= 0);
    flags = fcntl (sock, F_GETFL, 0);
    return fcntl (sock, F_SETFL, flags | O_NONBLOCK);
}

int socket_blocking (int sock)
{
    int flags;
    assert (sock >= 0);
    flags = fcntl (sock, F_GETFL, 0);
    return fcntl (sock, F_SETFL, flags & ~O_NONBLOCK);
}

int getpeer_information (int fd, char *ipaddr, char *string_addr)
{
    struct sockaddr_storage sa;
    socklen_t salen = sizeof sa;

    assert (fd >= 0);
    assert (ipaddr != NULL);
    assert (string_addr != NULL);

    ipaddr[0] = '\0';
    strlcpy (string_addr, "[unknown]", HOSTNAME_LENGTH);

    if (getpeername (fd, (struct sockaddr *) &sa, &salen) != 0)
        return -1;

    if (get_ip_string ((struct sockaddr *) &sa, ipaddr, IP_LENGTH) == NULL)
        return -1;

    return getnameinfo ((struct sockaddr *) &sa, salen,
                        string_addr, HOSTNAME_LENGTH, NULL, 0, 0);
}

static int read_request_line (struct conn_s *connptr)
{
    ssize_t len;
    while(1){
        len = readline(connptr->client_fd, &connptr->request_line);
        if(len < 0){
            MITLogWrite(MITLOG_LEVEL_ERROR, 
                        "read_request_line: Client (file descriptor: %d) "
                        "closed socket before read.", connptr->client_fd);
            return -1;
        }

        if(len == 0) return 0;

        if(chomp(connptr->request_line, len) != len){
            break;
        }
        Free(connptr -> request_line);
    }
    //MITLogWrite(MITLOG_LEVEL_COMMON, "Request (file descriptor %d): %s",
    //            connptr->client_fd, connptr->request_line);
    return 0;
}

static void free_request_struct (struct request_s *request)
{
    if (!request)
        return;

    Free(request->method);
    Free(request->protocol);

    if (request->host)
        Free(request->host);
    if (request->path)
        Free(request->path);

    Free(request);
}

static void strip_username_password (char *host)
{
    char *p;

    assert (host);
    assert (strlen (host) > 0);

    if ((p = strchr (host, '@')) == NULL)
        return;

    p++;
    while (*p)
        *host++ = *p++;
    *host = '\0';
}

static int strip_return_port (char *host)
{
    char *ptr1;
    char *ptr2;
    int port;

    ptr1 = strrchr(host, ':');
    if (ptr1 == NULL)
        return 0;

    ptr2 = strchr(ptr1, ']');
    if (ptr2 != NULL)
        return 0;

    *ptr1++ = '\0';
    if (sscanf(ptr1, "%d", &port) != 1)
        return 0;
    return port;
}

static int extract_http_url (const char *url, struct request_s *request)
{
    char *p;
    int len;
    int port;

    p = strchr (url, '/');
    if (p != NULL) {
        len = p - url;
        request->host = (char *) Malloc (len + 1);
        memcpy (request->host, url, len);
        request->host[len] = '\0';
        request->path = strdup (p);
    } else {
        request->host = strdup (url);
        request->path = strdup ("/");
    }

    if (!request->host || !request->path){
        if (request->host)
            Free (request->host);
        if (request->path)
            Free (request->path);
        return -1;
    }

    strip_username_password (request->host);

    port = strip_return_port (request->host);
    request->port = (port != 0) ? port : HTTP_PORT;

    p = strrchr (request->host, ']');
    if (p && (*(request->host) == '[')) {
        request->host++;
        *p = '\0';
    }

    return 0;
}

static int extract_ssl_url (const char *url, struct request_s *request)
{
    request->host = (char *) Malloc(strlen (url) + 1);
    if (!request->host)
            return -1;

    if (sscanf (url, "%[^:]:%d", request->host, &request->port) == 2) ;
    else if (sscanf(url, "%s", request->host) == 1)
        request->port = HTTP_PORT_SSL;
    else {
        MITLogWrite(MITLOG_LEVEL_COMMON, "extract_ssl_url: Can't parse URL.");
        Free (request->host);
        return -1;
    }

    strip_username_password (request->host);

    return 0;
}

static struct request_s *process_request (struct conn_s *connptr)
{
    char *url;
    struct request_s *request;
    int ret;
    size_t request_len;
    request = (struct request_s *)Calloc(1, sizeof(struct request_s));
    if (!request) return NULL;
    request_len = strlen (connptr->request_line) + 1;
    request->method = (char*)Malloc(sizeof(char) * request_len);
    url = (char*)Malloc(sizeof(char) * request_len);
    request -> protocol = (char*)Malloc(sizeof(char) * request_len);

    ret = sscanf(connptr->request_line, "%[^ ] %[^ ] %[^ ]",
                 request->method, url, request->protocol);
    if (ret == 2 && !strcasecmp(request->method, "GET")){
        request -> protocol[0] = 0;
        connptr -> protocol.major = 0;
        connptr -> protocol.minor = 9;
    } else if (ret == 3 && !strncasecmp(request->protocol, "HTTP/", 5)){
        ret = sscanf (request->protocol + 5, "%u.%u",
                      &connptr->protocol.major,
                      &connptr->protocol.minor);
        if(ret != 2){
            MITLogWrite(MITLOG_LEVEL_ERROR, "process_request: Bad Request on file descriptor %d",
                    connptr->client_fd); 
            goto fail;
        }
    } else {
        MITLogWrite(MITLOG_LEVEL_ERROR, "process_request: Bad Request on file descriptor %d",
                connptr->client_fd); 
        goto fail;
    }

    if (!url) {
        //MITLogWrite(MITLOG_LEVEL_ERROR, "process_request: Null URL on file descriptor %d",
        //        connptr->client_fd);
        goto fail;
    }

    if (strncasecmp (url, "http://", 7) == 0){
        char *skipped_type = strstr (url, "//") + 2;
        if (extract_http_url (skipped_type, request) < 0) {
            //MITLogWrite(MITLOG_LEVEL_ERROR, "process_request: Could not parse url %s on file descriptor %d",
            //        url, connptr->client_fd);
            goto fail;
        }
        connptr -> connect_method = 0;
    } else if (strcmp (request->method, "CONNECT") == 0) {
        if (extract_ssl_url (url, request) < 0) {
            //MITLogWrite(MITLOG_LEVEL_ERROR,  "process_request: Could not parse url %s on file descriptor %d",
            //        url, connptr->client_fd);
            goto fail;            
        }
        connptr -> connect_method = 1;
    }

    //Free(url);
    return request;
fail:
    //Free(url);
    free_request_struct(request);
    return NULL;
}

static int
add_header_to_connection (hashmap_t hashofheaders, char *header, size_t len)
{
    char *sep;
    len -= chomp (header, len);
    sep = strchr (header, ':');
    if (!sep)
        return -1;
    while (*sep == ':' || *sep == ' ' || *sep == '\t')
        *sep++ = '\0';
    len -= sep - header - 1; 
    return hashmap_insert (hashofheaders, header, sep, len);
}

static int get_all_headers (int fd, hashmap_t hashofheaders)
{
    char *line = NULL;
    char *header = NULL;
    char *tmp;
    ssize_t linelen;
    ssize_t len = 0;
    unsigned int double_cgi = 0;

    assert (fd >= 0);
    assert (hashofheaders != NULL);

    for (;;) {
        if ((linelen = readline (fd, &line)) <= 0) {
            Free (header);
            Free (line);
            return -1;
        }

        if (CHECK_CRLF (line, linelen) || !CHECK_LWS (line, linelen)) {
            if (!double_cgi
                && len > 0
                && add_header_to_connection (hashofheaders, header,
                                             len) < 0) {
                Free (header);
                Free (line);
                return -1;
            }
            len = 0;
        }

        if (CHECK_CRLF (line, linelen)) {
            Free (header);
            Free (line);
            return 0;
        }

        if (linelen >= 5 && strncasecmp (line, "HTTP/", 5) == 0) {
            double_cgi = 1;
        }

        tmp = (char *) Realloc (header, len + linelen);
        if (tmp == NULL) {
                Free (header);
                Free (line);
                return -1;
        }
        header = tmp;
        memcpy (header + len, line, linelen);
        len += linelen;
        Free (line);
    }
}

static long get_content_length (hashmap_t hashofheaders)
{
    ssize_t len;
    char *data;
    long content_length = -1;
    len = hashmap_entry_by_key (hashofheaders, "Content-Length",
                                (void **) &data);
    if (len > 0)
        content_length = atol (data);

    return content_length;
}

static int pull_client_data (struct conn_s *connptr, long int length)
{
    char *buffer;
    ssize_t len;
    buffer = (char *)Malloc(min(MAXBUFFSIZE, (unsigned long int)length));
    if(!buffer) return -1;
    do{
        len = safe_read(connptr->client_fd, buffer,
                        min(MAXBUFFSIZE, (unsigned long int)length));
        if(len <= 0){
            Free(buffer);
            return -1;
        }
        add_to_buffer(connptr -> cbuffer, buffer, len);
        length -= len;
    }while(length > 0);

    socket_nonblocking (connptr->client_fd);
    len = recv(connptr->client_fd, buffer, 2, MSG_PEEK);
    socket_blocking (connptr->client_fd);

    if (len < 0 && errno != EAGAIN){
        Free(buffer);
        return -1;
    }

    if ((len == 2) && CHECK_CRLF (buffer, len)) {
        ssize_t ret;
        ret = read (connptr->client_fd, buffer, 2);
        if (ret == -1) {
            MITLogWrite(MITLOG_LEVEL_COMMON, "Could not read two bytes from POST message");
        }
    }

    Free(buffer);
    return 0;
}

static int
process_client_headers (struct conn_s *connptr, hashmap_t hashofheaders,
                        struct request_s* request)
{
    static const char* skipheaders[] = {"Connection", "Proxy-Connection",
                                        "Accept", "Accept-Encoding", "User-Agent"};
    int i;
    hashmap_iter iter;
    char *data, *header;
    size_t size;
    char* buffer_line = NULL;

    size = strlen(request -> method) + strlen(request -> path) + 13;
    buffer_line = (char*)Malloc(size);
    snprintf(buffer_line, size, "%s %s HTTP/1.0\r\n", request -> method, request -> path);
    add_to_buffer(connptr -> cbuffer, buffer_line, size - 1);

    add_to_buffer(connptr -> cbuffer, "Connection: close\r\n", 19);
    add_to_buffer(connptr -> cbuffer, "Proxy-Connection: close\r\n", 25);
    add_to_buffer(connptr -> cbuffer, "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:10.0.3) Gecko/20120305 Firefox/10.0.3\r\n", 86);
    add_to_buffer(connptr -> cbuffer, "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n", 73);
    add_to_buffer(connptr -> cbuffer, "Accept-Encoding: gzip, deflate\r\n", 32);


    connptr->content_length.client = get_content_length (hashofheaders);
    for (i = 0; i != (sizeof (skipheaders) / sizeof (char *)); i++) {
        hashmap_remove(hashofheaders, skipheaders[i]);
    }

    iter = hashmap_first (hashofheaders);
    if (iter >= 0) {
        for (; !hashmap_is_end (hashofheaders, iter); ++iter) {
            hashmap_return_entry (hashofheaders,
                                  iter, &data, (void **) &header);
            size = strlen(data) + strlen(header) + 5;
            buffer_line = (char*)Malloc(sizeof(char) * size);
            snprintf(buffer_line, size, "%s: %s\r\n", data, header);
            add_to_buffer(connptr -> cbuffer, buffer_line, size - 1);
        }
    }

    add_to_buffer(connptr -> cbuffer, "\r\n", 2);
    if (connptr->content_length.client > 0) {
        return pull_client_data (connptr,connptr->content_length.client);
    }

    return 0;
}

int getsock_ip (int fd, char *ipaddr)
{
    struct sockaddr_storage name;
    socklen_t namelen = sizeof (name);

    assert (fd >= 0);

    if (getsockname (fd, (struct sockaddr *) &name, &namelen) != 0) {
        MITLogWrite(MITLOG_LEVEL_COMMON, "getsock_ip: getsockname() error: %s",
                    strerror(errno));
        return -1;
    }

    if (get_ip_string ((struct sockaddr *) &name, ipaddr, IP_LENGTH) ==
        NULL)
        return -1;

    return 0;
}

static int process_server_headers (struct conn_s *connptr)
{
    char *response_line;
    hashmap_t hashofheaders;
    hashmap_iter iter;
    char *line, *data, *header;
    ssize_t len, size;
    int ret;

    while(1){
        len = readline (connptr->server_fd, &response_line);
        if(len < 0) return -1;
        if(len == 0){
            add_to_buffer(connptr -> sbuffer, "\r\n", 2);
            return 0;
        }
        
        if (chomp (response_line, len) != len) {
            hashofheaders = hashmap_create (HEADER_BUCKETS);
            if (!hashofheaders) {
                Free(response_line);
                return -2;
            }
            if (get_all_headers (connptr->server_fd, hashofheaders) < 0) {
                MITLogWrite(MITLOG_LEVEL_COMMON, "Could not retrieve all the headers from the remote server.");
                hashmap_delete (hashofheaders);
                Free(response_line);
                return -3;
            }
            if (connptr->protocol.major < 1) {
                hashmap_delete (hashofheaders);
                Free(response_line);
                return -4;
            }

            line = (char*)Malloc(strlen(response_line) + 3);
            snprintf(line, strlen(response_line) + 3, "%s\r\n", response_line);
            add_to_buffer(connptr -> sbuffer, line, strlen(response_line) + 2);

            if(ret < 0){
                hashmap_delete(hashofheaders);
                return -5;
            }

            connptr->content_length.server = get_content_length (hashofheaders);
       
            iter = hashmap_first (hashofheaders);

            if (iter >= 0) {
                for (; !hashmap_is_end (hashofheaders, iter); ++iter) {
                    hashmap_return_entry (hashofheaders,
                                          iter, &data, (void **) &header);
                    size = strlen(data) + strlen(header) + 5;
                    line = (char*)Malloc(sizeof(char) * size);
                    snprintf(line, size, "%s: %s\r\n", data, header);
                    add_to_buffer(connptr -> sbuffer, line, size - 1);

                    if(ret < 0){
                        hashmap_delete(hashofheaders);
                        return -6;
                    }
                }
            }
            hashmap_delete (hashofheaders);

            add_to_buffer(connptr -> sbuffer, "\r\n", 2);
            return 0;
        }

        Free(response_line);
    }
    return -8;
}

static int pull_server_data(struct conn_s *connptr)
{
    char *buffer;
    ssize_t len;
    ssize_t length = MAXBUFFSIZE;
    buffer = (char *)Malloc(length);
    if(!buffer) return -1;
    while(1){
        len = safe_read(connptr->server_fd, buffer, length);
        if(len < 0){
            Free(buffer);
            return -1;
        }

        if(len == 0){
            Free(buffer);
            return 0;
        }
        add_to_buffer(connptr -> sbuffer, buffer, len);
    }
    return 0;
}

static int send_client_request(struct conn_s *connptr, struct request_s *request)
{
    char* key = NULL;
    buffer_to_str(connptr -> cbuffer, &key);
    char* value = NULL;
    
    cache_query(CACHE, key, (void **)&value);
    if(value == NULL){
        MITLogWrite(MITLOG_LEVEL_COMMON, "cache miss for (%d:%d)",
                    connptr -> client_fd, connptr -> server_fd);

        connptr -> server_fd = Open_clientfd(request -> host, request -> port);
        if(connptr -> server_fd < 0){
            MITLogWrite(MITLOG_LEVEL_ERROR, "open server socket error!");
            goto fail;
        }
       
        MITLogWrite(MITLOG_LEVEL_COMMON, "Established connection to host \"%s\" using "
           "file descriptor %d.", request->host,
           connptr -> server_fd);
        
        if(write_buffer(connptr -> cbuffer, connptr -> server_fd) < 0)
            goto fail;

        if(process_server_headers(connptr) < 0){
            MITLogWrite(MITLOG_LEVEL_ERROR, "process_server_headers error");
            goto fail;
        }

        if(pull_server_data(connptr) < 0){
            MITLogWrite(MITLOG_LEVEL_ERROR, "pull_server_data error");
            goto fail;
        }
        buffer_to_str(connptr -> sbuffer, &value);
        cache_update(CACHE, key, value, strlen(value));

    } else {
        MITLogWrite(MITLOG_LEVEL_COMMON, "cache hit for (%d:%d)",
                    connptr -> client_fd, connptr -> server_fd);
        buffer_from_str(connptr -> sbuffer, value);
    }


    if(write_buffer(connptr -> sbuffer, connptr -> client_fd) < 0)
        goto fail;

    return 0;

fail:        
    if(key)Free(key);
    if(value)Free(value);
    return -1;
}

void handle_connection(int fd)
{
    struct conn_s *connptr;
    struct request_s *request = NULL;
    hashmap_t hashofheaders = NULL;

    char sock_ipaddr[IP_LENGTH];
    char peer_ipaddr[IP_LENGTH];
    char peer_string[HOSTNAME_LENGTH];
    
    getpeer_information (fd, peer_ipaddr, peer_string);
    getsock_ip (fd, sock_ipaddr);

    MITLogWrite(MITLOG_LEVEL_COMMON, "Connect (file descriptor %d): %s [%s] at [%s]",
           fd, peer_string, peer_ipaddr, sock_ipaddr);

    connptr = initialize_conn(fd, peer_ipaddr, peer_string, sock_ipaddr);
    if (!connptr) {
        Close(fd);
        return;
    }
    
    if(read_request_line(connptr) < 0){
        MITLogWrite(MITLOG_LEVEL_ERROR, "failed to read request line");
        destroy_conn(connptr);
        return;
    }

    if(connptr -> request_line == NULL){
        MITLogWrite(MITLOG_LEVEL_COMMON, "empty request");
        destroy_conn(connptr);
        return;
    }

    request = process_request(connptr);

    if(!request){
        MITLogWrite(MITLOG_LEVEL_ERROR, "failed to process request");
        destroy_conn(connptr);
        return;
    }

    if(connptr -> connect_method){
        MITLogWrite(MITLOG_LEVEL_ERROR, "https not supported");
        free_request_struct(request);
        destroy_conn(connptr);
        return;
    }

    hashofheaders = hashmap_create (HEADER_BUCKETS);
    if(get_all_headers(connptr->client_fd, hashofheaders) < 0){
        MITLogWrite(MITLOG_LEVEL_ERROR, "failed to get all headers");
        free_request_struct(request);
        destroy_conn(connptr);
        hashmap_delete(hashofheaders);
        return;
    }
 
    if (process_client_headers (connptr, hashofheaders, request) < 0) {
        MITLogWrite(MITLOG_LEVEL_ERROR, "process_client_headers error");
        free_request_struct(request);
        destroy_conn(connptr);
        hashmap_delete(hashofheaders);
        return;     
    }


    if(send_client_request(connptr, request) < 0){
        free_request_struct(request);
        destroy_conn(connptr);
        hashmap_delete(hashofheaders);
        return;
    }

    MITLogWrite(MITLOG_LEVEL_COMMON, "Closed connection between local client (fd:%d) "
           "and remote client (fd:%d)",
           connptr->client_fd, connptr->server_fd);
    free_request_struct (request);
    hashmap_delete (hashofheaders);
    destroy_conn (connptr);
    return; 
}


#include "reqs.h"
#include "csapp.h"
#include "proxy.h"
#include "network.h"
#include "conns.h"
#include "buffer.h"
#include "text.h"

#define HTTP_LINE_LENGTH (MAX_CACHE_SIZE / 6)

#define CHECK_CRLF(header, len)                                 \
  (((len) == 1 && header[0] == '\n') ||                         \
   ((len) == 2 && header[0] == '\r' && header[1] == '\n'))
#define CHECK_LWS(header, len)                                  \
  ((len) > 0 && (header[0] == ' ' || header[0] == '\t'))

static int read_request_line (struct conn_s *connptr)
{
    ssize_t len;
    while(1){
        len = readline (connptr->client_fd, &connptr->request_line);
        if(len < 0){
            app_error("read_request_line: closed socket before read.");
            return -1;
        }
        if (chomp (connptr->request_line, len) != len) break;
        Free(connptr->request_line);
    }
    return 0;
}

static void free_request_struct (struct request_s *request)
{
    if (!request)
        return;

    Free (request->method);
    Free (request->protocol);

    if (request->host)
        Free (request->host);
    if (request->path)
        Free (request->path);

    Free (request);
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

    ptr1 = strrchr (host, ':');
    if (ptr1 == NULL)
        return 0;

    ptr2 = strchr (ptr1, ']');
    if (ptr2 != NULL)
        return 0;

    *ptr1++ = '\0';
    if (sscanf (ptr1, "%d", &port) != 1)
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


void handle_connection (int fd)
{

}

#include "network.h"
#include "MITLogModule.h"

#define SEGMENT_LEN (512)
#define MAXIMUM_BUFFER_LENGTH (128 * 1024)

ssize_t safe_write (int fd, const char *buffer, size_t count)
{
    ssize_t len;
    size_t bytestosend;

    assert (fd >= 0);
    assert (buffer != NULL);
    assert (count > 0);

    bytestosend = count;

    while (1) {
        len = send(fd, buffer, bytestosend, 0);
        if (len < 0) {
            //MITLogWrite(MITLOG_LEVEL_ERROR, "safe_write failed %d: %s", fd, strerror(errno));
            if (errno == EINTR)
                continue;
            else
                return -errno;
        }

        if ((size_t) len == bytestosend)
            break;

        buffer += len;
        bytestosend -= len;
    }
    return count;
}

ssize_t safe_read (int fd, char *buffer, size_t count)
{
    ssize_t len;
    do {
        len = Read(fd, buffer, count);
    } while (len < 0 && errno == EINTR);
    return len;
}

int write_message (int fd, const char *fmt, ...)
{
    ssize_t n;
    size_t size = (1024 * 8);
    char *buf, *tmpbuf;
    va_list ap;

    if ((buf = (char *)Malloc(size)) == NULL)
        return -1;

    while (1) {
        va_start (ap, fmt);
        n = vsnprintf (buf, size, fmt, ap);
        va_end (ap);

        if (n > -1 && (size_t) n < size)
            break;

        if (n > -1)
            size = n + 1;
        else
            size *= 2;

        if ((tmpbuf = (char *) Realloc(buf, size)) == NULL) {
            Free (buf);
            return -2;
        } else
            buf = tmpbuf;
    }

    if (safe_write (fd, buf, n) < 0) {
            Free (buf);
            return -3;
    }

    Free (buf);
    return 0;
}


ssize_t readline (int fd, char **whole_buffer)
{
    ssize_t whole_buffer_len;
    char buffer[SEGMENT_LEN];
    char *ptr;

    ssize_t ret;
    ssize_t diff;

    struct read_lines_s {
        char *data;
        size_t len;
        struct read_lines_s *next;
    };
    struct read_lines_s *first_line, *line_ptr;

    first_line =
        (struct read_lines_s *) Calloc (sizeof (struct read_lines_s),
                                        1);
    if (!first_line)
        return -ENOMEM;

    line_ptr = first_line;

    whole_buffer_len = 0;
    for (;;) {
        ret = recv (fd, buffer, SEGMENT_LEN, MSG_PEEK);
        if (ret <= 0)
            goto CLEANUP;

        ptr = (char *) memchr (buffer, '\n', ret);
        if (ptr)
            diff = ptr - buffer + 1;
        else
            diff = ret;

        whole_buffer_len += diff;

        if (whole_buffer_len > MAXIMUM_BUFFER_LENGTH) {
            ret = -ERANGE;
            goto CLEANUP;
        }

        line_ptr->data = (char *)Malloc (diff);
        if (!line_ptr->data) {
                ret = -ENOMEM;
                goto CLEANUP;
        }

        recv (fd, line_ptr->data, diff, 0);
        line_ptr->len = diff;

        if (ptr) {
                line_ptr->next = NULL;
                break;
        }

        line_ptr->next =
            (struct read_lines_s *)
            Calloc (sizeof (struct read_lines_s), 1);
        if (!line_ptr->next) {
            ret = -ENOMEM;
            goto CLEANUP;
        }
        line_ptr = line_ptr->next;
    }

    *whole_buffer = (char *) Malloc (whole_buffer_len + 1);
    if (!*whole_buffer) {
        ret = -ENOMEM;
        goto CLEANUP;
    }

    *(*whole_buffer + whole_buffer_len) = '\0';

    whole_buffer_len = 0;
    line_ptr = first_line;
    while (line_ptr) {
        memcpy (*whole_buffer + whole_buffer_len, line_ptr->data,
                line_ptr->len);
        whole_buffer_len += line_ptr->len;
        line_ptr = line_ptr->next;
    }
    ret = whole_buffer_len;

CLEANUP:
    do {
            line_ptr = first_line->next;
            if (first_line->data)
                    Free (first_line->data);
            Free (first_line);
            first_line = line_ptr;
    } while (first_line);

    return ret;
}


char *get_ip_string (struct sockaddr *sa, char *buf, size_t buflen)
{
    assert (sa != NULL);
    assert (buf != NULL);
    assert (buflen != 0);
    buf[0] = '\0'; 

    switch (sa->sa_family) {
    case AF_INET:
        {
            struct sockaddr_in *sa_in = (struct sockaddr_in *) sa;
            inet_ntop (AF_INET, &sa_in->sin_addr, buf, buflen);
            break;
        }
    case AF_INET6:
        {
            struct sockaddr_in6 *sa_in6 =
                (struct sockaddr_in6 *) sa;

            inet_ntop (AF_INET6, &sa_in6->sin6_addr, buf, buflen);
            break;
        }
    default:
        return NULL;
    }

    return buf;
}
int opensock (const char *host, int port)
{
    int sockfd, n;
    struct addrinfo hints, *res, *ressave;
    char portstr[6];

    assert (host != NULL);
    assert (port > 0);

    memset (&hints, 0, sizeof (struct addrinfo));
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;

    snprintf (portstr, sizeof (portstr), "%d", port);

    n = getaddrinfo (host, portstr, &hints, &res);
    if (n != 0) {
        //MITLogWrite (MITLOG_LEVEL_ERROR,
        //             "opensock: Could not retrieve info for %s", host);
        return -1;
    }

    ressave = res;
    do {
        sockfd =
            socket (res->ai_family, res->ai_socktype, res->ai_protocol);
        if (sockfd < 0)
            continue;
        
        if (connect (sockfd, res->ai_addr, res->ai_addrlen) == 0)
            break;

        close (sockfd);
    } while ((res = res->ai_next) != NULL);
    freeaddrinfo (ressave);
    if (res == NULL) {
        //MITLogWrite(MITLOG_LEVEL_ERROR,
        //            "opensock: Could not establish a connection to %s",
        //            host);
        return -1;
    }

    return sockfd;
}


#include "network.h"

ssize_t safe_write (int fd, const char *buffer, size_t count)
{
    ssize_t len;
    size_t bytestosend;

    assert (fd >= 0);
    assert (buffer != NULL);
    assert (count > 0);

    bytestosend = count;

    while (1) {
        len = send (fd, buffer, bytestosend, 0);

        if (len < 0) {
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
        len = read (fd, buffer, count);
    } while (len < 0 && errno == EINTR);

    return len;
}

int write_message (int fd, const char *fmt, ...)
{
    ssize_t n;
    size_t size = (1024 * 8);
    char *buf, *tmpbuf;
    va_list ap;

    if ((buf = (char *) Malloc (size)) == NULL)
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

        if ((tmpbuf = (char *) saferealloc (buf, size)) == NULL) {
            Free (buf);
            return -1;
        } else
            buf = tmpbuf;
    }

    if (safe_write (fd, buf, n) < 0) {
        Free (buf);
        return -1;
    }

    Free (buf);
    return 0;
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


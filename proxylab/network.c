#include "network.h"

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


#include "reqs.h"
#include "csapp.h"
#include "proxy.h"
#include "network.h"

#define HTTP_LINE_LENGTH (MAXBUFFSIZE / 6)

#define CHECK_CRLF(header, len)                                 \
  (((len) == 1 && header[0] == '\n') ||                         \
   ((len) == 2 && header[0] == '\r' && header[1] == '\n'))
#define CHECK_LWS(header, len)                                  \
  ((len) > 0 && (header[0] == ' ' || header[0] == '\t'))

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

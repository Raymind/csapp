#ifndef _PROXYLAB_REQS_H_
#define _PROXYLAB_REQS_H_

#define HTTP_PORT 80
#define HTTP_PORT_SSL 443
#define IP_LENGTH		48
#define HOSTNAME_LENGTH		1024

struct request_s {
        char *method;
        char *protocol;

        char *host;
        int port;

        char *path;
};

extern void handle_connection (int fd);

#endif

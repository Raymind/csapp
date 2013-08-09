#ifndef _PROXYLAB_CONNS_H_
#define _PROXYLAB_CONNS_H_

#include "buffer.h"

struct conn_s{
    int client_fd;
    int server_fd;

    struct buffer_s* cbuffer;
    struct buffer_s* sbuffer;

    char* request_line;

    unsigned int connect_method;
    int error_number;
    char *error_string;
    
    struct {
        long int server;
        long int client;
    } content_length;
    
    char *server_ip_addr;
    char *client_ip_addr;
    char *client_string_addr;

    struct {
        unsigned int major;
        unsigned int minor;
    } protocol;
};

extern struct conn_s *initialize_conn(int client_fd, const char* ipaddr,
                                      const char* string_addr,
                                      const char* sock_ipaddr);
extern void destroy_conn(struct conn_s *connptr);

#endif

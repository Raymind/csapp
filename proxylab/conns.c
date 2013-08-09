#include "conns.h"
#include "proxy.h"
#include "csapp.h"

struct conn_s *initialize_conn(int client_fd, const char* ipaddr,
                               const char* string_addr,
                               const char* sock_ipaddr)
{
    struct conn_s *connptr = (struct conn_s*)Malloc(sizeof(struct conn_s));
    connptr -> client_fd = client_fd;
    connptr -> server_fd = -1;
    connptr -> cbuffer = new_buffer();
    connptr -> sbuffer = new_buffer();
    connptr -> request_line = NULL;
    connptr -> connect_method = 0;
    connptr -> error_number = -1;
    connptr -> error_string = NULL;
    connptr -> protocol.major = connptr -> protocol.minor = 0;
    connptr -> content_length.server = connptr -> content_length.client = -1;
    connptr -> server_ip_addr = (sock_ipaddr ?
                                 strdup(sock_ipaddr) : NULL);
    connptr -> client_ip_addr = strdup(ipaddr);
    connptr -> client_string_addr = strdup(string_addr);

    return connptr;
}

void destroy_conn(struct conn_s* connptr)
{
    assert(connptr != NULL);
    if(connptr -> client_fd != -1) Close(connptr -> client_fd);
    if(connptr -> server_fd != -1) Close(connptr -> server_fd);

    if(connptr -> cbuffer) delete_buffer(connptr -> cbuffer);
    if(connptr -> sbuffer) delete_buffer(connptr -> sbuffer);
    if(connptr -> request_line) Free(connptr -> request_line);

    if(connptr -> error_string) Free(connptr -> error_string);
    if(connptr -> server_ip_addr) Free(connptr -> server_ip_addr);
    if(connptr -> client_ip_addr) Free(connptr -> client_ip_addr);
    if(connptr -> client_string_addr) Free(connptr -> client_string_addr);

    Free(connptr);
}


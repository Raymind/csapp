#include "conns.h"
#include "csapp.h"
#include "hashmap.h"
#include "buffer.h"

struct conn_s *initialize_conn (int client_fd, const char *ipaddr,
                                const char *string_addr,
                                const char *sock_ipaddr)
{
        struct conn_s *connptr;
        struct buffer_s *cbuffer, *sbuffer;

        assert (client_fd >= 0);

        cbuffer = new_buffer ();
        sbuffer = new_buffer ();

        if (!cbuffer || !sbuffer)
                goto error_exit;
        connptr = (struct conn_s *) Malloc (sizeof (struct conn_s));
        if (!connptr)
                goto error_exit;

        connptr->client_fd = client_fd;
        connptr->server_fd = -1;

        connptr->cbuffer = cbuffer;
        connptr->sbuffer = sbuffer;

        connptr->request_line = NULL;

        connptr->error_variables = NULL;
        connptr->error_string = NULL;
        connptr->error_number = -1;

        connptr->connect_method = 0;

        connptr->protocol.major = connptr->protocol.minor = 0;

        connptr->content_length.server = connptr->content_length.client = -1;

        connptr->server_ip_addr = (sock_ipaddr ?
                                   strdup (sock_ipaddr) : NULL);
        connptr->client_ip_addr = strdup (ipaddr);
        connptr->client_string_addr = strdup (string_addr);

        return connptr;

error_exit:
        if (cbuffer)
                delete_buffer (cbuffer);
        if (sbuffer)
                delete_buffer (sbuffer);

        return NULL;
}

void destroy_conn (struct conn_s *connptr)
{
        assert (connptr != NULL);

        if (connptr->client_fd != -1)
                close (connptr->client_fd);
        if (connptr->server_fd != -1)
                close (connptr->server_fd);

        if (connptr->cbuffer)
                delete_buffer (connptr->cbuffer);
        if (connptr->sbuffer)
                delete_buffer (connptr->sbuffer);

        if (connptr->request_line)
                Free (connptr->request_line);

        if (connptr->error_variables)
                hashmap_delete (connptr->error_variables);

        if (connptr->error_string)
                Free (connptr->error_string);

        if (connptr->server_ip_addr)
                Free (connptr->server_ip_addr);
        if (connptr->client_ip_addr)
                Free (connptr->client_ip_addr);
        if (connptr->client_string_addr)
                Free (connptr->client_string_addr);

        Free (connptr);
}


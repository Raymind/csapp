#ifndef _PROXYLAB_NETWORK_H_
#define _PROXYLAB_NETWORK_H_

#include "csapp.h"

extern ssize_t readline (int fd, char **whole_buffer);
extern char *get_ip_string (struct sockaddr *sa, char *buf, size_t buflen);
extern ssize_t safe_write (int fd, const char *buffer, size_t count);
extern ssize_t safe_read (int fd, char *buffer, size_t count);
extern int write_message (int fd, const char *fmt, ...);
extern int opensock (const char *host, int port);

#endif

#ifndef _PROXYLAB_NETWORK_H_
#define _PROXYLAB_NETWORK_H_

#include "csapp.h"
#include "assert.h"
#include "sys/types.h"

extern char *get_ip_string (struct sockaddr *sa, char *buf, size_t len);

#endif

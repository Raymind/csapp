#ifndef _PROXYLAB_PROXY_H_
#define _PROXYLAB_PROXY_H_

#include "csapp.h"

#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400
#define MAXBUFFSIZE ((size_t)(1024 * 96))
#define MAX_CLIENT_OBJECT_SIZE 4096
#define IP_LENGTH		48
#define HOSTNAME_LENGTH		1024


typedef void signal_func (int);

extern const char* USER_AGENT;
extern const char* ACCEPT;
extern const char* CONNECTION;
extern const char* PROXY_CONNECTION;
extern const char* ACCEPT_ENCODING;

#if !defined(min) || !defined(max)
#  define min(a,b)	((a) < (b) ? (a) : (b))
#  define max(a,b)	((a) > (b) ? (a) : (b))
#endif

extern unsigned int QUIT;
extern signal_func *set_signal_handler (int signo, signal_func * func);
#endif

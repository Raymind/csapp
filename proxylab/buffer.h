#ifndef _PROXYLAB_BUFFER_H_
#define _PROXYLAB_BUFFER_H_

#include "csapp.h"

struct buffer_s;
extern struct buffer_s *new_buffer (void);
extern void delete_buffer (struct buffer_s *buffptr);
extern size_t buffer_size (struct buffer_s *buffptr);

extern int add_to_buffer (struct buffer_s *buffptr, char *data,
                          size_t length);
extern int add_to_buffer_primary (struct buffer_s *buffptr, char *data,
                                  size_t length, unsigned int primary);
extern int buffer_to_str(struct buffer_s *buffptr, char** str);
extern int buffer_to_key(struct buffer_s *buffptr, char** str);
extern int buffer_from_str(struct buffer_s *buffptr, char* str);

extern int write_buffer(struct buffer_s *buffptr, int fd);
extern int read_buffer(struct buffer_s *buffptr, int fd);

#endif

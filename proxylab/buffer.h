#ifndef _PROXYLAB_BUFFER_H_
#define _PROXYLAB_BUFFER_H_

struct buffer_s;
extern struct buffer_s *new_buffer (void);
extern void delete_buffer (struct buffer_s *buffptr);
extern size_t buffer_size (struct buffer_s *buffptr);
extern int add_to_buffer (struct buffer_s *buffptr, unsigned char *data,
                          size_t length);
extern ssize_t read_buffer (int fd, struct buffer_s *buffptr);
extern ssize_t write_buffer (int fd, struct buffer_s *buffptr);

#endif

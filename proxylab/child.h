#ifndef _PROXYLAB_CHILD_H
#define _PROXYLAB_CHILD_H

#define CHILD_MAXCLIENTS 128
#define CHILD_MAXSPARESERVERS 64
#define CHILD_MINSPARESERVERS 4
#define CHILD_STARTSERVERS 16

extern short int child_pool_create (void);
extern int child_listening_sock (int port);
extern void child_close_sock (void);
extern void child_main_loop (void);

#endif

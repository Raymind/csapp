#include "child.h"
#include "csapp.h"
#include "proxy.h"

static int listenfd;
static socklen_t addrlen;

enum child_status_t { T_EMPTY, T_WAITING, T_CONNECTED };

struct child_s {
    pid_t tid;
    enum child_status_t status;
    pthread_t thread;
};

static struct child_s *child_ptr;

static unsigned int *servers_waiting; 

#define SERVER_COUNT_LOCK()   _child_lock_wait()
#define SERVER_COUNT_UNLOCK() _child_lock_release()

static pthread_mutex_t child_lock;

static void _child_lock_init(void)
{
    pthread_mutex_init(&child_lock, NULL);
}

static void _child_lock_wait (void)
{
    pthread_mutex_lock(&child_lock);
}

static void _child_lock_release(void)
{
    pthread_mutex_unlock(&child_lock);
}

#define SERVER_INC() do { \
    SERVER_COUNT_LOCK(); \
    ++(*servers_waiting); \
    SERVER_COUNT_UNLOCK(); \
} while (0)

#define SERVER_DEC() do { \
    SERVER_COUNT_LOCK(); \
    assert(*servers_waiting > 0); \
    --(*servers_waiting); \
    SERVER_COUNT_UNLOCK(); \
} while (0)

static void *child_main (void *ptr_void)
{
    struct child_s* ptr = (struct child_s*)ptr_void;
    int connfd;
    struct sockaddr *cliaddr;
    socklen_t clilen;

    cliaddr = (struct sockaddr *)Malloc(addrlen);
    if(!cliaddr) Pthread_exit(0);

    while(!QUIT){
        ptr -> status = T_WAITING;
        clilen = addrlen;
        connfd = Accept(listenfd, cliaddr, &clilen);

        if(connfd < 0) continue;

        ptr -> status = T_CONNECTED;

        SERVER_DEC();

        SERVER_COUNT_LOCK();
        if(*servers_waiting > CHILD_MAXSPARESERVERS){
            app_error("Waiting servers exceeds MAXSPARESERVERS. Killing child.");
            SERVER_COUNT_UNLOCK();
            break;
        } else {
            SERVER_COUNT_UNLOCK();
        }

        SERVER_INC();
    }

    ptr -> status = T_EMPTY;

    Free(cliaddr);
    Pthread_exit(0);
    return NULL;
}

static int child_make(struct child_s *ptr)
{
    pthread_t thread = ptr -> thread;
    Pthread_create(&thread, NULL, child_main, (void *)ptr);
    if(thread != NULL) return 0;
    else return -1;
}

short int child_pool_create (void)
{
    unsigned int i;

    child_ptr = (struct child_s*)Malloc(CHILD_MAXCLIENTS * 
                                        sizeof(struct child_s));
    if(!child_ptr) return -1;

    servers_waiting = (unsigned int *)Malloc(sizeof(unsigned int));
    *servers_waiting = 0;

    _child_lock_init();

    for(i = 0; i != CHILD_MAXCLIENTS; i++){
        child_ptr[i].status = T_EMPTY;
    }

    for(i = 0; i != CHILD_STARTSERVERS; i++){
        child_ptr[i].status = T_WAITING;
        if(child_make(&child_ptr[i])){
            return -1;
        } else {
            SERVER_INC();
        }
    }

    return 0;
}

int child_listening_sock (int port)
{
    return Open_listenfd(port);
}

void child_close_sock(void)
{
    close(listenfd);
}

void child_main_loop(void)
{
    unsigned int i;
    while(1){
        if(QUIT) return;

        SERVER_COUNT_LOCK();
        if(*servers_waiting < CHILD_MINSPARESERVERS){
            SERVER_COUNT_UNLOCK();
            for(i = 0; i != CHILD_MAXCLIENTS; i++){
                if(child_ptr[i].status == T_EMPTY){
                    child_ptr[i].status = T_WAITING;
                    if(child_make(&child_ptr[i])) break;
                    SERVER_INC();
                    break;
                }
            }
        } else {
            SERVER_COUNT_UNLOCK();
        }

        sleep(1);
    }
}


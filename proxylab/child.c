#include "child.h"
#include "csapp.h"
#include "proxy.h"
#include "reqs.h"
#include "MITLogModule.h"

static int listenfd;

enum child_status_t { T_CONNECTED, T_WAITING };

struct child_s {
    enum child_status_t status;
    int connfd;
};

static struct child_s *child_ptr;

void *child_main (void *ptr_void)
{
    struct child_s* ptr = (struct child_s*)ptr_void;
    handle_connection(ptr -> connfd);
    ptr -> status = T_WAITING;
    return NULL;
}

int child_make(struct child_s *ptr)
{
    pthread_t thread;
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

    for(i = 0; i != CHILD_MAXCLIENTS; i++){
        child_ptr[i].status = T_WAITING;
    }
    return 0;
}

int child_listening_sock (int port)
{
    listenfd = Open_listenfd(port);
    return listenfd;
}

void child_close_sock(void)
{
    close(listenfd);
}

void child_main_loop(void)
{
    unsigned int i;
    int connfd;
    unsigned int busy = 1;

    while(1){
        if(QUIT) return;
        socklen_t size = sizeof(struct sockaddr_in);
        struct sockaddr_in their_addr;
        connfd = Accept(listenfd, (struct sockaddr*)&their_addr, &size); 

        while(1){
            for(i = 0; i != CHILD_MAXCLIENTS; i++){
                struct child_s child = child_ptr[i];
                if(child.status == T_WAITING){
                    child.status = T_CONNECTED;
                    child.connfd = connfd;
                    child_ptr[i] = child;
                    child_make(&child_ptr[i]);
                    busy = 0;
                    break;
                }
            }
            if(!busy) break;
        }
    }
}


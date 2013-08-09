#include <stdio.h>

#include "proxy.h"
#include "child.h"
#include "cache.h"
#include "MITLogModule.h"

unsigned int QUIT = 0;
struct cache_s* CACHE = NULL;
const char* USER_AGENT = "Mozilla/5.0 (X11; Linux x86_64; rv:10.0.3) Gecko/20120305 Firefox/10.0.3";
const char* ACCEPT =  "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
const char* ACCEPT_ENCODING = "gzip, deflate";
const char* CONNECTION = "close";
const char* PROXY_CONNECTION = "close";

int process_cmdline(int argc, char* argv[])
{
    if(argc != 2){
        app_error("Usage: ./proxy PORT");
        exit(0);
    } else {
        int port = atoi(argv[1]);
        if(port <= 1000 || port >= 64000){
            MITLogWrite(MITLOG_LEVEL_ERROR, "port exceeds the range (1000,64000)");
            exit(0);
        }
        return port;
    }
}

signal_func *set_signal_handler (int signo, signal_func * func)
{
    struct sigaction act, oact;

    act.sa_handler = func;
    sigemptyset (&act.sa_mask);
    act.sa_flags = 0;
    if (signo == SIGALRM) {
#ifdef SA_INTERRUPT
        act.sa_flags |= SA_INTERRUPT;   /* SunOS 4.x */
#endif
    } else {
#ifdef SA_RESTART
        act.sa_flags |= SA_RESTART;     /* SVR4, 4.4BSD */
#endif
    }

    if (sigaction (signo, &act, &oact) < 0)
        return SIG_ERR;
    return oact.sa_handler;
}


int main(int argc, char* argv[])
{
    MITLogOpen("TestApp", "./logs");
    int port = process_cmdline(argc, argv);
   
    if (set_signal_handler (SIGPIPE, SIG_IGN) == SIG_ERR) {
        MITLogWrite(MITLOG_LEVEL_ERROR, "%s: Could not set the \"SIGPIPE\" signal.",
                argv[0]);
        exit(-1);
    }

    if(child_listening_sock(port) < 0){
        MITLogWrite(MITLOG_LEVEL_ERROR, "%s: Could not create listening socket.", argv[0]);
        exit(-1);
    }
    
    if(child_pool_create() < 0){
        MITLogWrite(MITLOG_LEVEL_ERROR, "%s: Could not create the pool of children.", argv[0]);
        exit(-1);
    }

    MITLogWrite(MITLOG_LEVEL_COMMON, "Starting main loop. Accepting connections.");

    cache_init(&CACHE);

    child_main_loop ();

    MITLogWrite(MITLOG_LEVEL_COMMON, "Shutting down.");

    child_close_sock ();

    return 0;
}

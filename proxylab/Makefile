CC = gcc
CFLAGS = -g -Wall -Werror
LDFLAGS = -lpthread
SOURCES = csapp.c child.c hashmap.c text.c proxy.c reqs.c network.c conns.c buffer.c cache.c MITLogModule.c 
OBJECTS = $(SOURCES:.c=.o)
EXECUTABLE = proxy

all: $(SOURCES) $(EXECUTABLE)
	
$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

submit:
	(make clean; cd ..; tar cvf proxylab.tar proxylab)

clean:
	rm -f *~ *.o proxy core


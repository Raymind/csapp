CC = gcc
CFLAGS = -g -Wall -Werror
LDFLAGS = -lpthread
SOURCES = csapp.c child.c hashmap.c reqs.c network.c buffer.c conns.c text.c proxy.c
OBJECTS = $(SOURCES:.c=.o)
EXECUTABLE = proxy

all: $(SOURCES) $(EXECUTABLE)
	
$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

submit:
	(make clean; cd ..; tar cvf proxylab.tar proxylab-handout)

clean:
	rm -f *~ *.o proxy core


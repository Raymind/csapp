#include "buffer.h"
#include "network.h"
#include "MITLogModule.h"

#define BUFFER_HEAD(x) (x)->head
#define BUFFER_TAIL(x) (x)->tail

#include "MITLogModule.h"

struct bufline_s {
    char *string;  /* the actual string of data */
    struct bufline_s *next; /* pointer to next in linked list */
    size_t length;          /* length of the string of data */
    size_t pos;             /* start sending from this offset */
    unsigned int primary;   /* whether used for cache key */
};

struct buffer_s {
    struct bufline_s *head; /* top of the buffer */
    struct bufline_s *tail; /* bottom of the buffer */
    size_t size;            /* total size of the buffer */
};

static struct bufline_s *makenewline (char *data, size_t length, unsigned int pri)
{
    struct bufline_s *newline;

    assert (data != NULL);
    assert (length > 0);

    newline = (struct bufline_s *) Malloc (sizeof (struct bufline_s));
    if (!newline)
        return NULL;

    newline->string = (char *) Malloc (length);
    if (!newline->string) {
        Free (newline);
        return NULL;
    }

    memcpy (newline->string, data, length);

    newline->next = NULL;
    newline->length = length;
    newline->primary = pri;

    newline->pos = 0;

    return newline;
}

static void free_line (struct bufline_s *line)
{
    assert (line != NULL);

    if (!line)
        return;

    if (line->string)
        Free (line->string);

    Free (line);
}

struct buffer_s *new_buffer (void)
{
    struct buffer_s *buffptr;

    buffptr = (struct buffer_s *) Malloc (sizeof (struct buffer_s));
    if (!buffptr)
            return NULL;
    BUFFER_HEAD (buffptr) = BUFFER_TAIL (buffptr) = NULL;
    buffptr->size = 0;

    return buffptr;
}

void delete_buffer (struct buffer_s *buffptr)
{
    struct bufline_s *next;

    assert (buffptr != NULL);

    while (BUFFER_HEAD (buffptr)) {
        next = BUFFER_HEAD (buffptr)->next;
        free_line (BUFFER_HEAD (buffptr));
        BUFFER_HEAD (buffptr) = next;
    }

    Free (buffptr);
}

size_t buffer_size (struct buffer_s *buffptr)
{
    return buffptr->size;
}

int add_to_buffer (struct buffer_s *buffptr, char *data, 
                   size_t length)
{
    return add_to_buffer_primary(buffptr, data, length, 0);
}

int add_to_buffer_primary (struct buffer_s *buffptr, char *data, 
                           size_t length, unsigned int primary)
{
    struct bufline_s *newline;

    assert (buffptr != NULL);
    assert (data != NULL);
    assert (length > 0);
    if (BUFFER_HEAD (buffptr) == NULL)
        assert (buffptr->size == 0);
    else
        assert (buffptr->size > 0);
    if (!(newline = makenewline (data, length, primary)))
        return -1;

    if (buffptr->size == 0)
        BUFFER_HEAD (buffptr) = BUFFER_TAIL (buffptr) = newline;
    else {
        BUFFER_TAIL (buffptr)->next = newline;
        BUFFER_TAIL (buffptr) = newline;
    }

    buffptr->size += length;
    return 0;
}

int buffer_to_str(struct buffer_s* buffptr, char** str)
{
    char* p;
    assert(buffptr != NULL);
    struct bufline_s* ptr = BUFFER_HEAD(buffptr);
    *str = (char*)Malloc(buffptr -> size + 1);
    p = (*str);
    while (ptr) {
        memcpy(p, ptr -> string, ptr -> length);
        p = p + ptr -> length; 
        ptr = ptr -> next;
    }
    (*p) = '\0';
    return 0;
}

int buffer_to_key(struct buffer_s* buffptr, char** str)
{
    char* p;
    ssize_t size = 0;
    struct bufline_s* ptr = BUFFER_HEAD(buffptr);
    while(ptr){
        if(ptr -> primary) size = size + ptr -> length;
        ptr = ptr -> next;
    }
    *str = (char*)Malloc(size + 1);
    p = (*str);
    ptr = BUFFER_HEAD(buffptr);
    while(ptr){
        if(ptr -> primary){
            memcpy(p, ptr -> string, ptr -> length);
            p = p + ptr -> length; 
        }
        ptr = ptr -> next;
    }
    (*p) = '\0';
    return 0;
}

int buffer_from_str(struct buffer_s* buffptr, char* str)
{
    assert(buffptr != NULL);
    assert(str != NULL);

    char* temp;
    char* p = str;
    ssize_t len = 0;
    while(p < str + strlen(str)){
        temp = strstr(p, "\n");
        if(temp == NULL) break;
        len = temp - p + 1;
        char* line = (char*)Malloc(len);
        memcpy(line, p, len);
        add_to_buffer(buffptr, line, len);
        p = temp + 1;
    }
    return 0;
}

int write_buffer(struct buffer_s* buffptr, int fd)
{
    assert(buffptr != NULL);
    struct bufline_s* line = buffptr -> head;
    while(line != NULL){
        if(safe_write(fd, line -> string, line -> length) < 0){
            MITLogWrite(MITLOG_LEVEL_ERROR, "write buffer error!");
            return -1;
        }
        line = line -> next;
    }
    return 0;
}

int read_buffer(struct buffer_s* buffptr, int fd)
{
   return 0; 
}

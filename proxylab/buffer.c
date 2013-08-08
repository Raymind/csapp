#include "proxy.h"
#include "buffer.h"
#include "csapp.h"

#define BUFFER_HEAD(x) (x)->head
#define BUFFER_TAIL(x) (x)->tail

struct bufline_s {
    unsigned char *string; 
    struct bufline_s *next;
    size_t length;         
    size_t pos;           
};

struct buffer_s {
        struct bufline_s *head; /* top of the buffer */
        struct bufline_s *tail; /* bottom of the buffer */
        size_t size;            /* total size of the buffer */
};


static struct bufline_s *makenewline (unsigned char *data, size_t length)
{
    struct bufline_s *newline;

    assert (data != NULL);
    assert (length > 0);

    newline = (struct bufline_s *) Malloc (sizeof (struct bufline_s));
    if (!newline)
        return NULL;

    newline->string = (unsigned char *) Malloc (length);
    if (!newline->string) {
        Free (newline);
        return NULL;
    }

    memcpy (newline->string, data, length);

    newline->next = NULL;
    newline->length = length;

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

int add_to_buffer (struct buffer_s *buffptr, unsigned char *data, size_t length)
{
    struct bufline_s *newline;

    assert (buffptr != NULL);
    assert (data != NULL);
    assert (length > 0);
    if (BUFFER_HEAD (buffptr) == NULL)
        assert (buffptr->size == 0);
    else
        assert (buffptr->size > 0);
    if (!(newline = makenewline (data, length)))
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

static struct bufline_s *remove_from_buffer (struct buffer_s *buffptr)
{
    struct bufline_s *line;

    assert (buffptr != NULL);
    assert (BUFFER_HEAD (buffptr) != NULL);

    line = BUFFER_HEAD (buffptr);
    BUFFER_HEAD (buffptr) = line->next;

    buffptr->size -= line->length;

    return line;
}

ssize_t read_buffer (int fd, struct buffer_s * buffptr)
{
    ssize_t bytesin;
    unsigned char *buffer;

    assert (fd >= 0);
    assert (buffptr != NULL);
    if (buffptr->size >= MAX_CACHE_SIZE)
        return 0;

    buffer = (unsigned char *) Malloc (MAX_OBJECT_SIZE);
    if (!buffer) {
        return -ENOMEM;
    }

    bytesin = read (fd, buffer, MAX_OBJECT_SIZE);

    if (bytesin > 0) {
        if (add_to_buffer (buffptr, buffer, bytesin) < 0) {
            app_error("readbuff: add_to_buffer() error.");
            bytesin = -1;
        }
    } else {
        if (bytesin == 0) {
            bytesin = -1;
        } else {
            switch (errno) {
#ifdef EWOULDBLOCK
            case EWOULDBLOCK:
#else
#  ifdef EAGAIN
            case EAGAIN:
#  endif
#endif
            case EINTR:
                bytesin = 0;
                break;
            default:
                app_error("readbuff: recv() error on fd");
                bytesin = -1;
                break;
            }
        }
    }

    Free (buffer);
    return bytesin;
}

ssize_t write_buffer (int fd, struct buffer_s * buffptr)
{
    ssize_t bytessent;
    struct bufline_s *line;

    assert (fd >= 0);
    assert (buffptr != NULL);

    if (buffptr->size == 0)
        return 0;

    assert (BUFFER_HEAD (buffptr) != NULL);
    line = BUFFER_HEAD (buffptr);

    bytessent = send(fd, line->string + line->pos, 
                     line->length - line->pos, 0);

    if (bytessent >= 0) {
        line->pos += bytessent;
        if (line->pos == line->length)
            free_line (remove_from_buffer (buffptr));
        return bytessent;
    } else {
        switch (errno) {
#ifdef EWOULDBLOCK
        case EWOULDBLOCK:
#else
#  ifdef EAGAIN
        case EAGAIN:
#  endif
#endif
        case EINTR:
            return 0;
        case ENOBUFS:
        case ENOMEM:
            app_error("writebuff write() error, ENOMEM");
            return 0;
        default:
            app_error("writebuff write() error, Unknown");
            return -1;
        }
    }
}





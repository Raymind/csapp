#include "buffer.h"

#define BUFFER_HEAD(x) (x)->head
#define BUFFER_TAIL(x) (x)->tail

struct bufline_s {
    unsigned char *string;  /* the actual string of data */
    struct bufline_s *next; /* pointer to next in linked list */
    size_t length;          /* length of the string of data */
    size_t pos;             /* start sending from this offset */
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

    buffptr = (struct buffer_s *) safemalloc (sizeof (struct buffer_s));
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



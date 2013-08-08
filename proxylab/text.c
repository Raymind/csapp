#include "text.h"

ssize_t chomp (char *buffer, size_t length)
{
    size_t chars;

    assert (buffer != NULL);
    assert (length > 0);

    if (buffer == NULL)
        return -EFAULT;
    if (length < 1)
        return -ERANGE;

    chars = 0;

    --length;
    while (buffer[length] == '\r' || buffer[length] == '\n') {
        buffer[length] = '\0';
        chars++;

        if (length-- == 0)
            break;
    }

    return chars;
}


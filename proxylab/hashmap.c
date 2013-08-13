#include "hashmap.h"

struct hashentry_s {
    char *key;
    void *data;
    size_t len;
    long timestamp;
    int count;

    struct hashentry_s *prev, *next;
};

struct hashbucket_s {
    struct hashentry_s *head, *tail;
};

struct hashmap_s {
    unsigned int size;
    hashmap_iter end_iterator;

    struct hashbucket_s *buckets;
};

static int hashfunc (const char *key, unsigned int size)
{
    uint32_t hash;

    if (key == NULL)
        return -EINVAL;
    if (size == 0)
        return -ERANGE;

    for (hash = tolower (*key++); *key != '\0'; key++) {
        uint32_t bit = (hash & 1) ? (1 << (sizeof (uint32_t) - 1)) : 0;

        hash >>= 1;

        hash += tolower (*key) + bit;
    }

    return hash % size;
}

hashmap_t hashmap_create (unsigned int nbuckets)
{
    struct hashmap_s *ptr;

    if (nbuckets == 0)
        return NULL;

    ptr = (struct hashmap_s *) Calloc (1, sizeof (struct hashmap_s));
    if (!ptr)
        return NULL;

    ptr->size = nbuckets;
    ptr->buckets = (struct hashbucket_s *) Calloc (nbuckets,
                                                   sizeof (struct
                                                           hashbucket_s));
    if (!ptr->buckets) {
        Free (ptr);
        return NULL;
    }
    ptr->end_iterator = 0;

    return ptr;
}

static int delete_hashbucket (struct hashbucket_s *bucket)
{
    struct hashentry_s *nextptr;
    struct hashentry_s *ptr;

    if (bucket == NULL || bucket->head == NULL)
        return -EINVAL;

    ptr = bucket->head;
    while (ptr) {
        nextptr = ptr->next;

        Free (ptr->key);
        Free (ptr->data);
        Free (ptr);

        ptr = nextptr;
    }

    return 0;
}

int hashmap_delete (hashmap_t map)
{
    unsigned int i;

    if (map == NULL)
        return -EINVAL;

    for (i = 0; i != map->size; i++) {
        if (map->buckets[i].head != NULL) {
            delete_hashbucket (&map->buckets[i]);
        }
    }

    Free (map->buckets);
    Free (map);

    return 0;
}

int
hashmap_insert (hashmap_t map, const char *key, const void *data, size_t len)
{
    struct hashentry_s *ptr;
    int hash;
    char *key_copy;
    void *data_copy;

    assert (map != NULL);
    assert (key != NULL);
    assert (data != NULL);
    assert (len > 0);

    if (map == NULL || key == NULL)
        return -EINVAL;
    if (!data || len < 1)
        return -ERANGE;

    hash = hashfunc (key, map->size);
    if (hash < 0)
        return hash;

    key_copy = strdup (key);
    if (!key_copy)
        return -ENOMEM;

    data_copy = Malloc (len);
    if (!data_copy) {
        Free (key_copy);
        return -ENOMEM;
    }
    memcpy (data_copy, data, len);

    ptr = (struct hashentry_s *) Malloc (sizeof (struct hashentry_s));
    if (!ptr) {
        Free (key_copy);
        Free (data_copy);
        return -ENOMEM;
    }

    ptr->key = key_copy;
    ptr->data = data_copy;
    ptr->len = len;
    ptr->timestamp = (long)time(NULL);
    ptr->count = 1;
    ptr->next = NULL;
    ptr->prev = map->buckets[hash].tail;
    if (map->buckets[hash].tail)
        map->buckets[hash].tail->next = ptr;

    map->buckets[hash].tail = ptr;
    if (!map->buckets[hash].head)
        map->buckets[hash].head = ptr;

    map->end_iterator++;
    return 0;
}

hashmap_iter hashmap_first (hashmap_t map)
{
    assert (map != NULL);

    if (!map)
        return -EINVAL;

    if (map->end_iterator == 0)
        return -1;
    else
        return 0;
}

int hashmap_is_end (hashmap_t map, hashmap_iter iter)
{
    assert (map != NULL);
    assert (iter >= 0);

    if (!map || iter < 0)
        return -EINVAL;

    if (iter == map->end_iterator)
        return 1;
    else
        return 0;
}

hashmap_iter hashmap_find (hashmap_t map, const char *key)
{
    unsigned int i;
    hashmap_iter iter = 0;
    struct hashentry_s *ptr;

    assert (map != NULL);
    assert (key != NULL);

    if (!map || !key)
        return -EINVAL;
    for (i = 0; i != map->size; i++) {
        ptr = map->buckets[i].head;

        while (ptr) {
            if (strcasecmp (ptr->key, key) == 0) {
                ptr -> timestamp = (long)time(NULL);
                ptr -> count = ptr -> count + 1;
                return iter;
            }

            iter++;
            ptr = ptr->next;
        }
    }

    return iter;
}

ssize_t
hashmap_return_entry (hashmap_t map, hashmap_iter iter, char **key, void **data)
{
    unsigned int i;
    struct hashentry_s *ptr;
    hashmap_iter count = 0;

    assert (map != NULL);
    assert (iter >= 0);
    assert (iter != map->end_iterator);
    assert (key != NULL);
    assert (data != NULL);

    if (!map || iter < 0 || !key || !data)
        return -EINVAL;

    for (i = 0; i != map->size; i++) {
        ptr = map->buckets[i].head;
        while (ptr) {
            if (count == iter) {
                *key = ptr->key;
                *data = ptr->data;
                ptr -> timestamp = (long)time(NULL);
                ptr -> count = ptr -> count + 1;
                return ptr->len;
            }

            ptr = ptr->next;
            count++;
        }
    }

    return -EFAULT;
}

ssize_t hashmap_search (hashmap_t map, const char *key)
{
    int hash;
    struct hashentry_s *ptr;
    ssize_t count = 0;

    if (map == NULL || key == NULL)
        return -EINVAL;

    hash = hashfunc (key, map->size);
    if (hash < 0)
        return hash;

    ptr = map->buckets[hash].head;

    while (ptr) {
        if (strcasecmp (ptr->key, key) == 0){
            ptr -> timestamp = (long)time(NULL);
            ptr -> count = ptr -> count + 1;
            ++count;
        }
        ptr = ptr->next;
    }

    return count;
}

ssize_t hashmap_entry_by_key (hashmap_t map, const char *key, void **data)
{
    int hash;
    struct hashentry_s *ptr;

    if (!map || !key || !data)
        return -EINVAL;

    hash = hashfunc (key, map->size);
    if (hash < 0)
        return hash;

    ptr = map->buckets[hash].head;

    while (ptr) {
        if (strcasecmp (ptr->key, key) == 0) {
            ptr -> timestamp = (long)time(NULL);
            ptr -> count = ptr -> count + 1;
            *data = ptr->data;
            return ptr->len;
        }

        ptr = ptr->next;
    }

    return 0;
}

ssize_t hashmap_remove (hashmap_t map, const char *key)
{
    int hash;
    struct hashentry_s *ptr, *next;
    short int deleted = 0;

    if (map == NULL || key == NULL)
        return -EINVAL;

    hash = hashfunc (key, map->size);
    if (hash < 0)
        return hash;

    ptr = map->buckets[hash].head;
    while (ptr) {
        if (strcasecmp (ptr->key, key) == 0) {
            next = ptr->next;

            if (ptr->prev)
                ptr->prev->next = ptr->next;
            if (ptr->next)
                ptr->next->prev = ptr->prev;

            if (map->buckets[hash].head == ptr)
                map->buckets[hash].head = ptr->next;
            if (map->buckets[hash].tail == ptr)
                map->buckets[hash].tail = ptr->prev;

            Free (ptr->key);
            Free (ptr->data);
            Free (ptr);

            ++deleted;
            --map->end_iterator;

            ptr = next;
            continue;
        }

        ptr = ptr->next;
    }

    return deleted;
}

ssize_t hashmap_remove_lru(struct hashmap_s *map)
{
    ssize_t ret;
    unsigned int i;
    struct hashentry_s *ptr, *min_ptr, *next;
    long min_time = -1;
    long min_count = -1;
    unsigned int min_hash;

    if (!map)
        return -EINVAL;
    
    for (i = 0; i != map->size; i++) {
        ptr = map->buckets[i].head;

        while (ptr) {
            if(min_time < 0 || ptr -> timestamp < min_time){
                min_time = ptr -> timestamp;
                min_count = ptr -> count;
                min_hash = i;
                min_ptr = ptr;
            } else if (ptr -> timestamp == min_time){
                if(ptr -> count < min_count){
                    min_count = ptr -> count;
                    min_hash = i;
                    min_ptr = ptr;
                }
            }
            ptr = ptr->next;
        }
    }

    if(min_time < 0) return 0;

    ret = min_ptr -> len;
    next = min_ptr -> next;
    if (min_ptr->prev)
        min_ptr->prev->next = min_ptr->next;
    if (min_ptr->next)
        min_ptr->next->prev = min_ptr->prev;

    if (map->buckets[min_hash].head == min_ptr)
        map->buckets[min_hash].head = min_ptr->next;
    if (map->buckets[min_hash].tail == min_ptr)
        map->buckets[min_hash].tail = min_ptr->prev;

    Free (min_ptr->key);
    Free (min_ptr->data);
    Free (min_ptr);
    
    --map->end_iterator;
    return ret;
}

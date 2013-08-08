#ifndef _PROXYLAB_HASHMAP_H_
#define _PROXYLAB_HASHMAP_H_

typedef struct hashmap_s *hashmap_t;
typedef int hashmap_iter;

extern hashmap_t hashmap_create (unsigned int nbuckets);
extern int hashmap_delete (hashmap_t map);
extern int hashmap_insert (hashmap_t map, const char *key,
                           const void *data, size_t len);
extern hashmap_iter hashmap_first (hashmap_t map);
extern int hashmap_is_end (hashmap_t map, hashmap_iter iter);
extern hashmap_iter hashmap_find (hashmap_t map, const char *key);
extern ssize_t hashmap_return_entry (hashmap_t map, hashmap_iter iter,
                                     char **key, void **data);
extern ssize_t hashmap_entry_by_key (hashmap_t map, const char *key,
                                     void **data);
extern ssize_t hashmap_search (hashmap_t map, const char *key);
extern ssize_t hashmap_remove (hashmap_t map, const char *key);

#endif

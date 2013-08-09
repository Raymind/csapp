#ifndef _PROXYLAB_CACHE_H_
#define _PROXYLAB_CACHE_H_

#include "csapp.h"
#include "hashmap.h"

#define CACHE_BUCKET 128

struct cache_s{
    size_t curr_size;
    pthread_rwlock_t lock;

    struct hashmap_s* map;
};

extern struct cache_s *CACHE;
extern int cache_init(struct cache_s **cache);
extern int cache_query(struct cache_s *cache, 
                       const char* key, void **value);
extern int cache_update(struct cache_s *cache, 
                        const char* key, const char* value, 
                        size_t len);

#endif

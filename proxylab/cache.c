#include "cache.h"
#include "proxy.h"

int cache_init(struct cache_s **cache)
{
    *cache = (struct cache_s*)Malloc(sizeof(struct cache_s));
    if(*cache == NULL) 
        return -1;
    
    (*cache) -> map = hashmap_create(CACHE_BUCKET);
    
    if((*cache) -> map == NULL)
        return -1;

    (*cache) -> curr_size = 0;
    
    if(!pthread_rwlock_init(&((*cache) -> lock), NULL))
        return -1;
    return 0;
}

int cache_query(struct cache_s *cache, 
                const char* key, void **value)
{
    pthread_rwlock_rdlock(&cache -> lock);
    hashmap_entry_by_key(cache -> map, key, value);
    pthread_rwlock_unlock(&cache -> lock);
    return 0;
}

int cache_update(struct cache_s *cache, 
                 const char* key, const char* value, 
                 size_t len)
{
    pthread_rwlock_wrlock(&cache -> lock);
    ssize_t freed_size = MAX_CACHE_SIZE - cache -> curr_size;
    ssize_t size;
    
    if(len > MAX_OBJECT_SIZE){
        //MITLogWrite(MITLOG_LEVEL_WARNING,
        //            "object size (%d) exceeds the MAX_OBJECT_SIZE(%d)",
        //            len, MAX_OBJECT_SIZE);
        pthread_rwlock_unlock(&cache -> lock);
        return 0;
    }
    
    if(len > MAX_CACHE_SIZE - cache -> curr_size){
        //MITLogWrite(MITLOG_LEVEL_WARNING,
        //            "Cache (size: %d) is almost full."
        //            "Should evict object for incoming object"
        //            "(size: %d)", cache -> curr_size, len);
        while(freed_size < len){
            if((size = hashmap_remove_lru(cache -> map)) < 0){
                pthread_rwlock_unlock(&cache -> lock);
                return -1;
            }
            //MITLogWrite(MITLOG_LEVEL_COMMON, "successfully evict %d bytes", size);
            cache -> curr_size = cache -> curr_size - size;
            freed_size += size;
        }
    }

    if(hashmap_insert(cache -> map, key, value, len) < 0){
        pthread_rwlock_unlock(&cache -> lock);
        return -1;
    }
    cache -> curr_size = cache -> curr_size + len;

    //MITLogWrite(MITLOG_LEVEL_COMMON, "New cache object added, current size: %d",
    //            cache -> curr_size);

    pthread_rwlock_unlock(&cache -> lock);
    return 0;
}


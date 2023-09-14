#include "object_v2-hash.h"
#include <stdio.h>

int
main ()
{
        ObjectHash* hash;
        ObjectHashKV* kv;

        hash = object_hash_new ();
        object_hash_set_value (hash, "abc", false, O_PTR (5667), NULL);
        object_hash_set_value (hash, "ggggg", false, O_PTR (56123), NULL);
        object_hash_set_value (hash, "azxcga", false, O_PTR (12332), NULL);
        object_hash_set_value (hash, "aaaa", false, O_PTR (5623), NULL);
        object_hash_set_value (hash, "a23456", false, O_PTR (56737), NULL);

        object_hash_iter_reset (hash);

        while ((kv = object_hash_iter_get (hash))) {
                printf ("%s: %p\n", object_string_get_string (kv->ckey), kv->value);
        }

        object_unref (hash);
        return 0;
}
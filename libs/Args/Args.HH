#include <StringView.HH> /* Is including this really a good idea? */

class Args
{
    StringView* data;
    U64 capacity;
    U64 count;
};

Bool Args_init(Args* args, U64 argc, U8** argv)
{
    args->capacity = argc;
    args->count = args->capacity;
    args->data = MAlloc(sizeof(StringView) * args->capacity);
    for (U64 i = 0; i < args->capacity; i++) {
        StringView_init_from_cstr(&(args->data[i]), argv[i]);
    }
    return args->data != NULL;
}

U0 Args_free(Args* args)
{
    for (U64 i = 0; i < args->count; i++) {
        StringView_free(&args->data[i]);
    }
    Free(args->data);
    args->capacity = 0;
    args->count = 0;
}

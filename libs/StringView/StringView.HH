class StringView
{
    U8* data;
    U64 capacity;
    U64 count;
};

Bool StringView_init(StringView* sv, U64 size_initial=5)
{
    sv->data = MAlloc(sizeof(sv->data[0]) * size_initial);
    sv->capacity = size_initial;
    sv->count = 0;
    return sv->data != NULL;
}

U0 StringView_free(StringView* sv)
{
    Free(sv->data);
    sv->capacity = 0;
    sv->count = 0;
}

Bool StringView_push_U8(StringView* sv, U8 c)
{
    if (sv->capacity > sv->count) {
        sv->data[sv->count++] = c;
        return TRUE;
    }

    /* Could not push, reallocating first */
    sv->capacity *= 2;
    sv->data = ReAlloc(sv->data, sizeof(sv->data[0]) * sv->capacity);
    sv->data[sv->count++] = c;
    return FALSE;
}

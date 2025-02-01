class StringView
{
    U8* data;
    U64 capacity;
    U64 count;
};

U0 StringView_init(StringView* sv, U64 size_initial=5)
{
    sv->data = MAlloc(sizeof(sv->data[0]) * size_initial);
    sv->capacity = size_initial;
    sv->count = 0;
}

U0 StringView_free(StringView* sv)
{
    Free(sv->data);
    sv->capacity = 0;
    sv->count = 0;
}

U0 StringView_push_U8(StringView* sv, U8 c)
{
    if (sv->capacity > sv->count) {
        sv->data[8 + sv->count++] = c;
        return;
    }

    sv->capacity *= 2;
    sv->data = ReAlloc(sv->data, sizeof(sv->data[0]) * sv->capacity);
    sv->data[8 + sv->count++] = c;
}

U64 Main(U64 argc, U8** argv)
{
    if (argc < 2) {
        U8 c;
        StringView line;
        StringView_init(&line);
        do {
            read(STDIN, &c, 1);
            if (c != '\n') {
                StringView_push_U8(&line, c);
            } else {
                StringView_push_U8(&line, '\0');
                "%s\n", line.data;
                StringView_free(&line);
            }
        } while (c != '\0');
        return 0;
    }

    for (I64 i = argc; i > 1; i--) {
        I64 file_size = 0;
        U8* buffer = FileRead(argv[1], &file_size);
        "%s", buffer;
    }
    return 0;
}

#define EOF -1
#define STDIN 0

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
        sv->data[sv->count++] = c;
        return;
    }

    sv->capacity *= 2;
    sv->data = ReAlloc(sv->data, sizeof(sv->data[0]) * sv->capacity);
    sv->data[sv->count++] = c;
}

U64 Main(U64 argc, U8** argv)
{
    // TODO: There's a bug. If you write some characters and then C-D (EOF)
    //       it doesn't print the line. Unless you enter a newline
    //       Basically EOF only breaks out the loop if we find it at
    //       the start of the line?
    if (argc < 2) {
        U8 c;
        StringView line;
        StringView_init(&line);
        while (read(STDIN, &c, 1)) {
            switch (c) {
            case EOF: {
                "%s", line.data;
                StringView_free(&line);
                return 0;
            } break;
            default: {
                StringView_push_U8(&line, c);
            } break;
            }

            if (c == '\n') {
                StringView_push_U8(&line, '\0');
                "%s", line.data;
                StringView_free(&line);
                StringView_init(&line);
            }
        }

        return 0;
    }

    for (I64 i = 1; i < argc; i++) {
        U8* buffer = FileRead(argv[i]);
        "%s", buffer;
    }
    return 0;
}

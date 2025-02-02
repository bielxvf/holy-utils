#include "../../libs/StringView/StringView.HH"

#define PROGRAM "basename"

U64 Main(U64 argc, U8** argv)
{
    if (argc < 2) {
        PROGRAM": missing operand\n";
        "Try `"PROGRAM" --help` for more information.\n";
        return 1;
    }

    U64 args_capacity = argc;
    U64 args_count = args_capacity;
    StringView* args = MAlloc(sizeof(StringView) * args_capacity);
    for (U64 i = 0; i < args_count; i++) {
        StringView_init_from_cstr(&args[i], argv[i]);
        "init %d completed\n", i;
        "data: %s\n", args[i].data;
    }

    for (U64 i = 0; i < args_count; i++) {
        "%s\n", args[i].data;
    }

    /* Free args array */
    for (U64 i = 0; i < args_count; i++) {
        StringView_free(&args[i]);
    }
    Free(args);

    /*
    StringView path;

    for (U64 i = 1; i < argc; i++) {
        StringView_init_from_cstr(&path, argv[i]);

        U8* last_slash = path.data;
        for (U64 j = 0; j < path.count; j++) {
            if (path.data[j] == '/') {
                last_slash = path.data + j + 1;
            }
        }
        "%s", last_slash;
        StringView_free(&path);
        if (i + 1 < argc) {
            "\n";
        }
    }

    "\n";
    */

    return 0;
}

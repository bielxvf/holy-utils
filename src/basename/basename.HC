#include "../../libs/StringView/StringView.HH"

#define PROGRAM "basename"

U64 Main(U64 argc, U8** argv)
{
    if (argc < 2) {
        PROGRAM": missing operand\n";
        "Try `"PROGRAM" --help` for more information.\n";
        return 1;
    }

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
    return 0;
}

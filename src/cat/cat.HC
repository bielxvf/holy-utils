#define EOF -1

#include "../../libs/StringView/StringView.HH"

U64 Main(U64 argc, U8** argv)
{
    // TODO: There's a bug. If you write some characters and then C-D (EOF)
    //       it doesn't print the line. Unless you enter a newline
    //       Basically EOF only breaks out the loop if we find it at
    //       the start of the line? Or if you press C-D twice it actually
    //       terminates but it doesnt print the line.

    /* Read stdin */
    if (argc < 2) {
        U8 c;
        StringView line;
        if (!StringView_init(&line)) {
            "Failed to init StringView\n";
            return 1;
        }
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
                if (!StringView_init(&line)) {
                    "Failed to init StringView\n";
                    return 1;
                }
            }
        }
        return 0;
    }

    /* Print files given */
    for (I64 i = 1; i < argc; i++) {
        U8* buffer = FileRead(argv[i]);
        "%s", buffer;
    }
    return 0;
}

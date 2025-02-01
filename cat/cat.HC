U64 Main(U64 argc, U8** argv)
{
    for (I64 i = argc; i > 1; i--) {
        I64 file_size = 0;
        U8* buffer = FileRead(argv[1], &file_size);
        "%s", buffer;
    }
    return 0;
}

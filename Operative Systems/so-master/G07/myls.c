#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    int flag, opt;
    int nsecs, tfnd;
    char *extension;

    nsecs = 0;
    tfnd = 0;

    /* The getopt() function parses the command-line arguments. Its arguments
      argc and argv are the argument count and array as passed to the main()
      function on program invocation. An element of argv that starts with
      '-' (and is not exactly "-" or "--") is an option element. The charac‐
      ters of this element (aside from the initial '-') are option charac‐
      ters.  If getopt() is called repeatedly, it returns successively each
      of the option characters from each of the option elements.

      For more information check the man page (man 3 getopt) 
     */
    while ((opt = getopt(argc, argv, "dfe:")) != -1)
    {
        switch (opt)
        {
            case 'd':
                flag = 0;
                break;
            case 'f':
                flag = 1;
                break;
            case 'e':
                flag = 2;
                extension = optarg;
                break;
            default: /* '?' */
                fprintf(stderr, "Usage: %s [-t nsecs] [-n] name\n",
                        argv[0]);
                exit(EXIT_FAILURE);
        }
    }

    /*switch(opt)
    {
        case 0:

    }*/


    /* By default, getopt() permutes the contents of argv as it scans, so that
      eventually all the nonoptions are at the end.
    */
    if (optind >= argc)
    {
        fprintf(stderr, "Expected argument after options\n");
        return EXIT_FAILURE;
    }

    /* Other code omitted */

    return EXIT_SUCCESS;
}

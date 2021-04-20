#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

/* SUGESTÂO: utilize as páginas do manual para conhecer mais sobre as funções usadas:
 man fopen
 man fgets
*/

#define LINEMAXSIZE 80 /* or other suitable maximum line size */


int main(int argc, char *argv[])
{
    int i; 

    /* Validate number of arguments */
    if(argc == 1)
    {
        printf("USAGE: %s fileName\n", argv[0]);
        return EXIT_FAILURE;
    }

    for(i = 1;i < argc;i++)
    {
        int nlines = 1;
        FILE *fp = NULL;
        char line [LINEMAXSIZE];

        /* Open the file provided as argument */
        errno = 0;
        fp = fopen(argv[i], "r");
        if(fp == NULL)
        {
            perror ("Error opening file!");
            return EXIT_FAILURE;
        }

        /* read all the lines of the file */
        while(fgets(line, sizeof(line), fp) != NULL )
        {
             printf("(%d) -> %s",nlines,line);
             nlines++;
        }
        printf("\n\n");

        fclose (fp);
    }
    return EXIT_SUCCESS;
}

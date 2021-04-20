#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv)
{
    int i, j, numChars;
    char arg[100], sentence[100];

    if(argc == 1)
    {
        printf("Apenas foi introduzido um argumento!");
        EXIT_FAILURE;
    }

    numChars = 0;
    for(i = 1 ; i < argc ; i++)
    {   
        strcpy(arg, argv[i]);
        if(isalpha(arg[0]) != 0)
        {
            for(j = 0;j < strlen(arg);j++)
            {
                sentence[numChars] = arg[j];
                numChars++;
             }
        }   
        
    }

    printf("Sentence: %s\n",sentence);
}
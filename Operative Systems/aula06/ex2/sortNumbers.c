#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
/* SUGESTÂO: utilize as páginas do manual para conhecer mais sobre as funções usadas:
 man qsort */

int compareInts(const void *px1, const void *px2) {
    int x1 = *((int *)px1);
    int x2 = *((int *)px2);
    return(x1 < x2 ? -1 : 1);
}
int main(int argc, char *argv[]) {
    int numSizeMax, numSize;
    int i = 0;
    int *numbers;
    FILE *fp = NULL;
    char line[100];
    numSizeMax = 200;
    /* Memory allocation for all the numbers in the arguments */
    numbers = (int *) malloc(sizeof(int) * numSizeMax);

    fp = fopen(argv[1], "r");

    /* read all the lines of the file */
    numSize=0;
    while( fgets(line, sizeof(line), fp) != NULL )
    {
     numbers[i] = atoi(line);
     i++;
     numSize++;
    }
    fclose(fp);

    qsort(numbers, numSize, sizeof(int), compareInts);

    printf("Sorted numbers: \n");
    for(i = 0 ; i < numSize ; i++)
    {
        printf("%d\n", numbers[i]);
    }
    return EXIT_SUCCESS;
}


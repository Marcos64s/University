#include <stdio.h>
#include <stdlib.h>
int main(int argc, char **argv) {
    int i;
    if (argc>2 ){
     for(i = 0 ; i < argc ; i++){
         printf("Argument %02d: \"%s\"\n", i, argv[i]);
     }
     return EXIT_SUCCESS;
    }
    else
     {
     printf("A função tem de ter mais de dois argumentos!\n");
     return 0;
     }
}

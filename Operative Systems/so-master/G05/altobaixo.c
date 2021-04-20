#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv)
{   
    int i, j, min, max, randomNumber, guess, tries;
    char arg[100];

    if(argc != 3)
    {
        printf("Número de argumentos inválido! (%d)\n",argc);
        exit(1);
    }

    for(i = 1; i < argc;i++)
    {
        strcpy(arg, argv[i]);
        for(j = 0;j < strlen(arg);j++)
        {
            if(isdigit(arg[j]) == 0)
            {
                printf("Pelo menos um dos argumentos não contêm apenas dígitos!\n");
                exit(1);
            }
        }
    }

    if(strcmp(argv[1],argv[2]) == 0)
    {
        printf("Os números introduzidos são iguais!\n");
        exit(1);
    }
    else if(strcmp(argv[1],argv[2]) < 0)
    {
        min = atoi(argv[1]);
        max = atoi(argv[2]);
        printf("Mínimo: %d - Máximo: %d\n",min,max);
    }
    else
    {
        min = atoi(argv[2]);
        max = atoi(argv[1]);
        printf("Mínimo: %d - Máximo: %d\n",min,max);
    }

    if((max - min) == 1)
    {
       printf("O intervalo é demasiado pequeno!\n");
       exit(1); 
    }

    randomNumber = (int)((max - min +1)*((double)rand()/RAND_MAX) + min);

    tries = 1;
    do
    {   
        printf("\n(%d) Guess: ",tries);
        scanf("%d",&guess);
        if(guess < randomNumber)
        {
            printf("Tentativa demasiado baixa!\n");
        }
        else if(guess > randomNumber)
        {
            printf("Tentativa demasiado alta!\n");
        }
        else
        {
            printf("Parabéns, acertou à tentativa número %d! O número é %d.\n",tries,randomNumber);
            exit(1);
        }
        tries++;
    } while(guess != randomNumber);
    return 0;
}
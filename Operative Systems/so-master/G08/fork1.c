#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    int ret;

    printf ("Antes do fork: PID = %d, PPID = %d\n", getpid (), getppid ());
    if ((ret = fork ()) < 0) { 
        perror ("erro na duplicação do processo");
        return EXIT_FAILURE;
    }
    if (ret > 0) sleep (1);
    printf ("Quem sou eu?\nApós o fork: PID = %d, PPID = %d\n", getpid (), getppid ());

    return EXIT_SUCCESS;
}

/*
    Respostas à questão 1 do guião 8

    b)
        A linha 9 é executada pelo pai. (0 segundos)
        O fork() retorna 2 vezes, uma para o pai e outra para o filho.
        A linha 10 é executada pelo pai e pelo filho, pois quando o fork() retorna,
        o filho já existe.
        A partir da linha 10, ambos fazem todos os processos.
        O pai faz o sleep()
        Serão impressas 5 linhas no ecrã.
        O PAI DO PAI É A BASH!
*/

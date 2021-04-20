#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    printf ("Pai (antes do fork): PID = %u, PPID = %u\n", getpid (), getppid ());
    switch (fork ())
    {
      case -1: /* fork falhou */
               perror ("Erro no fork\n");
               return EXIT_FAILURE;
      case 0:  /* processo filho */
                        /*   path    argv[0]    terminador  */
               /*if (execl ("./child", "./child", NULL) < 0) {*/
               if (execl ("/bin/ls","/bin/ls","-l",NULL) < 0){
                   perror ("erro no lancamento da aplicacao");
                   return EXIT_FAILURE;
               }
               printf ("Porque é que eu não apareço?\n");
               break;
      default: /* processo pai */
               sleep (1);
               printf ("Pai (depois do fork): PID = %u, PPID = %u\n", getpid (), getppid ());
    }

    return EXIT_SUCCESS;
}

/*
    Respostas à questão 3 do guião 8

    Linha 7 - Pai - 0 segundos
    Linha 8 - Pai e Filho
    Linhas 10 a 12 - ninguém
    Linhas 13 e 14 - Filho
    Linhas 15 a 17 - ninguém
    Linhas a seguir à 20 - Pai

    Em Bash, quando se faz $./child, a Bash faz um fork() para criar um novo processo e depois faz um
    exec() para criar um novo programa.
    $exec ./child, mata a Bash.

    

*/
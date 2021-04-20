#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
/* SUGESTÂO: utilize as páginas do manual para conhecer mais sobre as funções usadas:
 man system
 man date */
int main(int argc, char *argv[]) {
    char text[1024], text1[1024];
    char *current_time;
    FILE *fp = NULL;
    time_t t = time(NULL);
    struct tm *tm = localtime(&t);

    fp = fopen("command.log","w");

    do {
        printf("Command: ");
        scanf("%[^\n]%*c", text);

        if(strcmp(text, "end")) {
           printf("\n * Command to be executed: %s\n", text);
           printf("---------------------------------\n");
           system(text);
           printf("---------------------------------\n");
        }

	strcpy(text1,text);

        strcat(text1,"\t||\t");
	strcat(text1,asctime(tm));
	strcat(text1,"\n");

        fputs(text1,fp);

    } while(strcmp(text, "end"));
    printf("-----------The End---------------\n");
    fclose(fp);
    return EXIT_SUCCESS;
}

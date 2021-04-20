#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

typedef struct
{
    int age;
    double height;
    char name[64];
} Person;

void printPersonInfo(Person *p)
{
    printf("Person: %s, %d, %f\n", p->name, p->age, p->height);
}

int main (int argc, char *argv[])
{
    FILE *fp = NULL;
    Person p, people[100];
    int i, np, rp;

    /* Validate number of arguments */
    if(argc != 2)
    {
        printf("USAGE: %s fileName\n", argv[0]);
        return EXIT_FAILURE;
    }

    /* Open the file provided as argument */
    errno = 0;
    fp = fopen(argv[1], "r");
    if(fp == NULL)
    {
        perror ("Error opening file!");
        return EXIT_FAILURE;
    }

    /* read all the itens of the file */
    np = 0;
    while(fread(&p, sizeof(Person), 1, fp) == 1)
    {
        people[np] = p;
        np++;
    }
    fclose(fp);

    fp = fopen(argv[1], "w");
    /* Ask for the numbers of people to write in the file */
    printf("Número de pessoas?\n");
    scanf("%d",&rp);

    /* Write 10 itens on a file */
    for(i = 0 ; i < rp ; i++)
    {    
        printf("Pessoa %d\n",i+1);
        printf("Nome? ");
        scanf(" %[^\n]",p.name);
        printf("Idade? ");
        scanf("%d",&p.age);
        printf("Altura? ");
        scanf("%lf",&p.height);
        people[np] = p;
        np++;
    }
    
    for(i = 0; i < np; i++)
    {
        printPersonInfo(&people[i]);
        fwrite(&people[i], sizeof(Person), 1, fp);
    }

    fclose(fp);

    return EXIT_SUCCESS;
}

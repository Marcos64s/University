#include <stdio.h>      /* printf, fgets */
#include <stdlib.h>     /* atoi */
#include <math.h>

int main(int argc, char *argv[]){
int res;
int i;
    for(i=0;i<argc-1;i++)
    {
        printf("\t%s",argv[i]);
    }

int a = atof(argv[1]);
int ar = atof(argv[3]);
char op = *argv[2];

printf("%c",op);

switch(op){
	case '+':
		res = a + ar;
		break;
	case '-':
		res = a-ar;
		 break;
	case 'x':
		res = a*ar;
		break;
	case '/':
		res = a/ar;
		break;
	case 'p':
		res = pow(a,ar);
		break;
	}
printf("\nO Resultado é : %d\n",res);
return 0;
}

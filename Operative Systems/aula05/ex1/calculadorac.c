#include <stdio.h>      /* printf, fgets */
#include <stdlib.h>     /* atoi */
#include <math.h>

int main(int argc, char *argv[]){
int res;
char *q;

int a = strtod(argv[1],&q);
int ar = strtod(argv[3],&q);
char op = *argv[2];

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

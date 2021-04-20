#include <stdio.h>
#include <stdlib.h>

int main(){
 int adv,num;
 time_t t;

 srand((unsigned) time(&t));

 num = (rand() % 100);

 printf("Adivinha o numero: ");
 scanf("%i",&adv);

 while(adv != num){
  if(adv<num){
   printf("É Mais Alto\n");
  }else{
   printf("É Mais Baixo\n");
  }

  printf("Adivinha outra vez o numero: ");
  scanf("%i",&adv);
 }
 printf("Adivinhaste!\n");
 return 0;
}

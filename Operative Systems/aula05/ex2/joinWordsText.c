#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>

int main (int argc, char *argv[]) {
 char arr[100];
 int c=0;
 int i,j;
 bool result;
 for (i = 1; i < argc; i++){
 result = isdigit(argv[i][0]);
  if(result == 0){
   for (j = 0; j < strlen(argv[i]);j++){
    arr[c] = argv[i][j];
    c++;
   }
  }
 }
 for(int k = 0;k < c;k++){
  printf("%c",arr[k]);
 }
 printf("\n");
 return 0;
}

#include <stdio.h>
#include <string.h>

int main (int argc, char *argv[]) {
  char arr[100];
  int c=0;
  int i,j;
  for (i = 1; i < argc; i++){
   for (j = 0; j < strlen(argv[i]);j++){
    arr[c] = argv[i][j];
    c++;
  }
 }
 for(int k = 0;k < c;k++){
  printf("%c",arr[k]);
 }
 printf("\n");
}

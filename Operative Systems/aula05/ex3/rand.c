#include <stdio.h>
#include <stdlib.h>

int main () {
   int i, n;
   time_t t;
   
   n = 100;
   /* Print 5 random numbers from 0 to 49 */
   for( i = 0 ; i < n ; i++ ) {
      printf("%d\n", rand() % 50);
   }
   
   return(0);
}

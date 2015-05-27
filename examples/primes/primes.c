#include <stdio.h>
#include <stdlib.h>

int primes(int u){
  int sum = 0;
  int j, i = 1;

  while(i++ < u ) {


    for(j = 2; j <= (i/j); j++){
      if(!(i%j)) break;
    }

    
    if(j > (i/j)){
      fprintf(stderr, "%d is prime\n", i);
      sum += i;
    }
  }

   return sum;
}


int main(int argc, char* argv[]){
  if(argc < 2){
    fprintf(stderr, "Usage: %s <n>\n", argv[0]);
    return 0;
  }
  int n = atoi(argv[1]);

  int sum = primes(n);

  fprintf(stderr, "The sum is %d\n", sum);

  return 0;
}

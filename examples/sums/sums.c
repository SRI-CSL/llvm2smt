#include <stdio.h>
#include <stdlib.h>

//1 + 2 + ... + n = 1/2 n * (n * 1)

int lhs(int n){
  int sum = 0;
  while(n > 0){
    sum += n;
    n -= 1;
  }
  return sum;
}

int rhs(int n){
  int prod = n * (n + 1);
  prod = prod / 2;
  return prod;
}



int main(int argc, char* argv[]){
  if(argc < 2){
    fprintf(stderr, "Usage: %s <n> [lhs]\n", argv[0]);
    return 0;
  }
  int s, n = atoi(argv[1]);
  if(argc == 2){
    s = lhs(n);
  } else {
    s = rhs(n);
  }
  fprintf(stderr, "sum(%d) = %d\n", n, s);
  return 0;
}

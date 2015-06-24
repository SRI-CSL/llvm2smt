#include <stdio.h>
#include <stdlib.h>


int exp0(int a, int b){
  int retval = 1;
  if(b < 0){ return 0; }
  while(b > 0){
    retval *= a;
    b -= 1;
  }
  return retval;
}


int exp1(int a, int b){
  int retval = 1;
  if(b < 0){ return 0; }
  while (b != 0) {
    if ((b & 1) != 0) {
      retval *= a;
    }
    b >>= 1;
    a *= a;
  }
  return retval;
}


int main(int argc, char* argv[]){
  if(argc == 3){
    int a = (int)atoi(argv[1]);
    int b = (int)atoi(argv[2]);
    int lhs = exp0(a, b);
    int rhs = exp1(a, b);
    if(lhs == rhs){
      printf("lhs == rhs: %d\n", lhs);
    } else {
      printf("lhs = %d != rhs = %d\n", lhs, rhs);

    }
  }
  return 0;
}

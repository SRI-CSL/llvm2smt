#include <stdio.h>

typedef unsigned short int_type;

int_type exp0(int_type a, int_type b){
  int_type retval = 1;
  //  if(b < 0){ return 0; }
  while(b > 0){
    retval *= a;
    b -= 1;
  }
  return retval;
}


int_type exp1(int_type a, int_type b){
  int_type retval = 1;
  //  if(b < 0){ return 0; }
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

  




  return 0;
}

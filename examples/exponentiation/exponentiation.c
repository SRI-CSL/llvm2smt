#include <stdio.h>


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

  




  return 0;
}

#include <stdio.h>
#include <stdint.h>
#include <stddef.h>

typedef struct {
  char c;
} s0;


typedef struct {
  char  c;
  char  d;
  short s;
  long  n;
} s1;


typedef struct {
  char  c;
  short s;
} s2;


typedef struct {
  char   c;
  double d;
  short  s;
} s3;


typedef struct {
  char   c;
  double d;
} s4;

typedef struct {
  char   c;
  int64_t i64;
} s5;

typedef struct {
  char   c;
  float f;
} s6;


typedef union {
  char c;
  short s;
  int j;
} u0;



int main(int argc, char* argv[]){
  s0 x0 = { '0' };
  s1 x1;
  s2 x2;
  s3 x3;
  s4 x4;
  s5 x5;
  s6 x6;
  
  u0 z0;
  
  fprintf(stderr, "sizeof(%s) = %d, x0.c = %c\n", "x0", (int)sizeof(x0), x0.c);
  fprintf(stderr, "sizeof(%s) = %d\n", "x1", (int)sizeof(x1));
  fprintf(stderr, "sizeof(%s) = %d\n", "x2", (int)sizeof(x2));
  fprintf(stderr, "sizeof(%s) = %d\n", "x3", (int)sizeof(x3));

  fprintf(stderr, "sizeof(%s) = %d offset of d = %d\n", "x4", (int)sizeof(x4), (int)offsetof(s4, d));
  fprintf(stderr, "sizeof(%s) = %d offset of d = %d\n", "x5", (int)sizeof(x5), (int)offsetof(s5, i64));
  fprintf(stderr, "sizeof(%s) = %d offset of d = %d\n", "x6", (int)sizeof(x6), (int)offsetof(s6, f));
 
  fprintf(stderr, "sizeof(%s) = %d\n", "u0", (int)sizeof(z0));



  return 0;

}

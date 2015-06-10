#include <stdio.h>
#include <stdint.h>
#include <stddef.h>
#include <stdlib.h>

/*
 *  See 3-2 of http://sco.com/developers/devspecs/abi386-4.pdf
 *
 */


typedef struct {
  char c;
} s0;

s0* make_s0(char c){
  s0* retval = (s0*)malloc(sizeof(s0));
  retval->c = c;
  return retval;
}


typedef struct {
  char  c;
  char  d;
  short s;
  long  n;
} s1;

s1* make_s1(char c, char  d, short s, long  n){
  s1* retval = (s1*)malloc(sizeof(s1));
  retval->c = c;
  retval->d = d;
  retval->s = s;
  retval->n = n;
  return retval;
}

typedef struct {
  char  c;
  short s;
} s2;

s2* make_s2(char c, short s){
  s2* retval = (s2*)malloc(sizeof(s2));
  retval->c = c;
  retval->s = s;
  return retval;
}

typedef struct {
  char   c;
  double d;
  short  s;
} s3;

s3* make_s3(char c, double d, short s){
  s3* retval = (s3*)malloc(sizeof(s3));
  retval->c = c;
  retval->d = d;
  retval->s = s;
  return retval;
}


typedef struct {
  char   c;
  double d;
} s4;

s4* make_s4(char c, double d){
  s4* retval = (s4*)malloc(sizeof(s4));
  retval->c = c;
  retval->d = d;
  return retval;
}

typedef struct {
  char   c;
  int64_t i64;
} s5;

s5* make_s5(char c, int64_t i64){
  s5* retval = (s5*)malloc(sizeof(s5));
  retval->c = c;
  retval->i64 = i64;
  return retval;
}

typedef struct {
  char   c;
  float f;
} s6;

s6* make_s6(char c, float f){
  s6* retval = (s6*)malloc(sizeof(s6));
  retval->c = c;
  retval->f = f;
  return retval;
}


typedef union {
  char c;
  short s;
  int j;
} s7;

s7* make_s7(char c, short s, int j){
  s7* retval = (s7*)malloc(sizeof(s7));
  retval->c = c;
  retval->s = s;
  retval->j = j;
  return retval;
}



int main(int argc, char* argv[]){
  
  fprintf(stderr, "sizeof(%s) = %d offset of c = %d\n", "s0", (int)sizeof(s0), (int)offsetof(s0, c));
  fprintf(stderr, "\n");

  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s1", (int)sizeof(s1), (int)offsetof(s1, c));
  fprintf(stderr, "sizeof(%s) = %d offset of d   = %d\n", "s1", (int)sizeof(s1), (int)offsetof(s1, d));
  fprintf(stderr, "sizeof(%s) = %d offset of s   = %d\n", "s1", (int)sizeof(s1), (int)offsetof(s1, s));
  fprintf(stderr, "sizeof(%s) = %d offset of n   = %d\n", "s1", (int)sizeof(s1), (int)offsetof(s1, n));
  fprintf(stderr, "\n");

  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s2", (int)sizeof(s2), (int)offsetof(s2, c));
  fprintf(stderr, "sizeof(%s) = %d offset of s   = %d\n", "s2", (int)sizeof(s2), (int)offsetof(s2, s));
  fprintf(stderr, "\n");

  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s3", (int)sizeof(s3), (int)offsetof(s3, c));
  fprintf(stderr, "sizeof(%s) = %d offset of d   = %d\n", "s2", (int)sizeof(s3), (int)offsetof(s3, d));
  fprintf(stderr, "sizeof(%s) = %d offset of s   = %d\n", "s2", (int)sizeof(s3), (int)offsetof(s3, s));
  fprintf(stderr, "\n");

  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s4", (int)sizeof(s4), (int)offsetof(s4, c));
  fprintf(stderr, "sizeof(%s) = %d offset of d   = %d\n", "s4", (int)sizeof(s4), (int)offsetof(s4, d));
  fprintf(stderr, "\n");

  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s5", (int)sizeof(s5), (int)offsetof(s5, c));
  fprintf(stderr, "sizeof(%s) = %d offset of i64 = %d\n", "s5", (int)sizeof(s5), (int)offsetof(s5, i64));
  fprintf(stderr, "\n");

  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s6", (int)sizeof(s6), (int)offsetof(s6, c));
  fprintf(stderr, "sizeof(%s) = %d offset of f   = %d\n", "s6", (int)sizeof(s6), (int)offsetof(s6, f));
  fprintf(stderr, "\n");

  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s6", (int)sizeof(s7), (int)offsetof(s7, c));
  fprintf(stderr, "sizeof(%s) = %d offset of s   = %d\n", "s6", (int)sizeof(s7), (int)offsetof(s7, s));
  fprintf(stderr, "sizeof(%s) = %d offset of j   = %d\n", "s6", (int)sizeof(s7), (int)offsetof(s7, j));
  fprintf(stderr, "\n");




  return 0;

}

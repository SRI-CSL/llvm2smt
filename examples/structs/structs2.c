#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdbool.h>

/*
 * Based on packtest.c from http://www.catb.org/esr/structure-packing/
 */

typedef struct foo1 {
    char *p;
    char c;
    long x;
} s1;

s1* make_s1(char *p, char c, long x){
  s1* retval = (s1*)malloc(sizeof(s1));
  retval->p = p;
  retval->c = c;
  retval->x = x;
  return retval;
}


typedef struct foo2 {
    char c;      /* 1 byte */
    char pad[7]; /* 7 bytes */
    char *p;     /* 8 bytes */
    long x;      /* 8 bytes */
} s2;

s2* make_s2(char c, char *p, long x){
  s2* retval = (s2*)malloc(sizeof(s2));
  retval->c = c;
  retval->p = p;
  retval->x = x;
  return retval;
}

typedef struct foo3 {
    char *p;     /* 8 bytes */
    char c;      /* 1 byte */
} s3;

s3* make_s3(char c, char *p){
  s3* retval = (s3*)malloc(sizeof(s3));
  retval->c = c;
  retval->p = p;
  return retval;
}

typedef struct foo4 {
    short s;     /* 2 bytes */
    char c;      /* 1 byte */
} s4;

s4* make_s4(short s, char c){
  s4* retval = (s4*)malloc(sizeof(s4));
  retval->s = s;
  retval->c = c;
  return retval;
}

typedef struct foo5 {
    short s;
    char c;
    int flip:1;
    int nybble:4;
    int septet:7;
} s5;

s5* make_s5(short s, char c, int flip, int nybble, int septet){
  s5* retval = (s5*)malloc(sizeof(s5));
  retval->s = s;
  retval->c = c;
  retval->flip = flip;
  retval->nybble = nybble;
  retval->septet = septet;
  return retval;
}

typedef struct foo6 {
    int bigfield:31;
    int littlefield:1;
} s6;

s6* make_s6(int bigfield, int littlefield){
  s6* retval = (s6*)malloc(sizeof(s6));
  retval->bigfield = bigfield;
  retval->littlefield = littlefield;
  return retval;
}

typedef struct foo7 {
    int bigfield1:31;
    int littlefield1:1;
    int bigfield2:31;
    int littlefield2:1;
} s7;

s7* make_s7(int bigfield1, int littlefield1, int bigfield2, int littlefield2){
  s7* retval = (s7*)malloc(sizeof(s7));
  retval->bigfield1 = bigfield1;
  retval->littlefield1 = littlefield1;
  retval->bigfield2 = bigfield2;
  retval->littlefield2 = littlefield2;
 return retval;
}

typedef struct foo8 {
    int bigfield1:31;
    int bigfield2:31;
    int littlefield1:1;
    int littlefield2:1;
} s8;

s8* make_s8(int bigfield1, int bigfield2, int littlefield1, int littlefield2){
  s8* retval = (s8*)malloc(sizeof(s8));
  retval->bigfield1 = bigfield1;
  retval->bigfield2 = bigfield2;
  retval->littlefield1 = littlefield1;
  retval->littlefield2 = littlefield2;
  return retval;
}

typedef struct foo9 {
    char c;
    struct foo9_inner {
        char *p;
        short x;
    } inner;
} s9;

s9* make_s9(char c, char* p, short x){
  s9* retval = (s9*)malloc(sizeof(s9));
  retval->c = c;
  retval->inner.p = p;
  retval->inner.x = x;
  return retval;
}

typedef struct foo10 {
    char c;
    struct foo10 *p;
    short x;
} s10;

s10* make_s10(char c, s10* p, short x){
  s10* retval = (s10*)malloc(sizeof(s10));
  retval->c = c;
  retval->p = p;
  retval->x = x;
  return retval;
}

typedef struct foo11 {
    struct foo11 *p;
    short x;
    char c;
} s11;

s11* make_s11(s11* p, short x, char c){
  s11* retval = (s11*)malloc(sizeof(s11));
  retval->p = p;
  retval->x = x;
  retval->c = c;
  return retval;
}

typedef struct foo12 {
    struct foo12_inner {
        char *p;
        short x;
    } inner;
    char c;
} s12;

s12* make_s12(char *p, short x, char c){
  s12* retval = (s12*)malloc(sizeof(s12));
  retval->inner.p = p;
  retval->inner.x = x;
  retval->c = c;
  return retval;
}

int main(int argc, char *argv[]){
  
  
  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s1", (int)sizeof(s1), (int)offsetof(s1, c));

  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s2", (int)sizeof(s2), (int)offsetof(s2, c));
  
  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s3", (int)sizeof(s3), (int)offsetof(s3, c));
  
  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s4", (int)sizeof(s4), (int)offsetof(s4, c));
  
  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s5", (int)sizeof(s5), (int)offsetof(s5, c));
  
  //fprintf(stderr, "sizeof(%s) = %d offset of bigfield    = %d\n", "s6", (int)sizeof(s6), (int)offsetof(s6, bigfield));
  
  //fprintf(stderr, "sizeof(%s) = %d offset of bigfield1   = %d\n", "s7", (int)sizeof(s7), (int)offsetof(s7,  bigfield1));
  
  //fprintf(stderr, "sizeof(%s) = %d offset of bigfield1   = %d\n", "s8", (int)sizeof(s8), (int)offsetof(s8, bigfield1));
  
  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s9", (int)sizeof(s9), (int)offsetof(s9, c));
  
  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s10", (int)sizeof(s10), (int)offsetof(s10, c));
    
  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s11", (int)sizeof(s11), (int)offsetof(s11, c));
  
  fprintf(stderr, "sizeof(%s) = %d offset of c   = %d\n", "s12", (int)sizeof(s12), (int)offsetof(s12, c));

}

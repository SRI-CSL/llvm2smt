#include <stdio.h>
#include <stdbool.h>

/*
 * Based on packtest.c from http://www.catb.org/esr/structure-packing/
 */

typedef struct foo1 {
    char *p;
    char c;
    long x;
} s1;

typedef struct foo2 {
    char c;      /* 1 byte */
    char pad[7]; /* 7 bytes */
    char *p;     /* 8 bytes */
    long x;      /* 8 bytes */
} s2;

typedef struct foo3 {
    char *p;     /* 8 bytes */
    char c;      /* 1 byte */
} s3;

typedef struct foo4 {
    short s;     /* 2 bytes */
    char c;      /* 1 byte */
} s4;

typedef struct foo5 {
    short s;
    char c;
    int flip:1;
    int nybble:4;
    int septet:7;
} s5;

typedef struct foo6 {
    int bigfield:31;
    int littlefield:1;
} s6;

typedef struct foo7 {
    int bigfield1:31;
    int littlefield1:1;
    int bigfield2:31;
    int littlefield2:1;
} s7;

typedef struct foo8 {
    int bigfield1:31;
    int bigfield2:31;
    int littlefield1:1;
    int littlefield2:1;
} s8;

typedef struct foo9 {
    char c;
    struct foo9_inner {
        char *p;
        short x;
    } inner;
} s9;

typedef struct foo10 {
    char c;
    struct foo10 *p;
    short x;
} s10;

typedef struct foo11 {
    struct foo11 *p;
    short x;
    char c;
} s11;

typedef struct foo12 {
    struct foo12_inner {
        char *p;
        short x;
    } inner;
    char c;
} s12;

int main(int argc, char *argv[]){
    printf("sizeof(char *)        = %zu\n", sizeof(char *));
    printf("sizeof(long)          = %zu\n", sizeof(long));
    printf("sizeof(int)           = %zu\n", sizeof(int));
    printf("sizeof(short)         = %zu\n", sizeof(short));
    printf("sizeof(char)          = %zu\n", sizeof(char));
    printf("sizeof(float)         = %zu\n", sizeof(float));
    printf("sizeof(double)        = %zu\n", sizeof(double));
    printf("sizeof(struct foo1)   = %zu\n", sizeof(struct foo1));
    printf("sizeof(struct foo2)   = %zu\n", sizeof(struct foo2));
    printf("sizeof(struct foo3)   = %zu\n", sizeof(struct foo3));
    printf("sizeof(struct foo4)   = %zu\n", sizeof(struct foo4));
    printf("sizeof(struct foo5)   = %zu\n", sizeof(struct foo5));
    printf("sizeof(struct foo6)   = %zu\n", sizeof(struct foo6));
    printf("sizeof(struct foo7)   = %zu\n", sizeof(struct foo7));
    printf("sizeof(struct foo8)   = %zu\n", sizeof(struct foo8));
    printf("sizeof(struct foo9)   = %zu\n", sizeof(struct foo9));
    printf("sizeof(struct foo10)   = %zu\n", sizeof(struct foo10));
    printf("sizeof(struct foo11)   = %zu\n", sizeof(struct foo11));
    printf("sizeof(struct foo12)   = %zu\n", sizeof(struct foo12));
}

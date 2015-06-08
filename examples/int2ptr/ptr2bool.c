#include <stdio.h>
#include <stdlib.h>

// int to ptr to int
int lhs(int x) {
  void *ptr;

  ptr = (void *) x;
  return (int) ptr;
}

// identity function
int rhs(int x) {
  return x;
}

int main(int argc, char *argv[]) {
  int foo, bar;
  void *foo_ptr;

  if (argc <= 1) {
    return 0;
  }

  foo = atol(argv[1]);
  foo_ptr = (void *) foo;
  bar = (int) foo_ptr;

  printf("foo is %d, foo_ptr is %p, bar is %d\n", foo, foo_ptr, bar);

  return 0;
}

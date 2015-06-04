#include <stdio.h>
#include <stdlib.h>

static __attribute__ ((__always_inline__)) char rot13_char(char ch) {
  char offset;

  if ('A' <= ch && ch <= 'Z') {
    offset = ch - 'A';
    offset = (offset + 13) % 26;
    return 'A' + (char) offset;
  }

  if ('a' <= ch && ch <= 'z') {
    offset = ch - 'a';
    offset = (offset + 13) % 26;
    return 'a' + (char) offset;
  }

  return ch;
}

#if 0
static void rot13(const char *in, char *out, unsigned n) __attribute__((__always_inline__)) {
  unsigned i;

  for (i=0; i<n; i++) {
    out[i] = rot13_char(in[i]);
  }
}
#endif

static char lhs(char x) {
  return x;
}

static char rhs(char x) {
  return rot13_char(rot13_char(x));
}

int main(int argc, char* argv[]){
  char x, y, z;

  if (argc == 2){
    x = argv[1][0];
    y = rot13_char(x);
    z = rot13_char(y);
    printf("x = '%c', y = '%c', z = '%c', lhs(x) = '%c', rhs(x) = '%c'\n", x, y, z, lhs(x), rhs(x));
  }

  return 0;
}

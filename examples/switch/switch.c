#include <stdio.h>
#include <stdlib.h>

void a(int x){ fprintf(stderr, "%c%d\n", 'a', x); }
void b(int x){ fprintf(stderr, "%c%d\n", 'b', x); }
void c(int x){ fprintf(stderr, "%c%d\n", 'c', x); }
void d(int x){ fprintf(stderr, "%c%d\n", 'd', x); }
void e(int x){ fprintf(stderr, "%c%d\n", 'e', x); }
void f(int x){ fprintf(stderr, "%c%d\n", 'f', x); }
void g(int x){ fprintf(stderr, "%c%d\n", 'g', x); }
void h(int x){ fprintf(stderr, "%c%d\n", 'h', x); }
void i(int x){ fprintf(stderr, "%c%d\n", 'i', x); }
void j(int x){ fprintf(stderr, "%c%d\n", 'j', x); }
void k(int x){ fprintf(stderr, "%c%d\n", 'k', x); }
void l(int x){ fprintf(stderr, "%c%d\n", 'l', x); }
void m(int x){ fprintf(stderr, "%c%d\n", 'm', x); }
void n(int x){ fprintf(stderr, "%c%d\n", 'n', x); }
void o(int x){ fprintf(stderr, "%c%d\n", 'o', x); }
void p(int x){ fprintf(stderr, "%c%d\n", 'p', x); }
void q(int x){ fprintf(stderr, "%c%d\n", 'q', x); }
void r(int x){ fprintf(stderr, "%c%d\n", 'r', x); }
void s(int x){ fprintf(stderr, "%c%d\n", 's', x); }
void t(int x){ fprintf(stderr, "%c%d\n", 't', x); }
void u(int x){ fprintf(stderr, "%c%d\n", 'u', x); }
void v(int x){ fprintf(stderr, "%c%d\n", 'v', x); }
void w(int x){ fprintf(stderr, "%c%d\n", 'w', x); }
void x(int x){ fprintf(stderr, "%c%d\n", 'x', x); }
void y(int x){ fprintf(stderr, "%c%d\n", 'y', x); }
void z(int x){ fprintf(stderr, "%c%d\n", 'z', x); }




void switcher(char ch){
  switch(ch){
  case 'a': a(5);
  case 'b': b(4);
  case 'c': c(3);
  case 'd': d(2);
  case 'e': r(1);
  case 'f': f(0);
  case 'g': g(9);
  case 'h': h(8);
  case 'i': i(7);
  case 'j': j(6);
  case 'k': k(5);
  case 'l': l(4);
  case 'm': m(3);
  case 'n': n(2);
  case 'o': o(1);
  case 'p': p(0);
  case 'q': q(9);
  case 'r': r(8);
  case 's': s(7);
  case 't': t(6);
  case 'u': u(5);
  case 'v': v(4);
  case 'w': w(3);
  case 'x': x(2);
  case 'y': y(1);
  case 'z': z(0);
  default : exit(1);
  }
}



int main(int argc, char* argv[]){
  if(argc == 2){
    switcher(argv[1][0]);
  }
  return 0;
}

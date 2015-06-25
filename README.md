# llvm2smt

Experimental translation of LLVM (3.5ish) IR to SMT-LIB.


Overview
=============

This tool, llvm2smt, parses a llvm bitcode file (in its human readable form) and
translates it to a symbolic SMT-LIB representation.

Currently the resulting SMT-LIB file uses the theory of bitvectors and arrays (QF_ABV).

The goal is to support symbolic analyses, such as bounded model checking, using
SMT solvers.

The tool is in its infancy and only translates the llvm IR as it appears. Any logical
properties one might want to verify must be added by hand.


A Simple Example
==============

The file `test/shufflevector.ll` includes two simple functions written
by hand.  The first function `@lhs` takes two integers, stores them
in a two-element vector, shuffles the vector twice, then returns the first
vector element.

```llvm
; Function Attrs: nounwind ssp uwtable
define i32 @lhs(i32 %a, i32 %b) #0 {
  %1 = insertelement <2 x i32> undef, i32 %a, i32 0
  %2 = insertelement <2 x i32> %1, i32 %b, i32 1
  %3 = shufflevector <2 x i32> %2, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  %4 = shufflevector <2 x i32> %3, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  %5 = extractelement <2 x i32> %4, i32 0
  ret i32 %5
}

```

The second function `@rhs` does the same thing without the shuffles.

```llvm
; Function Attrs: nounwind ssp uwtable
define i32 @rhs(i32 %a, i32 %b) #0 {
  %1 = insertelement <2 x i32> undef, i32 %a, i32 0
  %2 = insertelement <2 x i32> %1, i32 %b, i32 1
  %3 = extractelement <2 x i32> %2, i32 0
  ret i32 %3
}

```

We can show that these functions are equivalent by first translating the LLVM IR
to SMT-LIB via:

```shell
> llvm2smt shufflevector.ll > shufflevector.smt
```
Function `@rhs` is translated to the following SMT-LIB statements.
```scheme
;; Function: |@rhs|
;; (i32 %a, i32 %b)
(declare-fun memory2 () Mem)
(define-fun rsp2 () (_ BitVec 64) (_ bv0 64))
(declare-fun |%a_@rhs| () (_ BitVec 32))
(declare-fun |%b_@rhs| () (_ BitVec 32))

;; BLOCK %0 with index 0 and rank = 1
;; Predecessors:
;; @rhs_block_0_entry_condition 
(define-fun @rhs_block_0_entry_condition () Bool true)
;; %1 = insertelement <2 x i32> undef, i32 %a, i32 0
(define-fun |%1_@rhs| () (Array (_ BitVec 1) (_ BitVec 32))
   (store vzero_1_32 ((_ extract 0 0) (_ bv0 32)) |%a_@rhs|))
;; %2 = insertelement <2 x i32> %1, i32 %b, i32 1
(define-fun |%2_@rhs| () (Array (_ BitVec 1) (_ BitVec 32))
   (store |%1_@rhs| ((_ extract 0 0) (_ bv1 32)) |%b_@rhs|))
;; %3 = extractelement <2 x i32> %2, i32 0
(define-fun |%3_@rhs| () (_ BitVec 32)
   (select |%2_@rhs| ((_ extract 0 0) (_ bv0 32))))
;; ret i32 %3
;; No backward arrows


(define-fun @rhs_result () (_ BitVec 32) |%3_@rhs|)

```
The key points are:

1. The function takes two input arguments denoted by `|%a_@rhs|` and `|%b_@rhs|`. Both 
are bitvectors of length 32.

2. The return value of the function is denoted by `@rhs_result`.

The other function is encoded similarly.

To check whether these two functions are equivalent, we add the following two SMT-LIB commands
at the end of the file:

```scheme
(assert (and (= |%a_@lhs| |%a_@rhs|) (= |%b_@lhs| |%b_@rhs|) (not (= @lhs_result @rhs_result))))
(check-sat)
```

This tests whether the functions `@lhs` and `@rhs` can produce different results when run of the same input.

We can then give the entire file to an SMT solver, such as `yices-smt2`,  to conclude:

```shell
> yices-smt2 shufflevector.smt
unsat
```
As expected, the assertion is not satisfiable: if we give both functions the same input, they produce the same result.



Compilation
==============

`llvm2smt` is written in OCaml. It is known to compile with OCaml 4.02.1
but other versions may work too. Standard OCaml tools are required
including `ocamllex`, `ocamlyacc`, and `ocamldep`. 

Installing OCaml is reasonably easy. Check the instructions at
https://ocaml.org/docs/install.html.

Once you have OCaml, go to the `./src` directory then type

```shell
> make
```

This will build two main executables:

1. `parse` is based on Trevor Jim's [parser](https://github.com/tjim/smpcc/blob/master/compiler/)
    for LLVM assembly language (`.ll` suffix).
    It can be used to check that our tool properly parses LLVM.

2. `llvm2smt` is the main tool. It produces an SMT-LIB specification 
    from a single `.ll` input.



Examples and tests for both are included in the `./examples`,
`./test`, and `./bitcode` directories. Check the Makefile for details.

On simple examples (i.e., one source file), you can generate bitvcode using `clang -S -emit-llvm`. For
more complex builds, we typically use [wllvm](https://github.com/SRI-CSL/whole-program-llvm).



What we do
==============

`llvm2smt` translates every basic block in the LLVM file into a
sequence of SMT-LIB declarations and definitions. We use a global
array to represent memory. For a 64 bit address space, this array has
type

```scheme
  (Array (_ BitVec 64) (_ BitVec 8)).
```

Read operations are encoded using SMT-LIB `select` and write
operations are encoded using `store`. Each write operation produces a
new memory state, denoted by a fresh SMT-LIB constant.

We also use a global variable to denote the stack pointer. It is used to
encode the LLVM `alloca` operations (i.e., create local variables on the stack).

We use a bit-precise representation: `i1` variables are represented as
Boolean, all other integer types are converted to bitvectors of the
appropriate size. For example, `i32` variables are represented as
bitvectors of length 32. We support all LLVM types except
floating-point numbers. For LLVM vector types, we use SMT-LIB
arrays. For example a register of type `<2 x i32>` is represented as 
an array of two bitvectors of length 32. The array itself is of type

```scheme
(Array (_ BitVec 1) (_ BitVec 32)).
```

The SMT-LIB translation assumes that every basic block is executed at
most once. In most cases, this means that we must unroll loops before
the translation by using `opt` with the following command switches:
```
> opt -loop-rotate -loop-unroll -unroll-count=3 ...
```
(Try `opt --help-list-hidden` to see all the good things `opt` can do for you.)



What we don't do
==============

We do not handle function calls. A work around is to force the
compiler to inline the calls to all relevant functions. 
This can be done by annotating function declarations as follows:
```c
static __attribute__ ((__always_inline__))  int my_function(int x) {
  ...
}
```

We do not handle floating-point types in LLVM since the QF_ABV logic
that we use does not support include floating point operations.  Our
crude approach for now is to convert all floating-point constants to
zero and all floating-point register to uninterpreted constants in the
SMT-LIB translation.

In addition to `call` mentioned above, we do not handle the following
LLVM instructions `invoke`, `landingpad`, `resume`, `va_arg`,
`indirectbr`, `cmpxchg`, `atomicrmw`, `fence`, `addrspacecast`,
`extractvalue`, and `insertvalue`. Some of these could be added but we
have not encountered them in our C-code examples.







Acknowledgement:
==============

Our code builds upon an OCaml-based parser for LLVM written by
Trevo Jim:

https://github.com/tjim/smpcc/blob/master/compiler/

We diverged from this repository around February 2015.




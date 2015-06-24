# llvm2smt

Experimental translation of LLVM (3.5ish) IR to SMT-LIB2.


Overview
=============

This tool, llvm2smt, parses a llvm bitcode file (in its human readable form) and
translates it to a symbolic SMT-LIB2 representation.

Currently the resulting SMT-LIB2 file uses the theory of bitvectors and arrays (QF_ABV).

The goal is to support symbolic analyses such as bounded model checking using
SMT solvers.

The tool is in its infancy and only translates the llvm IR as it appears. Any logical
properties one might want to verify must be added by hand.


A Simple Example
==============

The file `test/shufflevector.ll` includes two simple functions written by hand.
The first `@lhs` takes two integers, creates a vector with those arguments,
shuffles it twice, then returns the first vector element.

```
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

```
; Function Attrs: nounwind ssp uwtable
define i32 @rhs(i32 %a, i32 %b) #0 {
  %1 = insertelement <2 x i32> undef, i32 %a, i32 0
  %2 = insertelement <2 x i32> %1, i32 %b, i32 1
  %3 = extractelement <2 x i32> %2, i32 0
  ret i32 %3
}

```

We can show that these functions are equivalent by first translating the LLVM IR
to SMT-LIB2 via:

```
llvm2smt shufflevector.ll > shufflevector.smt
```
The translation of the second function is the following.
```
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
(define-fun |%1_@rhs| () (Array (_ BitVec 1) (_ BitVec 32)) (store vzero_1_32 ((_ extract 0 0) (_ bv0 32)) |%a_@rhs|))
;; %2 = insertelement <2 x i32> %1, i32 %b, i32 1
(define-fun |%2_@rhs| () (Array (_ BitVec 1) (_ BitVec 32)) (store |%1_@rhs| ((_ extract 0 0) (_ bv1 32)) |%b_@rhs|))
;; %3 = extractelement <2 x i32> %2, i32 0
(define-fun |%3_@rhs| () (_ BitVec 32) (select |%2_@rhs| ((_ extract 0 0) (_ bv0 32))))
;; ret i32 %3
;; No backward arrows


(define-fun @rhs_result () (_ BitVec 32) |%3_@rhs|)

```
The key points are:

1. The function takes two input arguments denoted by `|%a_@rhs|` and `|%b_@rhs|`, both 
being bitvectors of length 32.

2. The return value is denoted by `@rhs_result`

To assert that these two functions are equivalent we state:

```
(assert (and (= |%a_@lhs| |%a_@rhs|) (= |%b_@lhs| |%b_@rhs|) (not (= @lhs_result @rhs_result))))
(check-sat)
```


Prerequisites
==============

Ocaml





What we do
==============



What we don't do
==============



Acknowledgements:
==============

The ocaml lex and yac that we built upon comes directly from:

https://github.com/tjim/smpcc/blob/master/compiler/

which we diverged from around February 2015.




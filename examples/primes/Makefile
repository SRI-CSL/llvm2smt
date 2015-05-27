# LLVM = ${HOME}/LLVM/llvm-3.5-install/bin/
LLVM = ${HOME}/LLVM-3.5.0/build/Debug+Asserts/bin

all:
#	clang -S -emit-llvm distrib.c	
	clang -S -emit-llvm sums.c
#	clang -S -emit-llvm primes.c
#	clang -O1 -S -emit-llvm sums.c -o sums_opt.ll
#	clang -O1 -S -emit-llvm primes.c -o primes_opt.ll


dot:
#	${LLVM}/opt -dot-callgraph primes_opt.ll  -o /dev/null
#	 dot -Tpng callgraph.dot -o callgraph.png	
#	${LLVM}/opt -dot-cfg primes_opt.ll  -o /dev/null
	${LLVM}/opt -dot-cfg-only primes_opt.ll  -o /dev/null
#	 dot -Tpng cfg.main.dot -o cfg_main.png	
#	 dot -Tpng cfg.primes.dot -o cfg_primes.png	
#	${LLVM}/opt -dot-cfg-only primes_opt_u2.ll  -o /dev/null
#	${LLVM}/opt -dot-cfg-only primes_opt_u5.ll  -o /dev/null
#	 dot -Tpng cfg.primes.dot -o cfg_primes_u5.png	

runp:
	${LLVM}/lli primes_opt_auto2.ll 100

runs:
	${LLVM}/lli sums.ll 0
	${LLVM}/lli sums.ll 0 6
	${LLVM}/lli sums_unroll3_fixed_by_hand.ll 0
	${LLVM}/lli sums_unroll3_fixed_by_hand.ll 0 6

#-loops -loop-simplify
# also -unroll-threshold
#
# To see the hidden options: clang or opt --help-list-hidden
#

unfoldp:
	${LLVM}/opt -debug  -loop-unroll -unroll-count=2 primes_opt.ll  -o primes_opt_auto2.bc 2> primes_opt_auto2.log
	${LLVM}/llvm-dis primes_opt_auto2.bc
	${LLVM}/opt -dot-cfg-only primes_opt_auto2.ll  -o /dev/null
	dot -Tpng cfg.primes.dot -o cfg_primes_auto2.png

unfolds:
	${LLVM}/opt -debug -loop-rotate  -loop-unroll -unroll-count=3 sums.ll  -o sums_auto3.bc 2> sums_auto3.log
	${LLVM}/llvm-dis sums_auto3.bc
	${LLVM}/opt -dot-cfg-only sums_auto3.ll  -o /dev/null
	dot -Tpng cfg.lhs.dot -o cfg_sums_lhs_auto3.png

unfold_test:
	${LLVM}/opt -debug  -loop-unroll -unroll-count=10 -unroll-threshold=10000 primes_opt.ll  -o primes_opt_test10.bc 2> primes_opt_test10.log
	${LLVM}/llvm-dis primes_opt_test10.bc
	${LLVM}/opt -dot-cfg-only primes_opt_test10.ll  -o /dev/null
	dot -Tsvg cfg.primes.dot -o cfg_primes_test10.svg


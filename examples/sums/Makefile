LLVM = ${HOME}/LLVM/llvm-3.5-install/bin/
# LLVM = ${HOME}/LLVM-3.5.0/build/Debug+Asserts/bin

all:
	clang -S -emit-llvm sums.c

runs:
	${LLVM}/lli sums.ll 10
	${LLVM}/lli sums.ll 10 6

unfolds:
	${LLVM}/opt -debug -loop-rotate  -loop-unroll -unroll-count=3 sums.ll  -o sums_auto3.bc 2> sums_auto3.log
	${LLVM}/llvm-dis sums_auto3.bc
	${LLVM}/opt -dot-cfg-only sums_auto3.ll  -o /dev/null
	dot -Tpng cfg.lhs.dot -o cfg_sums_lhs_auto3.png



clean:
	rm -f *.dot *.bc *.ll *.png *.log



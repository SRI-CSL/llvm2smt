all:
	${LLVM_HOME}/bin/clang -S -emit-llvm sums.c

runs:
	${LLVM_HOME}/bin/lli sums.ll 10
	${LLVM_HOME}/bin/lli sums.ll 10 6

unfolds:
	${LLVM_HOME}/bin/opt -debug -loop-rotate  -loop-unroll -unroll-count=3 sums.ll  -o sums_auto3.bc 2> sums_auto3.log
	${LLVM_HOME}/bin/llvm-dis sums_auto3.bc
	${LLVM_HOME}/bin/opt -dot-cfg-only sums_auto3.ll  -o /dev/null
	dot -Tpng cfg.lhs.dot -o cfg_sums_lhs_auto3.png



clean:
	rm -f *.dot *.bc *.ll *.png *.log



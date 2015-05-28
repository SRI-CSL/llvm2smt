# LLVM = ${HOME}/LLVM/llvm-3.5-install/bin
LLVM = ${HOME}/LLVM-3.5.0/build/Debug+Asserts/bin

primes:
	clang -S -emit-llvm primes.c -o primes.ll
	clang -O1 -S -emit-llvm primes.c -o primes_opt.ll

dot:
	${LLVM}/opt -dot-cfg-only primes_opt.ll  -o /dev/null

run:
	${LLVM}/lli primes_opt.ll 100


#-loops -loop-simplify
# also -unroll-threshold
#
# To see the hidden options: clang or opt --help-list-hidden
#

#numbers higher than 5 can be done, but dot needs help.
VERSIONS=2 3 4 5


unfold: primes
	for ucount in ${VERSIONS} ; do \
	    `${LLVM}/opt -debug -loop-unroll -unroll-count=$${ucount} -unroll-threshold=10000 primes_opt.ll  -o primes_opt_test$${ucount}.bc  2> primes_opt_test$${ucount}.log `\
            `${LLVM}/llvm-dis primes_opt_test$${ucount}.bc` \
	    `${LLVM}/opt -dot-cfg-only primes_opt_test$${ucount}.ll  -o /dev/null` \
	    `dot -Tpng cfg.primes.dot -o primes_opt_test$${ucount}.png` \
	    echo "Success for $${ucount}\n"; \
        done



clean:
	rm *.bc *.ll *.log  *.dot *.png

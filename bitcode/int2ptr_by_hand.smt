(set-logic QF_ABV)
(define-sort Address () (_ BitVec 64))
(define-sort Byte () (_ BitVec 8))
(define-sort Mem () (Array Address Byte))

(define-sort I8 () (_ BitVec 8))
(define-sort I16 () (_ BitVec 16))
(define-sort I32 () (_ BitVec 32))
(define-sort I64 () (_ BitVec 64))
(define-sort I128 () (_ BitVec 128))


;;
;;constants
;;
(define-fun zero  () Address (_ bv0 64))
(define-fun one   () Address (_ bv1 64))
(define-fun two   () Address (_ bv2 64))
(define-fun three () Address (_ bv3 64))
(define-fun four  () Address (_ bv4 64))
(define-fun five  () Address (_ bv5 64))
(define-fun six   () Address (_ bv6 64))
(define-fun seven () Address (_ bv7 64))
(define-fun eight () Address (_ bv8 64))


;;
;; Write a little endian 1 bit value (8 bit aligned) at address x in mem
;;
(define-fun write1 ((mem Mem) (x Address) (v Bool)) Mem
  (store mem x (ite v #x01 #x00)))

;;
;; Write a little endian 8bit value at address x in mem
;;
(define-fun write8 ((mem Mem) (x Address) (v I8)) Mem
  (store mem x v))

;;
;; Write a little endian 16bit value at address x in mem
;;
(define-fun write16 ((mem Mem) (x Address) (v I16)) Mem
  (let ((b0 ((_ extract 7 0) v))
	(b1 ((_ extract 15 8) v)))
    (store (store mem x b0) (bvadd x one) b1)))

;;
;; Write a little endian 32bit value at address x in mem
;;
(define-fun write32 ((mem Mem) (x Address) (v I32)) Mem
  (let ((b0 ((_ extract 7 0) v))
	(b1 ((_ extract 15 8) v))
	(b2 ((_ extract 23 16) v))
	(b3 ((_ extract 31 24) v)))
    (store (store (store (store mem x b0) (bvadd x one) b1) (bvadd x two) b2) (bvadd x three) b3)))

;;
;; Write a little endian 64bit value at address x in mem
;;
(define-fun write64 ((mem Mem) (x Address) (v I64)) Mem
  (let ((b0 ((_ extract 31 0) v))
	(b1 ((_ extract 63 32) v)))
    (write32 (write32 mem x b0) (bvadd x four) b1)))

;;
;; Write a little endian 128bit value at address x in mem
;;
(define-fun write128 ((mem Mem) (x Address) (v I128)) Mem
  (let ((b0 ((_ extract 63 0) v))
	(b1 ((_ extract 127 64) v)))
    (write64 (write64 mem x b0) (bvadd x eight) b1)))


;;
;; Read a little endian 1 bit value (8 bit aligned) at address x in mem
;; - returns a Boolean: true if what's stored at address x is non-zero
;;
(define-fun read1 ((mem Mem) (x Address)) Bool
   (not (= (select mem x) #x00)))

;;
;; Read a little endian 8bit value at address x in mem
;;
(define-fun read8 ((mem Mem) (x Address)) I8
  (select mem x))

;;
;; Read a little endian 16bit value at address x in mem
;;
(define-fun read16 ((mem Mem) (x Address)) I16
  (let ((b0 (select mem x))
	(b1 (select mem (bvadd x one))))
    (concat b1 b0))) 

;;
;; Read a little endian 32bit value at address x in mem
;;
(define-fun read32 ((mem Mem) (x Address)) I32
  (let ((b0 (select mem x))
	(b1 (select mem (bvadd x one)))
	(b2 (select mem (bvadd x two)))
	(b3 (select mem (bvadd x three))))
    (concat b3 (concat b2 (concat b1 b0)))))

;;
;; Read a little endian 64bit value at address x in mem
;;
(define-fun read64 ((mem Mem) (x Address)) I64
  (let ((b0 (read32 mem x))
        (b1 (read32 mem (bvadd x four))))
    (concat b1 b0)))

;;
;; Read a little endian 128bit value at address x in mem
;;
(define-fun read128 ((mem Mem) (x Address)) I128
  (let ((b0 (read64 mem x))
        (b1 (read64 mem (bvadd x eight))))
    (concat b1 b0)))

;; @.str [37 x i8] = c"foo is %d, foo_ptr is %p, bar is %d\0A\00"
(declare-fun |@.str| () (_ BitVec 64))


;; Function: |@lhs|
;; (i32 %x)
(declare-fun memory1 () Mem)
(define-fun rsp1 () (_ BitVec 64) (_ bv0 64))
(declare-fun |%x_@lhs| () (_ BitVec 32))

;; BLOCK %0 with index 0 and rank = 1
;; Predecessors:
;; @lhs_block_0_entry_condition 
(define-fun @lhs_block_0_entry_condition () Bool true)
;; %1 = alloca i32, align 4
(define-fun rsp2 () Address (bvsub rsp1 (_ bv4 64)))
(define-fun |%1_@lhs| () (_ BitVec 64) rsp2)
;; %ptr = alloca i8*, align 8
(define-fun rsp3 () Address (bvsub rsp2 (_ bv8 64)))
(define-fun |%ptr_@lhs| () (_ BitVec 64) rsp3)
;; store i32 %x, i32* %1, align 4
(define-fun memory2 () Mem (write32 memory1 |%1_@lhs| |%x_@lhs|))
;; %2 = load i32* %1, align 4
(define-fun |%2_@lhs| () (_ BitVec 32) (read32 memory2 |%1_@lhs|))
;; %3 = sext i32 %2 to i64
(define-fun |%3_@lhs| () (_ BitVec 64) ((_ sign_extend 32) |%2_@lhs|))
;; %4 = inttoptr i64 %3 to i8*
(define-fun |%4_@lhs| () (_ BitVec 64) |%3_@lhs|)
;; store i8* %4, i8** %ptr, align 8
(define-fun memory3 () Mem (write64 memory2 |%ptr_@lhs| |%4_@lhs|))
;; %5 = load i8** %ptr, align 8
(define-fun |%5_@lhs| () (_ BitVec 64) (read64 memory3 |%ptr_@lhs|))
;; %6 = ptrtoint i8* %5 to i32
(define-fun |%6_@lhs| () (_ BitVec 32) ((_ extract 31 0) |%5_@lhs|))
;; ret i32 %6
;; No backward arrows


(define-fun @lhs_result () (_ BitVec 32) |%6_@lhs|)

;; Function: |@rhs|
;; (i32 %x)
(declare-fun memory4 () Mem)
(define-fun rsp4 () (_ BitVec 64) (_ bv0 64))
(declare-fun |%x_@rhs| () (_ BitVec 32))

;; BLOCK %0 with index 0 and rank = 1
;; Predecessors:
;; @rhs_block_0_entry_condition 
(define-fun @rhs_block_0_entry_condition () Bool true)
;; %1 = alloca i32, align 4
(define-fun rsp5 () Address (bvsub rsp4 (_ bv4 64)))
(define-fun |%1_@rhs| () (_ BitVec 64) rsp5)
;; store i32 %x, i32* %1, align 4
(define-fun memory5 () Mem (write32 memory4 |%1_@rhs| |%x_@rhs|))
;; %2 = load i32* %1, align 4
(define-fun |%2_@rhs| () (_ BitVec 32) (read32 memory5 |%1_@rhs|))
;; ret i32 %2
;; No backward arrows


(define-fun @rhs_result () (_ BitVec 32) |%2_@rhs|)

(assert (and (= |%x_@rhs| |%x_@lhs|) (not (= |@rhs_result| |@lhs_result|))))
(check-sat)

;; Function: |@main|
;; (i32 %argc, i8** %argv)
(declare-fun memory6 () Mem)
(define-fun rsp6 () (_ BitVec 64) (_ bv0 64))
(declare-fun |%argc_@main| () (_ BitVec 32))
(declare-fun |%argv_@main| () (_ BitVec 64))

;; BLOCK %0 with index 0 and rank = 1
;; Predecessors:
;; @main_block_0_entry_condition 
(define-fun @main_block_0_entry_condition () Bool true)
;; %1 = alloca i32, align 4
(define-fun rsp7 () Address (bvsub rsp6 (_ bv4 64)))
(define-fun |%1_@main| () (_ BitVec 64) rsp7)
;; %2 = alloca i32, align 4
(define-fun rsp8 () Address (bvsub rsp7 (_ bv4 64)))
(define-fun |%2_@main| () (_ BitVec 64) rsp8)
;; %3 = alloca i8**, align 8
(define-fun rsp9 () Address (bvsub rsp8 (_ bv8 64)))
(define-fun |%3_@main| () (_ BitVec 64) rsp9)
;; %foo = alloca i32, align 4
(define-fun rsp10 () Address (bvsub rsp9 (_ bv4 64)))
(define-fun |%foo_@main| () (_ BitVec 64) rsp10)
;; %bar = alloca i32, align 4
(define-fun rsp11 () Address (bvsub rsp10 (_ bv4 64)))
(define-fun |%bar_@main| () (_ BitVec 64) rsp11)
;; %foo_ptr = alloca i8*, align 8
(define-fun rsp12 () Address (bvsub rsp11 (_ bv8 64)))
(define-fun |%foo_ptr_@main| () (_ BitVec 64) rsp12)
;; store i32 0, i32* %1
(define-fun memory7 () Mem (write32 memory6 |%1_@main| (_ bv0 32)))
;; store i32 %argc, i32* %2, align 4
(define-fun memory8 () Mem (write32 memory7 |%2_@main| |%argc_@main|))
;; store i8** %argv, i8*** %3, align 8
(define-fun memory9 () Mem (write64 memory8 |%3_@main| |%argv_@main|))
;; %4 = load i32* %2, align 4
(define-fun |%4_@main| () (_ BitVec 32) (read32 memory9 |%2_@main|))
;; %5 = icmp sle i32 %4, 1
(define-fun |%5_@main| () Bool (bvsle |%4_@main| (_ bv1 32)))
;; br i1 %5, label %6, label %7
;; No backward arrows

;; BLOCK %6 with index 1 and rank = 2
;; Predecessors: %0
;; @main_block_1_entry_condition 
(define-fun @main_block_1_entry_condition () Bool
    (and @main_block_0_entry_condition |%5_@main|)
)
;; store i32 0, i32* %1
(define-fun memory10 () Mem (write32 memory9 |%1_@main| (_ bv0 32)))
;; br label %22
;; No backward arrows

;; BLOCK %7 with index 2 and rank = 2
;; Predecessors: %0
;; @main_block_2_entry_condition 
(define-fun @main_block_2_entry_condition () Bool
    (and @main_block_0_entry_condition (not |%5_@main|))
)
;; %8 = load i8*** %3, align 8
(define-fun |%8_@main| () (_ BitVec 64) (read64 memory10 |%3_@main|))
;; %9 = getelementptr inbounds i8** %8, i64 1
(declare-fun |%9_@main| () (_ BitVec 64))
;; %10 = load i8** %9, align 8
(define-fun |%10_@main| () (_ BitVec 64) (read64 memory10 |%9_@main|))
;; %11 = call i64 @atol(i8* %10)
(declare-fun |%11_@main| () (_ BitVec 64))
;; %12 = trunc i64 %11 to i32
(define-fun |%12_@main| () (_ BitVec 32) ((_ extract 31 0) |%11_@main|))
;; store i32 %12, i32* %foo, align 4
(define-fun memory11 () Mem (write32 memory10 |%foo_@main| |%12_@main|))
;; %13 = load i32* %foo, align 4
(define-fun |%13_@main| () (_ BitVec 32) (read32 memory11 |%foo_@main|))
;; %14 = sext i32 %13 to i64
(define-fun |%14_@main| () (_ BitVec 64) ((_ sign_extend 32) |%13_@main|))
;; %15 = inttoptr i64 %14 to i8*
(define-fun |%15_@main| () (_ BitVec 64) |%14_@main|)
;; store i8* %15, i8** %foo_ptr, align 8
(define-fun memory12 () Mem (write64 memory11 |%foo_ptr_@main| |%15_@main|))
;; %16 = load i8** %foo_ptr, align 8
(define-fun |%16_@main| () (_ BitVec 64) (read64 memory12 |%foo_ptr_@main|))
;; %17 = ptrtoint i8* %16 to i32
(define-fun |%17_@main| () (_ BitVec 32) ((_ extract 31 0) |%16_@main|))
;; store i32 %17, i32* %bar, align 4
(define-fun memory13 () Mem (write32 memory12 |%bar_@main| |%17_@main|))
;; %18 = load i32* %foo, align 4
(define-fun |%18_@main| () (_ BitVec 32) (read32 memory13 |%foo_@main|))
;; %19 = load i8** %foo_ptr, align 8
(define-fun |%19_@main| () (_ BitVec 64) (read64 memory13 |%foo_ptr_@main|))
;; %20 = load i32* %bar, align 4
(define-fun |%20_@main| () (_ BitVec 32) (read32 memory13 |%bar_@main|))
;; %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 %18, i8* %19, i32 %20)
(declare-fun |%21_@main| () (_ BitVec 64))
;; store i32 0, i32* %1
(define-fun memory14 () Mem (write32 memory13 |%1_@main| (_ bv0 32)))
;; br label %22
;; No backward arrows

;; BLOCK %22 with index 3 and rank = 3
;; Predecessors: %7 %6
;; @main_block_3_entry_condition 
(define-fun @main_block_3_entry_condition () Bool
    (or
        @main_block_2_entry_condition
        @main_block_1_entry_condition
    )
)
;; %23 = load i32* %1
(define-fun |%23_@main| () (_ BitVec 32) (read32 memory14 |%1_@main|))
;; ret i32 %23
;; No backward arrows


(define-fun @main_result () (_ BitVec 32) |%23_@main|)

;; Function: |@atol|
;; (i8*)


;; Function: |@printf|
;; (i8*, ...)



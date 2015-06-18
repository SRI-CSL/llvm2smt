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



;; Function: |@exp0|
;; (i32 %a, i32 %b)
(declare-fun memory1 () Mem)
(define-fun rsp1 () (_ BitVec 64) (_ bv0 64))
(declare-fun |%a_@exp0| () (_ BitVec 32))
(declare-fun |%b_@exp0| () (_ BitVec 32))

;; BLOCK %0 with index 0 and rank = 1
;; Predecessors:
;; @exp0_block_0_entry_condition 
(define-fun @exp0_block_0_entry_condition () Bool true)
;; %1 = alloca i32, align 4
(define-fun rsp2 () Address (bvsub rsp1 (_ bv4 64)))
(define-fun |%1_@exp0| () (_ BitVec 64) rsp2)
;; %2 = alloca i32, align 4
(define-fun rsp3 () Address (bvsub rsp2 (_ bv4 64)))
(define-fun |%2_@exp0| () (_ BitVec 64) rsp3)
;; %3 = alloca i32, align 4
(define-fun rsp4 () Address (bvsub rsp3 (_ bv4 64)))
(define-fun |%3_@exp0| () (_ BitVec 64) rsp4)
;; %retval = alloca i32, align 4
(define-fun rsp5 () Address (bvsub rsp4 (_ bv4 64)))
(define-fun |%retval_@exp0| () (_ BitVec 64) rsp5)
;; store i32 %a, i32* %2, align 4
(define-fun memory2 () Mem (write32 memory1 |%2_@exp0| |%a_@exp0|))
;; store i32 %b, i32* %3, align 4
(define-fun memory3 () Mem (write32 memory2 |%3_@exp0| |%b_@exp0|))
;; store i32 1, i32* %retval, align 4
(define-fun memory4 () Mem (write32 memory3 |%retval_@exp0| (_ bv1 32)))
;; %4 = load i32* %3, align 4
(define-fun |%4_@exp0| () (_ BitVec 32) (read32 memory4 |%3_@exp0|))
;; %5 = icmp slt i32 %4, 0
(define-fun |%5_@exp0| () Bool (bvslt |%4_@exp0| (_ bv0 32)))
;; br i1 %5, label %6, label %7
;; No backward arrows

;; BLOCK %6 with index 1 and rank = 2
;; Predecessors: %0
;; @exp0_block_1_entry_condition 
(define-fun @exp0_block_1_entry_condition () Bool
    (and @exp0_block_0_entry_condition |%5_@exp0|)
)
(define-fun memory5 () Mem memory4)
;; store i32 0, i32* %1
(define-fun memory6 () Mem (write32 memory5 |%1_@exp0| (_ bv0 32)))
;; br label %20
;; No backward arrows

;; BLOCK %7 with index 2 and rank = 2
;; Predecessors: %0
;; @exp0_block_2_entry_condition 
(define-fun @exp0_block_2_entry_condition () Bool
    (and @exp0_block_0_entry_condition (not |%5_@exp0|))
)
(define-fun memory7 () Mem memory4)
;; %8 = load i32* %3, align 4
(define-fun |%8_@exp0| () (_ BitVec 32) (read32 memory7 |%3_@exp0|))
;; %9 = icmp sgt i32 %8, 0
(define-fun |%9_@exp0| () Bool (bvsgt |%8_@exp0| (_ bv0 32)))
;; br i1 %9, label %.lr.ph, label %18
;; No backward arrows

;; BLOCK %.lr.ph with index 3 and rank = 3
;; Predecessors: %7
;; @exp0_block_3_entry_condition 
(define-fun @exp0_block_3_entry_condition () Bool
    (and @exp0_block_2_entry_condition |%9_@exp0|)
)
(define-fun memory8 () Mem memory7)
;; br label %10
;; No backward arrows

;; BLOCK %10 with index 4 and rank = 4
;; Predecessors: %30 %.lr.ph
;; Backward pointers: %30
;; @exp0_block_4_entry_condition 
(define-fun @exp0_block_4_entry_condition () Bool
    @exp0_block_3_entry_condition
)
(define-fun memory9 () Mem memory8)
;; %11 = load i32* %2, align 4
(define-fun |%11_@exp0| () (_ BitVec 32) (read32 memory9 |%2_@exp0|))
;; %12 = load i32* %retval, align 4
(define-fun |%12_@exp0| () (_ BitVec 32) (read32 memory9 |%retval_@exp0|))
;; %13 = mul nsw i32 %12, %11
(define-fun |%13_@exp0| () (_ BitVec 32) (bvmul |%12_@exp0| |%11_@exp0|))
;; store i32 %13, i32* %retval, align 4
(define-fun memory10 () Mem (write32 memory9 |%retval_@exp0| |%13_@exp0|))
;; %14 = load i32* %3, align 4
(define-fun |%14_@exp0| () (_ BitVec 32) (read32 memory10 |%3_@exp0|))
;; %15 = sub nsw i32 %14, 1
(define-fun |%15_@exp0| () (_ BitVec 32) (bvsub |%14_@exp0| (_ bv1 32)))
;; store i32 %15, i32* %3, align 4
(define-fun memory11 () Mem (write32 memory10 |%3_@exp0| |%15_@exp0|))
;; %16 = load i32* %3, align 4
(define-fun |%16_@exp0| () (_ BitVec 32) (read32 memory11 |%3_@exp0|))
;; %17 = icmp sgt i32 %16, 0
(define-fun |%17_@exp0| () Bool (bvsgt |%16_@exp0| (_ bv0 32)))
;; br i1 %17, label %22, label %._crit_edge
;; No backward arrows

;; BLOCK %22 with index 8 and rank = 5
;; Predecessors: %10
;; @exp0_block_8_entry_condition 
(define-fun @exp0_block_8_entry_condition () Bool
    (and @exp0_block_4_entry_condition |%17_@exp0|)
)
(define-fun memory12 () Mem memory11)
;; %23 = load i32* %2, align 4
(define-fun |%23_@exp0| () (_ BitVec 32) (read32 memory12 |%2_@exp0|))
;; %24 = load i32* %retval, align 4
(define-fun |%24_@exp0| () (_ BitVec 32) (read32 memory12 |%retval_@exp0|))
;; %25 = mul nsw i32 %24, %23
(define-fun |%25_@exp0| () (_ BitVec 32) (bvmul |%24_@exp0| |%23_@exp0|))
;; store i32 %25, i32* %retval, align 4
(define-fun memory13 () Mem (write32 memory12 |%retval_@exp0| |%25_@exp0|))
;; %26 = load i32* %3, align 4
(define-fun |%26_@exp0| () (_ BitVec 32) (read32 memory13 |%3_@exp0|))
;; %27 = sub nsw i32 %26, 1
(define-fun |%27_@exp0| () (_ BitVec 32) (bvsub |%26_@exp0| (_ bv1 32)))
;; store i32 %27, i32* %3, align 4
(define-fun memory14 () Mem (write32 memory13 |%3_@exp0| |%27_@exp0|))
;; %28 = load i32* %3, align 4
(define-fun |%28_@exp0| () (_ BitVec 32) (read32 memory14 |%3_@exp0|))
;; %29 = icmp sgt i32 %28, 0
(define-fun |%29_@exp0| () Bool (bvsgt |%28_@exp0| (_ bv0 32)))
;; br i1 %29, label %30, label %._crit_edge
;; No backward arrows

;; BLOCK %30 with index 9 and rank = 6
;; Predecessors: %22
;; @exp0_block_9_entry_condition 
(define-fun @exp0_block_9_entry_condition () Bool
    (and @exp0_block_8_entry_condition |%29_@exp0|)
)
(define-fun memory15 () Mem memory14)
;; %31 = load i32* %2, align 4
(define-fun |%31_@exp0| () (_ BitVec 32) (read32 memory15 |%2_@exp0|))
;; %32 = load i32* %retval, align 4
(define-fun |%32_@exp0| () (_ BitVec 32) (read32 memory15 |%retval_@exp0|))
;; %33 = mul nsw i32 %32, %31
(define-fun |%33_@exp0| () (_ BitVec 32) (bvmul |%32_@exp0| |%31_@exp0|))
;; store i32 %33, i32* %retval, align 4
(define-fun memory16 () Mem (write32 memory15 |%retval_@exp0| |%33_@exp0|))
;; %34 = load i32* %3, align 4
(define-fun |%34_@exp0| () (_ BitVec 32) (read32 memory16 |%3_@exp0|))
;; %35 = sub nsw i32 %34, 1
(define-fun |%35_@exp0| () (_ BitVec 32) (bvsub |%34_@exp0| (_ bv1 32)))
;; store i32 %35, i32* %3, align 4
(define-fun memory17 () Mem (write32 memory16 |%3_@exp0| |%35_@exp0|))
;; %36 = load i32* %3, align 4
(define-fun |%36_@exp0| () (_ BitVec 32) (read32 memory17 |%3_@exp0|))
;; %37 = icmp sgt i32 %36, 0
(define-fun |%37_@exp0| () Bool (bvsgt |%36_@exp0| (_ bv0 32)))
;; br i1 %37, label %10, label %._crit_edge
;; BACKWARD ARROWS:  %10
(assert 
    (not (and @exp0_block_9_entry_condition |%37_@exp0|))
)

;; BLOCK %._crit_edge with index 5 and rank = 7
;; Predecessors: %30 %22 %10
;; @exp0_block_5_entry_condition 
(define-fun @exp0_block_5_entry_condition () Bool
    (or
        (and @exp0_block_9_entry_condition (not |%37_@exp0|))
        (and @exp0_block_8_entry_condition (not |%29_@exp0|))
        (and @exp0_block_4_entry_condition (not |%17_@exp0|))
    )
)
(define-fun memory18 () Mem (ite (and @exp0_block_9_entry_condition (not |%37_@exp0|)) memory17 (ite (and @exp0_block_8_entry_condition (not |%29_@exp0|)) memory14 memory11)))
;; br label %18
;; No backward arrows

;; BLOCK %18 with index 6 and rank = 8
;; Predecessors: %._crit_edge %7
;; @exp0_block_6_entry_condition 
(define-fun @exp0_block_6_entry_condition () Bool
    (or
        @exp0_block_5_entry_condition
        (and @exp0_block_2_entry_condition (not |%9_@exp0|))
    )
)
(define-fun memory19 () Mem (ite @exp0_block_5_entry_condition memory18 memory7))
;; %19 = load i32* %retval, align 4
(define-fun |%19_@exp0| () (_ BitVec 32) (read32 memory19 |%retval_@exp0|))
;; store i32 %19, i32* %1
(define-fun memory20 () Mem (write32 memory19 |%1_@exp0| |%19_@exp0|))
;; br label %20
;; No backward arrows

;; BLOCK %20 with index 7 and rank = 9
;; Predecessors: %18 %6
;; @exp0_block_7_entry_condition 
(define-fun @exp0_block_7_entry_condition () Bool
    (or
        @exp0_block_6_entry_condition
        @exp0_block_1_entry_condition
    )
)
(define-fun memory21 () Mem (ite @exp0_block_6_entry_condition memory20 memory6))
;; %21 = load i32* %1
(define-fun |%21_@exp0| () (_ BitVec 32) (read32 memory21 |%1_@exp0|))
;; ret i32 %21
;; No backward arrows


(define-fun @exp0_result () (_ BitVec 32) |%21_@exp0|)

;; Function: |@exp1|
;; (i32 %a, i32 %b)
(declare-fun memory22 () Mem)
(define-fun rsp6 () (_ BitVec 64) (_ bv0 64))
(declare-fun |%a_@exp1| () (_ BitVec 32))
(declare-fun |%b_@exp1| () (_ BitVec 32))

;; BLOCK %0 with index 0 and rank = 1
;; Predecessors:
;; @exp1_block_0_entry_condition 
(define-fun @exp1_block_0_entry_condition () Bool true)
;; %1 = alloca i32, align 4
(define-fun rsp7 () Address (bvsub rsp6 (_ bv4 64)))
(define-fun |%1_@exp1| () (_ BitVec 64) rsp7)
;; %2 = alloca i32, align 4
(define-fun rsp8 () Address (bvsub rsp7 (_ bv4 64)))
(define-fun |%2_@exp1| () (_ BitVec 64) rsp8)
;; %3 = alloca i32, align 4
(define-fun rsp9 () Address (bvsub rsp8 (_ bv4 64)))
(define-fun |%3_@exp1| () (_ BitVec 64) rsp9)
;; %retval = alloca i32, align 4
(define-fun rsp10 () Address (bvsub rsp9 (_ bv4 64)))
(define-fun |%retval_@exp1| () (_ BitVec 64) rsp10)
;; store i32 %a, i32* %2, align 4
(define-fun memory23 () Mem (write32 memory22 |%2_@exp1| |%a_@exp1|))
;; store i32 %b, i32* %3, align 4
(define-fun memory24 () Mem (write32 memory23 |%3_@exp1| |%b_@exp1|))
;; store i32 1, i32* %retval, align 4
(define-fun memory25 () Mem (write32 memory24 |%retval_@exp1| (_ bv1 32)))
;; %4 = load i32* %3, align 4
(define-fun |%4_@exp1| () (_ BitVec 32) (read32 memory25 |%3_@exp1|))
;; %5 = icmp slt i32 %4, 0
(define-fun |%5_@exp1| () Bool (bvslt |%4_@exp1| (_ bv0 32)))
;; br i1 %5, label %6, label %7
;; No backward arrows

;; BLOCK %6 with index 1 and rank = 2
;; Predecessors: %0
;; @exp1_block_1_entry_condition 
(define-fun @exp1_block_1_entry_condition () Bool
    (and @exp1_block_0_entry_condition |%5_@exp1|)
)
(define-fun memory26 () Mem memory25)
;; store i32 0, i32* %1
(define-fun memory27 () Mem (write32 memory26 |%1_@exp1| (_ bv0 32)))
;; br label %28
;; No backward arrows

;; BLOCK %7 with index 2 and rank = 2
;; Predecessors: %0
;; @exp1_block_2_entry_condition 
(define-fun @exp1_block_2_entry_condition () Bool
    (and @exp1_block_0_entry_condition (not |%5_@exp1|))
)
(define-fun memory28 () Mem memory25)
;; %8 = load i32* %3, align 4
(define-fun |%8_@exp1| () (_ BitVec 32) (read32 memory28 |%3_@exp1|))
;; %9 = icmp ne i32 %8, 0
(define-fun |%9_@exp1| () Bool (distinct |%8_@exp1| (_ bv0 32)))
;; br i1 %9, label %.lr.ph, label %26
;; No backward arrows

;; BLOCK %.lr.ph with index 3 and rank = 3
;; Predecessors: %7
;; @exp1_block_3_entry_condition 
(define-fun @exp1_block_3_entry_condition () Bool
    (and @exp1_block_2_entry_condition |%9_@exp1|)
)
(define-fun memory29 () Mem memory28)
;; br label %10
;; No backward arrows

;; BLOCK %10 with index 4 and rank = 4
;; Predecessors: %54 %.lr.ph
;; Backward pointers: %54
;; @exp1_block_4_entry_condition 
(define-fun @exp1_block_4_entry_condition () Bool
    @exp1_block_3_entry_condition
)
(define-fun memory30 () Mem memory29)
;; %11 = load i32* %3, align 4
(define-fun |%11_@exp1| () (_ BitVec 32) (read32 memory30 |%3_@exp1|))
;; %12 = and i32 %11, 1
(define-fun |%12_@exp1| () (_ BitVec 32) (bvand |%11_@exp1| (_ bv1 32)))
;; %13 = icmp ne i32 %12, 0
(define-fun |%13_@exp1| () Bool (distinct |%12_@exp1| (_ bv0 32)))
;; br i1 %13, label %14, label %18
;; No backward arrows

;; BLOCK %14 with index 5 and rank = 5
;; Predecessors: %10
;; @exp1_block_5_entry_condition 
(define-fun @exp1_block_5_entry_condition () Bool
    (and @exp1_block_4_entry_condition |%13_@exp1|)
)
(define-fun memory31 () Mem memory30)
;; %15 = load i32* %2, align 4
(define-fun |%15_@exp1| () (_ BitVec 32) (read32 memory31 |%2_@exp1|))
;; %16 = load i32* %retval, align 4
(define-fun |%16_@exp1| () (_ BitVec 32) (read32 memory31 |%retval_@exp1|))
;; %17 = mul nsw i32 %16, %15
(define-fun |%17_@exp1| () (_ BitVec 32) (bvmul |%16_@exp1| |%15_@exp1|))
;; store i32 %17, i32* %retval, align 4
(define-fun memory32 () Mem (write32 memory31 |%retval_@exp1| |%17_@exp1|))
;; br label %18
;; No backward arrows

;; BLOCK %18 with index 6 and rank = 6
;; Predecessors: %14 %10
;; @exp1_block_6_entry_condition 
(define-fun @exp1_block_6_entry_condition () Bool
    (or
        @exp1_block_5_entry_condition
        (and @exp1_block_4_entry_condition (not |%13_@exp1|))
    )
)
(define-fun memory33 () Mem (ite @exp1_block_5_entry_condition memory32 memory30))
;; %19 = load i32* %3, align 4
(define-fun |%19_@exp1| () (_ BitVec 32) (read32 memory33 |%3_@exp1|))
;; %20 = ashr i32 %19, 1
(define-fun |%20_@exp1| () (_ BitVec 32) (bvashr |%19_@exp1| (_ bv1 32)))
;; store i32 %20, i32* %3, align 4
(define-fun memory34 () Mem (write32 memory33 |%3_@exp1| |%20_@exp1|))
;; %21 = load i32* %2, align 4
(define-fun |%21_@exp1| () (_ BitVec 32) (read32 memory34 |%2_@exp1|))
;; %22 = load i32* %2, align 4
(define-fun |%22_@exp1| () (_ BitVec 32) (read32 memory34 |%2_@exp1|))
;; %23 = mul nsw i32 %22, %21
(define-fun |%23_@exp1| () (_ BitVec 32) (bvmul |%22_@exp1| |%21_@exp1|))
;; store i32 %23, i32* %2, align 4
(define-fun memory35 () Mem (write32 memory34 |%2_@exp1| |%23_@exp1|))
;; %24 = load i32* %3, align 4
(define-fun |%24_@exp1| () (_ BitVec 32) (read32 memory35 |%3_@exp1|))
;; %25 = icmp ne i32 %24, 0
(define-fun |%25_@exp1| () Bool (distinct |%24_@exp1| (_ bv0 32)))
;; br i1 %25, label %30, label %._crit_edge
;; No backward arrows

;; BLOCK %30 with index 10 and rank = 7
;; Predecessors: %18
;; @exp1_block_10_entry_condition 
(define-fun @exp1_block_10_entry_condition () Bool
    (and @exp1_block_6_entry_condition |%25_@exp1|)
)
(define-fun memory36 () Mem memory35)
;; %31 = load i32* %3, align 4
(define-fun |%31_@exp1| () (_ BitVec 32) (read32 memory36 |%3_@exp1|))
;; %32 = and i32 %31, 1
(define-fun |%32_@exp1| () (_ BitVec 32) (bvand |%31_@exp1| (_ bv1 32)))
;; %33 = icmp ne i32 %32, 0
(define-fun |%33_@exp1| () Bool (distinct |%32_@exp1| (_ bv0 32)))
;; br i1 %33, label %34, label %38
;; No backward arrows

;; BLOCK %34 with index 11 and rank = 8
;; Predecessors: %30
;; @exp1_block_11_entry_condition 
(define-fun @exp1_block_11_entry_condition () Bool
    (and @exp1_block_10_entry_condition |%33_@exp1|)
)
(define-fun memory37 () Mem memory36)
;; %35 = load i32* %2, align 4
(define-fun |%35_@exp1| () (_ BitVec 32) (read32 memory37 |%2_@exp1|))
;; %36 = load i32* %retval, align 4
(define-fun |%36_@exp1| () (_ BitVec 32) (read32 memory37 |%retval_@exp1|))
;; %37 = mul nsw i32 %36, %35
(define-fun |%37_@exp1| () (_ BitVec 32) (bvmul |%36_@exp1| |%35_@exp1|))
;; store i32 %37, i32* %retval, align 4
(define-fun memory38 () Mem (write32 memory37 |%retval_@exp1| |%37_@exp1|))
;; br label %38
;; No backward arrows

;; BLOCK %38 with index 12 and rank = 9
;; Predecessors: %34 %30
;; @exp1_block_12_entry_condition 
(define-fun @exp1_block_12_entry_condition () Bool
    (or
        @exp1_block_11_entry_condition
        (and @exp1_block_10_entry_condition (not |%33_@exp1|))
    )
)
(define-fun memory39 () Mem (ite @exp1_block_11_entry_condition memory38 memory36))
;; %39 = load i32* %3, align 4
(define-fun |%39_@exp1| () (_ BitVec 32) (read32 memory39 |%3_@exp1|))
;; %40 = ashr i32 %39, 1
(define-fun |%40_@exp1| () (_ BitVec 32) (bvashr |%39_@exp1| (_ bv1 32)))
;; store i32 %40, i32* %3, align 4
(define-fun memory40 () Mem (write32 memory39 |%3_@exp1| |%40_@exp1|))
;; %41 = load i32* %2, align 4
(define-fun |%41_@exp1| () (_ BitVec 32) (read32 memory40 |%2_@exp1|))
;; %42 = load i32* %2, align 4
(define-fun |%42_@exp1| () (_ BitVec 32) (read32 memory40 |%2_@exp1|))
;; %43 = mul nsw i32 %42, %41
(define-fun |%43_@exp1| () (_ BitVec 32) (bvmul |%42_@exp1| |%41_@exp1|))
;; store i32 %43, i32* %2, align 4
(define-fun memory41 () Mem (write32 memory40 |%2_@exp1| |%43_@exp1|))
;; %44 = load i32* %3, align 4
(define-fun |%44_@exp1| () (_ BitVec 32) (read32 memory41 |%3_@exp1|))
;; %45 = icmp ne i32 %44, 0
(define-fun |%45_@exp1| () Bool (distinct |%44_@exp1| (_ bv0 32)))
;; br i1 %45, label %46, label %._crit_edge
;; No backward arrows

;; BLOCK %46 with index 13 and rank = 10
;; Predecessors: %38
;; @exp1_block_13_entry_condition 
(define-fun @exp1_block_13_entry_condition () Bool
    (and @exp1_block_12_entry_condition |%45_@exp1|)
)
(define-fun memory42 () Mem memory41)
;; %47 = load i32* %3, align 4
(define-fun |%47_@exp1| () (_ BitVec 32) (read32 memory42 |%3_@exp1|))
;; %48 = and i32 %47, 1
(define-fun |%48_@exp1| () (_ BitVec 32) (bvand |%47_@exp1| (_ bv1 32)))
;; %49 = icmp ne i32 %48, 0
(define-fun |%49_@exp1| () Bool (distinct |%48_@exp1| (_ bv0 32)))
;; br i1 %49, label %50, label %54
;; No backward arrows

;; BLOCK %50 with index 14 and rank = 11
;; Predecessors: %46
;; @exp1_block_14_entry_condition 
(define-fun @exp1_block_14_entry_condition () Bool
    (and @exp1_block_13_entry_condition |%49_@exp1|)
)
(define-fun memory43 () Mem memory42)
;; %51 = load i32* %2, align 4
(define-fun |%51_@exp1| () (_ BitVec 32) (read32 memory43 |%2_@exp1|))
;; %52 = load i32* %retval, align 4
(define-fun |%52_@exp1| () (_ BitVec 32) (read32 memory43 |%retval_@exp1|))
;; %53 = mul nsw i32 %52, %51
(define-fun |%53_@exp1| () (_ BitVec 32) (bvmul |%52_@exp1| |%51_@exp1|))
;; store i32 %53, i32* %retval, align 4
(define-fun memory44 () Mem (write32 memory43 |%retval_@exp1| |%53_@exp1|))
;; br label %54
;; No backward arrows

;; BLOCK %54 with index 15 and rank = 12
;; Predecessors: %50 %46
;; @exp1_block_15_entry_condition 
(define-fun @exp1_block_15_entry_condition () Bool
    (or
        @exp1_block_14_entry_condition
        (and @exp1_block_13_entry_condition (not |%49_@exp1|))
    )
)
(define-fun memory45 () Mem (ite @exp1_block_14_entry_condition memory44 memory42))
;; %55 = load i32* %3, align 4
(define-fun |%55_@exp1| () (_ BitVec 32) (read32 memory45 |%3_@exp1|))
;; %56 = ashr i32 %55, 1
(define-fun |%56_@exp1| () (_ BitVec 32) (bvashr |%55_@exp1| (_ bv1 32)))
;; store i32 %56, i32* %3, align 4
(define-fun memory46 () Mem (write32 memory45 |%3_@exp1| |%56_@exp1|))
;; %57 = load i32* %2, align 4
(define-fun |%57_@exp1| () (_ BitVec 32) (read32 memory46 |%2_@exp1|))
;; %58 = load i32* %2, align 4
(define-fun |%58_@exp1| () (_ BitVec 32) (read32 memory46 |%2_@exp1|))
;; %59 = mul nsw i32 %58, %57
(define-fun |%59_@exp1| () (_ BitVec 32) (bvmul |%58_@exp1| |%57_@exp1|))
;; store i32 %59, i32* %2, align 4
(define-fun memory47 () Mem (write32 memory46 |%2_@exp1| |%59_@exp1|))
;; %60 = load i32* %3, align 4
(define-fun |%60_@exp1| () (_ BitVec 32) (read32 memory47 |%3_@exp1|))
;; %61 = icmp ne i32 %60, 0
(define-fun |%61_@exp1| () Bool (distinct |%60_@exp1| (_ bv0 32)))
;; br i1 %61, label %10, label %._crit_edge
;; BACKWARD ARROWS:  %10
(assert 
    (not (and @exp1_block_15_entry_condition |%61_@exp1|))
)

;; BLOCK %._crit_edge with index 7 and rank = 13
;; Predecessors: %54 %38 %18
;; @exp1_block_7_entry_condition 
(define-fun @exp1_block_7_entry_condition () Bool
    (or
        (and @exp1_block_15_entry_condition (not |%61_@exp1|))
        (and @exp1_block_12_entry_condition (not |%45_@exp1|))
        (and @exp1_block_6_entry_condition (not |%25_@exp1|))
    )
)
(define-fun memory48 () Mem (ite (and @exp1_block_15_entry_condition (not |%61_@exp1|)) memory47 (ite (and @exp1_block_12_entry_condition (not |%45_@exp1|)) memory41 memory35)))
;; br label %26
;; No backward arrows

;; BLOCK %26 with index 8 and rank = 14
;; Predecessors: %._crit_edge %7
;; @exp1_block_8_entry_condition 
(define-fun @exp1_block_8_entry_condition () Bool
    (or
        @exp1_block_7_entry_condition
        (and @exp1_block_2_entry_condition (not |%9_@exp1|))
    )
)
(define-fun memory49 () Mem (ite @exp1_block_7_entry_condition memory48 memory28))
;; %27 = load i32* %retval, align 4
(define-fun |%27_@exp1| () (_ BitVec 32) (read32 memory49 |%retval_@exp1|))
;; store i32 %27, i32* %1
(define-fun memory50 () Mem (write32 memory49 |%1_@exp1| |%27_@exp1|))
;; br label %28
;; No backward arrows

;; BLOCK %28 with index 9 and rank = 15
;; Predecessors: %26 %6
;; @exp1_block_9_entry_condition 
(define-fun @exp1_block_9_entry_condition () Bool
    (or
        @exp1_block_8_entry_condition
        @exp1_block_1_entry_condition
    )
)
(define-fun memory51 () Mem (ite @exp1_block_8_entry_condition memory50 memory27))
;; %29 = load i32* %1
(define-fun |%29_@exp1| () (_ BitVec 32) (read32 memory51 |%1_@exp1|))
;; ret i32 %29
;; No backward arrows


(define-fun @exp1_result () (_ BitVec 32) |%29_@exp1|)

;; Function: |@main|
;; (i32 %argc, i8** %argv)
(declare-fun memory52 () Mem)
(define-fun rsp11 () (_ BitVec 64) (_ bv0 64))
(declare-fun |%argc_@main| () (_ BitVec 32))
(declare-fun |%argv_@main| () (_ BitVec 64))

;; BLOCK %0 with index 0 and rank = 1
;; Predecessors:
;; @main_block_0_entry_condition 
(define-fun @main_block_0_entry_condition () Bool true)
;; %1 = alloca i32, align 4
(define-fun rsp12 () Address (bvsub rsp11 (_ bv4 64)))
(define-fun |%1_@main| () (_ BitVec 64) rsp12)
;; %2 = alloca i32, align 4
(define-fun rsp13 () Address (bvsub rsp12 (_ bv4 64)))
(define-fun |%2_@main| () (_ BitVec 64) rsp13)
;; %3 = alloca i8**, align 8
(define-fun rsp14 () Address (bvsub rsp13 (_ bv8 64)))
(define-fun |%3_@main| () (_ BitVec 64) rsp14)
;; store i32 0, i32* %1
(define-fun memory53 () Mem (write32 memory52 |%1_@main| (_ bv0 32)))
;; store i32 %argc, i32* %2, align 4
(define-fun memory54 () Mem (write32 memory53 |%2_@main| |%argc_@main|))
;; store i8** %argv, i8*** %3, align 8
(define-fun memory55 () Mem (write64 memory54 |%3_@main| |%argv_@main|))
;; ret i32 0
;; No backward arrows


(define-fun @main_result () (_ BitVec 32) (_ bv0 32))


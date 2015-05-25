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

;; @__stderrp %struct.__sFILE* = no value
(declare-fun |@__stderrp| () (_ BitVec 64))
;; @.str [21 x i8] = c"Usage: %s <n> [lhs]\0A\00"
(declare-fun |@.str| () (_ BitVec 64))
;; @.str1 [14 x i8] = c"sum(%d) = %d\0A\00"
(declare-fun |@.str1| () (_ BitVec 64))


;; Function: |@lhs|
;; (i32 %n)
(define-fun block0_entry () Bool true)
(declare-fun memory0 () Mem)
(define-fun rsp0 () (_ BitVec 64) (_ bv0 64))
(declare-fun |%n| () (_ BitVec 32))
;;  %1 = alloca i32, align 4
(define-fun rsp1 () Address (bvsub rsp0 (_ bv4 64)))
(define-fun |%1| () (_ BitVec 64) rsp1)
;;  %sum = alloca i32, align 4
(define-fun rsp2 () Address (bvsub rsp1 (_ bv4 64)))
(define-fun |%sum| () (_ BitVec 64) rsp2)
;;  store i32 %n, i32* %1, align 4
(define-fun memory1 () Mem (write32 memory0 |%1| |%n|))
;;  store i32 0, i32* %sum, align 4
(define-fun memory2 () Mem (write32 memory1 |%sum| (_ bv0 32)))
;;  %2 = load i32* %1, align 4
(define-fun |%2| () (_ BitVec 32) (read32 memory2 |%1|))
;;  %3 = icmp sgt i32 %2, 0
(define-fun |%3| () Bool (bvsgt |%2| (_ bv0 32)))
;;  br i1 %3, label %.lr.ph, label %30

(define-fun lr_ph_entry () Bool (and block0_entry |%3|))
;;  br label %4

(define-fun block4_entry () Bool lr_ph_entry)
;;  %5 = load i32* %1, align 4
(define-fun |%5| () (_ BitVec 32) (read32 memory2 |%1|))
;;  %6 = load i32* %sum, align 4
(define-fun |%6| () (_ BitVec 32) (read32 memory2 |%sum|))
;;  %7 = add nsw i32 %6, %5
(define-fun |%7| () (_ BitVec 32) (bvadd |%6| |%5|))
;;  store i32 %7, i32* %sum, align 4
(define-fun memory3 () Mem (write32 memory2 |%sum| |%7|))
;;  %8 = load i32* %1, align 4
(define-fun |%8| () (_ BitVec 32) (read32 memory3 |%1|))
;;  %9 = sub nsw i32 %8, 1
(define-fun |%9| () (_ BitVec 32) (bvsub |%8| (_ bv1 32)))
;;  store i32 %9, i32* %1, align 4
(define-fun memory4 () Mem (write32 memory3 |%1| |%9|))
;;  %10 = load i32* %1, align 4
(define-fun |%10| () (_ BitVec 32) (read32 memory4 |%1|))
;;  %11 = icmp sgt i32 %10, 0
(define-fun |%11| () Bool (bvsgt |%10| (_ bv0 32)))
;;  br i1 %11, label %14, label %._crit_edge

;;  br label %13

;;  br label %14

(define-fun block14_entry () Bool (and block4_entry |%11|))
;;  %15 = load i32* %1, align 4
(define-fun |%15| () (_ BitVec 32) (read32 memory4 |%1|))
;;  %16 = load i32* %sum, align 4
(define-fun |%16| () (_ BitVec 32) (read32 memory4 |%sum|))
;;  %17 = add nsw i32 %16, %15
(define-fun |%17| () (_ BitVec 32) (bvadd |%16| |%15|))
;;  store i32 %17, i32* %sum, align 4
(define-fun memory5 () Mem (write32 memory4 |%sum| |%17|))
;;  %18 = load i32* %1, align 4
(define-fun |%18| () (_ BitVec 32) (read32 memory5 |%1|))
;;  %19 = sub nsw i32 %18, 1
(define-fun |%19| () (_ BitVec 32) (bvsub |%18| (_ bv1 32)))
;;  store i32 %19, i32* %1, align 4
(define-fun memory6 () Mem (write32 memory5 |%1| |%19|))
;;  %20 = load i32* %1, align 4
(define-fun |%20| () (_ BitVec 32) (read32 memory6 |%1|))
;;  %21 = icmp sgt i32 %20, 0
(define-fun |%21| () Bool (bvsgt |%20| (_ bv0 32)))
;;  br i1 %21, label %22, label %._crit_edge

(define-fun block22_entry () Bool (and block14_entry |%21|))
;;  %23 = load i32* %1, align 4
(define-fun |%23| () (_ BitVec 32) (read32 memory6 |%1|))
;;  %24 = load i32* %sum, align 4
(define-fun |%24| () (_ BitVec 32) (read32 memory6 |%sum|))
;;  %25 = add nsw i32 %24, %23
(define-fun |%25| () (_ BitVec 32) (bvadd |%24| |%23|))
;;  store i32 %25, i32* %sum, align 4
(define-fun memory7 () Mem (write32 memory6 |%sum| |%25|))
;;  %26 = load i32* %1, align 4
(define-fun |%26| () (_ BitVec 32) (read32 memory7 |%1|))
;;  %27 = sub nsw i32 %26, 1
(define-fun |%27| () (_ BitVec 32) (bvsub |%26| (_ bv1 32)))
;;  store i32 %27, i32* %1, align 4
(define-fun memory8 () Mem (write32 memory7 |%1| |%27|))
;;  %28 = load i32* %1, align 4
(define-fun |%28| () (_ BitVec 32) (read32 memory8 |%1|))
;;  %29 = icmp sgt i32 %28, 0
(define-fun |%29| () Bool (bvsgt |%28| (_ bv0 32)))
;;  br i1 %29, label %4, label %._crit_edge

;; cut the loop: we don't want to jump back to %4
(assert (not (and block22_entry |%29|)))

;; predecessors: %22, %14, %4
;;  br label %30
(define-fun _crit_edge_entry () Bool 
  (or (and block22_entry (not |%29|))
      (and block14_entry (not |%21|))
      (and block4_entry (not |%11|))))

;; memory = phi [memory4, %4], [memory6, %14], [memory8 %22]
(define-fun memory9 () Mem
  (ite (and block4_entry (not |%11|)) memory4
    (ite (and block14_entry (not |%21|)) memory6
      (ite (and block22_entry (not |%29|)) memory8
	memory0))))

;; predecessors: %0 and %crit_edge
(define-fun block30_entry () Bool
  (or (and block0_entry (not |%3|)) _crit_edge_entry))      

(define-fun memory10 () Mem
  (ite (and block0_entry (not |%3|)) memory2
    (ite _crit_edge_entry memory9
      memory0)))

;;  %31 = load i32* %sum, align 4
(define-fun |%31| () (_ BitVec 32) (read32 memory10 |%sum|))
;;  ret i32 %31

(define-fun result-of-lhs () (_ BitVec 32) |%31|)

;;
;; Renaming on |@rhs| to make labels unique
;; - memory0 --> memory20  (+ 20)
;; - rsp0 --> rsp20  (+ 20)
;; - %1 --> %41 (+ 40)
;; - %n --> %nnnn

;; Function: |@rhs|
;; (i32 %n)
(declare-fun memory20 () Mem)
(define-fun rsp20 () (_ BitVec 64) (_ bv0 64))
(declare-fun |%nnn| () (_ BitVec 32))
;;  %1 = alloca i32, align 4
(define-fun rsp21 () Address (bvsub rsp20 (_ bv4 64)))
(define-fun |%41| () (_ BitVec 64) rsp21)
;;  %prod = alloca i32, align 4
(define-fun rsp22 () Address (bvsub rsp21 (_ bv4 64)))
(define-fun |%prod| () (_ BitVec 64) rsp22)
;;  store i32 %n, i32* %1, align 4
(define-fun memory21 () Mem (write32 memory20 |%41| |%nnn|))
;;  %2 = load i32* %1, align 4
(define-fun |%42| () (_ BitVec 32) (read32 memory21 |%41|))
;;  %3 = load i32* %1, align 4
(define-fun |%43| () (_ BitVec 32) (read32 memory21 |%41|))
;;  %4 = add nsw i32 %3, 1
(define-fun |%44| () (_ BitVec 32) (bvadd |%43| (_ bv1 32)))
;;  %5 = mul nsw i32 %2, %4
(define-fun |%45| () (_ BitVec 32) (bvmul |%42| |%44|))
;;  store i32 %5, i32* %prod, align 4
(define-fun memory22 () Mem (write32 memory21 |%prod| |%45|))
;;  %6 = load i32* %prod, align 4
(define-fun |%46| () (_ BitVec 32) (read32 memory22 |%prod|))
;;  %7 = sdiv i32 %6, 2
(define-fun |%47| () (_ BitVec 32) (bvsdiv |%46| (_ bv2 32)))
;;  store i32 %7, i32* %prod, align 4
(define-fun memory23 () Mem (write32 memory22 |%prod| |%47|))
;;  %8 = load i32* %prod, align 4
(define-fun |%48| () (_ BitVec 32) (read32 memory23 |%prod|))
;;  ret i32 %8

(define-fun result-of-rhs () (_ BitVec 32) |%48|)

;; (assert (= memory20 memory0))
(assert (bvsge |%n| (_ bv0 32)))
(assert (= |%n| |%nnn|))
(assert (not (= result-of-lhs result-of-rhs)))

(check-sat)
(get-model)
(get-value (result-of-lhs result-of-rhs))

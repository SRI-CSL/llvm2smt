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


;;
;; Vectors of (2^1) int4 elements
;;
(define-sort vector_1_4 () (Array (_ BitVec 1) (_ BitVec 4)))

(declare-fun vundef_1_4 () vector_1_4)


;;
;; Vectors of (2^1) int8 elements
;;
(define-sort vector_1_8 () (Array (_ BitVec 1) (_ BitVec 8)))

(declare-fun vundef_1_8 () vector_1_8)


;;
;; Vectors of (2^1) int16 elements
;;
(define-sort vector_1_16 () (Array (_ BitVec 1) (_ BitVec 16)))

(declare-fun vundef_1_16 () vector_1_16)


;;
;; Vectors of (2^1) int32 elements
;;
(define-sort vector_1_32 () (Array (_ BitVec 1) (_ BitVec 32)))

(declare-fun vundef_1_32 () vector_1_32)


;;
;; Vectors of (2^1) int64 elements
;;
(define-sort vector_1_64 () (Array (_ BitVec 1) (_ BitVec 64)))

(declare-fun vundef_1_64 () vector_1_64)


;;
;; Vectors of (2^2) int4 elements
;;
(define-sort vector_2_4 () (Array (_ BitVec 2) (_ BitVec 4)))

(declare-fun vundef_2_4 () vector_2_4)


;;
;; Vectors of (2^2) int8 elements
;;
(define-sort vector_2_8 () (Array (_ BitVec 2) (_ BitVec 8)))

(declare-fun vundef_2_8 () vector_2_8)


;;
;; Vectors of (2^2) int16 elements
;;
(define-sort vector_2_16 () (Array (_ BitVec 2) (_ BitVec 16)))

(declare-fun vundef_2_16 () vector_2_16)


;;
;; Vectors of (2^2) int32 elements
;;
(define-sort vector_2_32 () (Array (_ BitVec 2) (_ BitVec 32)))

(declare-fun vundef_2_32 () vector_2_32)


;;
;; Vectors of (2^2) int64 elements
;;
(define-sort vector_2_64 () (Array (_ BitVec 2) (_ BitVec 64)))

(declare-fun vundef_2_64 () vector_2_64)


;;
;; Vectors of (2^3) int4 elements
;;
(define-sort vector_3_4 () (Array (_ BitVec 3) (_ BitVec 4)))

(declare-fun vundef_3_4 () vector_3_4)


;;
;; Vectors of (2^3) int8 elements
;;
(define-sort vector_3_8 () (Array (_ BitVec 3) (_ BitVec 8)))

(declare-fun vundef_3_8 () vector_3_8)


;;
;; Vectors of (2^3) int16 elements
;;
(define-sort vector_3_16 () (Array (_ BitVec 3) (_ BitVec 16)))

(declare-fun vundef_3_16 () vector_3_16)


;;
;; Vectors of (2^3) int32 elements
;;
(define-sort vector_3_32 () (Array (_ BitVec 3) (_ BitVec 32)))

(declare-fun vundef_3_32 () vector_3_32)


;;
;; Vectors of (2^3) int64 elements
;;
(define-sort vector_3_64 () (Array (_ BitVec 3) (_ BitVec 64)))

(declare-fun vundef_3_64 () vector_3_64)

;; Special case where we use Bool rather than bitvectors of size 1 

(define-sort vector_1_1 () (Array (_ BitVec 1) Bool))

(declare-fun vundef_1_1 () vector_1_1)

(define-fun vmake_1_1 ((x0 Bool) (x1 Bool)) vector_1_1
   (store (store vundef_1_1 #b0 x0) #b1 x1))

(define-sort vector_2_1 () (Array (_ BitVec 2) Bool))

(declare-fun vundef_2_1 () vector_2_1)

(define-fun vmake_2_1 
  ((x0 Bool) (x1 Bool) (x2 Bool) (x3 Bool)) vector_2_1
   (store (store (store (store vundef_2_1 #b00 x0) #b01 x1) #b10 x2) #b11 x3))

(define-sort vector_3_1 () (Array (_ BitVec 3) Bool))

(declare-fun vundef_3_1 () vector_3_1)

(define-fun vmake_3_1 
  ((x0 Bool) (x1 Bool) (x2 Bool) (x3 Bool) (x4 Bool) (x5 Bool) (x6 Bool) (x7 Bool)) vector_3_1
   (store (store (store (store (store (store (store (store vundef_3_1 #b000 x0) #b001 x1) #b010 x2) #b011 x3) #b100 x4) #b101 x5) #b110 x6) #b111 x7))


;;
;; Vectors of (2^1) i.e. two int4 elements
;;
(define-fun vmake_1_4 ((x0 (_ BitVec 4)) (x1 (_ BitVec 4))) vector_1_4
   (store (store vundef_1_4 #b0 x0) #b1 x1))

;;
;; Vectors of (2^2) i.e. four int4 elements
;;
(define-fun vmake_2_4 
  ((x0 (_ BitVec 4)) (x1 (_ BitVec 4)) (x2 (_ BitVec 4)) (x3 (_ BitVec 4))) vector_2_4
   (store (store (store (store vundef_2_4 #b00 x0) #b01 x1) #b10 x2) #b11 x3))

;;
;; Vectors of (2^3) i.e. eight int4 elements
;;
(define-fun vmake_3_4 
  ((x0 (_ BitVec 4)) (x1 (_ BitVec 4)) (x2 (_ BitVec 4)) (x3 (_ BitVec 4))(x4 (_ BitVec 4)) (x5 (_ BitVec 4)) (x6 (_ BitVec 4)) (x7 (_ BitVec 4))) vector_3_4
   (store (store (store (store (store (store (store (store vundef_3_4 #b000 x0) #b001 x1) #b010 x2) #b011 x3) #b100 x4) #b101 x5) #b110 x6) #b111 x7))


;; zero vectors with int4 elements

 (define-fun vzero_1_4 () vector_1_4 (vmake_1_4 (_ bv0 4) (_ bv0 4)))

 (define-fun vzero_2_4 () vector_2_4 (vmake_2_4 (_ bv0 4) (_ bv0 4) (_ bv0 4) (_ bv0 4)))
 
 (define-fun vzero_3_4 () vector_3_4 (vmake_3_4 (_ bv0 4) (_ bv0 4) (_ bv0 4) (_ bv0 4) (_ bv0 4) (_ bv0 4) (_ bv0 4) (_ bv0 4)))
 

;;
;; Vectors of (2^1) i.e. two int8 elements
;;
(define-fun vmake_1_8 ((x0 (_ BitVec 8)) (x1 (_ BitVec 8))) vector_1_8
   (store (store vundef_1_8 #b0 x0) #b1 x1))

;;
;; Vectors of (2^2) i.e. four int8 elements
;;
(define-fun vmake_2_8 
  ((x0 (_ BitVec 8)) (x1 (_ BitVec 8)) (x2 (_ BitVec 8)) (x3 (_ BitVec 8))) vector_2_8
   (store (store (store (store vundef_2_8 #b00 x0) #b01 x1) #b10 x2) #b11 x3))

;;
;; Vectors of (2^3) i.e. eight int8 elements
;;
(define-fun vmake_3_8 
  ((x0 (_ BitVec 8)) (x1 (_ BitVec 8)) (x2 (_ BitVec 8)) (x3 (_ BitVec 8))(x4 (_ BitVec 8)) (x5 (_ BitVec 8)) (x6 (_ BitVec 8)) (x7 (_ BitVec 8))) vector_3_8
   (store (store (store (store (store (store (store (store vundef_3_8 #b000 x0) #b001 x1) #b010 x2) #b011 x3) #b100 x4) #b101 x5) #b110 x6) #b111 x7))


;; zero vectors with int8 elements

 (define-fun vzero_1_8 () vector_1_8 (vmake_1_8 (_ bv0 8) (_ bv0 8)))

 (define-fun vzero_2_8 () vector_2_8 (vmake_2_8 (_ bv0 8) (_ bv0 8) (_ bv0 8) (_ bv0 8)))
 
 (define-fun vzero_3_8 () vector_3_8 (vmake_3_8 (_ bv0 8) (_ bv0 8) (_ bv0 8) (_ bv0 8) (_ bv0 8) (_ bv0 8) (_ bv0 8) (_ bv0 8)))
 

;;
;; Vectors of (2^1) i.e. two int16 elements
;;
(define-fun vmake_1_16 ((x0 (_ BitVec 16)) (x1 (_ BitVec 16))) vector_1_16
   (store (store vundef_1_16 #b0 x0) #b1 x1))

;;
;; Vectors of (2^2) i.e. four int16 elements
;;
(define-fun vmake_2_16 
  ((x0 (_ BitVec 16)) (x1 (_ BitVec 16)) (x2 (_ BitVec 16)) (x3 (_ BitVec 16))) vector_2_16
   (store (store (store (store vundef_2_16 #b00 x0) #b01 x1) #b10 x2) #b11 x3))

;;
;; Vectors of (2^3) i.e. eight int16 elements
;;
(define-fun vmake_3_16 
  ((x0 (_ BitVec 16)) (x1 (_ BitVec 16)) (x2 (_ BitVec 16)) (x3 (_ BitVec 16))(x4 (_ BitVec 16)) (x5 (_ BitVec 16)) (x6 (_ BitVec 16)) (x7 (_ BitVec 16))) vector_3_16
   (store (store (store (store (store (store (store (store vundef_3_16 #b000 x0) #b001 x1) #b010 x2) #b011 x3) #b100 x4) #b101 x5) #b110 x6) #b111 x7))


;; zero vectors with int16 elements

 (define-fun vzero_1_16 () vector_1_16 (vmake_1_16 (_ bv0 16) (_ bv0 16)))

 (define-fun vzero_2_16 () vector_2_16 (vmake_2_16 (_ bv0 16) (_ bv0 16) (_ bv0 16) (_ bv0 16)))
 
 (define-fun vzero_3_16 () vector_3_16 (vmake_3_16 (_ bv0 16) (_ bv0 16) (_ bv0 16) (_ bv0 16) (_ bv0 16) (_ bv0 16) (_ bv0 16) (_ bv0 16)))
 

;;
;; Vectors of (2^1) i.e. two int32 elements
;;
(define-fun vmake_1_32 ((x0 (_ BitVec 32)) (x1 (_ BitVec 32))) vector_1_32
   (store (store vundef_1_32 #b0 x0) #b1 x1))

;;
;; Vectors of (2^2) i.e. four int32 elements
;;
(define-fun vmake_2_32 
  ((x0 (_ BitVec 32)) (x1 (_ BitVec 32)) (x2 (_ BitVec 32)) (x3 (_ BitVec 32))) vector_2_32
   (store (store (store (store vundef_2_32 #b00 x0) #b01 x1) #b10 x2) #b11 x3))

;;
;; Vectors of (2^3) i.e. eight int32 elements
;;
(define-fun vmake_3_32 
  ((x0 (_ BitVec 32)) (x1 (_ BitVec 32)) (x2 (_ BitVec 32)) (x3 (_ BitVec 32))(x4 (_ BitVec 32)) (x5 (_ BitVec 32)) (x6 (_ BitVec 32)) (x7 (_ BitVec 32))) vector_3_32
   (store (store (store (store (store (store (store (store vundef_3_32 #b000 x0) #b001 x1) #b010 x2) #b011 x3) #b100 x4) #b101 x5) #b110 x6) #b111 x7))


;; zero vectors with int32 elements

 (define-fun vzero_1_32 () vector_1_32 (vmake_1_32 (_ bv0 32) (_ bv0 32)))

 (define-fun vzero_2_32 () vector_2_32 (vmake_2_32 (_ bv0 32) (_ bv0 32) (_ bv0 32) (_ bv0 32)))
 
 (define-fun vzero_3_32 () vector_3_32 (vmake_3_32 (_ bv0 32) (_ bv0 32) (_ bv0 32) (_ bv0 32) (_ bv0 32) (_ bv0 32) (_ bv0 32) (_ bv0 32)))
 

;;
;; Vectors of (2^1) i.e. two int64 elements
;;
(define-fun vmake_1_64 ((x0 (_ BitVec 64)) (x1 (_ BitVec 64))) vector_1_64
   (store (store vundef_1_64 #b0 x0) #b1 x1))

;;
;; Vectors of (2^2) i.e. four int64 elements
;;
(define-fun vmake_2_64 
  ((x0 (_ BitVec 64)) (x1 (_ BitVec 64)) (x2 (_ BitVec 64)) (x3 (_ BitVec 64))) vector_2_64
   (store (store (store (store vundef_2_64 #b00 x0) #b01 x1) #b10 x2) #b11 x3))

;;
;; Vectors of (2^3) i.e. eight int64 elements
;;
(define-fun vmake_3_64 
  ((x0 (_ BitVec 64)) (x1 (_ BitVec 64)) (x2 (_ BitVec 64)) (x3 (_ BitVec 64))(x4 (_ BitVec 64)) (x5 (_ BitVec 64)) (x6 (_ BitVec 64)) (x7 (_ BitVec 64))) vector_3_64
   (store (store (store (store (store (store (store (store vundef_3_64 #b000 x0) #b001 x1) #b010 x2) #b011 x3) #b100 x4) #b101 x5) #b110 x6) #b111 x7))


;; zero vectors with int64 elements

 (define-fun vzero_1_64 () vector_1_64 (vmake_1_64 (_ bv0 64) (_ bv0 64)))

 (define-fun vzero_2_64 () vector_2_64 (vmake_2_64 (_ bv0 64) (_ bv0 64) (_ bv0 64) (_ bv0 64)))
 
 (define-fun vzero_3_64 () vector_3_64 (vmake_3_64 (_ bv0 64) (_ bv0 64) (_ bv0 64) (_ bv0 64) (_ bv0 64) (_ bv0 64) (_ bv0 64) (_ bv0 64)))
 

(define-fun vbvadd_1_8 ((x vector_1_8) (y vector_1_8)) vector_1_8
   (let ((z0 (bvadd (select x #b0) (select y #b0)))
         (z1 (bvadd (select x #b1) (select y #b1))))
      (vmake_1_8 z0 z1)))

(define-fun vbvadd_1_16 ((x vector_1_16) (y vector_1_16)) vector_1_16
   (let ((z0 (bvadd (select x #b0) (select y #b0)))
         (z1 (bvadd (select x #b1) (select y #b1))))
      (vmake_1_16 z0 z1)))

(define-fun vbvadd_1_32 ((x vector_1_32) (y vector_1_32)) vector_1_32
   (let ((z0 (bvadd (select x #b0) (select y #b0)))
         (z1 (bvadd (select x #b1) (select y #b1))))
      (vmake_1_32 z0 z1)))

(define-fun vbvadd_1_64 ((x vector_1_64) (y vector_1_64)) vector_1_64
   (let ((z0 (bvadd (select x #b0) (select y #b0)))
         (z1 (bvadd (select x #b1) (select y #b1))))
      (vmake_1_64 z0 z1)))

(define-fun vbvsub_1_8 ((x vector_1_8) (y vector_1_8)) vector_1_8
   (let ((z0 (bvsub (select x #b0) (select y #b0)))
         (z1 (bvsub (select x #b1) (select y #b1))))
      (vmake_1_8 z0 z1)))

(define-fun vbvsub_1_16 ((x vector_1_16) (y vector_1_16)) vector_1_16
   (let ((z0 (bvsub (select x #b0) (select y #b0)))
         (z1 (bvsub (select x #b1) (select y #b1))))
      (vmake_1_16 z0 z1)))

(define-fun vbvsub_1_32 ((x vector_1_32) (y vector_1_32)) vector_1_32
   (let ((z0 (bvsub (select x #b0) (select y #b0)))
         (z1 (bvsub (select x #b1) (select y #b1))))
      (vmake_1_32 z0 z1)))

(define-fun vbvsub_1_64 ((x vector_1_64) (y vector_1_64)) vector_1_64
   (let ((z0 (bvsub (select x #b0) (select y #b0)))
         (z1 (bvsub (select x #b1) (select y #b1))))
      (vmake_1_64 z0 z1)))

(define-fun vbvmul_1_8 ((x vector_1_8) (y vector_1_8)) vector_1_8
   (let ((z0 (bvmul (select x #b0) (select y #b0)))
         (z1 (bvmul (select x #b1) (select y #b1))))
      (vmake_1_8 z0 z1)))

(define-fun vbvmul_1_16 ((x vector_1_16) (y vector_1_16)) vector_1_16
   (let ((z0 (bvmul (select x #b0) (select y #b0)))
         (z1 (bvmul (select x #b1) (select y #b1))))
      (vmake_1_16 z0 z1)))

(define-fun vbvmul_1_32 ((x vector_1_32) (y vector_1_32)) vector_1_32
   (let ((z0 (bvmul (select x #b0) (select y #b0)))
         (z1 (bvmul (select x #b1) (select y #b1))))
      (vmake_1_32 z0 z1)))

(define-fun vbvmul_1_64 ((x vector_1_64) (y vector_1_64)) vector_1_64
   (let ((z0 (bvmul (select x #b0) (select y #b0)))
         (z1 (bvmul (select x #b1) (select y #b1))))
      (vmake_1_64 z0 z1)))

(define-fun vbvshl_1_8 ((x vector_1_8) (y vector_1_8)) vector_1_8
   (let ((z0 (bvshl (select x #b0) (select y #b0)))
         (z1 (bvshl (select x #b1) (select y #b1))))
      (vmake_1_8 z0 z1)))

(define-fun vbvshl_1_16 ((x vector_1_16) (y vector_1_16)) vector_1_16
   (let ((z0 (bvshl (select x #b0) (select y #b0)))
         (z1 (bvshl (select x #b1) (select y #b1))))
      (vmake_1_16 z0 z1)))

(define-fun vbvshl_1_32 ((x vector_1_32) (y vector_1_32)) vector_1_32
   (let ((z0 (bvshl (select x #b0) (select y #b0)))
         (z1 (bvshl (select x #b1) (select y #b1))))
      (vmake_1_32 z0 z1)))

(define-fun vbvshl_1_64 ((x vector_1_64) (y vector_1_64)) vector_1_64
   (let ((z0 (bvshl (select x #b0) (select y #b0)))
         (z1 (bvshl (select x #b1) (select y #b1))))
      (vmake_1_64 z0 z1)))

(define-fun vbvsdiv_1_8 ((x vector_1_8) (y vector_1_8)) vector_1_8
   (let ((z0 (bvsdiv (select x #b0) (select y #b0)))
         (z1 (bvsdiv (select x #b1) (select y #b1))))
      (vmake_1_8 z0 z1)))

(define-fun vbvsdiv_1_16 ((x vector_1_16) (y vector_1_16)) vector_1_16
   (let ((z0 (bvsdiv (select x #b0) (select y #b0)))
         (z1 (bvsdiv (select x #b1) (select y #b1))))
      (vmake_1_16 z0 z1)))

(define-fun vbvsdiv_1_32 ((x vector_1_32) (y vector_1_32)) vector_1_32
   (let ((z0 (bvsdiv (select x #b0) (select y #b0)))
         (z1 (bvsdiv (select x #b1) (select y #b1))))
      (vmake_1_32 z0 z1)))

(define-fun vbvsdiv_1_64 ((x vector_1_64) (y vector_1_64)) vector_1_64
   (let ((z0 (bvsdiv (select x #b0) (select y #b0)))
         (z1 (bvsdiv (select x #b1) (select y #b1))))
      (vmake_1_64 z0 z1)))

(define-fun vbvudiv_1_8 ((x vector_1_8) (y vector_1_8)) vector_1_8
   (let ((z0 (bvudiv (select x #b0) (select y #b0)))
         (z1 (bvudiv (select x #b1) (select y #b1))))
      (vmake_1_8 z0 z1)))

(define-fun vbvudiv_1_16 ((x vector_1_16) (y vector_1_16)) vector_1_16
   (let ((z0 (bvudiv (select x #b0) (select y #b0)))
         (z1 (bvudiv (select x #b1) (select y #b1))))
      (vmake_1_16 z0 z1)))

(define-fun vbvudiv_1_32 ((x vector_1_32) (y vector_1_32)) vector_1_32
   (let ((z0 (bvudiv (select x #b0) (select y #b0)))
         (z1 (bvudiv (select x #b1) (select y #b1))))
      (vmake_1_32 z0 z1)))

(define-fun vbvudiv_1_64 ((x vector_1_64) (y vector_1_64)) vector_1_64
   (let ((z0 (bvudiv (select x #b0) (select y #b0)))
         (z1 (bvudiv (select x #b1) (select y #b1))))
      (vmake_1_64 z0 z1)))

(define-fun vbvlshr_1_8 ((x vector_1_8) (y vector_1_8)) vector_1_8
   (let ((z0 (bvlshr (select x #b0) (select y #b0)))
         (z1 (bvlshr (select x #b1) (select y #b1))))
      (vmake_1_8 z0 z1)))

(define-fun vbvlshr_1_16 ((x vector_1_16) (y vector_1_16)) vector_1_16
   (let ((z0 (bvlshr (select x #b0) (select y #b0)))
         (z1 (bvlshr (select x #b1) (select y #b1))))
      (vmake_1_16 z0 z1)))

(define-fun vbvlshr_1_32 ((x vector_1_32) (y vector_1_32)) vector_1_32
   (let ((z0 (bvlshr (select x #b0) (select y #b0)))
         (z1 (bvlshr (select x #b1) (select y #b1))))
      (vmake_1_32 z0 z1)))

(define-fun vbvlshr_1_64 ((x vector_1_64) (y vector_1_64)) vector_1_64
   (let ((z0 (bvlshr (select x #b0) (select y #b0)))
         (z1 (bvlshr (select x #b1) (select y #b1))))
      (vmake_1_64 z0 z1)))

(define-fun vbvashr_1_8 ((x vector_1_8) (y vector_1_8)) vector_1_8
   (let ((z0 (bvashr (select x #b0) (select y #b0)))
         (z1 (bvashr (select x #b1) (select y #b1))))
      (vmake_1_8 z0 z1)))

(define-fun vbvashr_1_16 ((x vector_1_16) (y vector_1_16)) vector_1_16
   (let ((z0 (bvashr (select x #b0) (select y #b0)))
         (z1 (bvashr (select x #b1) (select y #b1))))
      (vmake_1_16 z0 z1)))

(define-fun vbvashr_1_32 ((x vector_1_32) (y vector_1_32)) vector_1_32
   (let ((z0 (bvashr (select x #b0) (select y #b0)))
         (z1 (bvashr (select x #b1) (select y #b1))))
      (vmake_1_32 z0 z1)))

(define-fun vbvashr_1_64 ((x vector_1_64) (y vector_1_64)) vector_1_64
   (let ((z0 (bvashr (select x #b0) (select y #b0)))
         (z1 (bvashr (select x #b1) (select y #b1))))
      (vmake_1_64 z0 z1)))

(define-fun vbvurem_1_8 ((x vector_1_8) (y vector_1_8)) vector_1_8
   (let ((z0 (bvurem (select x #b0) (select y #b0)))
         (z1 (bvurem (select x #b1) (select y #b1))))
      (vmake_1_8 z0 z1)))

(define-fun vbvurem_1_16 ((x vector_1_16) (y vector_1_16)) vector_1_16
   (let ((z0 (bvurem (select x #b0) (select y #b0)))
         (z1 (bvurem (select x #b1) (select y #b1))))
      (vmake_1_16 z0 z1)))

(define-fun vbvurem_1_32 ((x vector_1_32) (y vector_1_32)) vector_1_32
   (let ((z0 (bvurem (select x #b0) (select y #b0)))
         (z1 (bvurem (select x #b1) (select y #b1))))
      (vmake_1_32 z0 z1)))

(define-fun vbvurem_1_64 ((x vector_1_64) (y vector_1_64)) vector_1_64
   (let ((z0 (bvurem (select x #b0) (select y #b0)))
         (z1 (bvurem (select x #b1) (select y #b1))))
      (vmake_1_64 z0 z1)))

(define-fun vbvsrem_1_8 ((x vector_1_8) (y vector_1_8)) vector_1_8
   (let ((z0 (bvsrem (select x #b0) (select y #b0)))
         (z1 (bvsrem (select x #b1) (select y #b1))))
      (vmake_1_8 z0 z1)))

(define-fun vbvsrem_1_16 ((x vector_1_16) (y vector_1_16)) vector_1_16
   (let ((z0 (bvsrem (select x #b0) (select y #b0)))
         (z1 (bvsrem (select x #b1) (select y #b1))))
      (vmake_1_16 z0 z1)))

(define-fun vbvsrem_1_32 ((x vector_1_32) (y vector_1_32)) vector_1_32
   (let ((z0 (bvsrem (select x #b0) (select y #b0)))
         (z1 (bvsrem (select x #b1) (select y #b1))))
      (vmake_1_32 z0 z1)))

(define-fun vbvsrem_1_64 ((x vector_1_64) (y vector_1_64)) vector_1_64
   (let ((z0 (bvsrem (select x #b0) (select y #b0)))
         (z1 (bvsrem (select x #b1) (select y #b1))))
      (vmake_1_64 z0 z1)))

(define-fun vbvand_1_8 ((x vector_1_8) (y vector_1_8)) vector_1_8
   (let ((z0 (bvand (select x #b0) (select y #b0)))
         (z1 (bvand (select x #b1) (select y #b1))))
      (vmake_1_8 z0 z1)))

(define-fun vbvand_1_16 ((x vector_1_16) (y vector_1_16)) vector_1_16
   (let ((z0 (bvand (select x #b0) (select y #b0)))
         (z1 (bvand (select x #b1) (select y #b1))))
      (vmake_1_16 z0 z1)))

(define-fun vbvand_1_32 ((x vector_1_32) (y vector_1_32)) vector_1_32
   (let ((z0 (bvand (select x #b0) (select y #b0)))
         (z1 (bvand (select x #b1) (select y #b1))))
      (vmake_1_32 z0 z1)))

(define-fun vbvand_1_64 ((x vector_1_64) (y vector_1_64)) vector_1_64
   (let ((z0 (bvand (select x #b0) (select y #b0)))
         (z1 (bvand (select x #b1) (select y #b1))))
      (vmake_1_64 z0 z1)))

(define-fun vbvor_1_8 ((x vector_1_8) (y vector_1_8)) vector_1_8
   (let ((z0 (bvor (select x #b0) (select y #b0)))
         (z1 (bvor (select x #b1) (select y #b1))))
      (vmake_1_8 z0 z1)))

(define-fun vbvor_1_16 ((x vector_1_16) (y vector_1_16)) vector_1_16
   (let ((z0 (bvor (select x #b0) (select y #b0)))
         (z1 (bvor (select x #b1) (select y #b1))))
      (vmake_1_16 z0 z1)))

(define-fun vbvor_1_32 ((x vector_1_32) (y vector_1_32)) vector_1_32
   (let ((z0 (bvor (select x #b0) (select y #b0)))
         (z1 (bvor (select x #b1) (select y #b1))))
      (vmake_1_32 z0 z1)))

(define-fun vbvor_1_64 ((x vector_1_64) (y vector_1_64)) vector_1_64
   (let ((z0 (bvor (select x #b0) (select y #b0)))
         (z1 (bvor (select x #b1) (select y #b1))))
      (vmake_1_64 z0 z1)))

(define-fun vbvxor_1_8 ((x vector_1_8) (y vector_1_8)) vector_1_8
   (let ((z0 (bvxor (select x #b0) (select y #b0)))
         (z1 (bvxor (select x #b1) (select y #b1))))
      (vmake_1_8 z0 z1)))

(define-fun vbvxor_1_16 ((x vector_1_16) (y vector_1_16)) vector_1_16
   (let ((z0 (bvxor (select x #b0) (select y #b0)))
         (z1 (bvxor (select x #b1) (select y #b1))))
      (vmake_1_16 z0 z1)))

(define-fun vbvxor_1_32 ((x vector_1_32) (y vector_1_32)) vector_1_32
   (let ((z0 (bvxor (select x #b0) (select y #b0)))
         (z1 (bvxor (select x #b1) (select y #b1))))
      (vmake_1_32 z0 z1)))

(define-fun vbvxor_1_64 ((x vector_1_64) (y vector_1_64)) vector_1_64
   (let ((z0 (bvxor (select x #b0) (select y #b0)))
         (z1 (bvxor (select x #b1) (select y #b1))))
      (vmake_1_64 z0 z1)))

 (define-fun vbvadd_2_8 ((x vector_2_8) (y vector_2_8)) vector_2_8
   (let ((z0 (bvadd (select x #b00) (select y #b00)))
         (z1 (bvadd (select x #b01) (select y #b01)))
         (z2 (bvadd (select x #b10) (select y #b10)))
         (z3 (bvadd (select x #b11) (select y #b11))))
      (vmake_2_8 z0 z1 z2 z3)))


 (define-fun vbvadd_2_16 ((x vector_2_16) (y vector_2_16)) vector_2_16
   (let ((z0 (bvadd (select x #b00) (select y #b00)))
         (z1 (bvadd (select x #b01) (select y #b01)))
         (z2 (bvadd (select x #b10) (select y #b10)))
         (z3 (bvadd (select x #b11) (select y #b11))))
      (vmake_2_16 z0 z1 z2 z3)))


 (define-fun vbvadd_2_32 ((x vector_2_32) (y vector_2_32)) vector_2_32
   (let ((z0 (bvadd (select x #b00) (select y #b00)))
         (z1 (bvadd (select x #b01) (select y #b01)))
         (z2 (bvadd (select x #b10) (select y #b10)))
         (z3 (bvadd (select x #b11) (select y #b11))))
      (vmake_2_32 z0 z1 z2 z3)))


 (define-fun vbvadd_2_64 ((x vector_2_64) (y vector_2_64)) vector_2_64
   (let ((z0 (bvadd (select x #b00) (select y #b00)))
         (z1 (bvadd (select x #b01) (select y #b01)))
         (z2 (bvadd (select x #b10) (select y #b10)))
         (z3 (bvadd (select x #b11) (select y #b11))))
      (vmake_2_64 z0 z1 z2 z3)))


 (define-fun vbvsub_2_8 ((x vector_2_8) (y vector_2_8)) vector_2_8
   (let ((z0 (bvsub (select x #b00) (select y #b00)))
         (z1 (bvsub (select x #b01) (select y #b01)))
         (z2 (bvsub (select x #b10) (select y #b10)))
         (z3 (bvsub (select x #b11) (select y #b11))))
      (vmake_2_8 z0 z1 z2 z3)))


 (define-fun vbvsub_2_16 ((x vector_2_16) (y vector_2_16)) vector_2_16
   (let ((z0 (bvsub (select x #b00) (select y #b00)))
         (z1 (bvsub (select x #b01) (select y #b01)))
         (z2 (bvsub (select x #b10) (select y #b10)))
         (z3 (bvsub (select x #b11) (select y #b11))))
      (vmake_2_16 z0 z1 z2 z3)))


 (define-fun vbvsub_2_32 ((x vector_2_32) (y vector_2_32)) vector_2_32
   (let ((z0 (bvsub (select x #b00) (select y #b00)))
         (z1 (bvsub (select x #b01) (select y #b01)))
         (z2 (bvsub (select x #b10) (select y #b10)))
         (z3 (bvsub (select x #b11) (select y #b11))))
      (vmake_2_32 z0 z1 z2 z3)))


 (define-fun vbvsub_2_64 ((x vector_2_64) (y vector_2_64)) vector_2_64
   (let ((z0 (bvsub (select x #b00) (select y #b00)))
         (z1 (bvsub (select x #b01) (select y #b01)))
         (z2 (bvsub (select x #b10) (select y #b10)))
         (z3 (bvsub (select x #b11) (select y #b11))))
      (vmake_2_64 z0 z1 z2 z3)))


 (define-fun vbvmul_2_8 ((x vector_2_8) (y vector_2_8)) vector_2_8
   (let ((z0 (bvmul (select x #b00) (select y #b00)))
         (z1 (bvmul (select x #b01) (select y #b01)))
         (z2 (bvmul (select x #b10) (select y #b10)))
         (z3 (bvmul (select x #b11) (select y #b11))))
      (vmake_2_8 z0 z1 z2 z3)))


 (define-fun vbvmul_2_16 ((x vector_2_16) (y vector_2_16)) vector_2_16
   (let ((z0 (bvmul (select x #b00) (select y #b00)))
         (z1 (bvmul (select x #b01) (select y #b01)))
         (z2 (bvmul (select x #b10) (select y #b10)))
         (z3 (bvmul (select x #b11) (select y #b11))))
      (vmake_2_16 z0 z1 z2 z3)))


 (define-fun vbvmul_2_32 ((x vector_2_32) (y vector_2_32)) vector_2_32
   (let ((z0 (bvmul (select x #b00) (select y #b00)))
         (z1 (bvmul (select x #b01) (select y #b01)))
         (z2 (bvmul (select x #b10) (select y #b10)))
         (z3 (bvmul (select x #b11) (select y #b11))))
      (vmake_2_32 z0 z1 z2 z3)))


 (define-fun vbvmul_2_64 ((x vector_2_64) (y vector_2_64)) vector_2_64
   (let ((z0 (bvmul (select x #b00) (select y #b00)))
         (z1 (bvmul (select x #b01) (select y #b01)))
         (z2 (bvmul (select x #b10) (select y #b10)))
         (z3 (bvmul (select x #b11) (select y #b11))))
      (vmake_2_64 z0 z1 z2 z3)))


 (define-fun vbvshl_2_8 ((x vector_2_8) (y vector_2_8)) vector_2_8
   (let ((z0 (bvshl (select x #b00) (select y #b00)))
         (z1 (bvshl (select x #b01) (select y #b01)))
         (z2 (bvshl (select x #b10) (select y #b10)))
         (z3 (bvshl (select x #b11) (select y #b11))))
      (vmake_2_8 z0 z1 z2 z3)))


 (define-fun vbvshl_2_16 ((x vector_2_16) (y vector_2_16)) vector_2_16
   (let ((z0 (bvshl (select x #b00) (select y #b00)))
         (z1 (bvshl (select x #b01) (select y #b01)))
         (z2 (bvshl (select x #b10) (select y #b10)))
         (z3 (bvshl (select x #b11) (select y #b11))))
      (vmake_2_16 z0 z1 z2 z3)))


 (define-fun vbvshl_2_32 ((x vector_2_32) (y vector_2_32)) vector_2_32
   (let ((z0 (bvshl (select x #b00) (select y #b00)))
         (z1 (bvshl (select x #b01) (select y #b01)))
         (z2 (bvshl (select x #b10) (select y #b10)))
         (z3 (bvshl (select x #b11) (select y #b11))))
      (vmake_2_32 z0 z1 z2 z3)))


 (define-fun vbvshl_2_64 ((x vector_2_64) (y vector_2_64)) vector_2_64
   (let ((z0 (bvshl (select x #b00) (select y #b00)))
         (z1 (bvshl (select x #b01) (select y #b01)))
         (z2 (bvshl (select x #b10) (select y #b10)))
         (z3 (bvshl (select x #b11) (select y #b11))))
      (vmake_2_64 z0 z1 z2 z3)))


 (define-fun vbvsdiv_2_8 ((x vector_2_8) (y vector_2_8)) vector_2_8
   (let ((z0 (bvsdiv (select x #b00) (select y #b00)))
         (z1 (bvsdiv (select x #b01) (select y #b01)))
         (z2 (bvsdiv (select x #b10) (select y #b10)))
         (z3 (bvsdiv (select x #b11) (select y #b11))))
      (vmake_2_8 z0 z1 z2 z3)))


 (define-fun vbvsdiv_2_16 ((x vector_2_16) (y vector_2_16)) vector_2_16
   (let ((z0 (bvsdiv (select x #b00) (select y #b00)))
         (z1 (bvsdiv (select x #b01) (select y #b01)))
         (z2 (bvsdiv (select x #b10) (select y #b10)))
         (z3 (bvsdiv (select x #b11) (select y #b11))))
      (vmake_2_16 z0 z1 z2 z3)))


 (define-fun vbvsdiv_2_32 ((x vector_2_32) (y vector_2_32)) vector_2_32
   (let ((z0 (bvsdiv (select x #b00) (select y #b00)))
         (z1 (bvsdiv (select x #b01) (select y #b01)))
         (z2 (bvsdiv (select x #b10) (select y #b10)))
         (z3 (bvsdiv (select x #b11) (select y #b11))))
      (vmake_2_32 z0 z1 z2 z3)))


 (define-fun vbvsdiv_2_64 ((x vector_2_64) (y vector_2_64)) vector_2_64
   (let ((z0 (bvsdiv (select x #b00) (select y #b00)))
         (z1 (bvsdiv (select x #b01) (select y #b01)))
         (z2 (bvsdiv (select x #b10) (select y #b10)))
         (z3 (bvsdiv (select x #b11) (select y #b11))))
      (vmake_2_64 z0 z1 z2 z3)))


 (define-fun vbvudiv_2_8 ((x vector_2_8) (y vector_2_8)) vector_2_8
   (let ((z0 (bvudiv (select x #b00) (select y #b00)))
         (z1 (bvudiv (select x #b01) (select y #b01)))
         (z2 (bvudiv (select x #b10) (select y #b10)))
         (z3 (bvudiv (select x #b11) (select y #b11))))
      (vmake_2_8 z0 z1 z2 z3)))


 (define-fun vbvudiv_2_16 ((x vector_2_16) (y vector_2_16)) vector_2_16
   (let ((z0 (bvudiv (select x #b00) (select y #b00)))
         (z1 (bvudiv (select x #b01) (select y #b01)))
         (z2 (bvudiv (select x #b10) (select y #b10)))
         (z3 (bvudiv (select x #b11) (select y #b11))))
      (vmake_2_16 z0 z1 z2 z3)))


 (define-fun vbvudiv_2_32 ((x vector_2_32) (y vector_2_32)) vector_2_32
   (let ((z0 (bvudiv (select x #b00) (select y #b00)))
         (z1 (bvudiv (select x #b01) (select y #b01)))
         (z2 (bvudiv (select x #b10) (select y #b10)))
         (z3 (bvudiv (select x #b11) (select y #b11))))
      (vmake_2_32 z0 z1 z2 z3)))


 (define-fun vbvudiv_2_64 ((x vector_2_64) (y vector_2_64)) vector_2_64
   (let ((z0 (bvudiv (select x #b00) (select y #b00)))
         (z1 (bvudiv (select x #b01) (select y #b01)))
         (z2 (bvudiv (select x #b10) (select y #b10)))
         (z3 (bvudiv (select x #b11) (select y #b11))))
      (vmake_2_64 z0 z1 z2 z3)))


 (define-fun vbvlshr_2_8 ((x vector_2_8) (y vector_2_8)) vector_2_8
   (let ((z0 (bvlshr (select x #b00) (select y #b00)))
         (z1 (bvlshr (select x #b01) (select y #b01)))
         (z2 (bvlshr (select x #b10) (select y #b10)))
         (z3 (bvlshr (select x #b11) (select y #b11))))
      (vmake_2_8 z0 z1 z2 z3)))


 (define-fun vbvlshr_2_16 ((x vector_2_16) (y vector_2_16)) vector_2_16
   (let ((z0 (bvlshr (select x #b00) (select y #b00)))
         (z1 (bvlshr (select x #b01) (select y #b01)))
         (z2 (bvlshr (select x #b10) (select y #b10)))
         (z3 (bvlshr (select x #b11) (select y #b11))))
      (vmake_2_16 z0 z1 z2 z3)))


 (define-fun vbvlshr_2_32 ((x vector_2_32) (y vector_2_32)) vector_2_32
   (let ((z0 (bvlshr (select x #b00) (select y #b00)))
         (z1 (bvlshr (select x #b01) (select y #b01)))
         (z2 (bvlshr (select x #b10) (select y #b10)))
         (z3 (bvlshr (select x #b11) (select y #b11))))
      (vmake_2_32 z0 z1 z2 z3)))


 (define-fun vbvlshr_2_64 ((x vector_2_64) (y vector_2_64)) vector_2_64
   (let ((z0 (bvlshr (select x #b00) (select y #b00)))
         (z1 (bvlshr (select x #b01) (select y #b01)))
         (z2 (bvlshr (select x #b10) (select y #b10)))
         (z3 (bvlshr (select x #b11) (select y #b11))))
      (vmake_2_64 z0 z1 z2 z3)))


 (define-fun vbvashr_2_8 ((x vector_2_8) (y vector_2_8)) vector_2_8
   (let ((z0 (bvashr (select x #b00) (select y #b00)))
         (z1 (bvashr (select x #b01) (select y #b01)))
         (z2 (bvashr (select x #b10) (select y #b10)))
         (z3 (bvashr (select x #b11) (select y #b11))))
      (vmake_2_8 z0 z1 z2 z3)))


 (define-fun vbvashr_2_16 ((x vector_2_16) (y vector_2_16)) vector_2_16
   (let ((z0 (bvashr (select x #b00) (select y #b00)))
         (z1 (bvashr (select x #b01) (select y #b01)))
         (z2 (bvashr (select x #b10) (select y #b10)))
         (z3 (bvashr (select x #b11) (select y #b11))))
      (vmake_2_16 z0 z1 z2 z3)))


 (define-fun vbvashr_2_32 ((x vector_2_32) (y vector_2_32)) vector_2_32
   (let ((z0 (bvashr (select x #b00) (select y #b00)))
         (z1 (bvashr (select x #b01) (select y #b01)))
         (z2 (bvashr (select x #b10) (select y #b10)))
         (z3 (bvashr (select x #b11) (select y #b11))))
      (vmake_2_32 z0 z1 z2 z3)))


 (define-fun vbvashr_2_64 ((x vector_2_64) (y vector_2_64)) vector_2_64
   (let ((z0 (bvashr (select x #b00) (select y #b00)))
         (z1 (bvashr (select x #b01) (select y #b01)))
         (z2 (bvashr (select x #b10) (select y #b10)))
         (z3 (bvashr (select x #b11) (select y #b11))))
      (vmake_2_64 z0 z1 z2 z3)))


 (define-fun vbvurem_2_8 ((x vector_2_8) (y vector_2_8)) vector_2_8
   (let ((z0 (bvurem (select x #b00) (select y #b00)))
         (z1 (bvurem (select x #b01) (select y #b01)))
         (z2 (bvurem (select x #b10) (select y #b10)))
         (z3 (bvurem (select x #b11) (select y #b11))))
      (vmake_2_8 z0 z1 z2 z3)))


 (define-fun vbvurem_2_16 ((x vector_2_16) (y vector_2_16)) vector_2_16
   (let ((z0 (bvurem (select x #b00) (select y #b00)))
         (z1 (bvurem (select x #b01) (select y #b01)))
         (z2 (bvurem (select x #b10) (select y #b10)))
         (z3 (bvurem (select x #b11) (select y #b11))))
      (vmake_2_16 z0 z1 z2 z3)))


 (define-fun vbvurem_2_32 ((x vector_2_32) (y vector_2_32)) vector_2_32
   (let ((z0 (bvurem (select x #b00) (select y #b00)))
         (z1 (bvurem (select x #b01) (select y #b01)))
         (z2 (bvurem (select x #b10) (select y #b10)))
         (z3 (bvurem (select x #b11) (select y #b11))))
      (vmake_2_32 z0 z1 z2 z3)))


 (define-fun vbvurem_2_64 ((x vector_2_64) (y vector_2_64)) vector_2_64
   (let ((z0 (bvurem (select x #b00) (select y #b00)))
         (z1 (bvurem (select x #b01) (select y #b01)))
         (z2 (bvurem (select x #b10) (select y #b10)))
         (z3 (bvurem (select x #b11) (select y #b11))))
      (vmake_2_64 z0 z1 z2 z3)))


 (define-fun vbvsrem_2_8 ((x vector_2_8) (y vector_2_8)) vector_2_8
   (let ((z0 (bvsrem (select x #b00) (select y #b00)))
         (z1 (bvsrem (select x #b01) (select y #b01)))
         (z2 (bvsrem (select x #b10) (select y #b10)))
         (z3 (bvsrem (select x #b11) (select y #b11))))
      (vmake_2_8 z0 z1 z2 z3)))


 (define-fun vbvsrem_2_16 ((x vector_2_16) (y vector_2_16)) vector_2_16
   (let ((z0 (bvsrem (select x #b00) (select y #b00)))
         (z1 (bvsrem (select x #b01) (select y #b01)))
         (z2 (bvsrem (select x #b10) (select y #b10)))
         (z3 (bvsrem (select x #b11) (select y #b11))))
      (vmake_2_16 z0 z1 z2 z3)))


 (define-fun vbvsrem_2_32 ((x vector_2_32) (y vector_2_32)) vector_2_32
   (let ((z0 (bvsrem (select x #b00) (select y #b00)))
         (z1 (bvsrem (select x #b01) (select y #b01)))
         (z2 (bvsrem (select x #b10) (select y #b10)))
         (z3 (bvsrem (select x #b11) (select y #b11))))
      (vmake_2_32 z0 z1 z2 z3)))


 (define-fun vbvsrem_2_64 ((x vector_2_64) (y vector_2_64)) vector_2_64
   (let ((z0 (bvsrem (select x #b00) (select y #b00)))
         (z1 (bvsrem (select x #b01) (select y #b01)))
         (z2 (bvsrem (select x #b10) (select y #b10)))
         (z3 (bvsrem (select x #b11) (select y #b11))))
      (vmake_2_64 z0 z1 z2 z3)))


 (define-fun vbvand_2_8 ((x vector_2_8) (y vector_2_8)) vector_2_8
   (let ((z0 (bvand (select x #b00) (select y #b00)))
         (z1 (bvand (select x #b01) (select y #b01)))
         (z2 (bvand (select x #b10) (select y #b10)))
         (z3 (bvand (select x #b11) (select y #b11))))
      (vmake_2_8 z0 z1 z2 z3)))


 (define-fun vbvand_2_16 ((x vector_2_16) (y vector_2_16)) vector_2_16
   (let ((z0 (bvand (select x #b00) (select y #b00)))
         (z1 (bvand (select x #b01) (select y #b01)))
         (z2 (bvand (select x #b10) (select y #b10)))
         (z3 (bvand (select x #b11) (select y #b11))))
      (vmake_2_16 z0 z1 z2 z3)))


 (define-fun vbvand_2_32 ((x vector_2_32) (y vector_2_32)) vector_2_32
   (let ((z0 (bvand (select x #b00) (select y #b00)))
         (z1 (bvand (select x #b01) (select y #b01)))
         (z2 (bvand (select x #b10) (select y #b10)))
         (z3 (bvand (select x #b11) (select y #b11))))
      (vmake_2_32 z0 z1 z2 z3)))


 (define-fun vbvand_2_64 ((x vector_2_64) (y vector_2_64)) vector_2_64
   (let ((z0 (bvand (select x #b00) (select y #b00)))
         (z1 (bvand (select x #b01) (select y #b01)))
         (z2 (bvand (select x #b10) (select y #b10)))
         (z3 (bvand (select x #b11) (select y #b11))))
      (vmake_2_64 z0 z1 z2 z3)))


 (define-fun vbvor_2_8 ((x vector_2_8) (y vector_2_8)) vector_2_8
   (let ((z0 (bvor (select x #b00) (select y #b00)))
         (z1 (bvor (select x #b01) (select y #b01)))
         (z2 (bvor (select x #b10) (select y #b10)))
         (z3 (bvor (select x #b11) (select y #b11))))
      (vmake_2_8 z0 z1 z2 z3)))


 (define-fun vbvor_2_16 ((x vector_2_16) (y vector_2_16)) vector_2_16
   (let ((z0 (bvor (select x #b00) (select y #b00)))
         (z1 (bvor (select x #b01) (select y #b01)))
         (z2 (bvor (select x #b10) (select y #b10)))
         (z3 (bvor (select x #b11) (select y #b11))))
      (vmake_2_16 z0 z1 z2 z3)))


 (define-fun vbvor_2_32 ((x vector_2_32) (y vector_2_32)) vector_2_32
   (let ((z0 (bvor (select x #b00) (select y #b00)))
         (z1 (bvor (select x #b01) (select y #b01)))
         (z2 (bvor (select x #b10) (select y #b10)))
         (z3 (bvor (select x #b11) (select y #b11))))
      (vmake_2_32 z0 z1 z2 z3)))


 (define-fun vbvor_2_64 ((x vector_2_64) (y vector_2_64)) vector_2_64
   (let ((z0 (bvor (select x #b00) (select y #b00)))
         (z1 (bvor (select x #b01) (select y #b01)))
         (z2 (bvor (select x #b10) (select y #b10)))
         (z3 (bvor (select x #b11) (select y #b11))))
      (vmake_2_64 z0 z1 z2 z3)))


 (define-fun vbvxor_2_8 ((x vector_2_8) (y vector_2_8)) vector_2_8
   (let ((z0 (bvxor (select x #b00) (select y #b00)))
         (z1 (bvxor (select x #b01) (select y #b01)))
         (z2 (bvxor (select x #b10) (select y #b10)))
         (z3 (bvxor (select x #b11) (select y #b11))))
      (vmake_2_8 z0 z1 z2 z3)))


 (define-fun vbvxor_2_16 ((x vector_2_16) (y vector_2_16)) vector_2_16
   (let ((z0 (bvxor (select x #b00) (select y #b00)))
         (z1 (bvxor (select x #b01) (select y #b01)))
         (z2 (bvxor (select x #b10) (select y #b10)))
         (z3 (bvxor (select x #b11) (select y #b11))))
      (vmake_2_16 z0 z1 z2 z3)))


 (define-fun vbvxor_2_32 ((x vector_2_32) (y vector_2_32)) vector_2_32
   (let ((z0 (bvxor (select x #b00) (select y #b00)))
         (z1 (bvxor (select x #b01) (select y #b01)))
         (z2 (bvxor (select x #b10) (select y #b10)))
         (z3 (bvxor (select x #b11) (select y #b11))))
      (vmake_2_32 z0 z1 z2 z3)))


 (define-fun vbvxor_2_64 ((x vector_2_64) (y vector_2_64)) vector_2_64
   (let ((z0 (bvxor (select x #b00) (select y #b00)))
         (z1 (bvxor (select x #b01) (select y #b01)))
         (z2 (bvxor (select x #b10) (select y #b10)))
         (z3 (bvxor (select x #b11) (select y #b11))))
      (vmake_2_64 z0 z1 z2 z3)))


 (define-fun vbvadd_3_8 ((x vector_3_8) (y vector_3_8)) vector_3_8
   (let (
         (z0 (bvadd (select x #b000) (select y #b000)))
         (z1 (bvadd (select x #b001) (select y #b001)))
         (z2 (bvadd (select x #b010) (select y #b010)))
         (z3 (bvadd (select x #b011) (select y #b011)))
         (z4 (bvadd (select x #b100) (select y #b100)))
         (z5 (bvadd (select x #b101) (select y #b101)))
         (z6 (bvadd (select x #b110) (select y #b110)))
         (z7 (bvadd (select x #b111) (select y #b111)))
         )
      (vmake_3_8 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvadd_3_16 ((x vector_3_16) (y vector_3_16)) vector_3_16
   (let (
         (z0 (bvadd (select x #b000) (select y #b000)))
         (z1 (bvadd (select x #b001) (select y #b001)))
         (z2 (bvadd (select x #b010) (select y #b010)))
         (z3 (bvadd (select x #b011) (select y #b011)))
         (z4 (bvadd (select x #b100) (select y #b100)))
         (z5 (bvadd (select x #b101) (select y #b101)))
         (z6 (bvadd (select x #b110) (select y #b110)))
         (z7 (bvadd (select x #b111) (select y #b111)))
         )
      (vmake_3_16 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvadd_3_32 ((x vector_3_32) (y vector_3_32)) vector_3_32
   (let (
         (z0 (bvadd (select x #b000) (select y #b000)))
         (z1 (bvadd (select x #b001) (select y #b001)))
         (z2 (bvadd (select x #b010) (select y #b010)))
         (z3 (bvadd (select x #b011) (select y #b011)))
         (z4 (bvadd (select x #b100) (select y #b100)))
         (z5 (bvadd (select x #b101) (select y #b101)))
         (z6 (bvadd (select x #b110) (select y #b110)))
         (z7 (bvadd (select x #b111) (select y #b111)))
         )
      (vmake_3_32 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvadd_3_64 ((x vector_3_64) (y vector_3_64)) vector_3_64
   (let (
         (z0 (bvadd (select x #b000) (select y #b000)))
         (z1 (bvadd (select x #b001) (select y #b001)))
         (z2 (bvadd (select x #b010) (select y #b010)))
         (z3 (bvadd (select x #b011) (select y #b011)))
         (z4 (bvadd (select x #b100) (select y #b100)))
         (z5 (bvadd (select x #b101) (select y #b101)))
         (z6 (bvadd (select x #b110) (select y #b110)))
         (z7 (bvadd (select x #b111) (select y #b111)))
         )
      (vmake_3_64 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvsub_3_8 ((x vector_3_8) (y vector_3_8)) vector_3_8
   (let (
         (z0 (bvsub (select x #b000) (select y #b000)))
         (z1 (bvsub (select x #b001) (select y #b001)))
         (z2 (bvsub (select x #b010) (select y #b010)))
         (z3 (bvsub (select x #b011) (select y #b011)))
         (z4 (bvsub (select x #b100) (select y #b100)))
         (z5 (bvsub (select x #b101) (select y #b101)))
         (z6 (bvsub (select x #b110) (select y #b110)))
         (z7 (bvsub (select x #b111) (select y #b111)))
         )
      (vmake_3_8 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvsub_3_16 ((x vector_3_16) (y vector_3_16)) vector_3_16
   (let (
         (z0 (bvsub (select x #b000) (select y #b000)))
         (z1 (bvsub (select x #b001) (select y #b001)))
         (z2 (bvsub (select x #b010) (select y #b010)))
         (z3 (bvsub (select x #b011) (select y #b011)))
         (z4 (bvsub (select x #b100) (select y #b100)))
         (z5 (bvsub (select x #b101) (select y #b101)))
         (z6 (bvsub (select x #b110) (select y #b110)))
         (z7 (bvsub (select x #b111) (select y #b111)))
         )
      (vmake_3_16 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvsub_3_32 ((x vector_3_32) (y vector_3_32)) vector_3_32
   (let (
         (z0 (bvsub (select x #b000) (select y #b000)))
         (z1 (bvsub (select x #b001) (select y #b001)))
         (z2 (bvsub (select x #b010) (select y #b010)))
         (z3 (bvsub (select x #b011) (select y #b011)))
         (z4 (bvsub (select x #b100) (select y #b100)))
         (z5 (bvsub (select x #b101) (select y #b101)))
         (z6 (bvsub (select x #b110) (select y #b110)))
         (z7 (bvsub (select x #b111) (select y #b111)))
         )
      (vmake_3_32 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvsub_3_64 ((x vector_3_64) (y vector_3_64)) vector_3_64
   (let (
         (z0 (bvsub (select x #b000) (select y #b000)))
         (z1 (bvsub (select x #b001) (select y #b001)))
         (z2 (bvsub (select x #b010) (select y #b010)))
         (z3 (bvsub (select x #b011) (select y #b011)))
         (z4 (bvsub (select x #b100) (select y #b100)))
         (z5 (bvsub (select x #b101) (select y #b101)))
         (z6 (bvsub (select x #b110) (select y #b110)))
         (z7 (bvsub (select x #b111) (select y #b111)))
         )
      (vmake_3_64 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvmul_3_8 ((x vector_3_8) (y vector_3_8)) vector_3_8
   (let (
         (z0 (bvmul (select x #b000) (select y #b000)))
         (z1 (bvmul (select x #b001) (select y #b001)))
         (z2 (bvmul (select x #b010) (select y #b010)))
         (z3 (bvmul (select x #b011) (select y #b011)))
         (z4 (bvmul (select x #b100) (select y #b100)))
         (z5 (bvmul (select x #b101) (select y #b101)))
         (z6 (bvmul (select x #b110) (select y #b110)))
         (z7 (bvmul (select x #b111) (select y #b111)))
         )
      (vmake_3_8 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvmul_3_16 ((x vector_3_16) (y vector_3_16)) vector_3_16
   (let (
         (z0 (bvmul (select x #b000) (select y #b000)))
         (z1 (bvmul (select x #b001) (select y #b001)))
         (z2 (bvmul (select x #b010) (select y #b010)))
         (z3 (bvmul (select x #b011) (select y #b011)))
         (z4 (bvmul (select x #b100) (select y #b100)))
         (z5 (bvmul (select x #b101) (select y #b101)))
         (z6 (bvmul (select x #b110) (select y #b110)))
         (z7 (bvmul (select x #b111) (select y #b111)))
         )
      (vmake_3_16 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvmul_3_32 ((x vector_3_32) (y vector_3_32)) vector_3_32
   (let (
         (z0 (bvmul (select x #b000) (select y #b000)))
         (z1 (bvmul (select x #b001) (select y #b001)))
         (z2 (bvmul (select x #b010) (select y #b010)))
         (z3 (bvmul (select x #b011) (select y #b011)))
         (z4 (bvmul (select x #b100) (select y #b100)))
         (z5 (bvmul (select x #b101) (select y #b101)))
         (z6 (bvmul (select x #b110) (select y #b110)))
         (z7 (bvmul (select x #b111) (select y #b111)))
         )
      (vmake_3_32 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvmul_3_64 ((x vector_3_64) (y vector_3_64)) vector_3_64
   (let (
         (z0 (bvmul (select x #b000) (select y #b000)))
         (z1 (bvmul (select x #b001) (select y #b001)))
         (z2 (bvmul (select x #b010) (select y #b010)))
         (z3 (bvmul (select x #b011) (select y #b011)))
         (z4 (bvmul (select x #b100) (select y #b100)))
         (z5 (bvmul (select x #b101) (select y #b101)))
         (z6 (bvmul (select x #b110) (select y #b110)))
         (z7 (bvmul (select x #b111) (select y #b111)))
         )
      (vmake_3_64 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvshl_3_8 ((x vector_3_8) (y vector_3_8)) vector_3_8
   (let (
         (z0 (bvshl (select x #b000) (select y #b000)))
         (z1 (bvshl (select x #b001) (select y #b001)))
         (z2 (bvshl (select x #b010) (select y #b010)))
         (z3 (bvshl (select x #b011) (select y #b011)))
         (z4 (bvshl (select x #b100) (select y #b100)))
         (z5 (bvshl (select x #b101) (select y #b101)))
         (z6 (bvshl (select x #b110) (select y #b110)))
         (z7 (bvshl (select x #b111) (select y #b111)))
         )
      (vmake_3_8 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvshl_3_16 ((x vector_3_16) (y vector_3_16)) vector_3_16
   (let (
         (z0 (bvshl (select x #b000) (select y #b000)))
         (z1 (bvshl (select x #b001) (select y #b001)))
         (z2 (bvshl (select x #b010) (select y #b010)))
         (z3 (bvshl (select x #b011) (select y #b011)))
         (z4 (bvshl (select x #b100) (select y #b100)))
         (z5 (bvshl (select x #b101) (select y #b101)))
         (z6 (bvshl (select x #b110) (select y #b110)))
         (z7 (bvshl (select x #b111) (select y #b111)))
         )
      (vmake_3_16 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvshl_3_32 ((x vector_3_32) (y vector_3_32)) vector_3_32
   (let (
         (z0 (bvshl (select x #b000) (select y #b000)))
         (z1 (bvshl (select x #b001) (select y #b001)))
         (z2 (bvshl (select x #b010) (select y #b010)))
         (z3 (bvshl (select x #b011) (select y #b011)))
         (z4 (bvshl (select x #b100) (select y #b100)))
         (z5 (bvshl (select x #b101) (select y #b101)))
         (z6 (bvshl (select x #b110) (select y #b110)))
         (z7 (bvshl (select x #b111) (select y #b111)))
         )
      (vmake_3_32 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvshl_3_64 ((x vector_3_64) (y vector_3_64)) vector_3_64
   (let (
         (z0 (bvshl (select x #b000) (select y #b000)))
         (z1 (bvshl (select x #b001) (select y #b001)))
         (z2 (bvshl (select x #b010) (select y #b010)))
         (z3 (bvshl (select x #b011) (select y #b011)))
         (z4 (bvshl (select x #b100) (select y #b100)))
         (z5 (bvshl (select x #b101) (select y #b101)))
         (z6 (bvshl (select x #b110) (select y #b110)))
         (z7 (bvshl (select x #b111) (select y #b111)))
         )
      (vmake_3_64 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvsdiv_3_8 ((x vector_3_8) (y vector_3_8)) vector_3_8
   (let (
         (z0 (bvsdiv (select x #b000) (select y #b000)))
         (z1 (bvsdiv (select x #b001) (select y #b001)))
         (z2 (bvsdiv (select x #b010) (select y #b010)))
         (z3 (bvsdiv (select x #b011) (select y #b011)))
         (z4 (bvsdiv (select x #b100) (select y #b100)))
         (z5 (bvsdiv (select x #b101) (select y #b101)))
         (z6 (bvsdiv (select x #b110) (select y #b110)))
         (z7 (bvsdiv (select x #b111) (select y #b111)))
         )
      (vmake_3_8 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvsdiv_3_16 ((x vector_3_16) (y vector_3_16)) vector_3_16
   (let (
         (z0 (bvsdiv (select x #b000) (select y #b000)))
         (z1 (bvsdiv (select x #b001) (select y #b001)))
         (z2 (bvsdiv (select x #b010) (select y #b010)))
         (z3 (bvsdiv (select x #b011) (select y #b011)))
         (z4 (bvsdiv (select x #b100) (select y #b100)))
         (z5 (bvsdiv (select x #b101) (select y #b101)))
         (z6 (bvsdiv (select x #b110) (select y #b110)))
         (z7 (bvsdiv (select x #b111) (select y #b111)))
         )
      (vmake_3_16 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvsdiv_3_32 ((x vector_3_32) (y vector_3_32)) vector_3_32
   (let (
         (z0 (bvsdiv (select x #b000) (select y #b000)))
         (z1 (bvsdiv (select x #b001) (select y #b001)))
         (z2 (bvsdiv (select x #b010) (select y #b010)))
         (z3 (bvsdiv (select x #b011) (select y #b011)))
         (z4 (bvsdiv (select x #b100) (select y #b100)))
         (z5 (bvsdiv (select x #b101) (select y #b101)))
         (z6 (bvsdiv (select x #b110) (select y #b110)))
         (z7 (bvsdiv (select x #b111) (select y #b111)))
         )
      (vmake_3_32 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvsdiv_3_64 ((x vector_3_64) (y vector_3_64)) vector_3_64
   (let (
         (z0 (bvsdiv (select x #b000) (select y #b000)))
         (z1 (bvsdiv (select x #b001) (select y #b001)))
         (z2 (bvsdiv (select x #b010) (select y #b010)))
         (z3 (bvsdiv (select x #b011) (select y #b011)))
         (z4 (bvsdiv (select x #b100) (select y #b100)))
         (z5 (bvsdiv (select x #b101) (select y #b101)))
         (z6 (bvsdiv (select x #b110) (select y #b110)))
         (z7 (bvsdiv (select x #b111) (select y #b111)))
         )
      (vmake_3_64 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvudiv_3_8 ((x vector_3_8) (y vector_3_8)) vector_3_8
   (let (
         (z0 (bvudiv (select x #b000) (select y #b000)))
         (z1 (bvudiv (select x #b001) (select y #b001)))
         (z2 (bvudiv (select x #b010) (select y #b010)))
         (z3 (bvudiv (select x #b011) (select y #b011)))
         (z4 (bvudiv (select x #b100) (select y #b100)))
         (z5 (bvudiv (select x #b101) (select y #b101)))
         (z6 (bvudiv (select x #b110) (select y #b110)))
         (z7 (bvudiv (select x #b111) (select y #b111)))
         )
      (vmake_3_8 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvudiv_3_16 ((x vector_3_16) (y vector_3_16)) vector_3_16
   (let (
         (z0 (bvudiv (select x #b000) (select y #b000)))
         (z1 (bvudiv (select x #b001) (select y #b001)))
         (z2 (bvudiv (select x #b010) (select y #b010)))
         (z3 (bvudiv (select x #b011) (select y #b011)))
         (z4 (bvudiv (select x #b100) (select y #b100)))
         (z5 (bvudiv (select x #b101) (select y #b101)))
         (z6 (bvudiv (select x #b110) (select y #b110)))
         (z7 (bvudiv (select x #b111) (select y #b111)))
         )
      (vmake_3_16 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvudiv_3_32 ((x vector_3_32) (y vector_3_32)) vector_3_32
   (let (
         (z0 (bvudiv (select x #b000) (select y #b000)))
         (z1 (bvudiv (select x #b001) (select y #b001)))
         (z2 (bvudiv (select x #b010) (select y #b010)))
         (z3 (bvudiv (select x #b011) (select y #b011)))
         (z4 (bvudiv (select x #b100) (select y #b100)))
         (z5 (bvudiv (select x #b101) (select y #b101)))
         (z6 (bvudiv (select x #b110) (select y #b110)))
         (z7 (bvudiv (select x #b111) (select y #b111)))
         )
      (vmake_3_32 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvudiv_3_64 ((x vector_3_64) (y vector_3_64)) vector_3_64
   (let (
         (z0 (bvudiv (select x #b000) (select y #b000)))
         (z1 (bvudiv (select x #b001) (select y #b001)))
         (z2 (bvudiv (select x #b010) (select y #b010)))
         (z3 (bvudiv (select x #b011) (select y #b011)))
         (z4 (bvudiv (select x #b100) (select y #b100)))
         (z5 (bvudiv (select x #b101) (select y #b101)))
         (z6 (bvudiv (select x #b110) (select y #b110)))
         (z7 (bvudiv (select x #b111) (select y #b111)))
         )
      (vmake_3_64 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvlshr_3_8 ((x vector_3_8) (y vector_3_8)) vector_3_8
   (let (
         (z0 (bvlshr (select x #b000) (select y #b000)))
         (z1 (bvlshr (select x #b001) (select y #b001)))
         (z2 (bvlshr (select x #b010) (select y #b010)))
         (z3 (bvlshr (select x #b011) (select y #b011)))
         (z4 (bvlshr (select x #b100) (select y #b100)))
         (z5 (bvlshr (select x #b101) (select y #b101)))
         (z6 (bvlshr (select x #b110) (select y #b110)))
         (z7 (bvlshr (select x #b111) (select y #b111)))
         )
      (vmake_3_8 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvlshr_3_16 ((x vector_3_16) (y vector_3_16)) vector_3_16
   (let (
         (z0 (bvlshr (select x #b000) (select y #b000)))
         (z1 (bvlshr (select x #b001) (select y #b001)))
         (z2 (bvlshr (select x #b010) (select y #b010)))
         (z3 (bvlshr (select x #b011) (select y #b011)))
         (z4 (bvlshr (select x #b100) (select y #b100)))
         (z5 (bvlshr (select x #b101) (select y #b101)))
         (z6 (bvlshr (select x #b110) (select y #b110)))
         (z7 (bvlshr (select x #b111) (select y #b111)))
         )
      (vmake_3_16 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvlshr_3_32 ((x vector_3_32) (y vector_3_32)) vector_3_32
   (let (
         (z0 (bvlshr (select x #b000) (select y #b000)))
         (z1 (bvlshr (select x #b001) (select y #b001)))
         (z2 (bvlshr (select x #b010) (select y #b010)))
         (z3 (bvlshr (select x #b011) (select y #b011)))
         (z4 (bvlshr (select x #b100) (select y #b100)))
         (z5 (bvlshr (select x #b101) (select y #b101)))
         (z6 (bvlshr (select x #b110) (select y #b110)))
         (z7 (bvlshr (select x #b111) (select y #b111)))
         )
      (vmake_3_32 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvlshr_3_64 ((x vector_3_64) (y vector_3_64)) vector_3_64
   (let (
         (z0 (bvlshr (select x #b000) (select y #b000)))
         (z1 (bvlshr (select x #b001) (select y #b001)))
         (z2 (bvlshr (select x #b010) (select y #b010)))
         (z3 (bvlshr (select x #b011) (select y #b011)))
         (z4 (bvlshr (select x #b100) (select y #b100)))
         (z5 (bvlshr (select x #b101) (select y #b101)))
         (z6 (bvlshr (select x #b110) (select y #b110)))
         (z7 (bvlshr (select x #b111) (select y #b111)))
         )
      (vmake_3_64 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvashr_3_8 ((x vector_3_8) (y vector_3_8)) vector_3_8
   (let (
         (z0 (bvashr (select x #b000) (select y #b000)))
         (z1 (bvashr (select x #b001) (select y #b001)))
         (z2 (bvashr (select x #b010) (select y #b010)))
         (z3 (bvashr (select x #b011) (select y #b011)))
         (z4 (bvashr (select x #b100) (select y #b100)))
         (z5 (bvashr (select x #b101) (select y #b101)))
         (z6 (bvashr (select x #b110) (select y #b110)))
         (z7 (bvashr (select x #b111) (select y #b111)))
         )
      (vmake_3_8 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvashr_3_16 ((x vector_3_16) (y vector_3_16)) vector_3_16
   (let (
         (z0 (bvashr (select x #b000) (select y #b000)))
         (z1 (bvashr (select x #b001) (select y #b001)))
         (z2 (bvashr (select x #b010) (select y #b010)))
         (z3 (bvashr (select x #b011) (select y #b011)))
         (z4 (bvashr (select x #b100) (select y #b100)))
         (z5 (bvashr (select x #b101) (select y #b101)))
         (z6 (bvashr (select x #b110) (select y #b110)))
         (z7 (bvashr (select x #b111) (select y #b111)))
         )
      (vmake_3_16 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvashr_3_32 ((x vector_3_32) (y vector_3_32)) vector_3_32
   (let (
         (z0 (bvashr (select x #b000) (select y #b000)))
         (z1 (bvashr (select x #b001) (select y #b001)))
         (z2 (bvashr (select x #b010) (select y #b010)))
         (z3 (bvashr (select x #b011) (select y #b011)))
         (z4 (bvashr (select x #b100) (select y #b100)))
         (z5 (bvashr (select x #b101) (select y #b101)))
         (z6 (bvashr (select x #b110) (select y #b110)))
         (z7 (bvashr (select x #b111) (select y #b111)))
         )
      (vmake_3_32 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvashr_3_64 ((x vector_3_64) (y vector_3_64)) vector_3_64
   (let (
         (z0 (bvashr (select x #b000) (select y #b000)))
         (z1 (bvashr (select x #b001) (select y #b001)))
         (z2 (bvashr (select x #b010) (select y #b010)))
         (z3 (bvashr (select x #b011) (select y #b011)))
         (z4 (bvashr (select x #b100) (select y #b100)))
         (z5 (bvashr (select x #b101) (select y #b101)))
         (z6 (bvashr (select x #b110) (select y #b110)))
         (z7 (bvashr (select x #b111) (select y #b111)))
         )
      (vmake_3_64 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvurem_3_8 ((x vector_3_8) (y vector_3_8)) vector_3_8
   (let (
         (z0 (bvurem (select x #b000) (select y #b000)))
         (z1 (bvurem (select x #b001) (select y #b001)))
         (z2 (bvurem (select x #b010) (select y #b010)))
         (z3 (bvurem (select x #b011) (select y #b011)))
         (z4 (bvurem (select x #b100) (select y #b100)))
         (z5 (bvurem (select x #b101) (select y #b101)))
         (z6 (bvurem (select x #b110) (select y #b110)))
         (z7 (bvurem (select x #b111) (select y #b111)))
         )
      (vmake_3_8 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvurem_3_16 ((x vector_3_16) (y vector_3_16)) vector_3_16
   (let (
         (z0 (bvurem (select x #b000) (select y #b000)))
         (z1 (bvurem (select x #b001) (select y #b001)))
         (z2 (bvurem (select x #b010) (select y #b010)))
         (z3 (bvurem (select x #b011) (select y #b011)))
         (z4 (bvurem (select x #b100) (select y #b100)))
         (z5 (bvurem (select x #b101) (select y #b101)))
         (z6 (bvurem (select x #b110) (select y #b110)))
         (z7 (bvurem (select x #b111) (select y #b111)))
         )
      (vmake_3_16 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvurem_3_32 ((x vector_3_32) (y vector_3_32)) vector_3_32
   (let (
         (z0 (bvurem (select x #b000) (select y #b000)))
         (z1 (bvurem (select x #b001) (select y #b001)))
         (z2 (bvurem (select x #b010) (select y #b010)))
         (z3 (bvurem (select x #b011) (select y #b011)))
         (z4 (bvurem (select x #b100) (select y #b100)))
         (z5 (bvurem (select x #b101) (select y #b101)))
         (z6 (bvurem (select x #b110) (select y #b110)))
         (z7 (bvurem (select x #b111) (select y #b111)))
         )
      (vmake_3_32 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvurem_3_64 ((x vector_3_64) (y vector_3_64)) vector_3_64
   (let (
         (z0 (bvurem (select x #b000) (select y #b000)))
         (z1 (bvurem (select x #b001) (select y #b001)))
         (z2 (bvurem (select x #b010) (select y #b010)))
         (z3 (bvurem (select x #b011) (select y #b011)))
         (z4 (bvurem (select x #b100) (select y #b100)))
         (z5 (bvurem (select x #b101) (select y #b101)))
         (z6 (bvurem (select x #b110) (select y #b110)))
         (z7 (bvurem (select x #b111) (select y #b111)))
         )
      (vmake_3_64 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvsrem_3_8 ((x vector_3_8) (y vector_3_8)) vector_3_8
   (let (
         (z0 (bvsrem (select x #b000) (select y #b000)))
         (z1 (bvsrem (select x #b001) (select y #b001)))
         (z2 (bvsrem (select x #b010) (select y #b010)))
         (z3 (bvsrem (select x #b011) (select y #b011)))
         (z4 (bvsrem (select x #b100) (select y #b100)))
         (z5 (bvsrem (select x #b101) (select y #b101)))
         (z6 (bvsrem (select x #b110) (select y #b110)))
         (z7 (bvsrem (select x #b111) (select y #b111)))
         )
      (vmake_3_8 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvsrem_3_16 ((x vector_3_16) (y vector_3_16)) vector_3_16
   (let (
         (z0 (bvsrem (select x #b000) (select y #b000)))
         (z1 (bvsrem (select x #b001) (select y #b001)))
         (z2 (bvsrem (select x #b010) (select y #b010)))
         (z3 (bvsrem (select x #b011) (select y #b011)))
         (z4 (bvsrem (select x #b100) (select y #b100)))
         (z5 (bvsrem (select x #b101) (select y #b101)))
         (z6 (bvsrem (select x #b110) (select y #b110)))
         (z7 (bvsrem (select x #b111) (select y #b111)))
         )
      (vmake_3_16 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvsrem_3_32 ((x vector_3_32) (y vector_3_32)) vector_3_32
   (let (
         (z0 (bvsrem (select x #b000) (select y #b000)))
         (z1 (bvsrem (select x #b001) (select y #b001)))
         (z2 (bvsrem (select x #b010) (select y #b010)))
         (z3 (bvsrem (select x #b011) (select y #b011)))
         (z4 (bvsrem (select x #b100) (select y #b100)))
         (z5 (bvsrem (select x #b101) (select y #b101)))
         (z6 (bvsrem (select x #b110) (select y #b110)))
         (z7 (bvsrem (select x #b111) (select y #b111)))
         )
      (vmake_3_32 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvsrem_3_64 ((x vector_3_64) (y vector_3_64)) vector_3_64
   (let (
         (z0 (bvsrem (select x #b000) (select y #b000)))
         (z1 (bvsrem (select x #b001) (select y #b001)))
         (z2 (bvsrem (select x #b010) (select y #b010)))
         (z3 (bvsrem (select x #b011) (select y #b011)))
         (z4 (bvsrem (select x #b100) (select y #b100)))
         (z5 (bvsrem (select x #b101) (select y #b101)))
         (z6 (bvsrem (select x #b110) (select y #b110)))
         (z7 (bvsrem (select x #b111) (select y #b111)))
         )
      (vmake_3_64 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvand_3_8 ((x vector_3_8) (y vector_3_8)) vector_3_8
   (let (
         (z0 (bvand (select x #b000) (select y #b000)))
         (z1 (bvand (select x #b001) (select y #b001)))
         (z2 (bvand (select x #b010) (select y #b010)))
         (z3 (bvand (select x #b011) (select y #b011)))
         (z4 (bvand (select x #b100) (select y #b100)))
         (z5 (bvand (select x #b101) (select y #b101)))
         (z6 (bvand (select x #b110) (select y #b110)))
         (z7 (bvand (select x #b111) (select y #b111)))
         )
      (vmake_3_8 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvand_3_16 ((x vector_3_16) (y vector_3_16)) vector_3_16
   (let (
         (z0 (bvand (select x #b000) (select y #b000)))
         (z1 (bvand (select x #b001) (select y #b001)))
         (z2 (bvand (select x #b010) (select y #b010)))
         (z3 (bvand (select x #b011) (select y #b011)))
         (z4 (bvand (select x #b100) (select y #b100)))
         (z5 (bvand (select x #b101) (select y #b101)))
         (z6 (bvand (select x #b110) (select y #b110)))
         (z7 (bvand (select x #b111) (select y #b111)))
         )
      (vmake_3_16 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvand_3_32 ((x vector_3_32) (y vector_3_32)) vector_3_32
   (let (
         (z0 (bvand (select x #b000) (select y #b000)))
         (z1 (bvand (select x #b001) (select y #b001)))
         (z2 (bvand (select x #b010) (select y #b010)))
         (z3 (bvand (select x #b011) (select y #b011)))
         (z4 (bvand (select x #b100) (select y #b100)))
         (z5 (bvand (select x #b101) (select y #b101)))
         (z6 (bvand (select x #b110) (select y #b110)))
         (z7 (bvand (select x #b111) (select y #b111)))
         )
      (vmake_3_32 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvand_3_64 ((x vector_3_64) (y vector_3_64)) vector_3_64
   (let (
         (z0 (bvand (select x #b000) (select y #b000)))
         (z1 (bvand (select x #b001) (select y #b001)))
         (z2 (bvand (select x #b010) (select y #b010)))
         (z3 (bvand (select x #b011) (select y #b011)))
         (z4 (bvand (select x #b100) (select y #b100)))
         (z5 (bvand (select x #b101) (select y #b101)))
         (z6 (bvand (select x #b110) (select y #b110)))
         (z7 (bvand (select x #b111) (select y #b111)))
         )
      (vmake_3_64 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvor_3_8 ((x vector_3_8) (y vector_3_8)) vector_3_8
   (let (
         (z0 (bvor (select x #b000) (select y #b000)))
         (z1 (bvor (select x #b001) (select y #b001)))
         (z2 (bvor (select x #b010) (select y #b010)))
         (z3 (bvor (select x #b011) (select y #b011)))
         (z4 (bvor (select x #b100) (select y #b100)))
         (z5 (bvor (select x #b101) (select y #b101)))
         (z6 (bvor (select x #b110) (select y #b110)))
         (z7 (bvor (select x #b111) (select y #b111)))
         )
      (vmake_3_8 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvor_3_16 ((x vector_3_16) (y vector_3_16)) vector_3_16
   (let (
         (z0 (bvor (select x #b000) (select y #b000)))
         (z1 (bvor (select x #b001) (select y #b001)))
         (z2 (bvor (select x #b010) (select y #b010)))
         (z3 (bvor (select x #b011) (select y #b011)))
         (z4 (bvor (select x #b100) (select y #b100)))
         (z5 (bvor (select x #b101) (select y #b101)))
         (z6 (bvor (select x #b110) (select y #b110)))
         (z7 (bvor (select x #b111) (select y #b111)))
         )
      (vmake_3_16 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvor_3_32 ((x vector_3_32) (y vector_3_32)) vector_3_32
   (let (
         (z0 (bvor (select x #b000) (select y #b000)))
         (z1 (bvor (select x #b001) (select y #b001)))
         (z2 (bvor (select x #b010) (select y #b010)))
         (z3 (bvor (select x #b011) (select y #b011)))
         (z4 (bvor (select x #b100) (select y #b100)))
         (z5 (bvor (select x #b101) (select y #b101)))
         (z6 (bvor (select x #b110) (select y #b110)))
         (z7 (bvor (select x #b111) (select y #b111)))
         )
      (vmake_3_32 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvor_3_64 ((x vector_3_64) (y vector_3_64)) vector_3_64
   (let (
         (z0 (bvor (select x #b000) (select y #b000)))
         (z1 (bvor (select x #b001) (select y #b001)))
         (z2 (bvor (select x #b010) (select y #b010)))
         (z3 (bvor (select x #b011) (select y #b011)))
         (z4 (bvor (select x #b100) (select y #b100)))
         (z5 (bvor (select x #b101) (select y #b101)))
         (z6 (bvor (select x #b110) (select y #b110)))
         (z7 (bvor (select x #b111) (select y #b111)))
         )
      (vmake_3_64 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvxor_3_8 ((x vector_3_8) (y vector_3_8)) vector_3_8
   (let (
         (z0 (bvxor (select x #b000) (select y #b000)))
         (z1 (bvxor (select x #b001) (select y #b001)))
         (z2 (bvxor (select x #b010) (select y #b010)))
         (z3 (bvxor (select x #b011) (select y #b011)))
         (z4 (bvxor (select x #b100) (select y #b100)))
         (z5 (bvxor (select x #b101) (select y #b101)))
         (z6 (bvxor (select x #b110) (select y #b110)))
         (z7 (bvxor (select x #b111) (select y #b111)))
         )
      (vmake_3_8 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvxor_3_16 ((x vector_3_16) (y vector_3_16)) vector_3_16
   (let (
         (z0 (bvxor (select x #b000) (select y #b000)))
         (z1 (bvxor (select x #b001) (select y #b001)))
         (z2 (bvxor (select x #b010) (select y #b010)))
         (z3 (bvxor (select x #b011) (select y #b011)))
         (z4 (bvxor (select x #b100) (select y #b100)))
         (z5 (bvxor (select x #b101) (select y #b101)))
         (z6 (bvxor (select x #b110) (select y #b110)))
         (z7 (bvxor (select x #b111) (select y #b111)))
         )
      (vmake_3_16 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvxor_3_32 ((x vector_3_32) (y vector_3_32)) vector_3_32
   (let (
         (z0 (bvxor (select x #b000) (select y #b000)))
         (z1 (bvxor (select x #b001) (select y #b001)))
         (z2 (bvxor (select x #b010) (select y #b010)))
         (z3 (bvxor (select x #b011) (select y #b011)))
         (z4 (bvxor (select x #b100) (select y #b100)))
         (z5 (bvxor (select x #b101) (select y #b101)))
         (z6 (bvxor (select x #b110) (select y #b110)))
         (z7 (bvxor (select x #b111) (select y #b111)))
         )
      (vmake_3_32 z0 z1 z2 z3 z4 z5 z6 z7)))


 (define-fun vbvxor_3_64 ((x vector_3_64) (y vector_3_64)) vector_3_64
   (let (
         (z0 (bvxor (select x #b000) (select y #b000)))
         (z1 (bvxor (select x #b001) (select y #b001)))
         (z2 (bvxor (select x #b010) (select y #b010)))
         (z3 (bvxor (select x #b011) (select y #b011)))
         (z4 (bvxor (select x #b100) (select y #b100)))
         (z5 (bvxor (select x #b101) (select y #b101)))
         (z6 (bvxor (select x #b110) (select y #b110)))
         (z7 (bvxor (select x #b111) (select y #b111)))
         )
      (vmake_3_64 z0 z1 z2 z3 z4 z5 z6 z7)))




;; conversion to and from (Bitvector 64)
;; this assumes little endian representation
(define-fun cast_vector_1_32_to_bits ((x vector_1_32)) (_ BitVec 64)
   (concat (select x #b1) (select x #b0)))

(define-fun cast_bits_to_vector_1_32 ((w (_ BitVec 64))) vector_1_32
   (let ((z0 ((_ extract 31 0) w))
         (z1 ((_ extract 63 32) w)))
      (vmake_1_32 z0 z1)))

;; conversion to and from (Bitvector 128)
;; this assumes little endian representation
(define-fun cast_vector_2_32_to_bits ((x vector_2_32)) (_ BitVec 128)
   (concat (concat (concat (select x #b11) (select x #b10)) (select x #b01)) (select x #b00)))

(define-fun cast_bits_to_vector_2_32 ((w (_ BitVec 128))) vector_2_32
   (let ((z0 ((_ extract 31 0) w))
         (z1 ((_ extract 63 32) w))
         (z2 ((_ extract 95 64) w))
         (z3 ((_ extract 127 96) w)))
      (vmake_2_32 z0 z1 z2 z3)))

;; conversion to and from (Bitvector 128) to vectors 2 x i64
(define-fun cast_vector_1_64_to_bits ((x vector_1_64)) (_ BitVec 128)
   (concat (select x #b1) (select x #b0)))

(define-fun cast_bits_to_vector_1_64 ((w (_ BitVec 128))) vector_1_64
   (let ((z0 ((_ extract 63 0) w))
         (z1 ((_ extract 127 64) w)))
      (vmake_1_64 z0 z1)))




;; end of prelude


(declare-fun |@exp0| () (_ BitVec 64))
(declare-fun |@exp1| () (_ BitVec 64))
(declare-fun |@main| () (_ BitVec 64))


;; Function: |@exp0|
;; (i16 zeroext %a, i16 zeroext %b)
(declare-fun memory1 () Mem)
(define-fun rsp1 () (_ BitVec 64) (_ bv0 64))
(declare-fun |%a_@exp0| () (_ BitVec 16))
(declare-fun |%b_@exp0| () (_ BitVec 16))

;; BLOCK %0 with index 0 and rank = 1
;; Predecessors:
;; @exp0_block_0_entry_condition 
(define-fun @exp0_block_0_entry_condition () Bool true)
;; %1 = alloca i16, align 2
(define-fun rsp2 () Address (bvsub rsp1 (_ bv2 64)))
(define-fun |%1_@exp0| () (_ BitVec 64) rsp2)
;; %2 = alloca i16, align 2
(define-fun rsp3 () Address (bvsub rsp2 (_ bv2 64)))
(define-fun |%2_@exp0| () (_ BitVec 64) rsp3)
;; %retval = alloca i16, align 2
(define-fun rsp4 () Address (bvsub rsp3 (_ bv2 64)))
(define-fun |%retval_@exp0| () (_ BitVec 64) rsp4)
;; store i16 %a, i16* %1, align 2
(define-fun memory2 () Mem (write16 memory1 |%1_@exp0| |%a_@exp0|))
;; store i16 %b, i16* %2, align 2
(define-fun memory3 () Mem (write16 memory2 |%2_@exp0| |%b_@exp0|))
;; store i16 1, i16* %retval, align 2
(define-fun memory4 () Mem (write16 memory3 |%retval_@exp0| (_ bv1 16)))
;; %3 = load i16* %2, align 2
(define-fun |%3_@exp0| () (_ BitVec 16) (read16 memory4 |%2_@exp0|))
;; %4 = zext i16 %3 to i32
(define-fun |%4_@exp0| () (_ BitVec 32) ((_ zero_extend 16) |%3_@exp0|))
;; %5 = icmp sgt i32 %4, 0
(define-fun |%5_@exp0| () Bool (bvsgt |%4_@exp0| (_ bv0 32)))
;; br i1 %5, label %.lr.ph, label %20
;; No backward arrows

;; BLOCK %.lr.ph with index 1 and rank = 2
;; Predecessors: %0
;; @exp0_block_1_entry_condition 
(define-fun @exp0_block_1_entry_condition () Bool
    (and @exp0_block_0_entry_condition |%5_@exp0|)
)
;;Memory PHI
(define-fun memory5 () Mem memory4)
;; br label %6
;; No backward arrows

;; BLOCK %6 with index 2 and rank = 3
;; Predecessors: %36 %.lr.ph
;; Backward pointers: %36
;; @exp0_block_2_entry_condition 
(define-fun @exp0_block_2_entry_condition () Bool
    @exp0_block_1_entry_condition
)
;;Memory PHI
(define-fun memory6 () Mem memory5)
;; %7 = load i16* %1, align 2
(define-fun |%7_@exp0| () (_ BitVec 16) (read16 memory6 |%1_@exp0|))
;; %8 = zext i16 %7 to i32
(define-fun |%8_@exp0| () (_ BitVec 32) ((_ zero_extend 16) |%7_@exp0|))
;; %9 = load i16* %retval, align 2
(define-fun |%9_@exp0| () (_ BitVec 16) (read16 memory6 |%retval_@exp0|))
;; %10 = zext i16 %9 to i32
(define-fun |%10_@exp0| () (_ BitVec 32) ((_ zero_extend 16) |%9_@exp0|))
;; %11 = mul nsw i32 %10, %8
(define-fun |%11_@exp0| () (_ BitVec 32) (bvmul |%10_@exp0| |%8_@exp0|))
;; %12 = trunc i32 %11 to i16
(define-fun |%12_@exp0| () (_ BitVec 16) ((_ extract 15 0) |%11_@exp0|))
;; store i16 %12, i16* %retval, align 2
(define-fun memory7 () Mem (write16 memory6 |%retval_@exp0| |%12_@exp0|))
;; %13 = load i16* %2, align 2
(define-fun |%13_@exp0| () (_ BitVec 16) (read16 memory7 |%2_@exp0|))
;; %14 = zext i16 %13 to i32
(define-fun |%14_@exp0| () (_ BitVec 32) ((_ zero_extend 16) |%13_@exp0|))
;; %15 = sub nsw i32 %14, 1
(define-fun |%15_@exp0| () (_ BitVec 32) (bvsub |%14_@exp0| (_ bv1 32)))
;; %16 = trunc i32 %15 to i16
(define-fun |%16_@exp0| () (_ BitVec 16) ((_ extract 15 0) |%15_@exp0|))
;; store i16 %16, i16* %2, align 2
(define-fun memory8 () Mem (write16 memory7 |%2_@exp0| |%16_@exp0|))
;; %17 = load i16* %2, align 2
(define-fun |%17_@exp0| () (_ BitVec 16) (read16 memory8 |%2_@exp0|))
;; %18 = zext i16 %17 to i32
(define-fun |%18_@exp0| () (_ BitVec 32) ((_ zero_extend 16) |%17_@exp0|))
;; %19 = icmp sgt i32 %18, 0
(define-fun |%19_@exp0| () Bool (bvsgt |%18_@exp0| (_ bv0 32)))
;; br i1 %19, label %22, label %._crit_edge
;; No backward arrows

;; BLOCK %22 with index 5 and rank = 4
;; Predecessors: %6
;; @exp0_block_5_entry_condition 
(define-fun @exp0_block_5_entry_condition () Bool
    (and @exp0_block_2_entry_condition |%19_@exp0|)
)
;;Memory PHI
(define-fun memory9 () Mem memory8)
;; %23 = load i16* %1, align 2
(define-fun |%23_@exp0| () (_ BitVec 16) (read16 memory9 |%1_@exp0|))
;; %24 = zext i16 %23 to i32
(define-fun |%24_@exp0| () (_ BitVec 32) ((_ zero_extend 16) |%23_@exp0|))
;; %25 = load i16* %retval, align 2
(define-fun |%25_@exp0| () (_ BitVec 16) (read16 memory9 |%retval_@exp0|))
;; %26 = zext i16 %25 to i32
(define-fun |%26_@exp0| () (_ BitVec 32) ((_ zero_extend 16) |%25_@exp0|))
;; %27 = mul nsw i32 %26, %24
(define-fun |%27_@exp0| () (_ BitVec 32) (bvmul |%26_@exp0| |%24_@exp0|))
;; %28 = trunc i32 %27 to i16
(define-fun |%28_@exp0| () (_ BitVec 16) ((_ extract 15 0) |%27_@exp0|))
;; store i16 %28, i16* %retval, align 2
(define-fun memory10 () Mem (write16 memory9 |%retval_@exp0| |%28_@exp0|))
;; %29 = load i16* %2, align 2
(define-fun |%29_@exp0| () (_ BitVec 16) (read16 memory10 |%2_@exp0|))
;; %30 = zext i16 %29 to i32
(define-fun |%30_@exp0| () (_ BitVec 32) ((_ zero_extend 16) |%29_@exp0|))
;; %31 = sub nsw i32 %30, 1
(define-fun |%31_@exp0| () (_ BitVec 32) (bvsub |%30_@exp0| (_ bv1 32)))
;; %32 = trunc i32 %31 to i16
(define-fun |%32_@exp0| () (_ BitVec 16) ((_ extract 15 0) |%31_@exp0|))
;; store i16 %32, i16* %2, align 2
(define-fun memory11 () Mem (write16 memory10 |%2_@exp0| |%32_@exp0|))
;; %33 = load i16* %2, align 2
(define-fun |%33_@exp0| () (_ BitVec 16) (read16 memory11 |%2_@exp0|))
;; %34 = zext i16 %33 to i32
(define-fun |%34_@exp0| () (_ BitVec 32) ((_ zero_extend 16) |%33_@exp0|))
;; %35 = icmp sgt i32 %34, 0
(define-fun |%35_@exp0| () Bool (bvsgt |%34_@exp0| (_ bv0 32)))
;; br i1 %35, label %36, label %._crit_edge
;; No backward arrows

;; BLOCK %36 with index 6 and rank = 5
;; Predecessors: %22
;; @exp0_block_6_entry_condition 
(define-fun @exp0_block_6_entry_condition () Bool
    (and @exp0_block_5_entry_condition |%35_@exp0|)
)
;;Memory PHI
(define-fun memory12 () Mem memory11)
;; %37 = load i16* %1, align 2
(define-fun |%37_@exp0| () (_ BitVec 16) (read16 memory12 |%1_@exp0|))
;; %38 = zext i16 %37 to i32
(define-fun |%38_@exp0| () (_ BitVec 32) ((_ zero_extend 16) |%37_@exp0|))
;; %39 = load i16* %retval, align 2
(define-fun |%39_@exp0| () (_ BitVec 16) (read16 memory12 |%retval_@exp0|))
;; %40 = zext i16 %39 to i32
(define-fun |%40_@exp0| () (_ BitVec 32) ((_ zero_extend 16) |%39_@exp0|))
;; %41 = mul nsw i32 %40, %38
(define-fun |%41_@exp0| () (_ BitVec 32) (bvmul |%40_@exp0| |%38_@exp0|))
;; %42 = trunc i32 %41 to i16
(define-fun |%42_@exp0| () (_ BitVec 16) ((_ extract 15 0) |%41_@exp0|))
;; store i16 %42, i16* %retval, align 2
(define-fun memory13 () Mem (write16 memory12 |%retval_@exp0| |%42_@exp0|))
;; %43 = load i16* %2, align 2
(define-fun |%43_@exp0| () (_ BitVec 16) (read16 memory13 |%2_@exp0|))
;; %44 = zext i16 %43 to i32
(define-fun |%44_@exp0| () (_ BitVec 32) ((_ zero_extend 16) |%43_@exp0|))
;; %45 = sub nsw i32 %44, 1
(define-fun |%45_@exp0| () (_ BitVec 32) (bvsub |%44_@exp0| (_ bv1 32)))
;; %46 = trunc i32 %45 to i16
(define-fun |%46_@exp0| () (_ BitVec 16) ((_ extract 15 0) |%45_@exp0|))
;; store i16 %46, i16* %2, align 2
(define-fun memory14 () Mem (write16 memory13 |%2_@exp0| |%46_@exp0|))
;; %47 = load i16* %2, align 2
(define-fun |%47_@exp0| () (_ BitVec 16) (read16 memory14 |%2_@exp0|))
;; %48 = zext i16 %47 to i32
(define-fun |%48_@exp0| () (_ BitVec 32) ((_ zero_extend 16) |%47_@exp0|))
;; %49 = icmp sgt i32 %48, 0
(define-fun |%49_@exp0| () Bool (bvsgt |%48_@exp0| (_ bv0 32)))
;; br i1 %49, label %6, label %._crit_edge
;; BACKWARD ARROWS:  %6
(assert 
    (not (and @exp0_block_6_entry_condition |%49_@exp0|))
)

;; BLOCK %._crit_edge with index 3 and rank = 6
;; Predecessors: %36 %22 %6
;; @exp0_block_3_entry_condition 
(define-fun @exp0_block_3_entry_condition () Bool
    (or
        (and @exp0_block_6_entry_condition (not |%49_@exp0|))
        (and @exp0_block_5_entry_condition (not |%35_@exp0|))
        (and @exp0_block_2_entry_condition (not |%19_@exp0|))
    )
)
;;Memory PHI
(define-fun memory15 () Mem 
    (ite (and @exp0_block_6_entry_condition (not |%49_@exp0|)) memory14 
    (ite (and @exp0_block_5_entry_condition (not |%35_@exp0|)) memory11 memory8
    )
    ))
;; br label %20
;; No backward arrows

;; BLOCK %20 with index 4 and rank = 7
;; Predecessors: %._crit_edge %0
;; @exp0_block_4_entry_condition 
(define-fun @exp0_block_4_entry_condition () Bool
    (or
        @exp0_block_3_entry_condition
        (and @exp0_block_0_entry_condition (not |%5_@exp0|))
    )
)
;;Memory PHI
(define-fun memory16 () Mem 
    (ite @exp0_block_3_entry_condition memory15 memory4
    ))
;; %21 = load i16* %retval, align 2
(define-fun |%21_@exp0| () (_ BitVec 16) (read16 memory16 |%retval_@exp0|))
;; ret i16 %21
;; No backward arrows


(define-fun @exp0_result () (_ BitVec 16) |%21_@exp0|)

;; Function: |@exp1|
;; (i16 zeroext %a, i16 zeroext %b)
(declare-fun memory17 () Mem)
(define-fun rsp5 () (_ BitVec 64) (_ bv0 64))
(declare-fun |%a_@exp1| () (_ BitVec 16))
(declare-fun |%b_@exp1| () (_ BitVec 16))

;; BLOCK %0 with index 0 and rank = 1
;; Predecessors:
;; @exp1_block_0_entry_condition 
(define-fun @exp1_block_0_entry_condition () Bool true)
;; %1 = alloca i16, align 2
(define-fun rsp6 () Address (bvsub rsp5 (_ bv2 64)))
(define-fun |%1_@exp1| () (_ BitVec 64) rsp6)
;; %2 = alloca i16, align 2
(define-fun rsp7 () Address (bvsub rsp6 (_ bv2 64)))
(define-fun |%2_@exp1| () (_ BitVec 64) rsp7)
;; %retval = alloca i16, align 2
(define-fun rsp8 () Address (bvsub rsp7 (_ bv2 64)))
(define-fun |%retval_@exp1| () (_ BitVec 64) rsp8)
;; store i16 %a, i16* %1, align 2
(define-fun memory18 () Mem (write16 memory17 |%1_@exp1| |%a_@exp1|))
;; store i16 %b, i16* %2, align 2
(define-fun memory19 () Mem (write16 memory18 |%2_@exp1| |%b_@exp1|))
;; store i16 1, i16* %retval, align 2
(define-fun memory20 () Mem (write16 memory19 |%retval_@exp1| (_ bv1 16)))
;; %3 = load i16* %2, align 2
(define-fun |%3_@exp1| () (_ BitVec 16) (read16 memory20 |%2_@exp1|))
;; %4 = zext i16 %3 to i32
(define-fun |%4_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%3_@exp1|))
;; %5 = icmp ne i32 %4, 0
(define-fun |%5_@exp1| () Bool (distinct |%4_@exp1| (_ bv0 32)))
;; br i1 %5, label %.lr.ph, label %32
;; No backward arrows

;; BLOCK %.lr.ph with index 1 and rank = 2
;; Predecessors: %0
;; @exp1_block_1_entry_condition 
(define-fun @exp1_block_1_entry_condition () Bool
    (and @exp1_block_0_entry_condition |%5_@exp1|)
)
;;Memory PHI
(define-fun memory21 () Mem memory20)
;; br label %6
;; No backward arrows

;; BLOCK %6 with index 2 and rank = 3
;; Predecessors: %72 %.lr.ph
;; Backward pointers: %72
;; @exp1_block_2_entry_condition 
(define-fun @exp1_block_2_entry_condition () Bool
    @exp1_block_1_entry_condition
)
;;Memory PHI
(define-fun memory22 () Mem memory21)
;; %7 = load i16* %2, align 2
(define-fun |%7_@exp1| () (_ BitVec 16) (read16 memory22 |%2_@exp1|))
;; %8 = zext i16 %7 to i32
(define-fun |%8_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%7_@exp1|))
;; %9 = and i32 %8, 1
(define-fun |%9_@exp1| () (_ BitVec 32) (bvand |%8_@exp1| (_ bv1 32)))
;; %10 = icmp ne i32 %9, 0
(define-fun |%10_@exp1| () Bool (distinct |%9_@exp1| (_ bv0 32)))
;; br i1 %10, label %11, label %18
;; No backward arrows

;; BLOCK %11 with index 3 and rank = 4
;; Predecessors: %6
;; @exp1_block_3_entry_condition 
(define-fun @exp1_block_3_entry_condition () Bool
    (and @exp1_block_2_entry_condition |%10_@exp1|)
)
;;Memory PHI
(define-fun memory23 () Mem memory22)
;; %12 = load i16* %1, align 2
(define-fun |%12_@exp1| () (_ BitVec 16) (read16 memory23 |%1_@exp1|))
;; %13 = zext i16 %12 to i32
(define-fun |%13_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%12_@exp1|))
;; %14 = load i16* %retval, align 2
(define-fun |%14_@exp1| () (_ BitVec 16) (read16 memory23 |%retval_@exp1|))
;; %15 = zext i16 %14 to i32
(define-fun |%15_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%14_@exp1|))
;; %16 = mul nsw i32 %15, %13
(define-fun |%16_@exp1| () (_ BitVec 32) (bvmul |%15_@exp1| |%13_@exp1|))
;; %17 = trunc i32 %16 to i16
(define-fun |%17_@exp1| () (_ BitVec 16) ((_ extract 15 0) |%16_@exp1|))
;; store i16 %17, i16* %retval, align 2
(define-fun memory24 () Mem (write16 memory23 |%retval_@exp1| |%17_@exp1|))
;; br label %18
;; No backward arrows

;; BLOCK %18 with index 4 and rank = 5
;; Predecessors: %11 %6
;; @exp1_block_4_entry_condition 
(define-fun @exp1_block_4_entry_condition () Bool
    (or
        @exp1_block_3_entry_condition
        (and @exp1_block_2_entry_condition (not |%10_@exp1|))
    )
)
;;Memory PHI
(define-fun memory25 () Mem 
    (ite @exp1_block_3_entry_condition memory24 memory22
    ))
;; %19 = load i16* %2, align 2
(define-fun |%19_@exp1| () (_ BitVec 16) (read16 memory25 |%2_@exp1|))
;; %20 = zext i16 %19 to i32
(define-fun |%20_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%19_@exp1|))
;; %21 = ashr i32 %20, 1
(define-fun |%21_@exp1| () (_ BitVec 32) (bvashr |%20_@exp1| (_ bv1 32)))
;; %22 = trunc i32 %21 to i16
(define-fun |%22_@exp1| () (_ BitVec 16) ((_ extract 15 0) |%21_@exp1|))
;; store i16 %22, i16* %2, align 2
(define-fun memory26 () Mem (write16 memory25 |%2_@exp1| |%22_@exp1|))
;; %23 = load i16* %1, align 2
(define-fun |%23_@exp1| () (_ BitVec 16) (read16 memory26 |%1_@exp1|))
;; %24 = zext i16 %23 to i32
(define-fun |%24_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%23_@exp1|))
;; %25 = load i16* %1, align 2
(define-fun |%25_@exp1| () (_ BitVec 16) (read16 memory26 |%1_@exp1|))
;; %26 = zext i16 %25 to i32
(define-fun |%26_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%25_@exp1|))
;; %27 = mul nsw i32 %26, %24
(define-fun |%27_@exp1| () (_ BitVec 32) (bvmul |%26_@exp1| |%24_@exp1|))
;; %28 = trunc i32 %27 to i16
(define-fun |%28_@exp1| () (_ BitVec 16) ((_ extract 15 0) |%27_@exp1|))
;; store i16 %28, i16* %1, align 2
(define-fun memory27 () Mem (write16 memory26 |%1_@exp1| |%28_@exp1|))
;; %29 = load i16* %2, align 2
(define-fun |%29_@exp1| () (_ BitVec 16) (read16 memory27 |%2_@exp1|))
;; %30 = zext i16 %29 to i32
(define-fun |%30_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%29_@exp1|))
;; %31 = icmp ne i32 %30, 0
(define-fun |%31_@exp1| () Bool (distinct |%30_@exp1| (_ bv0 32)))
;; br i1 %31, label %34, label %._crit_edge
;; No backward arrows

;; BLOCK %34 with index 7 and rank = 6
;; Predecessors: %18
;; @exp1_block_7_entry_condition 
(define-fun @exp1_block_7_entry_condition () Bool
    (and @exp1_block_4_entry_condition |%31_@exp1|)
)
;;Memory PHI
(define-fun memory28 () Mem memory27)
;; %35 = load i16* %2, align 2
(define-fun |%35_@exp1| () (_ BitVec 16) (read16 memory28 |%2_@exp1|))
;; %36 = zext i16 %35 to i32
(define-fun |%36_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%35_@exp1|))
;; %37 = and i32 %36, 1
(define-fun |%37_@exp1| () (_ BitVec 32) (bvand |%36_@exp1| (_ bv1 32)))
;; %38 = icmp ne i32 %37, 0
(define-fun |%38_@exp1| () Bool (distinct |%37_@exp1| (_ bv0 32)))
;; br i1 %38, label %39, label %46
;; No backward arrows

;; BLOCK %39 with index 8 and rank = 7
;; Predecessors: %34
;; @exp1_block_8_entry_condition 
(define-fun @exp1_block_8_entry_condition () Bool
    (and @exp1_block_7_entry_condition |%38_@exp1|)
)
;;Memory PHI
(define-fun memory29 () Mem memory28)
;; %40 = load i16* %1, align 2
(define-fun |%40_@exp1| () (_ BitVec 16) (read16 memory29 |%1_@exp1|))
;; %41 = zext i16 %40 to i32
(define-fun |%41_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%40_@exp1|))
;; %42 = load i16* %retval, align 2
(define-fun |%42_@exp1| () (_ BitVec 16) (read16 memory29 |%retval_@exp1|))
;; %43 = zext i16 %42 to i32
(define-fun |%43_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%42_@exp1|))
;; %44 = mul nsw i32 %43, %41
(define-fun |%44_@exp1| () (_ BitVec 32) (bvmul |%43_@exp1| |%41_@exp1|))
;; %45 = trunc i32 %44 to i16
(define-fun |%45_@exp1| () (_ BitVec 16) ((_ extract 15 0) |%44_@exp1|))
;; store i16 %45, i16* %retval, align 2
(define-fun memory30 () Mem (write16 memory29 |%retval_@exp1| |%45_@exp1|))
;; br label %46
;; No backward arrows

;; BLOCK %46 with index 9 and rank = 8
;; Predecessors: %39 %34
;; @exp1_block_9_entry_condition 
(define-fun @exp1_block_9_entry_condition () Bool
    (or
        @exp1_block_8_entry_condition
        (and @exp1_block_7_entry_condition (not |%38_@exp1|))
    )
)
;;Memory PHI
(define-fun memory31 () Mem 
    (ite @exp1_block_8_entry_condition memory30 memory28
    ))
;; %47 = load i16* %2, align 2
(define-fun |%47_@exp1| () (_ BitVec 16) (read16 memory31 |%2_@exp1|))
;; %48 = zext i16 %47 to i32
(define-fun |%48_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%47_@exp1|))
;; %49 = ashr i32 %48, 1
(define-fun |%49_@exp1| () (_ BitVec 32) (bvashr |%48_@exp1| (_ bv1 32)))
;; %50 = trunc i32 %49 to i16
(define-fun |%50_@exp1| () (_ BitVec 16) ((_ extract 15 0) |%49_@exp1|))
;; store i16 %50, i16* %2, align 2
(define-fun memory32 () Mem (write16 memory31 |%2_@exp1| |%50_@exp1|))
;; %51 = load i16* %1, align 2
(define-fun |%51_@exp1| () (_ BitVec 16) (read16 memory32 |%1_@exp1|))
;; %52 = zext i16 %51 to i32
(define-fun |%52_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%51_@exp1|))
;; %53 = load i16* %1, align 2
(define-fun |%53_@exp1| () (_ BitVec 16) (read16 memory32 |%1_@exp1|))
;; %54 = zext i16 %53 to i32
(define-fun |%54_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%53_@exp1|))
;; %55 = mul nsw i32 %54, %52
(define-fun |%55_@exp1| () (_ BitVec 32) (bvmul |%54_@exp1| |%52_@exp1|))
;; %56 = trunc i32 %55 to i16
(define-fun |%56_@exp1| () (_ BitVec 16) ((_ extract 15 0) |%55_@exp1|))
;; store i16 %56, i16* %1, align 2
(define-fun memory33 () Mem (write16 memory32 |%1_@exp1| |%56_@exp1|))
;; %57 = load i16* %2, align 2
(define-fun |%57_@exp1| () (_ BitVec 16) (read16 memory33 |%2_@exp1|))
;; %58 = zext i16 %57 to i32
(define-fun |%58_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%57_@exp1|))
;; %59 = icmp ne i32 %58, 0
(define-fun |%59_@exp1| () Bool (distinct |%58_@exp1| (_ bv0 32)))
;; br i1 %59, label %60, label %._crit_edge
;; No backward arrows

;; BLOCK %60 with index 10 and rank = 9
;; Predecessors: %46
;; @exp1_block_10_entry_condition 
(define-fun @exp1_block_10_entry_condition () Bool
    (and @exp1_block_9_entry_condition |%59_@exp1|)
)
;;Memory PHI
(define-fun memory34 () Mem memory33)
;; %61 = load i16* %2, align 2
(define-fun |%61_@exp1| () (_ BitVec 16) (read16 memory34 |%2_@exp1|))
;; %62 = zext i16 %61 to i32
(define-fun |%62_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%61_@exp1|))
;; %63 = and i32 %62, 1
(define-fun |%63_@exp1| () (_ BitVec 32) (bvand |%62_@exp1| (_ bv1 32)))
;; %64 = icmp ne i32 %63, 0
(define-fun |%64_@exp1| () Bool (distinct |%63_@exp1| (_ bv0 32)))
;; br i1 %64, label %65, label %72
;; No backward arrows

;; BLOCK %65 with index 11 and rank = 10
;; Predecessors: %60
;; @exp1_block_11_entry_condition 
(define-fun @exp1_block_11_entry_condition () Bool
    (and @exp1_block_10_entry_condition |%64_@exp1|)
)
;;Memory PHI
(define-fun memory35 () Mem memory34)
;; %66 = load i16* %1, align 2
(define-fun |%66_@exp1| () (_ BitVec 16) (read16 memory35 |%1_@exp1|))
;; %67 = zext i16 %66 to i32
(define-fun |%67_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%66_@exp1|))
;; %68 = load i16* %retval, align 2
(define-fun |%68_@exp1| () (_ BitVec 16) (read16 memory35 |%retval_@exp1|))
;; %69 = zext i16 %68 to i32
(define-fun |%69_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%68_@exp1|))
;; %70 = mul nsw i32 %69, %67
(define-fun |%70_@exp1| () (_ BitVec 32) (bvmul |%69_@exp1| |%67_@exp1|))
;; %71 = trunc i32 %70 to i16
(define-fun |%71_@exp1| () (_ BitVec 16) ((_ extract 15 0) |%70_@exp1|))
;; store i16 %71, i16* %retval, align 2
(define-fun memory36 () Mem (write16 memory35 |%retval_@exp1| |%71_@exp1|))
;; br label %72
;; No backward arrows

;; BLOCK %72 with index 12 and rank = 11
;; Predecessors: %65 %60
;; @exp1_block_12_entry_condition 
(define-fun @exp1_block_12_entry_condition () Bool
    (or
        @exp1_block_11_entry_condition
        (and @exp1_block_10_entry_condition (not |%64_@exp1|))
    )
)
;;Memory PHI
(define-fun memory37 () Mem 
    (ite @exp1_block_11_entry_condition memory36 memory34
    ))
;; %73 = load i16* %2, align 2
(define-fun |%73_@exp1| () (_ BitVec 16) (read16 memory37 |%2_@exp1|))
;; %74 = zext i16 %73 to i32
(define-fun |%74_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%73_@exp1|))
;; %75 = ashr i32 %74, 1
(define-fun |%75_@exp1| () (_ BitVec 32) (bvashr |%74_@exp1| (_ bv1 32)))
;; %76 = trunc i32 %75 to i16
(define-fun |%76_@exp1| () (_ BitVec 16) ((_ extract 15 0) |%75_@exp1|))
;; store i16 %76, i16* %2, align 2
(define-fun memory38 () Mem (write16 memory37 |%2_@exp1| |%76_@exp1|))
;; %77 = load i16* %1, align 2
(define-fun |%77_@exp1| () (_ BitVec 16) (read16 memory38 |%1_@exp1|))
;; %78 = zext i16 %77 to i32
(define-fun |%78_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%77_@exp1|))
;; %79 = load i16* %1, align 2
(define-fun |%79_@exp1| () (_ BitVec 16) (read16 memory38 |%1_@exp1|))
;; %80 = zext i16 %79 to i32
(define-fun |%80_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%79_@exp1|))
;; %81 = mul nsw i32 %80, %78
(define-fun |%81_@exp1| () (_ BitVec 32) (bvmul |%80_@exp1| |%78_@exp1|))
;; %82 = trunc i32 %81 to i16
(define-fun |%82_@exp1| () (_ BitVec 16) ((_ extract 15 0) |%81_@exp1|))
;; store i16 %82, i16* %1, align 2
(define-fun memory39 () Mem (write16 memory38 |%1_@exp1| |%82_@exp1|))
;; %83 = load i16* %2, align 2
(define-fun |%83_@exp1| () (_ BitVec 16) (read16 memory39 |%2_@exp1|))
;; %84 = zext i16 %83 to i32
(define-fun |%84_@exp1| () (_ BitVec 32) ((_ zero_extend 16) |%83_@exp1|))
;; %85 = icmp ne i32 %84, 0
(define-fun |%85_@exp1| () Bool (distinct |%84_@exp1| (_ bv0 32)))
;; br i1 %85, label %6, label %._crit_edge
;; BACKWARD ARROWS:  %6
(assert 
    (not (and @exp1_block_12_entry_condition |%85_@exp1|))
)

;; BLOCK %._crit_edge with index 5 and rank = 12
;; Predecessors: %72 %46 %18
;; @exp1_block_5_entry_condition 
(define-fun @exp1_block_5_entry_condition () Bool
    (or
        (and @exp1_block_12_entry_condition (not |%85_@exp1|))
        (and @exp1_block_9_entry_condition (not |%59_@exp1|))
        (and @exp1_block_4_entry_condition (not |%31_@exp1|))
    )
)
;;Memory PHI
(define-fun memory40 () Mem 
    (ite (and @exp1_block_12_entry_condition (not |%85_@exp1|)) memory39 
    (ite (and @exp1_block_9_entry_condition (not |%59_@exp1|)) memory33 memory27
    )
    ))
;; br label %32
;; No backward arrows

;; BLOCK %32 with index 6 and rank = 13
;; Predecessors: %._crit_edge %0
;; @exp1_block_6_entry_condition 
(define-fun @exp1_block_6_entry_condition () Bool
    (or
        @exp1_block_5_entry_condition
        (and @exp1_block_0_entry_condition (not |%5_@exp1|))
    )
)
;;Memory PHI
(define-fun memory41 () Mem 
    (ite @exp1_block_5_entry_condition memory40 memory20
    ))
;; %33 = load i16* %retval, align 2
(define-fun |%33_@exp1| () (_ BitVec 16) (read16 memory41 |%retval_@exp1|))
;; ret i16 %33
;; No backward arrows


(define-fun @exp1_result () (_ BitVec 16) |%33_@exp1|)

;; Function: |@main|
;; (i32 %argc, i8** %argv)
(declare-fun memory42 () Mem)
(define-fun rsp9 () (_ BitVec 64) (_ bv0 64))
(declare-fun |%argc_@main| () (_ BitVec 32))
(declare-fun |%argv_@main| () (_ BitVec 64))

;; BLOCK %0 with index 0 and rank = 1
;; Predecessors:
;; @main_block_0_entry_condition 
(define-fun @main_block_0_entry_condition () Bool true)
;; %1 = alloca i32, align 4
(define-fun rsp10 () Address (bvsub rsp9 (_ bv4 64)))
(define-fun |%1_@main| () (_ BitVec 64) rsp10)
;; %2 = alloca i32, align 4
(define-fun rsp11 () Address (bvsub rsp10 (_ bv4 64)))
(define-fun |%2_@main| () (_ BitVec 64) rsp11)
;; %3 = alloca i8**, align 8
(define-fun rsp12 () Address (bvsub rsp11 (_ bv8 64)))
(define-fun |%3_@main| () (_ BitVec 64) rsp12)
;; store i32 0, i32* %1
(define-fun memory43 () Mem (write32 memory42 |%1_@main| (_ bv0 32)))
;; store i32 %argc, i32* %2, align 4
(define-fun memory44 () Mem (write32 memory43 |%2_@main| |%argc_@main|))
;; store i8** %argv, i8*** %3, align 8
(define-fun memory45 () Mem (write64 memory44 |%3_@main| |%argv_@main|))
;; ret i32 0
;; No backward arrows


(define-fun @main_result () (_ BitVec 32) (_ bv0 32))

(assert (and (= |%a_@exp0| |%a_@exp1|) (= |%b_@exp0| |%b_@exp1|) (not (= @exp0_result @exp1_result))))

(check-sat)

(get-model)

(get-value (@exp0_result @exp1_result))


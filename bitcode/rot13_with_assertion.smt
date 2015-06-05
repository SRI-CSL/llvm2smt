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

;; @.str [60 x i8] = c"x = '%c', y = '%c', z = '%c', lhs(x) = '%c', rhs(x) = '%c'\0A\00"
(declare-fun |@.str| () (_ BitVec 64))


;; Function: |@main|
;; (i32 %argc, i8** %argv)
(declare-fun memory1 () Mem)
(define-fun rsp1 () (_ BitVec 64) (_ bv0 64))
(declare-fun |%argc_@main| () (_ BitVec 32))
(declare-fun |%argv_@main| () (_ BitVec 64))

;; BLOCK %0 with index 0 and rank = 1
;; Predecessors:
;; @main_block_0_entry_condition 
(define-fun @main_block_0_entry_condition () Bool true)
;; %1 = alloca i8, align 1
(define-fun rsp2 () Address (bvsub rsp1 (_ bv1 64)))
(define-fun |%1_@main| () (_ BitVec 64) rsp2)
;; %2 = alloca i8, align 1
(define-fun rsp3 () Address (bvsub rsp2 (_ bv1 64)))
(define-fun |%2_@main| () (_ BitVec 64) rsp3)
;; %offset.i1 = alloca i32, align 4
(define-fun rsp4 () Address (bvsub rsp3 (_ bv4 64)))
(define-fun |%offset.i1_@main| () (_ BitVec 64) rsp4)
;; %3 = alloca i8, align 1
(define-fun rsp5 () Address (bvsub rsp4 (_ bv1 64)))
(define-fun |%3_@main| () (_ BitVec 64) rsp5)
;; %4 = alloca i8, align 1
(define-fun rsp6 () Address (bvsub rsp5 (_ bv1 64)))
(define-fun |%4_@main| () (_ BitVec 64) rsp6)
;; %offset.i = alloca i32, align 4
(define-fun rsp7 () Address (bvsub rsp6 (_ bv4 64)))
(define-fun |%offset.i_@main| () (_ BitVec 64) rsp7)
;; %5 = alloca i32, align 4
(define-fun rsp8 () Address (bvsub rsp7 (_ bv4 64)))
(define-fun |%5_@main| () (_ BitVec 64) rsp8)
;; %6 = alloca i32, align 4
(define-fun rsp9 () Address (bvsub rsp8 (_ bv4 64)))
(define-fun |%6_@main| () (_ BitVec 64) rsp9)
;; %7 = alloca i8**, align 8
(define-fun rsp10 () Address (bvsub rsp9 (_ bv8 64)))
(define-fun |%7_@main| () (_ BitVec 64) rsp10)
;; %x = alloca i8, align 1
(define-fun rsp11 () Address (bvsub rsp10 (_ bv1 64)))
(define-fun |%x_@main| () (_ BitVec 64) rsp11)
;; %y = alloca i8, align 1
(define-fun rsp12 () Address (bvsub rsp11 (_ bv1 64)))
(define-fun |%y_@main| () (_ BitVec 64) rsp12)
;; %z = alloca i8, align 1
(define-fun rsp13 () Address (bvsub rsp12 (_ bv1 64)))
(define-fun |%z_@main| () (_ BitVec 64) rsp13)
;; store i32 0, i32* %5
(define-fun memory2 () Mem (write32 memory1 |%5_@main| (_ bv0 32)))
;; store i32 %argc, i32* %6, align 4
(define-fun memory3 () Mem (write32 memory2 |%6_@main| |%argc_@main|))
;; store i8** %argv, i8*** %7, align 8
(define-fun memory4 () Mem (write64 memory3 |%7_@main| |%argv_@main|))
;; %8 = load i32* %6, align 4
(define-fun |%8_@main| () (_ BitVec 32) (read32 memory4 |%6_@main|))
;; %9 = icmp eq i32 %8, 2
(define-fun |%9_@main| () Bool (= |%8_@main| (_ bv2 32)))
;; br i1 %9, label %10, label %115
;; No backward arrows

;; BLOCK %10 with index 1 and rank = 2
;; Predecessors: %0
;; @main_block_1_entry_condition 
(define-fun @main_block_1_entry_condition () Bool
    (and @main_block_0_entry_condition |%9_@main|)
)
;; %11 = load i8*** %7, align 8
(define-fun |%11_@main| () (_ BitVec 64) (read64 memory4 |%7_@main|))
;; %12 = getelementptr inbounds i8** %11, i64 1
(declare-fun |%12_@main| () (_ BitVec 64))
;; %13 = load i8** %12, align 8
(define-fun |%13_@main| () (_ BitVec 64) (read64 memory4 |%12_@main|))
;; %14 = getelementptr inbounds i8* %13, i64 0
(declare-fun |%14_@main| () (_ BitVec 64))
;; %15 = load i8* %14, align 1
(define-fun |%15_@main| () (_ BitVec 8) (read8 memory4 |%14_@main|))
;; store i8 %15, i8* %x, align 1
(define-fun memory5 () Mem (write8 memory4 |%x_@main| |%15_@main|))
;; %16 = load i8* %x, align 1
(define-fun |%16_@main| () (_ BitVec 8) (read8 memory5 |%x_@main|))
;; store i8 %16, i8* %4, align 1
(define-fun memory6 () Mem (write8 memory5 |%4_@main| |%16_@main|))
;; %17 = load i8* %4, align 1
(define-fun |%17_@main| () (_ BitVec 8) (read8 memory6 |%4_@main|))
;; %18 = sext i8 %17 to i32
(define-fun |%18_@main| () (_ BitVec 32) ((_ sign_extend 24) |%17_@main|))
;; %19 = icmp sle i32 65, %18
(define-fun |%19_@main| () Bool (bvsle (_ bv65 32) |%18_@main|))
;; br i1 %19, label %20, label %36
;; No backward arrows

;; BLOCK %20 with index 2 and rank = 3
;; Predecessors: %10
;; @main_block_2_entry_condition 
(define-fun @main_block_2_entry_condition () Bool
    (and @main_block_1_entry_condition |%19_@main|)
)
;; %21 = load i8* %4, align 1
(define-fun |%21_@main| () (_ BitVec 8) (read8 memory6 |%4_@main|))
;; %22 = sext i8 %21 to i32
(define-fun |%22_@main| () (_ BitVec 32) ((_ sign_extend 24) |%21_@main|))
;; %23 = icmp sle i32 %22, 90
(define-fun |%23_@main| () Bool (bvsle |%22_@main| (_ bv90 32)))
;; br i1 %23, label %24, label %36
;; No backward arrows

;; BLOCK %24 with index 3 and rank = 4
;; Predecessors: %20
;; @main_block_3_entry_condition 
(define-fun @main_block_3_entry_condition () Bool
    (and @main_block_2_entry_condition |%23_@main|)
)
;; %25 = load i8* %4, align 1
(define-fun |%25_@main| () (_ BitVec 8) (read8 memory6 |%4_@main|))
;; %26 = sext i8 %25 to i32
(define-fun |%26_@main| () (_ BitVec 32) ((_ sign_extend 24) |%25_@main|))
;; %27 = sub nsw i32 %26, 65
(define-fun |%27_@main| () (_ BitVec 32) (bvsub |%26_@main| (_ bv65 32)))
;; store i32 %27, i32* %offset.i, align 4
(define-fun memory7 () Mem (write32 memory6 |%offset.i_@main| |%27_@main|))
;; %28 = load i32* %offset.i, align 4
(define-fun |%28_@main| () (_ BitVec 32) (read32 memory7 |%offset.i_@main|))
;; %29 = add i32 %28, 13
(define-fun |%29_@main| () (_ BitVec 32) (bvadd |%28_@main| (_ bv13 32)))
;; %30 = urem i32 %29, 26
(define-fun |%30_@main| () (_ BitVec 32) (bvurem |%29_@main| (_ bv26 32)))
;; store i32 %30, i32* %offset.i, align 4
(define-fun memory8 () Mem (write32 memory7 |%offset.i_@main| |%30_@main|))
;; %31 = load i32* %offset.i, align 4
(define-fun |%31_@main| () (_ BitVec 32) (read32 memory8 |%offset.i_@main|))
;; %32 = trunc i32 %31 to i8
(define-fun |%32_@main| () (_ BitVec 8) ((_ extract 7 0) |%31_@main|))
;; %33 = sext i8 %32 to i32
(define-fun |%33_@main| () (_ BitVec 32) ((_ sign_extend 24) |%32_@main|))
;; %34 = add nsw i32 65, %33
(define-fun |%34_@main| () (_ BitVec 32) (bvadd (_ bv65 32) |%33_@main|))
;; %35 = trunc i32 %34 to i8
(define-fun |%35_@main| () (_ BitVec 8) ((_ extract 7 0) |%34_@main|))
;; store i8 %35, i8* %3
(define-fun memory9 () Mem (write8 memory8 |%3_@main| |%35_@main|))
;; br label %rot13_char.exit
;; No backward arrows

;; BLOCK %36 with index 4 and rank = 4
;; Predecessors: %20 %10
;; @main_block_4_entry_condition 
(define-fun @main_block_4_entry_condition () Bool
    (or
        (and @main_block_2_entry_condition (not |%23_@main|))
        (and @main_block_1_entry_condition (not |%19_@main|))
    )
)
;; %37 = load i8* %4, align 1
(define-fun |%37_@main| () (_ BitVec 8) (read8 memory9 |%4_@main|))
;; %38 = sext i8 %37 to i32
(define-fun |%38_@main| () (_ BitVec 32) ((_ sign_extend 24) |%37_@main|))
;; %39 = icmp sle i32 97, %38
(define-fun |%39_@main| () Bool (bvsle (_ bv97 32) |%38_@main|))
;; br i1 %39, label %40, label %56
;; No backward arrows

;; BLOCK %40 with index 5 and rank = 5
;; Predecessors: %36
;; @main_block_5_entry_condition 
(define-fun @main_block_5_entry_condition () Bool
    (and @main_block_4_entry_condition |%39_@main|)
)
;; %41 = load i8* %4, align 1
(define-fun |%41_@main| () (_ BitVec 8) (read8 memory9 |%4_@main|))
;; %42 = sext i8 %41 to i32
(define-fun |%42_@main| () (_ BitVec 32) ((_ sign_extend 24) |%41_@main|))
;; %43 = icmp sle i32 %42, 122
(define-fun |%43_@main| () Bool (bvsle |%42_@main| (_ bv122 32)))
;; br i1 %43, label %44, label %56
;; No backward arrows

;; BLOCK %44 with index 6 and rank = 6
;; Predecessors: %40
;; @main_block_6_entry_condition 
(define-fun @main_block_6_entry_condition () Bool
    (and @main_block_5_entry_condition |%43_@main|)
)
;; %45 = load i8* %4, align 1
(define-fun |%45_@main| () (_ BitVec 8) (read8 memory9 |%4_@main|))
;; %46 = sext i8 %45 to i32
(define-fun |%46_@main| () (_ BitVec 32) ((_ sign_extend 24) |%45_@main|))
;; %47 = sub nsw i32 %46, 97
(define-fun |%47_@main| () (_ BitVec 32) (bvsub |%46_@main| (_ bv97 32)))
;; store i32 %47, i32* %offset.i, align 4
(define-fun memory10 () Mem (write32 memory9 |%offset.i_@main| |%47_@main|))
;; %48 = load i32* %offset.i, align 4
(define-fun |%48_@main| () (_ BitVec 32) (read32 memory10 |%offset.i_@main|))
;; %49 = add i32 %48, 13
(define-fun |%49_@main| () (_ BitVec 32) (bvadd |%48_@main| (_ bv13 32)))
;; %50 = urem i32 %49, 26
(define-fun |%50_@main| () (_ BitVec 32) (bvurem |%49_@main| (_ bv26 32)))
;; store i32 %50, i32* %offset.i, align 4
(define-fun memory11 () Mem (write32 memory10 |%offset.i_@main| |%50_@main|))
;; %51 = load i32* %offset.i, align 4
(define-fun |%51_@main| () (_ BitVec 32) (read32 memory11 |%offset.i_@main|))
;; %52 = trunc i32 %51 to i8
(define-fun |%52_@main| () (_ BitVec 8) ((_ extract 7 0) |%51_@main|))
;; %53 = sext i8 %52 to i32
(define-fun |%53_@main| () (_ BitVec 32) ((_ sign_extend 24) |%52_@main|))
;; %54 = add nsw i32 97, %53
(define-fun |%54_@main| () (_ BitVec 32) (bvadd (_ bv97 32) |%53_@main|))
;; %55 = trunc i32 %54 to i8
(define-fun |%55_@main| () (_ BitVec 8) ((_ extract 7 0) |%54_@main|))
;; store i8 %55, i8* %3
(define-fun memory12 () Mem (write8 memory11 |%3_@main| |%55_@main|))
;; br label %rot13_char.exit
;; No backward arrows

;; BLOCK %56 with index 7 and rank = 6
;; Predecessors: %40 %36
;; @main_block_7_entry_condition 
(define-fun @main_block_7_entry_condition () Bool
    (or
        (and @main_block_5_entry_condition (not |%43_@main|))
        (and @main_block_4_entry_condition (not |%39_@main|))
    )
)
;; %57 = load i8* %4, align 1
(define-fun |%57_@main| () (_ BitVec 8) (read8 memory12 |%4_@main|))
;; store i8 %57, i8* %3
(define-fun memory13 () Mem (write8 memory12 |%3_@main| |%57_@main|))
;; br label %rot13_char.exit
;; No backward arrows

;; BLOCK %rot13_char.exit with index 8 and rank = 7
;; Predecessors: %56 %44 %24
;; @main_block_8_entry_condition 
(define-fun @main_block_8_entry_condition () Bool
    (or
        @main_block_7_entry_condition
        @main_block_6_entry_condition
        @main_block_3_entry_condition
    )
)
;; %58 = load i8* %3
(define-fun |%58_@main| () (_ BitVec 8) (read8 memory13 |%3_@main|))
;; store i8 %58, i8* %y, align 1
(define-fun memory14 () Mem (write8 memory13 |%y_@main| |%58_@main|))
;; %59 = load i8* %y, align 1
(define-fun |%59_@main| () (_ BitVec 8) (read8 memory14 |%y_@main|))
;; store i8 %59, i8* %2, align 1
(define-fun memory15 () Mem (write8 memory14 |%2_@main| |%59_@main|))
;; %60 = load i8* %2, align 1
(define-fun |%60_@main| () (_ BitVec 8) (read8 memory15 |%2_@main|))
;; %61 = sext i8 %60 to i32
(define-fun |%61_@main| () (_ BitVec 32) ((_ sign_extend 24) |%60_@main|))
;; %62 = icmp sle i32 65, %61
(define-fun |%62_@main| () Bool (bvsle (_ bv65 32) |%61_@main|))
;; br i1 %62, label %63, label %79
;; No backward arrows

;; BLOCK %63 with index 9 and rank = 8
;; Predecessors: %rot13_char.exit
;; @main_block_9_entry_condition 
(define-fun @main_block_9_entry_condition () Bool
    (and @main_block_8_entry_condition |%62_@main|)
)
;; %64 = load i8* %2, align 1
(define-fun |%64_@main| () (_ BitVec 8) (read8 memory15 |%2_@main|))
;; %65 = sext i8 %64 to i32
(define-fun |%65_@main| () (_ BitVec 32) ((_ sign_extend 24) |%64_@main|))
;; %66 = icmp sle i32 %65, 90
(define-fun |%66_@main| () Bool (bvsle |%65_@main| (_ bv90 32)))
;; br i1 %66, label %67, label %79
;; No backward arrows

;; BLOCK %67 with index 10 and rank = 9
;; Predecessors: %63
;; @main_block_10_entry_condition 
(define-fun @main_block_10_entry_condition () Bool
    (and @main_block_9_entry_condition |%66_@main|)
)
;; %68 = load i8* %2, align 1
(define-fun |%68_@main| () (_ BitVec 8) (read8 memory15 |%2_@main|))
;; %69 = sext i8 %68 to i32
(define-fun |%69_@main| () (_ BitVec 32) ((_ sign_extend 24) |%68_@main|))
;; %70 = sub nsw i32 %69, 65
(define-fun |%70_@main| () (_ BitVec 32) (bvsub |%69_@main| (_ bv65 32)))
;; store i32 %70, i32* %offset.i1, align 4
(define-fun memory16 () Mem (write32 memory15 |%offset.i1_@main| |%70_@main|))
;; %71 = load i32* %offset.i1, align 4
(define-fun |%71_@main| () (_ BitVec 32) (read32 memory16 |%offset.i1_@main|))
;; %72 = add i32 %71, 13
(define-fun |%72_@main| () (_ BitVec 32) (bvadd |%71_@main| (_ bv13 32)))
;; %73 = urem i32 %72, 26
(define-fun |%73_@main| () (_ BitVec 32) (bvurem |%72_@main| (_ bv26 32)))
;; store i32 %73, i32* %offset.i1, align 4
(define-fun memory17 () Mem (write32 memory16 |%offset.i1_@main| |%73_@main|))
;; %74 = load i32* %offset.i1, align 4
(define-fun |%74_@main| () (_ BitVec 32) (read32 memory17 |%offset.i1_@main|))
;; %75 = trunc i32 %74 to i8
(define-fun |%75_@main| () (_ BitVec 8) ((_ extract 7 0) |%74_@main|))
;; %76 = sext i8 %75 to i32
(define-fun |%76_@main| () (_ BitVec 32) ((_ sign_extend 24) |%75_@main|))
;; %77 = add nsw i32 65, %76
(define-fun |%77_@main| () (_ BitVec 32) (bvadd (_ bv65 32) |%76_@main|))
;; %78 = trunc i32 %77 to i8
(define-fun |%78_@main| () (_ BitVec 8) ((_ extract 7 0) |%77_@main|))
;; store i8 %78, i8* %1
(define-fun memory18 () Mem (write8 memory17 |%1_@main| |%78_@main|))
;; br label %rot13_char.exit2
;; No backward arrows

;; BLOCK %79 with index 11 and rank = 9
;; Predecessors: %63 %rot13_char.exit
;; @main_block_11_entry_condition 
(define-fun @main_block_11_entry_condition () Bool
    (or
        (and @main_block_9_entry_condition (not |%66_@main|))
        (and @main_block_8_entry_condition (not |%62_@main|))
    )
)
;; %80 = load i8* %2, align 1
(define-fun |%80_@main| () (_ BitVec 8) (read8 memory18 |%2_@main|))
;; %81 = sext i8 %80 to i32
(define-fun |%81_@main| () (_ BitVec 32) ((_ sign_extend 24) |%80_@main|))
;; %82 = icmp sle i32 97, %81
(define-fun |%82_@main| () Bool (bvsle (_ bv97 32) |%81_@main|))
;; br i1 %82, label %83, label %99
;; No backward arrows

;; BLOCK %83 with index 12 and rank = 10
;; Predecessors: %79
;; @main_block_12_entry_condition 
(define-fun @main_block_12_entry_condition () Bool
    (and @main_block_11_entry_condition |%82_@main|)
)
;; %84 = load i8* %2, align 1
(define-fun |%84_@main| () (_ BitVec 8) (read8 memory18 |%2_@main|))
;; %85 = sext i8 %84 to i32
(define-fun |%85_@main| () (_ BitVec 32) ((_ sign_extend 24) |%84_@main|))
;; %86 = icmp sle i32 %85, 122
(define-fun |%86_@main| () Bool (bvsle |%85_@main| (_ bv122 32)))
;; br i1 %86, label %87, label %99
;; No backward arrows

;; BLOCK %87 with index 13 and rank = 11
;; Predecessors: %83
;; @main_block_13_entry_condition 
(define-fun @main_block_13_entry_condition () Bool
    (and @main_block_12_entry_condition |%86_@main|)
)
;; %88 = load i8* %2, align 1
(define-fun |%88_@main| () (_ BitVec 8) (read8 memory18 |%2_@main|))
;; %89 = sext i8 %88 to i32
(define-fun |%89_@main| () (_ BitVec 32) ((_ sign_extend 24) |%88_@main|))
;; %90 = sub nsw i32 %89, 97
(define-fun |%90_@main| () (_ BitVec 32) (bvsub |%89_@main| (_ bv97 32)))
;; store i32 %90, i32* %offset.i1, align 4
(define-fun memory19 () Mem (write32 memory18 |%offset.i1_@main| |%90_@main|))
;; %91 = load i32* %offset.i1, align 4
(define-fun |%91_@main| () (_ BitVec 32) (read32 memory19 |%offset.i1_@main|))
;; %92 = add i32 %91, 13
(define-fun |%92_@main| () (_ BitVec 32) (bvadd |%91_@main| (_ bv13 32)))
;; %93 = urem i32 %92, 26
(define-fun |%93_@main| () (_ BitVec 32) (bvurem |%92_@main| (_ bv26 32)))
;; store i32 %93, i32* %offset.i1, align 4
(define-fun memory20 () Mem (write32 memory19 |%offset.i1_@main| |%93_@main|))
;; %94 = load i32* %offset.i1, align 4
(define-fun |%94_@main| () (_ BitVec 32) (read32 memory20 |%offset.i1_@main|))
;; %95 = trunc i32 %94 to i8
(define-fun |%95_@main| () (_ BitVec 8) ((_ extract 7 0) |%94_@main|))
;; %96 = sext i8 %95 to i32
(define-fun |%96_@main| () (_ BitVec 32) ((_ sign_extend 24) |%95_@main|))
;; %97 = add nsw i32 97, %96
(define-fun |%97_@main| () (_ BitVec 32) (bvadd (_ bv97 32) |%96_@main|))
;; %98 = trunc i32 %97 to i8
(define-fun |%98_@main| () (_ BitVec 8) ((_ extract 7 0) |%97_@main|))
;; store i8 %98, i8* %1
(define-fun memory21 () Mem (write8 memory20 |%1_@main| |%98_@main|))
;; br label %rot13_char.exit2
;; No backward arrows

;; BLOCK %99 with index 14 and rank = 11
;; Predecessors: %83 %79
;; @main_block_14_entry_condition 
(define-fun @main_block_14_entry_condition () Bool
    (or
        (and @main_block_12_entry_condition (not |%86_@main|))
        (and @main_block_11_entry_condition (not |%82_@main|))
    )
)
;; %100 = load i8* %2, align 1
(define-fun |%100_@main| () (_ BitVec 8) (read8 memory21 |%2_@main|))
;; store i8 %100, i8* %1
(define-fun memory22 () Mem (write8 memory21 |%1_@main| |%100_@main|))
;; br label %rot13_char.exit2
;; No backward arrows

;; BLOCK %rot13_char.exit2 with index 15 and rank = 12
;; Predecessors: %99 %87 %67
;; @main_block_15_entry_condition 
(define-fun @main_block_15_entry_condition () Bool
    (or
        @main_block_14_entry_condition
        @main_block_13_entry_condition
        @main_block_10_entry_condition
    )
)
;; %101 = load i8* %1
(define-fun |%101_@main| () (_ BitVec 8) (read8 memory22 |%1_@main|))
;; store i8 %101, i8* %z, align 1
(define-fun memory23 () Mem (write8 memory22 |%z_@main| |%101_@main|))
;; %102 = load i8* %x, align 1
(define-fun |%102_@main| () (_ BitVec 8) (read8 memory23 |%x_@main|))
;; %103 = sext i8 %102 to i32
(define-fun |%103_@main| () (_ BitVec 32) ((_ sign_extend 24) |%102_@main|))
;; %104 = load i8* %y, align 1
(define-fun |%104_@main| () (_ BitVec 8) (read8 memory23 |%y_@main|))
;; %105 = sext i8 %104 to i32
(define-fun |%105_@main| () (_ BitVec 32) ((_ sign_extend 24) |%104_@main|))
;; %106 = load i8* %z, align 1
(define-fun |%106_@main| () (_ BitVec 8) (read8 memory23 |%z_@main|))
;; %107 = sext i8 %106 to i32
(define-fun |%107_@main| () (_ BitVec 32) ((_ sign_extend 24) |%106_@main|))
;; %108 = load i8* %x, align 1
(define-fun |%108_@main| () (_ BitVec 8) (read8 memory23 |%x_@main|))
;; %109 = call signext i8 @lhs(i8 signext %108)
(declare-fun |%109_@main| () (_ BitVec 8))
;; %110 = sext i8 %109 to i32
(define-fun |%110_@main| () (_ BitVec 32) ((_ sign_extend 24) |%109_@main|))
;; %111 = load i8* %x, align 1
(define-fun |%111_@main| () (_ BitVec 8) (read8 memory23 |%x_@main|))
;; %112 = call signext i8 @rhs(i8 signext %111)
(declare-fun |%112_@main| () (_ BitVec 8))
;; %113 = sext i8 %112 to i32
(define-fun |%113_@main| () (_ BitVec 32) ((_ sign_extend 24) |%112_@main|))
;; %114 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([60 x i8]* @.str, i32 0, i32 0), i32 %103, i32 %105, i32 %107, i32 %110, i32 %113)
(declare-fun |%114_@main| () (_ BitVec 64))
;; br label %115
;; No backward arrows

;; BLOCK %115 with index 16 and rank = 13
;; Predecessors: %rot13_char.exit2 %0
;; @main_block_16_entry_condition 
(define-fun @main_block_16_entry_condition () Bool
    (or
        @main_block_15_entry_condition
        (and @main_block_0_entry_condition (not |%9_@main|))
    )
)
;; ret i32 0
;; No backward arrows


(define-fun @main_result () (_ BitVec 32) (_ bv0 32))

;; Function: |@printf|
;; (i8*, ...)


;; Function: |@lhs|
;; (i8 signext %x)
(declare-fun memory25 () Mem)
(define-fun rsp15 () (_ BitVec 64) (_ bv0 64))
(declare-fun |%x_@lhs| () (_ BitVec 8))

;; BLOCK %0 with index 0 and rank = 1
;; Predecessors:
;; @lhs_block_0_entry_condition 
(define-fun @lhs_block_0_entry_condition () Bool true)
;; %1 = alloca i8, align 1
(define-fun rsp16 () Address (bvsub rsp15 (_ bv1 64)))
(define-fun |%1_@lhs| () (_ BitVec 64) rsp16)
;; store i8 %x, i8* %1, align 1
(define-fun memory26 () Mem (write8 memory25 |%1_@lhs| |%x_@lhs|))
;; %2 = load i8* %1, align 1
(define-fun |%2_@lhs| () (_ BitVec 8) (read8 memory26 |%1_@lhs|))
;; ret i8 %2
;; No backward arrows


(define-fun @lhs_result () (_ BitVec 8) |%2_@lhs|)

;; Function: |@rhs|
;; (i8 signext %x)
(declare-fun memory27 () Mem)
(define-fun rsp17 () (_ BitVec 64) (_ bv0 64))
(declare-fun |%x_@rhs| () (_ BitVec 8))

;; BLOCK %0 with index 0 and rank = 1
;; Predecessors:
;; @rhs_block_0_entry_condition 
(define-fun @rhs_block_0_entry_condition () Bool true)
;; %1 = alloca i8, align 1
(define-fun rsp18 () Address (bvsub rsp17 (_ bv1 64)))
(define-fun |%1_@rhs| () (_ BitVec 64) rsp18)
;; %2 = alloca i8, align 1
(define-fun rsp19 () Address (bvsub rsp18 (_ bv1 64)))
(define-fun |%2_@rhs| () (_ BitVec 64) rsp19)
;; %offset.i1 = alloca i32, align 4
(define-fun rsp20 () Address (bvsub rsp19 (_ bv4 64)))
(define-fun |%offset.i1_@rhs| () (_ BitVec 64) rsp20)
;; %3 = alloca i8, align 1
(define-fun rsp21 () Address (bvsub rsp20 (_ bv1 64)))
(define-fun |%3_@rhs| () (_ BitVec 64) rsp21)
;; %4 = alloca i8, align 1
(define-fun rsp22 () Address (bvsub rsp21 (_ bv1 64)))
(define-fun |%4_@rhs| () (_ BitVec 64) rsp22)
;; %offset.i = alloca i32, align 4
(define-fun rsp23 () Address (bvsub rsp22 (_ bv4 64)))
(define-fun |%offset.i_@rhs| () (_ BitVec 64) rsp23)
;; %5 = alloca i8, align 1
(define-fun rsp24 () Address (bvsub rsp23 (_ bv1 64)))
(define-fun |%5_@rhs| () (_ BitVec 64) rsp24)
;; store i8 %x, i8* %5, align 1
(define-fun memory28 () Mem (write8 memory27 |%5_@rhs| |%x_@rhs|))
;; %6 = load i8* %5, align 1
(define-fun |%6_@rhs| () (_ BitVec 8) (read8 memory28 |%5_@rhs|))
;; store i8 %6, i8* %4, align 1
(define-fun memory29 () Mem (write8 memory28 |%4_@rhs| |%6_@rhs|))
;; %7 = load i8* %4, align 1
(define-fun |%7_@rhs| () (_ BitVec 8) (read8 memory29 |%4_@rhs|))
;; %8 = sext i8 %7 to i32
(define-fun |%8_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%7_@rhs|))
;; %9 = icmp sle i32 65, %8
(define-fun |%9_@rhs| () Bool (bvsle (_ bv65 32) |%8_@rhs|))
;; br i1 %9, label %10, label %26
;; No backward arrows

;; BLOCK %10 with index 1 and rank = 2
;; Predecessors: %0
;; @rhs_block_1_entry_condition 
(define-fun @rhs_block_1_entry_condition () Bool
    (and @rhs_block_0_entry_condition |%9_@rhs|)
)
;; %11 = load i8* %4, align 1
(define-fun |%11_@rhs| () (_ BitVec 8) (read8 memory29 |%4_@rhs|))
;; %12 = sext i8 %11 to i32
(define-fun |%12_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%11_@rhs|))
;; %13 = icmp sle i32 %12, 90
(define-fun |%13_@rhs| () Bool (bvsle |%12_@rhs| (_ bv90 32)))
;; br i1 %13, label %14, label %26
;; No backward arrows

;; BLOCK %14 with index 2 and rank = 3
;; Predecessors: %10
;; @rhs_block_2_entry_condition 
(define-fun @rhs_block_2_entry_condition () Bool
    (and @rhs_block_1_entry_condition |%13_@rhs|)
)
;; %15 = load i8* %4, align 1
(define-fun |%15_@rhs| () (_ BitVec 8) (read8 memory29 |%4_@rhs|))
;; %16 = sext i8 %15 to i32
(define-fun |%16_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%15_@rhs|))
;; %17 = sub nsw i32 %16, 65
(define-fun |%17_@rhs| () (_ BitVec 32) (bvsub |%16_@rhs| (_ bv65 32)))
;; store i32 %17, i32* %offset.i, align 4
(define-fun memory30 () Mem (write32 memory29 |%offset.i_@rhs| |%17_@rhs|))
;; %18 = load i32* %offset.i, align 4
(define-fun |%18_@rhs| () (_ BitVec 32) (read32 memory30 |%offset.i_@rhs|))
;; %19 = add i32 %18, 13
(define-fun |%19_@rhs| () (_ BitVec 32) (bvadd |%18_@rhs| (_ bv13 32)))
;; %20 = urem i32 %19, 26
(define-fun |%20_@rhs| () (_ BitVec 32) (bvurem |%19_@rhs| (_ bv26 32)))
;; store i32 %20, i32* %offset.i, align 4
(define-fun memory31 () Mem (write32 memory30 |%offset.i_@rhs| |%20_@rhs|))
;; %21 = load i32* %offset.i, align 4
(define-fun |%21_@rhs| () (_ BitVec 32) (read32 memory31 |%offset.i_@rhs|))
;; %22 = trunc i32 %21 to i8
(define-fun |%22_@rhs| () (_ BitVec 8) ((_ extract 7 0) |%21_@rhs|))
;; %23 = sext i8 %22 to i32
(define-fun |%23_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%22_@rhs|))
;; %24 = add nsw i32 65, %23
(define-fun |%24_@rhs| () (_ BitVec 32) (bvadd (_ bv65 32) |%23_@rhs|))
;; %25 = trunc i32 %24 to i8
(define-fun |%25_@rhs| () (_ BitVec 8) ((_ extract 7 0) |%24_@rhs|))
;; store i8 %25, i8* %3
(define-fun memory32 () Mem (write8 memory31 |%3_@rhs| |%25_@rhs|))
;; br label %rot13_char.exit
;; No backward arrows

;; BLOCK %26 with index 3 and rank = 3
;; Predecessors: %10 %0
;; @rhs_block_3_entry_condition 
(define-fun @rhs_block_3_entry_condition () Bool
    (or
        (and @rhs_block_1_entry_condition (not |%13_@rhs|))
        (and @rhs_block_0_entry_condition (not |%9_@rhs|))
    )
)
;; %27 = load i8* %4, align 1
(define-fun |%27_@rhs| () (_ BitVec 8) (read8 memory32 |%4_@rhs|))
;; %28 = sext i8 %27 to i32
(define-fun |%28_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%27_@rhs|))
;; %29 = icmp sle i32 97, %28
(define-fun |%29_@rhs| () Bool (bvsle (_ bv97 32) |%28_@rhs|))
;; br i1 %29, label %30, label %46
;; No backward arrows

;; BLOCK %30 with index 4 and rank = 4
;; Predecessors: %26
;; @rhs_block_4_entry_condition 
(define-fun @rhs_block_4_entry_condition () Bool
    (and @rhs_block_3_entry_condition |%29_@rhs|)
)
;; %31 = load i8* %4, align 1
(define-fun |%31_@rhs| () (_ BitVec 8) (read8 memory32 |%4_@rhs|))
;; %32 = sext i8 %31 to i32
(define-fun |%32_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%31_@rhs|))
;; %33 = icmp sle i32 %32, 122
(define-fun |%33_@rhs| () Bool (bvsle |%32_@rhs| (_ bv122 32)))
;; br i1 %33, label %34, label %46
;; No backward arrows

;; BLOCK %34 with index 5 and rank = 5
;; Predecessors: %30
;; @rhs_block_5_entry_condition 
(define-fun @rhs_block_5_entry_condition () Bool
    (and @rhs_block_4_entry_condition |%33_@rhs|)
)
;; %35 = load i8* %4, align 1
(define-fun |%35_@rhs| () (_ BitVec 8) (read8 memory32 |%4_@rhs|))
;; %36 = sext i8 %35 to i32
(define-fun |%36_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%35_@rhs|))
;; %37 = sub nsw i32 %36, 97
(define-fun |%37_@rhs| () (_ BitVec 32) (bvsub |%36_@rhs| (_ bv97 32)))
;; store i32 %37, i32* %offset.i, align 4
(define-fun memory33 () Mem (write32 memory32 |%offset.i_@rhs| |%37_@rhs|))
;; %38 = load i32* %offset.i, align 4
(define-fun |%38_@rhs| () (_ BitVec 32) (read32 memory33 |%offset.i_@rhs|))
;; %39 = add i32 %38, 13
(define-fun |%39_@rhs| () (_ BitVec 32) (bvadd |%38_@rhs| (_ bv13 32)))
;; %40 = urem i32 %39, 26
(define-fun |%40_@rhs| () (_ BitVec 32) (bvurem |%39_@rhs| (_ bv26 32)))
;; store i32 %40, i32* %offset.i, align 4
(define-fun memory34 () Mem (write32 memory33 |%offset.i_@rhs| |%40_@rhs|))
;; %41 = load i32* %offset.i, align 4
(define-fun |%41_@rhs| () (_ BitVec 32) (read32 memory34 |%offset.i_@rhs|))
;; %42 = trunc i32 %41 to i8
(define-fun |%42_@rhs| () (_ BitVec 8) ((_ extract 7 0) |%41_@rhs|))
;; %43 = sext i8 %42 to i32
(define-fun |%43_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%42_@rhs|))
;; %44 = add nsw i32 97, %43
(define-fun |%44_@rhs| () (_ BitVec 32) (bvadd (_ bv97 32) |%43_@rhs|))
;; %45 = trunc i32 %44 to i8
(define-fun |%45_@rhs| () (_ BitVec 8) ((_ extract 7 0) |%44_@rhs|))
;; store i8 %45, i8* %3
(define-fun memory35 () Mem (write8 memory34 |%3_@rhs| |%45_@rhs|))
;; br label %rot13_char.exit
;; No backward arrows

;; BLOCK %46 with index 6 and rank = 5
;; Predecessors: %30 %26
;; @rhs_block_6_entry_condition 
(define-fun @rhs_block_6_entry_condition () Bool
    (or
        (and @rhs_block_4_entry_condition (not |%33_@rhs|))
        (and @rhs_block_3_entry_condition (not |%29_@rhs|))
    )
)
;; %47 = load i8* %4, align 1
(define-fun |%47_@rhs| () (_ BitVec 8) (read8 memory35 |%4_@rhs|))
;; store i8 %47, i8* %3
(define-fun memory36 () Mem (write8 memory35 |%3_@rhs| |%47_@rhs|))
;; br label %rot13_char.exit
;; No backward arrows

;; BLOCK %rot13_char.exit with index 7 and rank = 6
;; Predecessors: %46 %34 %14
;; @rhs_block_7_entry_condition 
(define-fun @rhs_block_7_entry_condition () Bool
    (or
        @rhs_block_6_entry_condition
        @rhs_block_5_entry_condition
        @rhs_block_2_entry_condition
    )
)
;; %48 = load i8* %3
(define-fun |%48_@rhs| () (_ BitVec 8) (read8 memory36 |%3_@rhs|))
;; store i8 %48, i8* %2, align 1
(define-fun memory37 () Mem (write8 memory36 |%2_@rhs| |%48_@rhs|))
;; %49 = load i8* %2, align 1
(define-fun |%49_@rhs| () (_ BitVec 8) (read8 memory37 |%2_@rhs|))
;; %50 = sext i8 %49 to i32
(define-fun |%50_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%49_@rhs|))
;; %51 = icmp sle i32 65, %50
(define-fun |%51_@rhs| () Bool (bvsle (_ bv65 32) |%50_@rhs|))
;; br i1 %51, label %52, label %68
;; No backward arrows

;; BLOCK %52 with index 8 and rank = 7
;; Predecessors: %rot13_char.exit
;; @rhs_block_8_entry_condition 
(define-fun @rhs_block_8_entry_condition () Bool
    (and @rhs_block_7_entry_condition |%51_@rhs|)
)
;; %53 = load i8* %2, align 1
(define-fun |%53_@rhs| () (_ BitVec 8) (read8 memory37 |%2_@rhs|))
;; %54 = sext i8 %53 to i32
(define-fun |%54_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%53_@rhs|))
;; %55 = icmp sle i32 %54, 90
(define-fun |%55_@rhs| () Bool (bvsle |%54_@rhs| (_ bv90 32)))
;; br i1 %55, label %56, label %68
;; No backward arrows

;; BLOCK %56 with index 9 and rank = 8
;; Predecessors: %52
;; @rhs_block_9_entry_condition 
(define-fun @rhs_block_9_entry_condition () Bool
    (and @rhs_block_8_entry_condition |%55_@rhs|)
)
;; %57 = load i8* %2, align 1
(define-fun |%57_@rhs| () (_ BitVec 8) (read8 memory37 |%2_@rhs|))
;; %58 = sext i8 %57 to i32
(define-fun |%58_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%57_@rhs|))
;; %59 = sub nsw i32 %58, 65
(define-fun |%59_@rhs| () (_ BitVec 32) (bvsub |%58_@rhs| (_ bv65 32)))
;; store i32 %59, i32* %offset.i1, align 4
(define-fun memory38 () Mem (write32 memory37 |%offset.i1_@rhs| |%59_@rhs|))
;; %60 = load i32* %offset.i1, align 4
(define-fun |%60_@rhs| () (_ BitVec 32) (read32 memory38 |%offset.i1_@rhs|))
;; %61 = add i32 %60, 13
(define-fun |%61_@rhs| () (_ BitVec 32) (bvadd |%60_@rhs| (_ bv13 32)))
;; %62 = urem i32 %61, 26
(define-fun |%62_@rhs| () (_ BitVec 32) (bvurem |%61_@rhs| (_ bv26 32)))
;; store i32 %62, i32* %offset.i1, align 4
(define-fun memory39 () Mem (write32 memory38 |%offset.i1_@rhs| |%62_@rhs|))
;; %63 = load i32* %offset.i1, align 4
(define-fun |%63_@rhs| () (_ BitVec 32) (read32 memory39 |%offset.i1_@rhs|))
;; %64 = trunc i32 %63 to i8
(define-fun |%64_@rhs| () (_ BitVec 8) ((_ extract 7 0) |%63_@rhs|))
;; %65 = sext i8 %64 to i32
(define-fun |%65_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%64_@rhs|))
;; %66 = add nsw i32 65, %65
(define-fun |%66_@rhs| () (_ BitVec 32) (bvadd (_ bv65 32) |%65_@rhs|))
;; %67 = trunc i32 %66 to i8
(define-fun |%67_@rhs| () (_ BitVec 8) ((_ extract 7 0) |%66_@rhs|))
;; store i8 %67, i8* %1
(define-fun memory40 () Mem (write8 memory39 |%1_@rhs| |%67_@rhs|))
;; br label %rot13_char.exit2
;; No backward arrows

;; BLOCK %68 with index 10 and rank = 8
;; Predecessors: %52 %rot13_char.exit
;; @rhs_block_10_entry_condition 
(define-fun @rhs_block_10_entry_condition () Bool
    (or
        (and @rhs_block_8_entry_condition (not |%55_@rhs|))
        (and @rhs_block_7_entry_condition (not |%51_@rhs|))
    )
)
;; %69 = load i8* %2, align 1
(define-fun |%69_@rhs| () (_ BitVec 8) (read8 memory40 |%2_@rhs|))
;; %70 = sext i8 %69 to i32
(define-fun |%70_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%69_@rhs|))
;; %71 = icmp sle i32 97, %70
(define-fun |%71_@rhs| () Bool (bvsle (_ bv97 32) |%70_@rhs|))
;; br i1 %71, label %72, label %88
;; No backward arrows

;; BLOCK %72 with index 11 and rank = 9
;; Predecessors: %68
;; @rhs_block_11_entry_condition 
(define-fun @rhs_block_11_entry_condition () Bool
    (and @rhs_block_10_entry_condition |%71_@rhs|)
)
;; %73 = load i8* %2, align 1
(define-fun |%73_@rhs| () (_ BitVec 8) (read8 memory40 |%2_@rhs|))
;; %74 = sext i8 %73 to i32
(define-fun |%74_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%73_@rhs|))
;; %75 = icmp sle i32 %74, 122
(define-fun |%75_@rhs| () Bool (bvsle |%74_@rhs| (_ bv122 32)))
;; br i1 %75, label %76, label %88
;; No backward arrows

;; BLOCK %76 with index 12 and rank = 10
;; Predecessors: %72
;; @rhs_block_12_entry_condition 
(define-fun @rhs_block_12_entry_condition () Bool
    (and @rhs_block_11_entry_condition |%75_@rhs|)
)
;; %77 = load i8* %2, align 1
(define-fun |%77_@rhs| () (_ BitVec 8) (read8 memory40 |%2_@rhs|))
;; %78 = sext i8 %77 to i32
(define-fun |%78_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%77_@rhs|))
;; %79 = sub nsw i32 %78, 97
(define-fun |%79_@rhs| () (_ BitVec 32) (bvsub |%78_@rhs| (_ bv97 32)))
;; store i32 %79, i32* %offset.i1, align 4
(define-fun memory41 () Mem (write32 memory40 |%offset.i1_@rhs| |%79_@rhs|))
;; %80 = load i32* %offset.i1, align 4
(define-fun |%80_@rhs| () (_ BitVec 32) (read32 memory41 |%offset.i1_@rhs|))
;; %81 = add i32 %80, 13
(define-fun |%81_@rhs| () (_ BitVec 32) (bvadd |%80_@rhs| (_ bv13 32)))
;; %82 = urem i32 %81, 26
(define-fun |%82_@rhs| () (_ BitVec 32) (bvurem |%81_@rhs| (_ bv26 32)))
;; store i32 %82, i32* %offset.i1, align 4
(define-fun memory42 () Mem (write32 memory41 |%offset.i1_@rhs| |%82_@rhs|))
;; %83 = load i32* %offset.i1, align 4
(define-fun |%83_@rhs| () (_ BitVec 32) (read32 memory42 |%offset.i1_@rhs|))
;; %84 = trunc i32 %83 to i8
(define-fun |%84_@rhs| () (_ BitVec 8) ((_ extract 7 0) |%83_@rhs|))
;; %85 = sext i8 %84 to i32
(define-fun |%85_@rhs| () (_ BitVec 32) ((_ sign_extend 24) |%84_@rhs|))
;; %86 = add nsw i32 97, %85
(define-fun |%86_@rhs| () (_ BitVec 32) (bvadd (_ bv97 32) |%85_@rhs|))
;; %87 = trunc i32 %86 to i8
(define-fun |%87_@rhs| () (_ BitVec 8) ((_ extract 7 0) |%86_@rhs|))
;; store i8 %87, i8* %1
(define-fun memory43 () Mem (write8 memory42 |%1_@rhs| |%87_@rhs|))
;; br label %rot13_char.exit2
;; No backward arrows

;; BLOCK %88 with index 13 and rank = 10
;; Predecessors: %72 %68
;; @rhs_block_13_entry_condition 
(define-fun @rhs_block_13_entry_condition () Bool
    (or
        (and @rhs_block_11_entry_condition (not |%75_@rhs|))
        (and @rhs_block_10_entry_condition (not |%71_@rhs|))
    )
)
;; %89 = load i8* %2, align 1
(define-fun |%89_@rhs| () (_ BitVec 8) (read8 memory43 |%2_@rhs|))
;; store i8 %89, i8* %1
(define-fun memory44 () Mem (write8 memory43 |%1_@rhs| |%89_@rhs|))
;; br label %rot13_char.exit2
;; No backward arrows

;; BLOCK %rot13_char.exit2 with index 14 and rank = 11
;; Predecessors: %88 %76 %56
;; @rhs_block_14_entry_condition 
(define-fun @rhs_block_14_entry_condition () Bool
    (or
        @rhs_block_13_entry_condition
        @rhs_block_12_entry_condition
        @rhs_block_9_entry_condition
    )
)
;; %90 = load i8* %1
(define-fun |%90_@rhs| () (_ BitVec 8) (read8 memory44 |%1_@rhs|))
;; ret i8 %90
;; No backward arrows


(define-fun @rhs_result () (_ BitVec 8) |%90_@rhs|)

(assert (and (= |%x_@rhs| |%x_@lhs|) (not (= @rhs_result @lhs_result))))

(check-sat)


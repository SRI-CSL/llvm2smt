(*
 *
 * For printing the smt prelude for each cu.
 *
 *)

open Printf

(*
 * The prelude requirements object. This specifies what we need in our prelude.
 * It is filled in while translating the cu.
 * It to limit the prelude definitions to those that are necessary.
*)

type prelude = {
  address_width: int;
  mutable vundef: (int * int) list;
  mutable vmake:  (int * int) list;
  mutable vzero:  (int * int) list;
  mutable vbinop: (int * int) list;  (* could include the actual operator *)
  mutable trunc:  (int * int) list;
  mutable vtrunc: (int * int * int) list;
  mutable zext:  (int * int) list;
  mutable vzext: (int * int * int) list;
  mutable sext:  (int * int) list;
  mutable vsext: (int * int * int) list;
  mutable int_ptr:  (int * int) list;
  mutable vint_ptr: (int * int * int) list;
  mutable cast:   bool;
  mutable vector_width: int list;   (* the bit widths of the beasts found in vectors *)
  mutable vector_length: int list;  (* the LOGARITHMS of the lengths of the vectors *)
}


let compare2 (x0, y0) (x1, y1) =
  let xcmp = compare x0 x1 in
    if xcmp <> 0 then xcmp else compare y0 y1

let compare3 (x0, y0, z0) (x1, y1, z1) =
  let xcmp = compare x0 x1 in
    if xcmp <> 0 then xcmp else compare2 (y0, z0) (y1, z1)


let vector_width_add preq n =
  let l = preq.vector_width in
    if not (List.mem n l) then preq.vector_width <- n :: l

let vector_length_add preq n =
  let l = preq.vector_length in
    if not (List.mem n l) then preq.vector_length <- n :: l


let vector_width_fetch preq  = List.sort compare preq.vector_width

let vector_length_fetch preq  = List.sort compare preq.vector_length
      
let make_prelude aw =
  let p = { address_width = aw;
	    vundef = []; vmake = []; vzero = []; vbinop = [];
	    trunc = []; vtrunc = [];
	    zext = []; vzext = [];
	    sext = []; vsext = [];
	    int_ptr = []; vint_ptr = [];
	    cast = false; vector_width = [];   vector_length = []; } in
    p

let cast_add preq =
  if not preq.cast
  then
    begin
      preq.cast <- true;
      List.iter (fun w -> vector_width_add preq w) [32; 64];
      List.iter (fun l -> vector_length_add preq l) [1; 2];
    end
      
      
let vundef_add preq x =
  let l = preq.vundef in
    if not (List.mem x l)
    then
      let (length, width) = x in
	vector_width_add preq width;
	vector_length_add preq length;
	preq.vundef <- x :: l

let vundef_fetch preq = List.sort compare2 preq.vundef
    
let vmake_add preq x =
  let l = preq.vmake in
    if not (List.mem x l)
    then
      let (length, width) = x in
	vector_width_add preq width;
	vector_length_add preq length;
	preq.vmake <- x :: l

let vmake_fetch preq = List.sort compare2 preq.vmake
    
let vzero_add preq x =
  let l = preq.vzero in
    if not (List.mem x l)
    then
      let (length, width) = x in
	vector_width_add preq width;
	vector_length_add preq length;
	preq.vzero <- x :: l

let vzero_fetch preq = List.sort compare2 preq.vzero
    
let vbinop_add preq x =
  let l = preq.vbinop in
    if not (List.mem x l)
    then
      let (length, width) = x in
	vector_width_add preq width;
	vector_length_add preq length;
	preq.vbinop <- x :: l

let vbinop_fetch preq = List.sort compare2 preq.vbinop
    
let trunc_add preq x =
  let l = preq.trunc in
    if not (List.mem x l) then preq.trunc <- x :: l

let trunc_fetch preq = List.sort compare2 preq.trunc
    
let vtrunc_add preq x =
  let l = preq.vtrunc in
    if not (List.mem x l)
    then
      let (length, n, width) = x in
	vector_width_add preq n;
	vector_width_add preq width;
	vector_length_add preq length;
	trunc_add preq (n, width);
	preq.vtrunc <- x :: l

let vtrunc_fetch preq = List.sort compare3 preq.vtrunc

let zext_add preq x =
  let l = preq.zext in
    if not (List.mem x l) then preq.zext <- x :: l

let zext_fetch preq = List.sort compare2 preq.zext
    
let vzext_add preq x =
  let l = preq.vzext in
    if not (List.mem x l)
    then
      let (length, n, width) = x in
	vector_width_add preq n;
	vector_width_add preq width;
	vector_length_add preq length;
	zext_add preq (n, width);
	preq.vzext <- x :: l

let vzext_fetch preq = List.sort compare3 preq.vzext

let sext_add preq x =
  let l = preq.sext in
    if not (List.mem x l) then preq.sext <- x :: l

let sext_fetch preq = List.sort compare2 preq.sext
    
let vsext_add preq x =
  let l = preq.vsext in
    if not (List.mem x l)
    then
      let (length, n, width) = x in
	vector_width_add preq n;
	vector_width_add preq width;
	vector_length_add preq length;
	sext_add preq (n, width);
	preq.vsext <- x :: l

let vsext_fetch preq = List.sort compare3 preq.vsext

let int_ptr_add preq x =
  let l = preq.int_ptr in
    if not (List.mem x l) then preq.int_ptr <- x :: l

let int_ptr_fetch preq = List.sort compare2 preq.int_ptr
    
let vint_ptr_add preq x =
  let l = preq.vint_ptr in
    if not (List.mem x l)
    then
      let (length, n, width) = x in
	vector_width_add preq n;
	vector_width_add preq width;
	vector_length_add preq length;
	int_ptr_add preq (n, width);
	preq.vint_ptr <- x :: l

let vint_ptr_fetch preq = List.sort compare3 preq.vint_ptr

let dump_prelude prelude =
  let dump_aux1 string list =
    let n = (List.length list) in
      if n <> 0
      then
	begin
	  Printf.eprintf "%s[%d] = " string n;
	  List.iter (fun x ->  Printf.eprintf "%d " x) list;
	  Printf.eprintf "\n"
	end
      else
	Printf.eprintf "%s: 0.\n" string  
  in
  let dump_aux2 string list =
    let n = (List.length list) in
      if n <> 0
      then
	begin
	  Printf.eprintf "%s[%d] = " string n;
	  List.iter (fun (x, y) ->  Printf.eprintf "(%d, %d) " x y) list;
	  Printf.eprintf "\n"
	end
      else
	Printf.eprintf "%s: 0.\n" string  
  in
  let dump_aux3 string list =
    let n = (List.length list) in
      if n <> 0
      then
	begin
	  Printf.eprintf "%s[%d] = " string n;
	  List.iter (fun (x, y, z) ->  Printf.eprintf "(%d, %d, %d) " x y z) list;
	  Printf.eprintf "\n"
	end
      else
	Printf.eprintf "%s: 0.\n" string  
  in
    dump_aux1 "vector_length" (vector_length_fetch prelude);
    dump_aux1 "vector_width" (vector_width_fetch prelude);
    dump_aux2 "vundef" (vundef_fetch prelude);
    dump_aux2 "vmake" (vmake_fetch prelude);
    dump_aux2 "vzero" (vzero_fetch prelude);
    dump_aux2 "vbinop" (vbinop_fetch prelude);
    dump_aux2 "trunc" (trunc_fetch prelude);
    dump_aux3 "vtrunc" (vtrunc_fetch prelude);
    dump_aux2 "zext" (zext_fetch prelude);
    dump_aux3 "vzext" (vzext_fetch prelude);
    dump_aux2 "sext" (sext_fetch prelude);
    dump_aux3 "vsext" (vsext_fetch prelude);
    dump_aux2 "int_ptr" (int_ptr_fetch prelude);
    dump_aux3 "vint_ptr" (vint_ptr_fetch prelude)
      
      
let header =
  ";;
;; Generated by llvm2smt: https://github.com/SRI-CSL/llvm2smt
;; 
;; Copyright SRI International 2015
;;
;;\n"

let addr_type aw = "(_ BitVec " ^ (string_of_int aw) ^ ")"

let byte_type = "(_ BitVec 8)"

let i64_type = "(_ BitVec 64)"

let i32_type = "(_ BitVec 32)"

let i16_type = "(_ BitVec 16)"

let mem_type aw = "(Array " ^ (addr_type  aw)^ " " ^ byte_type ^")"

let zero_address aw = "(_ bv0 " ^ (string_of_int aw) ^ ")"

let types = "
(define-sort I8 () (_ BitVec 8))
(define-sort I16 () (_ BitVec 16))
(define-sort I32 () (_ BitVec 32))
(define-sort I64 () (_ BitVec 64))
(define-sort I128 () (_ BitVec 128))
"

let constants aw = 
  let b = Buffer.create 100 in
    bprintf b 
"
;;
;;constants
;;
(define-fun zero  () Address (_ bv0 %d))
(define-fun one   () Address (_ bv1 %d))
(define-fun two   () Address (_ bv2 %d))
(define-fun three () Address (_ bv3 %d))
(define-fun four  () Address (_ bv4 %d))
(define-fun five  () Address (_ bv5 %d))
(define-fun six   () Address (_ bv6 %d))
(define-fun seven () Address (_ bv7 %d))
(define-fun eight () Address (_ bv8 %d))
" aw aw aw aw aw aw aw aw aw;
    Buffer.contents b

let writes = "
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
"


let reads = "
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
"


(*
 * For each base function: bvadd, bvmul, etc.
 * we have a variant that operates element-wise on vectors.
 * In SMT2, we must define a special version for each
 * vector size and element type.
 *
 * NOTE: We treat bitvectors of size 1 differently.
 * (i.e., Bool instead of (_ BitVec 1))
 *)

let vector_type b len width =
  bprintf b
    "
;;
;; Vectors of (2^%d) int%d elements
;;
(define-sort vector_%d_%d () (Array (_ BitVec %d) (_ BitVec %d)))

(declare-fun vundef_%d_%d () vector_%d_%d)

"
    len width len width len width len width len width 

let vector_bool_1 b =
  bprintf b
    "
;; Special case where we use Bool rather than bitvectors of size 1 

(define-sort vector_1_1 () (Array (_ BitVec 1) Bool))

(declare-fun vundef_1_1 () vector_1_1)

(define-fun vmake_1_1 ((x0 Bool) (x1 Bool)) vector_1_1
   (store (store vundef_1_1 #b0 x0) #b1 x1))
\n"

let vector_bool_2 b =
  bprintf b
    "
;; Special case where we use Bool rather than bitvectors of size 1 

(define-sort vector_2_1 () (Array (_ BitVec 2) Bool))

(declare-fun vundef_2_1 () vector_2_1)

(define-fun vmake_2_1 
  ((x0 Bool) (x1 Bool) (x2 Bool) (x3 Bool)) vector_2_1
   (store (store (store (store vundef_2_1 #b00 x0) #b01 x1) #b10 x2) #b11 x3))
\n"
    
let vector_bool_3 b =
  bprintf b
    "
;; Special case where we use Bool rather than bitvectors of size 1 

(define-sort vector_3_1 () (Array (_ BitVec 3) Bool))

(declare-fun vundef_3_1 () vector_3_1)

(define-fun vmake_3_1 
  ((x0 Bool) (x1 Bool) (x2 Bool) (x3 Bool) (x4 Bool) (x5 Bool) (x6 Bool) (x7 Bool)) vector_3_1
   (store (store (store (store (store (store (store (store vundef_3_1 #b000 x0) #b001 x1) #b010 x2) #b011 x3) #b100 x4) #b101 x5) #b110 x6) #b111 x7))

"

let vector_bool b logv =
  if logv = 1
  then
    vector_bool_1 b 
  else if logv = 2
  then
    vector_bool_2 b
  else if logv = 3
  then
    vector_bool_3 b
  else
    failwith("vector_bool Ooops: need to write some prelude code for vectors longer than 2^3.")

    
let vector_casts = "


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

\n"

let vutils_1 b w =
  bprintf b
    "
;;
;; Vectors of (2^1) i.e. two int%d elements
;;
(define-fun vmake_1_%d ((x0 (_ BitVec %d)) (x1 (_ BitVec %d))) vector_1_%d
   (store (store vundef_1_%d #b0 x0) #b1 x1))

;; zero vectors with int%d elements

 (define-fun vzero_1_%d () vector_1_%d (vmake_1_%d (_ bv0 %d) (_ bv0 %d)))
\n"
    w w w w  w w w w  w w w w 
    

let vutils_2 b w =
  bprintf b
    ";;
;; Vectors of (2^2) i.e. four int%d elements
;;
(define-fun vmake_2_%d 
  ((x0 (_ BitVec %d)) (x1 (_ BitVec %d)) (x2 (_ BitVec %d)) (x3 (_ BitVec %d))) vector_2_%d
   (store (store (store (store vundef_2_%d #b00 x0) #b01 x1) #b10 x2) #b11 x3))

 (define-fun vzero_2_%d () vector_2_%d (vmake_2_%d (_ bv0 %d) (_ bv0 %d) (_ bv0 %d) (_ bv0 %d)))
\n"
    w w w w  w w w w  w w w w  w w w 

let vutils_3 b w =
  bprintf b
    ";;
;; Vectors of (2^3) i.e. eight int%d elements
;;
(define-fun vmake_3_%d 
  ((x0 (_ BitVec %d)) (x1 (_ BitVec %d)) (x2 (_ BitVec %d)) (x3 (_ BitVec %d))(x4 (_ BitVec %d)) (x5 (_ BitVec %d)) (x6 (_ BitVec %d)) (x7 (_ BitVec %d))) vector_3_%d
   (store (store (store (store (store (store (store (store vundef_3_%d #b000 x0) #b001 x1) #b010 x2) #b011 x3) #b100 x4) #b101 x5) #b110 x6) #b111 x7))

 (define-fun vzero_3_%d () vector_3_%d (vmake_3_%d (_ bv0 %d) (_ bv0 %d) (_ bv0 %d) (_ bv0 %d) (_ bv0 %d) (_ bv0 %d) (_ bv0 %d) (_ bv0 %d)))
\n"
    w w w w  w w w w  w w w w  w w w w  w w w w  w w w

let vutils b logv w =
  if logv = 1
  then
    vutils_1 b w
  else if logv = 2
  then
    vutils_2 b w
  else if logv = 3
  then
    vutils_3 b w
  else failwith("vutils Ooops: need to write some prelude code for vectors longer than 2^3.")

let binops = [
  "bvadd";
  "bvsub";
  "bvmul";
  "bvshl";
  "bvsdiv";
  "bvudiv";
  "bvlshr";
  "bvashr";
  "bvurem";
  "bvsrem";
  "bvand";
  "bvor";
  "bvxor"]

let bpr_op_1_w b binop w = 
  bprintf b 
    "
(define-fun v%s_1_%d ((x vector_1_%d) (y vector_1_%d)) vector_1_%d
   (let ((z0 (%s (select x #b0) (select y #b0)))
         (z1 (%s (select x #b1) (select y #b1))))
      (vmake_1_%d z0 z1)))
"
    binop w w w w binop binop w

    
let bpr_op_2_w b binop w = 
  bprintf b 
    "
 (define-fun v%s_2_%d ((x vector_2_%d) (y vector_2_%d)) vector_2_%d
   (let ((z0 (%s (select x #b00) (select y #b00)))
         (z1 (%s (select x #b01) (select y #b01)))
         (z2 (%s (select x #b10) (select y #b10)))
         (z3 (%s (select x #b11) (select y #b11))))
      (vmake_2_%d z0 z1 z2 z3)))
\n"
     binop w w w w binop binop binop binop w

let bpr_op_3_w b binop w = 
  bprintf b 
    "
 (define-fun v%s_3_%d ((x vector_3_%d) (y vector_3_%d)) vector_3_%d
   (let (
         (z0 (%s (select x #b000) (select y #b000)))
         (z1 (%s (select x #b001) (select y #b001)))
         (z2 (%s (select x #b010) (select y #b010)))
         (z3 (%s (select x #b011) (select y #b011)))
         (z4 (%s (select x #b100) (select y #b100)))
         (z5 (%s (select x #b101) (select y #b101)))
         (z6 (%s (select x #b110) (select y #b110)))
         (z7 (%s (select x #b111) (select y #b111)))
         )
      (vmake_3_%d z0 z1 z2 z3 z4 z5 z6 z7)))
\n"
    binop w w w w binop binop binop binop binop binop binop binop w


let vbinop b logv w =
  if logv = 1
  then
    List.iter (fun op -> (bpr_op_1_w b op w)) binops
  else if logv = 2
  then
    List.iter (fun op -> (bpr_op_2_w b op w)) binops
  else if logv = 3
  then
    List.iter (fun op -> (bpr_op_3_w b op w)) binops
  else failwith("vbinop Ooops: need to write some prelude code for binops of vectors longer than 2^3.")

    

let trunc b n w =
  if n >= w
  then
    failwith("trunc: target size should bigger than source size!")
  else
      if n = 1
      then
	bprintf b 
	  "
  (define-fun trunc_1_%d ((x (_ BitVec %d))) Bool (ite (= ((_ extract 0 0) x) (_ bv1 1)) true false))
\n"	
	  w w 
      else
	bprintf b 
	"
  (define-fun trunc_%d_%d ((x (_ BitVec %d))) (_ BitVec %d) ((_ extract %d 0) x))
\n"
	n w w n (n - 1)
	
let zext b n w =
  if n >= w
  then
    failwith("zext: target size should bigger than source size!")
  else
    if n = 1
    then
      bprintf b 
	"
  (define-fun zext_1_%d ((x Bool)) (_ BitVec %d) (ite x (_ bv1 %d) (_ bv0 %d)))
\n"	
	w w w w
    else
      bprintf b 
	"
  (define-fun zext_%d_%d ((x (_ BitVec %d))) (_ BitVec %d) ((_ zero_extend %d) x))
\n"
	n w n w (w - n)
	
let sext b n w =
  if n >= w
  then
    failwith("sext: target size should bigger than source size!")
  else
    if n = 1
    then
      bprintf b 
	"
  (define-fun sext_1_%d ((x Bool)) (_ BitVec %d) (ite x (bvneg (_ bv1 %d)) (_ bv0 %d)))
\n"	
	w w w w
    else
      bprintf b 
	"
  (define-fun sext_%d_%d ((x (_ BitVec %d))) (_ BitVec %d) ((_ sign_extend %d) x))
\n"
	n w n w (w - n)

let int_ptr b n w =
  if n == w
  then
    bprintf b 
      "
  (define-fun int_ptr_%d_%d ((x (_ BitVec %d))) (_ BitVec %d) x)
\n"
      n w n w  
  else
    if n > w
    then
      bprintf b 
	"
  (define-fun int_ptr_%d_%d ((x (_ BitVec %d))) (_ BitVec %d) ((_ zero_extend %d) x))
\n"
	w n w n (n - w)
    else
      bprintf b 
	"
  (define-fun int_ptr_%d_%d ((x (_ BitVec %d))) (_ BitVec %d) ((_ extract %d) x))
\n"
	w n w n (n - 1)


	
(* N.B. if we do it like this, then we need to be careful with the meaning of n and w; n < w
 * means that n is sometimes the argument size and sometimes the target size.
 *)
let vconversion_1 b conv_op n w  =
  bprintf b 
    "
(define-fun v%s_1_%d_%d ((x vector_1_%d)) vector_1_%d
   (let ((z0 (%s_%d_%d (select x #b0)))
         (z1 (%s_%d_%d (select x #b1))))
      (vmake_1_%d z0 z1)))
\n"
    conv_op n w w n conv_op n w conv_op n w n
      
      
let vconversion_2 b conv_op n w  =
  bprintf b 
    "
(define-fun v%s_2_%d_%d ((x vector_2_%d)) vector_2_%d
   (let ((z0 (%s_%d_%d (select x #b00)))
         (z1 (%s_%d_%d (select x #b01)))
         (z2 (%s_%d_%d (select x #b10)))
         (z3 (%s_%d_%d (select x #b11))))
      (vmake_2_%d z0 z1 z2 z3)))
\n"
    conv_op n w w n  conv_op n w  conv_op n w  conv_op n w  conv_op n w  n
    
      
let vconversion_3 b conv_op n w  =
  bprintf b 
    "
(define-fun v%s_3_%d_%d ((x vector_3_%d)) vector_3_%d
   (let ((z0 (%s_%d_%d (select x #b000)))
         (z1 (%s_%d_%d (select x #b001)))
         (z2 (%s_%d_%d (select x #b010)))
         (z3 (%s_%d_%d (select x #b011)))
         (z4 (%s_%d_%d (select x #b100)))
         (z5 (%s_%d_%d (select x #b101)))
         (z6 (%s_%d_%d (select x #b110)))
         (z7 (%s_%d_%d (select x #b111))))
      (vmake_3_%d z0 z1 z2 z3 z4 z5 z6 z7)))
\n"
    conv_op n w w n  conv_op n w  conv_op n w  conv_op n w  conv_op n w  conv_op n w  conv_op n w  conv_op n w  conv_op n w  n
    
let vconversion b conv_op logv n w =
  if logv = 1
  then
    vconversion_1 b conv_op n w
  else if logv = 2
  then
    vconversion_2 b conv_op n w
  else if logv = 3
  then
    vconversion_3 b conv_op n w
  else failwith("vconversion Ooops: need to write some prelude code for vectors longer than 2^3.")
	  

(*
 * Prelude: a bunch of definitions to abbreviate the conversion.
 *
 * Note that while the current output is large and indiscriminant,
 * this could be rectified. We could output the translation of the cu
 * to a temporary file, recording which functions we used, then prepend
 * the appropriately generated prelude.
 *
 *)
let print_prelude b preqs =

  let aw = preqs.address_width in 

  let vector_logarithms = preqs.vector_length in 
	       
  let vector_widths =  preqs.vector_width in 

    bprintf b "%s" header;
    
    bprintf b "(set-logic QF_ABV)\n";
    
    bprintf b "(define-sort Address () %s)\n" (addr_type aw);
    
    bprintf b "(define-sort Byte () %s)\n" byte_type;
    
    bprintf b "(define-sort Mem () (Array Address Byte))\n";
    
    bprintf b "%s\n" types;
    
    bprintf b "%s\n" (constants aw);
    
    bprintf b "%s\n" writes;
    
    bprintf b "%s\n" reads;
    
    List.iter (fun n -> (List.iter (fun width ->  (vector_type b n width)) vector_widths)) vector_logarithms;
    
    List.iter (fun n -> vector_bool b n) vector_logarithms;
    
    List.iter (fun n -> List.iter (fun w ->  (vutils b n w)) vector_widths) vector_logarithms;

    List.iter (fun (n, w) ->  (vbinop b n w)) (vbinop_fetch preqs);

    List.iter (fun (n, w) ->  (trunc b n w)) (trunc_fetch preqs);

    List.iter (fun (l, n, w) ->  (vconversion b "trunc" l n w)) (vtrunc_fetch preqs);

    List.iter (fun (n, w) ->  (zext b n w)) (zext_fetch preqs);

    List.iter (fun (l, n, w) ->  (vconversion b "zext" l n w)) (vzext_fetch preqs);

    List.iter (fun (n, w) ->  (sext b n w)) (sext_fetch preqs);

    List.iter (fun (l, n, w) ->  (vconversion b "sext" l n w)) (vsext_fetch preqs);

    List.iter (fun (n, w) ->  (int_ptr b n w)) (int_ptr_fetch preqs);

    List.iter (fun (l, n, w) ->  (vconversion b "int_ptr" l n w)) (vint_ptr_fetch preqs);

    if preqs.cast then bprintf b "%s\n" vector_casts;
    
    bprintf b "\n;; end of prelude\n\n\n";
    
    ()
    
    

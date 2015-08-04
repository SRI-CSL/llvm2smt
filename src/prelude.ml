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
  (* binary prelude parametric operations: undef vmake vzero vbinop trunc zext sext int_ptr vite *)
  twos_keys: string list;
  twos_table:  (string, (int * int) list) Hashtbl.t;
  (* ternary prelude parametric operations: vundef vtrunc vzext vsext vint_ptr *)
  threes_keys: string list;
  threes_table:  (string, (int * int * int) list) Hashtbl.t;
  mutable undef: int;               (* counter for gensym-ing undefs                 *)
  mutable cast:  bool;              (* do we need casts: vectors <-> bitvectors      *) 
  mutable vector_width: int list;   (* the bit widths of the beasts found in vectors *)
  mutable vector_length: int list;  (* the LOGARITHMS of the lengths of the vectors  *)
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

let undef_fetch preq =
  let n = preq.undef in
    preq.undef <- (n + 1);
    n
      
let make_prelude aw =
  let preq = { address_width = aw;
	       twos_keys = ["undef"; "vmake"; "vzero"; "vbinop"; "vcast";
			    "trunc"; "zext"; "sext"; "int_ptr"; "vite"];
	       twos_table = (Hashtbl.create 64);
	       threes_keys = ["vundef";  "vtrunc"; "vzext"; "vsext"; "vint_ptr";];
	       threes_table = (Hashtbl.create 64);
	       undef = 0; cast = false; vector_width = [];   vector_length = []; } in
    List.iter (fun key -> Hashtbl.add preq.twos_table key []) preq.twos_keys;
    List.iter (fun key -> Hashtbl.add preq.threes_table key []) preq.threes_keys;
    preq

let twos_add preq key x =
  let l = Hashtbl.find preq.twos_table key in
    if not (List.mem x l)
    then
      begin
	Hashtbl.replace preq.twos_table key (x :: l);
	(* these guys are vector operations so we need to add the vector types *)
	if key = "vmake" || key = "vzero" || key = "vbinop" || key = "vite" || key = "vcast"
	then
	  let (length, width) = x in
	    vector_width_add preq width;
	    vector_length_add preq length;
      end
    
let twos_fetch preq key = 
  List.sort compare2 (Hashtbl.find preq.twos_table key)

let threes_add preq key twin x =
  let l =  Hashtbl.find preq.threes_table key in
    if not (List.mem x l)
    then
      let (length, n, width) = x in
	(* these guys are vector operations so we need to add the vector types *)
	vector_width_add preq n;
	if key <> "vundef"
	then
	  begin
	    vector_width_add preq width;     (* not a width in the case of vundef *)
	    twos_add preq twin (n, width)   (* vundef doesn't rely on undef      *)
	  end;
	vector_length_add preq length;
	Hashtbl.replace preq.threes_table key (x :: l)

let threes_fetch preq key = List.sort compare3 (Hashtbl.find preq.threes_table key)


(* cast should go away once the vcast stuff is hooked in *)
let cast_add preq =
  if not preq.cast
  then
    begin
      preq.cast <- true;
      List.iter (fun w -> vector_width_add preq w) [32; 64];
      List.iter (fun l -> vector_length_add preq l) [1; 2];
    end
      
      
let undef_add preq x = twos_add preq "undef" x

let vmake_add preq x = twos_add preq "vmake" x
			 
let vzero_add preq x = twos_add preq "vzero" x
    
let vbinop_add preq x = twos_add preq "vbinop" x

let trunc_add preq x = twos_add preq "trunc" x
  
let zext_add preq x = twos_add preq "zext" x
			
let sext_add preq x = twos_add preq "sext" x

let int_ptr_add preq x = twos_add preq "int_ptr" x

let vundef_add preq x = threes_add preq "vundef" "undef" x
  
let vtrunc_add preq x = threes_add preq "vtrunc" "trunc" x
  
let vsext_add preq x = threes_add preq "vsext" "sext" x
  
let vzext_add preq x = threes_add preq "vzext" "zext" x
  
let vint_ptr_add preq x = threes_add preq "vint_ptr" "int_ptr" x

let vite_add preq x = twos_add preq "vite" x

let vcast_add preq x = twos_add preq "vcast" x
  
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
    List.iter (fun str -> (dump_aux2 str (twos_fetch prelude str))) prelude.twos_keys;
    List.iter (fun str -> (dump_aux3 str (threes_fetch prelude str))) prelude.threes_keys
      
      
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

(declare-fun vnew_%d_%d () vector_%d_%d)
\n"
    len width len width len width len width len width 

let vector_bool_1 b =
  bprintf b
    "
;; Special case where we use Bool rather than bitvectors of size 1 

(define-sort vector_1_1 () (Array (_ BitVec 1) Bool))

(declare-fun vnew_1_1 () vector_1_1)

(define-fun vmake_1_1 ((x0 Bool) (x1 Bool)) vector_1_1
   (store (store vnew_1_1 #b0 x0) #b1 x1))
\n"

let vector_bool_2 b =
  bprintf b
    "
;; Special case where we use Bool rather than bitvectors of size 1 

(define-sort vector_2_1 () (Array (_ BitVec 2) Bool))

(declare-fun vnew_2_1 () vector_2_1)

(define-fun vmake_2_1 
  ((x0 Bool) (x1 Bool) (x2 Bool) (x3 Bool)) vector_2_1
   (store (store (store (store vnew_2_1 #b00 x0) #b01 x1) #b10 x2) #b11 x3))
\n"
    
let vector_bool_3 b =
  bprintf b
    "
;; Special case where we use Bool rather than bitvectors of size 1 

(define-sort vector_3_1 () (Array (_ BitVec 3) Bool))

(declare-fun vnew_3_1 () vector_3_1)

(define-fun vmake_3_1 
  ((x0 Bool) (x1 Bool) (x2 Bool) (x3 Bool) (x4 Bool) (x5 Bool) (x6 Bool) (x7 Bool)) vector_3_1
   (store (store (store (store (store (store (store (store vnew_3_1 #b000 x0) #b001 x1) #b010 x2) #b011 x3) #b100 x4) #b101 x5) #b110 x6) #b111 x7))

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
    failwith("vector_bool Ooops: need to write some prelude code for vectors longer than 2^3: "^(string_of_int logv))


let vcast_1 b w =
  let w2 = 2 * w in 
    bprintf b
      "
;; this assumes little endian representation
(define-fun cast_vector_1_%d_to_bits ((x vector_1_%d)) (_ BitVec %d)
   (concat (select x #b1) (select x #b0)))

(define-fun cast_bits_to_vector_1_%d ((w (_ BitVec %d))) vector_1_%d
   (let ((z0 ((_ extract %d 0) w))
         (z1 ((_ extract %d %d) w)))
      (vmake_1_%d z0 z1)))
"
      w w w2    w w2 w (w - 1) (w2 - 1) w w

let vcast_2 b w =
  let w2 = 2 * w in 
  let w3 = 3 * w in 
  let w4 = 2 * w2 in 
    bprintf b
      "
;; this assumes little endian representation
(define-fun cast_vector_2_%d_to_bits ((x vector_2_%d)) (_ BitVec %d)
   (concat (concat (concat (select x #b11) (select x #b10)) (select x #b01)) (select x #b00)))

(define-fun cast_bits_to_vector_2_%d ((w (_ BitVec %d))) vector_2_%d
   (let ((z0 ((_ extract %d 0) w))
         (z1 ((_ extract %d %d) w))
         (z2 ((_ extract %d %d) w))
         (z3 ((_ extract %d %d) w)))
      (vmake_2_%d z0 z1 z2 z3)))
"
      w w w4     w w4 w (w - 1) (w2 - 1) w (w3 - 1) w2 (w4 - 1) w3 w

      
let vcast_3 b w =
    bprintf b
      "
;;;to appear (maybe)
"
      
let vcast b logv =
  if logv = 1
  then
    vcast_1 b 
  else if logv = 2
  then
    vcast_2 b
  else if logv = 3
  then
    vcast_3 b
  else
    failwith("vcast Ooops: need to write some prelude code for vectors longer than 2^3: e.g. 2^"^(string_of_int logv))
      
let v2b_cast b w =
  let w2 = 2 * w in 
  let w4 = 2 * w2 in 
    bprintf b
      "
;; this assumes little endian representation
(define-fun cast_vector_1_%d_to_bits ((x vector_1_%d)) (_ BitVec %d)
   (concat (select x #b1) (select x #b0)))

;; this assumes little endian representation
(define-fun cast_vector_2_%d_to_bits ((x vector_2_%d)) (_ BitVec %d)
   (concat (concat (concat (select x #b11) (select x #b10)) (select x #b01)) (select x #b00)))
"
      w w w2   w w w4 

let b2v_cast b w =
  let w2 = 2 * w in 
  let w3 = 3 * w in 
  let w4 = 2 * w2 in 
    bprintf b
      "
(define-fun cast_bits_to_vector_1_%d ((w (_ BitVec %d))) vector_1_%d
   (let ((z0 ((_ extract %d 0) w))
         (z1 ((_ extract %d %d) w)))
      (vmake_1_%d z0 z1)))

(define-fun cast_bits_to_vector_2_%d ((w (_ BitVec %d))) vector_2_%d
   (let ((z0 ((_ extract %d 0) w))
         (z1 ((_ extract %d %d) w))
         (z2 ((_ extract %d %d) w))
         (z3 ((_ extract %d %d) w)))
      (vmake_2_%d z0 z1 z2 z3)))
  "
      w w2 w (w - 1) (w2 - 1) w w    w w4 w (w - 1) (w2 - 1) w (w3 - 1) w2 (w4 - 1) w3 w
      
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
   (store (store vnew_1_%d #b0 x0) #b1 x1))

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
   (store (store (store (store vnew_2_%d #b00 x0) #b01 x1) #b10 x2) #b11 x3))

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
   (store (store (store (store (store (store (store (store vnew_3_%d #b000 x0) #b001 x1) #b010 x2) #b011 x3) #b100 x4) #b101 x5) #b110 x6) #b111 x7))

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


let undef b w c =
  if w = 1
  then
    bprintf b 
      "
  (declare-fun undef_%d_%d () Bool)
\n"	
      w c  
  else
    bprintf b 
	"
  (declare-fun undef_%d_%d () (_ BitVec %d))
\n"
      w c w

let vundef b n w c =
    bprintf b 
      "
  (declare-fun vundef_%d_%d_%d () vector_%d_%d)
\n"	
      n w c   n w

      
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
	  

let vite_1_w b w = 
  bprintf b 
    "
(define-fun vite_1_%d ((c vector_1_1) (x vector_1_%d) (y vector_1_%d)) vector_1_%d
   (let ((z0 (ite (select c #b0) (select x #b0) (select y #b0)))
         (z1 (ite (select c #b0) (select x #b1) (select y #b1))))
      (vmake_1_%d z0 z1)))
"
    w w w w  w

    
let vite_2_w b w = 
  bprintf b 
    "
 (define-fun vite_2_%d ((c vector_2_1) (x vector_2_%d) (y vector_2_%d)) vector_2_%d
   (let ((z0 (ite (select c #b00) (select x #b00) (select y #b00)))
         (z1 (ite (select c #b01) (select x #b01) (select y #b01)))
         (z2 (ite (select c #b10) (select x #b10) (select y #b10)))
         (z3 (ite (select c #b11) (select x #b11) (select y #b11))))
      (vmake_2_%d z0 z1 z2 z3)))
\n"
     w w w w  w

let vite_3_w b w = 
  bprintf b 
    "
 (define-fun vite_3_%d ((c vector_3_1) (x vector_3_%d) (y vector_3_%d)) vector_3_%d
   (let (
         (z0 (ite (select c #b000) (select x #b000) (select y #b000)))
         (z1 (ite (select c #b001) (select x #b001) (select y #b001)))
         (z2 (ite (select c #b010) (select x #b010) (select y #b010)))
         (z3 (ite (select c #b011) (select x #b011) (select y #b011)))
         (z4 (ite (select c #b100) (select x #b100) (select y #b100)))
         (z5 (ite (select c #b101) (select x #b101) (select y #b101)))
         (z6 (ite (select c #b110) (select x #b110) (select y #b110)))
         (z7 (ite (select c #b111)c(select x #b111) (select y #b111)))
         )
      (vmake_3_%d z0 z1 z2 z3 z4 z5 z6 z7)))
\n"
    w w w w  w

let vite b logv w =
  if logv = 1
  then
    vite_1_w b w
  else if logv = 2
  then
    vite_2_w b w
  else if logv = 3
  then
    vite_3_w b w
  else failwith("vite Ooops: need to write some prelude code for vectors longer than 2^3.")


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

    List.iter (fun (n, w) ->  (vbinop b n w)) (twos_fetch preqs "vbinop");

    List.iter (fun (n, w) ->  (trunc b n w)) (twos_fetch preqs "trunc");

    List.iter (fun (w, c) ->  (undef b w c)) (twos_fetch preqs "undef");

    List.iter (fun (n, w, c) ->  (vundef b n w c)) (threes_fetch preqs "vundef");

    List.iter (fun (l, n, w) ->  (vconversion b "trunc" l n w)) (threes_fetch preqs "vtrunc");

    List.iter (fun (n, w) ->  (zext b n w)) (twos_fetch preqs "zext");

    List.iter (fun (l, n, w) ->  (vconversion b "zext" l n w)) (threes_fetch preqs "vzext");

    List.iter (fun (n, w) ->  (sext b n w)) (twos_fetch preqs "sext");

    List.iter (fun (l, n, w) ->  (vconversion b "sext" l n w)) (threes_fetch preqs "vsext");

    List.iter (fun (n, w) ->  (int_ptr b n w)) (twos_fetch preqs "int_ptr");

    List.iter (fun (l, n, w) ->  (vconversion b "int_ptr" l n w)) (threes_fetch preqs "vint_ptr");

    List.iter (fun (n, w) ->  (vite b n w)) (twos_fetch preqs "vite");

    if preqs.cast then bprintf b "%s\n" vector_casts;
    
    bprintf b "\n;; end of prelude\n\n\n";
  
    ()
    
    

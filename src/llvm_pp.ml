(*
 * Pretty printing support plus syntactic utils
 *)

open Printf
open Llvm
open Util

(* binary operations *)
let bpr_binop b = function
  | Xchg -> bprintf b "xchg"
  | Add  -> bprintf b "add"
  | Sub  -> bprintf b "sub"
  | And  -> bprintf b "and"
  | Nand -> bprintf b "nand"
  | Or   -> bprintf b "or"
  | Xor  -> bprintf b "xor"
  | Max  -> bprintf b "max"
  | Min  -> bprintf b "min"
  | Umax -> bprintf b "umax"
  | Umin -> bprintf b "umin"

(* fast math flags *)      
let bpr_fast_math_flag b = function
  | Fast -> bprintf b "fast"
  | Nnan -> bprintf b "nnan"
  | Ninf -> bprintf b "ninf"
  | Nsz  -> bprintf b "nsz"
  | Arcp -> bprintf b "arcp"

let bpr_fast_math_flags = between " " bpr_fast_math_flag

(* attributes *)
let bpr_attribute b = function
  | Align x          -> bprintf b "align %d" x
  | Byval            -> bprintf b "byval"
  | Dereferenceable x   -> bprintf b "dereferenceable(%d)" x
  | Inalloca         -> bprintf b "inalloca"
  | Inreg            -> bprintf b "inreg"
  | Nest             -> bprintf b "nest"
  | Noalias          -> bprintf b "noalias"
  | Nocapture        -> bprintf b "nocapture"
  | Nonnull          -> bprintf b "nonnull"
  | Readnone         -> bprintf b "readnone"
  | Readonly         -> bprintf b "readonly"
  | Returned         -> bprintf b "returned"
  | Signext          -> bprintf b "signext"
  | Sret             -> bprintf b "sret"
  | Zeroext          -> bprintf b "zeroext"
  | Attrgrp x        -> bprintf b "#%d" x
  | Attr(x, None)    -> bprintf b "%s" x
  | Attr(x, Some y)  -> bprintf b "%s=%s" x y
  | Alignstack x     -> bprintf b "alignstack = (%d)" x
  | Alwaysinline     -> bprintf b "alwaysinline"
  | Builtin          -> bprintf b "builtin"
  | Cold             -> bprintf b "cold"
  | Inlinehint       -> bprintf b "inlinehint"
  | Minsize          -> bprintf b "minsize"
  | Naked            -> bprintf b "naked"
  | Nobuiltin        -> bprintf b "nobuiltin"
  | Noduplicate      -> bprintf b "noduplicate"
  | Noimplicitfloat  -> bprintf b "noimplicitfloat"
  | Noinline         -> bprintf b "noinline"
  | Nonlazybind      -> bprintf b "nonlazybind"
  | Noredzone        -> bprintf b "noredzone"
  | Noreturn         -> bprintf b "noreturn"
  | Nounwind         -> bprintf b "nounwind"
  | Optnone          -> bprintf b "optnone"
  | Optsize          -> bprintf b "optsize"
  | Returns_twice    -> bprintf b "returns_twice"
  | Ssp              -> bprintf b "ssp"
  | Sspreq           -> bprintf b "sspreq"
  | Sspstrong        -> bprintf b "sspstrong"
  | Sanitize_address -> bprintf b "sanitize_address"
  | Sanitize_thread  -> bprintf b "sanitize_thread"
  | Sanitize_memory  -> bprintf b "sanitize_memory"
  | Uwtable          -> bprintf b "uwtable"

let bpr_attributes =
  before " " bpr_attribute (* was between *)

let bpr_attrgrp b (x, y) =
  bprintf b "attributes #%d = {%a }\n" x bpr_attributes y

(* calling convention *)
let bpr_callingconv b = function
  | Ccc               -> bprintf b "ccc"
  | Fastcc            -> bprintf b "fastcc"
  | Intel_ocl_bicc    -> bprintf b "intel_ocl_bicc"
  | Coldcc            -> bprintf b "coldcc"
  | X86_stdcallcc     -> bprintf b "x86_stdcallcc"
  | X86_fastcallcc    -> bprintf b "x86_fastcallcc"
  | X86_thiscallcc    -> bprintf b "x86_thiscallcc"
  | X86_cdeclmethodcc -> bprintf b "x86_cdeclmethodcc"
  | Arm_apcscc        -> bprintf b "arm_apcscc"
  | Arm_aapcscc       -> bprintf b "arm_aapcscc"
  | Arm_aapcs_vfpcc   -> bprintf b "arm_aapcs_vfpcc"
  | Msp430_intrcc     -> bprintf b "msp430_intrcc"
  | Ptx_kernel        -> bprintf b "ptx_kernel"
  | Ptx_device        -> bprintf b "ptx_device"
  | Spir_func         -> bprintf b "spir_func"
  | Spir_kernel       -> bprintf b "spir_kernel"
  | X86_64_sysvcc     -> bprintf b "x86_64_sysvcc"
  | X86_64_win64cc    -> bprintf b "x86_64_win64cc"
  | Webkit_jscc       -> bprintf b "webkit_jscc"
  | Anyregcc          -> bprintf b "anyregcc"
  | Preserve_mostcc   -> bprintf b "preserve_mostcc"
  | Preserve_allcc    -> bprintf b "preserve_allcc"
  | Cc                -> bprintf b "cc"

let bpr_icmp b = function
  | I.Eq  -> bprintf b "eq"
  | I.Ne  -> bprintf b "ne"
  | I.Slt -> bprintf b "slt"
  | I.Sgt -> bprintf b "sgt"
  | I.Sle -> bprintf b "sle"
  | I.Sge -> bprintf b "sge"
  | I.Ult -> bprintf b "ult"
  | I.Ugt -> bprintf b "ugt"
  | I.Ule -> bprintf b "ule"
  | I.Uge -> bprintf b "uge"

let bpr_fcmp b = function
  | F.Oeq     -> bprintf b "oeq"
  | F.One     -> bprintf b "one"
  | F.Olt     -> bprintf b "olt"
  | F.Ogt     -> bprintf b "ogt"
  | F.Ole     -> bprintf b "ole"
  | F.Oge     -> bprintf b "oge"
  | F.Ord     -> bprintf b "ord"
  | F.Uno     -> bprintf b "uno"
  | F.Ueq     -> bprintf b "ueq"
  | F.Une     -> bprintf b "une"
  | F.Ult     -> bprintf b "ult"
  | F.Ugt     -> bprintf b "ugt"
  | F.Ule     -> bprintf b "ule"
  | F.Uge     -> bprintf b "uge"
  | F.True    -> bprintf b "true"
  | F.False   -> bprintf b "false"

let bpr_var b = function
  | Id(true, i)       -> bprintf b "@%d" i
  | Id(false, i)      -> bprintf b "%%%d" i
  | Name(true, name)  -> bprintf b "@%s" name
  | Name(false, name) -> bprintf b "%%%s" name

let string_of_var v =
  Util.spr bpr_var v

let rec bpr_typ b typ =
  let rec pr = function
    | Void      -> bprintf b "void"
    | Half      -> bprintf b "half"
    | Float     -> bprintf b "float"
    | Double    -> bprintf b "double"
    | X86_fp80  -> bprintf b "x86_fp80"
    | X86_mmx   -> bprintf b "x86_mmx"
    | Fp128     -> bprintf b "fp128"
    | Ppc_fp128 -> bprintf b "ppc_fp128"
    | Label     -> bprintf b "label"
    | Metadata  -> bprintf b "metadata"
    | Integer x ->
        bprintf b "i%d" x
    | Vartyp x -> bpr_var b x
    | Funtyp(return_ty, param_tys, is_var_arg) ->
        pr return_ty;
        bprintf b " (";
        between ", " bpr_formal b param_tys;
        if is_var_arg then
          if param_tys = [] then
            bprintf b "..."
          else bprintf b ", ...";
        bprintf b ")"
    | Structtyp(packed, typs) ->
        bprintf b "%a{%a%a%a}%a"
          (yes "<") packed
          (yes " ") (typs <> [])
          (between ", " bpr_typ) typs
          (yes " ") (typs <> [])
          (yes ">") packed;
    | Arraytyp(len, element_ty) ->
        bprintf b "[%d x " len;
        pr element_ty;
        bprintf b "]"
    | Pointer(element_ty, address_space) ->
        pr element_ty;
        (match address_space with
        | None -> ()
        | Some 0 -> ()
        | Some x -> bprintf b " addrspace(%d)" x);
        bprintf b "*"
    | Vector(len, element_ty) ->
        bprintf b "<%d x " len;
        pr element_ty;
        bprintf b ">"
  in pr typ
and bpr_formal b (typ, pattrs, formal) =
  bprintf b "%a%a%a"
    bpr_typ typ
    (before " " bpr_attribute) pattrs
    (opt_before " " bpr_var) formal

let string_of_typ t =
  Util.spr bpr_typ t

let rec string_of_typs typs =
  (match typs with
     | [] -> ""
     | ty :: tl -> (string_of_typ ty) ^ " " ^ string_of_typs tl)
  
    
let bpr_index_list b l =
  List.iter (bprintf b ", %d") l

let rec bpr_value b op = match op with
  | Var x          -> bpr_var b x
  | Basicblock x   -> bpr_var b x
  | Mdnode x       -> bprintf b "!%d" x
  | Mdnodevector x -> bpr_mdnodevector b x
  | Mdstring x     -> bprintf b "!%s" x
  | Null           -> bprintf b "null"
  | Undef          -> bprintf b "undef"
  | Zero           -> bprintf b "zeroinitializer"
  | True           -> bprintf b "true"
  | False          -> bprintf b "false"
  | Int x          -> bprintf b "%s" (Big_int.string_of_big_int x)
  | Float x        -> bprintf b "%s" x
  | Blockaddress(x, y) ->
      bprintf b "blockaddress(%a, %a)" bpr_value x bpr_value y
  | Array ops ->
      let is_string =
        List.for_all
          (function (Integer 8, Int _) -> true | _ -> false)
          ops in
      if is_string then begin
        bprintf b "c\"";
        List.iter
          (function
            | (_, Int x) ->
                let c = Char.chr(Big_int.int_of_big_int x) in
                let isprint c = c >= '\032' && c < '\127' in
                if (isprint c && c <> '\\' && c <> '\"') then
                  bprintf b "%c" c
                else
                  bprintf b "\\%.2X" (Char.code c)
            | _ (*impossible*) -> ())
          ops;
        bprintf b "\""
      end
      else
        bprintf b "[%a]" (between ", " bpr_typ_value) ops
  | Vector ops ->
      bprintf b "<%a>" (between ", " bpr_typ_value) ops
  | Struct(is_packed, ops) ->
      bprintf b "%a{%a%a%a}%a"
        (yes "<") is_packed
        (yes " ") (ops <> [])
        (between ", " bpr_typ_value) ops
        (yes " ") (ops <> [])
        (yes ">") is_packed
  | Trunc(x, y)          -> bprintf b "trunc(%a to %a)" bpr_typ_value x         bpr_typ y
  | Zext(x, y)           -> bprintf b "zext(%a to %a)" bpr_typ_value x          bpr_typ y
  | Sext(x, y)           -> bprintf b "sext(%a to %a)" bpr_typ_value x          bpr_typ y
  | Fptrunc(x, y)        -> bprintf b "fptrunc(%a to %a)" bpr_typ_value x       bpr_typ y
  | Fpext(x, y)          -> bprintf b "fpext(%a to %a)" bpr_typ_value x         bpr_typ y
  | Bitcast(x, y)        -> bprintf b "bitcast (%a to %a)" bpr_typ_value x      bpr_typ y
  | Addrspacecast(x, y)  -> bprintf b "addrspacecast(%a to %a)" bpr_typ_value x bpr_typ y
  | Uitofp(x, y)         -> bprintf b "uitofp(%a to %a)" bpr_typ_value x        bpr_typ y
  | Sitofp(x, y)         -> bprintf b "sitofp(%a to %a)" bpr_typ_value x        bpr_typ y
  | Fptoui(x, y)         -> bprintf b "fptoui(%a to %a)" bpr_typ_value x        bpr_typ y
  | Fptosi(x, y)         -> bprintf b "fptosi(%a to %a)" bpr_typ_value x        bpr_typ y
  | Inttoptr(x, y)       -> bprintf b "inttoptr (%a to %a)" bpr_typ_value x     bpr_typ y
  | Ptrtoint(x, y)       -> bprintf b "ptrtoint (%a to %a)" bpr_typ_value x      bpr_typ y
  | Extractvalue(x, y)   -> bprintf b "extractvalue(%a%a)" bpr_typ_value x bpr_index_list y
  | Insertvalue(x, y, z) -> bprintf b "insertvalue(%a, %a%a)" bpr_typ_value x bpr_typ_value y bpr_index_list z
  | Icmp(cmp, x, y)      -> bprintf b "icmp %a (%a, %a)" bpr_icmp cmp bpr_typ_value x bpr_typ_value y
  | Fcmp(cmp, x, y)      -> bprintf b "fcmp %a (%a, %a)" bpr_fcmp cmp bpr_typ_value x bpr_typ_value y
  | Sdiv(e, x, y)        -> bprintf b "sdiv%a(%a, %a)" (yes " exact ") e bpr_typ_value x bpr_typ_value y
  | Udiv(e, x, y)        -> bprintf b "udiv%a(%a, %a)" (yes " exact ") e bpr_typ_value x bpr_typ_value y
  | Lshr(e, x, y)        -> bprintf b "lshr%a(%a, %a)" (yes " exact ") e bpr_typ_value x bpr_typ_value y
  | Ashr(e, x, y)        -> bprintf b "ashr%a(%a, %a)" (yes " exact ") e bpr_typ_value x bpr_typ_value y
  | Fadd(x, y)           -> bprintf b "fadd(%a, %a)" bpr_typ_value x bpr_typ_value y
  | Fsub(x, y)           -> bprintf b "fsub(%a, %a)" bpr_typ_value x bpr_typ_value y
  | Fmul(x, y)           -> bprintf b "fmul(%a, %a)" bpr_typ_value x bpr_typ_value y
  | Fdiv(x, y)           -> bprintf b "fdiv(%a, %a)" bpr_typ_value x bpr_typ_value y
  | Frem(x, y)           -> bprintf b "frem(%a, %a)" bpr_typ_value x bpr_typ_value y
  | Urem(x, y)           -> bprintf b "urem(%a, %a)" bpr_typ_value x bpr_typ_value y
  | Srem(x, y)           -> bprintf b "srem(%a, %a)" bpr_typ_value x bpr_typ_value y
  | And (x, y)           -> bprintf b "and(%a, %a)" bpr_typ_value x bpr_typ_value y
  | Or  (x, y)           -> bprintf b "or(%a, %a)" bpr_typ_value x bpr_typ_value y
  | Xor (x, y)           -> bprintf b "xor(%a, %a)" bpr_typ_value x bpr_typ_value y
  | Getelementptr(inbounds, x) -> bprintf b "getelementptr %a(%a)" (yes "inbounds ") inbounds bpr_typ_value_list x
  | Shufflevector x      -> bprintf b "shufflevector(%a)" bpr_typ_value_list x
  | Insertelement x      -> bprintf b "insertelement(%a)" bpr_typ_value_list x
  | Extractelement x     -> bprintf b "extractelement(%a)" bpr_typ_value_list x
  | Select x             -> bprintf b "select(%a)" bpr_typ_value_list x
  | Add(nuw, nsw, x, y)  -> bprintf b "add%a%a(%a, %a)" (yes " nuw") nuw (yes " nsw ") nsw bpr_typ_value x bpr_typ_value y
  | Sub(nuw, nsw, x, y)  -> bprintf b "sub%a%a(%a, %a)" (yes " nuw") nuw (yes " nsw ") nsw bpr_typ_value x bpr_typ_value y
  | Mul(nuw, nsw, x, y)  -> bprintf b "mul%a%a(%a, %a)" (yes " nuw") nuw (yes " nsw ") nsw bpr_typ_value x bpr_typ_value y
  | Shl(nuw, nsw, x, y)  -> bprintf b "shl%a%a(%a, %a)" (yes " nuw") nuw (yes " nsw ") nsw bpr_typ_value x bpr_typ_value y
  | Asm(sideeffect, alignstack, inteldialect, x, y) ->
      bprintf b "asm %a%a%a%s, %s"
        (yes "sideeffect ") sideeffect
        (yes "alignstack ") alignstack
        (yes "inteldialect ") inteldialect
        x
        y

and bpr_typ_value b (typ, value) =
  bprintf b "%a %a" bpr_typ typ bpr_value value

and bpr_typ_value_list b l =
  (match l with [] -> ()
  | (ty, op)::tl ->
      let all_same_type = List.for_all (fun (ty', _) -> ty=ty') tl in
      if false && all_same_type then begin
        bprintf b "%a %a" bpr_typ ty bpr_value op;
        List.iter (fun (_, op) -> bprintf b ", %a" bpr_value op) tl
      end else
        between ", " (fun b (ty, op) -> bprintf b "%a %a" bpr_typ ty bpr_value op) b l)

and bpr_mdnodevector b x =
  let bpr b = function
    | None -> bprintf b "null"
    | Some y -> bpr_typ_value b y in
  bprintf b "!{%a}" (between ", " bpr) x

let string_of_value v =
  Util.spr bpr_value v

let bpr_arguments =
  let bpr b (typ, param_attributes, value) =
    bprintf b "%a %a%a"
      bpr_typ typ
      (after " " bpr_attribute) param_attributes
      bpr_value value in
  between ", " bpr

let bpr_ordering b = function
| Unordered -> bprintf b "unordered"
| Monotonic -> bprintf b "monotonic"
| Acquire   -> bprintf b "acquire"
| Release   -> bprintf b "release"
| Acq_rel   -> bprintf b "acq_rel"
| Seq_cst   -> bprintf b "seq_cst"

let bpr_instr_metadata b md =
  List.iter
    (function
      | (s, Mdnode i) ->
          bprintf b ", !%s !%d" s i
      | (s, Mdnodevector x) -> 
          bprintf b ", !%s !{%a}" s bpr_mdnodevector x
      | _ -> failwith "bpr_instr_metadata")
    md

let bpr_instr b (nopt, i) =
  bprintf b "  ";
  (match nopt with None -> ()
  | Some n -> bprintf b "%a = " bpr_var n);
  (match i with
  | Add(nuw, nsw, x, y, md) ->
      bprintf b "add %a%a%a, %a%a" (yes "nuw ") nuw (yes "nsw ") nsw bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Sub(nuw, nsw, x, y, md) ->
      bprintf b "sub %a%a%a, %a%a" (yes "nuw ") nuw (yes "nsw ") nsw bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Mul(nuw, nsw, x, y, md) ->
      bprintf b "mul %a%a%a, %a%a" (yes "nuw ") nuw (yes "nsw ") nsw bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Shl(nuw, nsw, x, y, md) ->
      bprintf b "shl %a%a%a, %a%a" (yes "nuw ") nuw (yes "nsw ") nsw bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Fadd(fmf, x, y, md)           ->
      bprintf b "fadd %a%a, %a%a" bpr_fast_math_flags fmf bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Fsub(fmf, x, y, md)           ->
      bprintf b "fsub %a%a, %a%a" bpr_fast_math_flags fmf bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Fmul(fmf, x, y, md)           ->
      bprintf b "fmul %a%a, %a%a" bpr_fast_math_flags fmf bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Fdiv(fmf, x, y, md)           ->
      bprintf b "fdiv %a%a, %a%a" bpr_fast_math_flags fmf bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Frem(fmf, x, y, md)           ->
      bprintf b "frem %a%a, %a%a" bpr_fast_math_flags fmf bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Sdiv(e, x, y, md)           ->
      bprintf b "sdiv%a %a, %a%a" (yes " exact") e bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Udiv(e, x, y, md)           ->
      bprintf b "udiv%a %a, %a%a" (yes " exact") e bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Lshr(e, x, y, md)           ->
      bprintf b "lshr%a %a, %a%a" (yes " exact") e bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Ashr(e, x, y, md)           ->
      bprintf b "ashr%a %a, %a%a" (yes " exact") e bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Urem(x, y, md)           ->
      bprintf b "urem %a, %a%a" bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Srem(x, y, md)           ->
      bprintf b "srem %a, %a%a" bpr_typ_value x bpr_value y bpr_instr_metadata md
  | And (x, y, md)           ->
      bprintf b "and %a, %a%a" bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Or  (x, y, md)           ->
      bprintf b "or %a, %a%a" bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Xor (x, y, md)           ->
      bprintf b "xor %a, %a%a" bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Icmp(icmp, x, y, md) ->
      bprintf b "icmp %a %a, %a%a" bpr_icmp icmp bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Fcmp(fcmp, x, y, md) ->
      bprintf b "fcmp %a %a, %a%a" bpr_fcmp fcmp bpr_typ_value x bpr_value y bpr_instr_metadata md
  | Trunc(x, y, md)          ->
      bprintf b "trunc %a to %a%a" bpr_typ_value x         bpr_typ y bpr_instr_metadata md
  | Zext(x, y, md)           ->
      bprintf b "zext %a to %a%a" bpr_typ_value x          bpr_typ y bpr_instr_metadata md
  | Sext(x, y, md)           ->
      bprintf b "sext %a to %a%a" bpr_typ_value x          bpr_typ y bpr_instr_metadata md
  | Fptrunc(x, y, md)        ->
      bprintf b "fptrunc %a to %a%a" bpr_typ_value x       bpr_typ y bpr_instr_metadata md
  | Fpext(x, y, md)          ->
      bprintf b "fpext %a to %a%a" bpr_typ_value x         bpr_typ y bpr_instr_metadata md
  | Bitcast(x, y, md)        ->
      bprintf b "bitcast %a to %a%a" bpr_typ_value x       bpr_typ y bpr_instr_metadata md
  | Addrspacecast(x, y, md)  ->
      bprintf b "addrspacecast %a to %a%a" bpr_typ_value x bpr_typ y bpr_instr_metadata md
  | Uitofp(x, y, md)         ->
      bprintf b "uitofp %a to %a%a" bpr_typ_value x        bpr_typ y bpr_instr_metadata md
  | Sitofp(x, y, md)         ->
      bprintf b "sitofp %a to %a%a" bpr_typ_value x        bpr_typ y bpr_instr_metadata md
  | Fptoui(x, y, md)         ->
      bprintf b "fptoui %a to %a%a" bpr_typ_value x        bpr_typ y bpr_instr_metadata md
  | Fptosi(x, y, md)         ->
      bprintf b "fptosi %a to %a%a" bpr_typ_value x        bpr_typ y bpr_instr_metadata md
  | Inttoptr(x, y, md)       ->
      bprintf b "inttoptr %a to %a%a" bpr_typ_value x      bpr_typ y bpr_instr_metadata md
  | Ptrtoint(x, y, md)       ->
      bprintf b "ptrtoint %a to %a%a" bpr_typ_value x      bpr_typ y bpr_instr_metadata md
  | Va_arg(x, y, md)         ->
      bprintf b "va_arg %a, %a%a" bpr_typ_value x      bpr_typ y bpr_instr_metadata md
  | Getelementptr(inbounds, x, md) ->
      bprintf b "getelementptr%a %a%a" (yes " inbounds") inbounds bpr_typ_value_list x bpr_instr_metadata md
  | Shufflevector(x, md) ->
      bprintf b "shufflevector %a%a" bpr_typ_value_list x bpr_instr_metadata md
  | Insertelement(x, md) ->
      bprintf b "insertelement %a%a" bpr_typ_value_list x bpr_instr_metadata md
  | Extractelement(x, md) ->
      bprintf b "extractelement %a%a" bpr_typ_value_list x bpr_instr_metadata md
  | Select(x, md) ->
      bprintf b "select %a%a" bpr_typ_value_list x
        bpr_instr_metadata md
  | Phi(ty, incoming, md) ->
      bprintf b "phi %a " bpr_typ ty;
      let first = ref true in
      List.iter
        (fun (x, y) ->
          if not !first then bprintf b ", " else first := false;
          bprintf b "[ %a, %a ]" bpr_value x bpr_value y)
        incoming;
      bpr_instr_metadata b md
  | Landingpad(x, y, z, w, md) ->
      let bpr_landingpad b = function
        | Catch(typ, value) ->  bprintf b "\n          catch %a %a" bpr_typ typ bpr_value value
        | Filter(typ, value) -> bprintf b "\n          filter %a %a" bpr_typ typ bpr_value value in
      let rec bpr b = function
        | [] -> ()
        | hd::tl -> bprintf b "%a" bpr_landingpad hd; bpr b tl in
	(* iam: ugly attempt to get the pretty printing similar to clang; could do with some tweaking *)
	bprintf b "landingpad %a personality %a%a%a%a"
	  bpr_typ x
	  bpr_typ_value y
	  (yes "\n          cleanup") z bpr w 
	  bpr_instr_metadata md
  | Call(is_tail_call, callconv, retattrs, callee_ty, callee_name, operands, callattrs, md) ->
      if is_tail_call then bprintf b "tail ";
      bprintf b "call";
      (opt_before " " bpr_callingconv) b callconv;
      bprintf b "%a %a %a(%a)%a%a"
	bpr_attributes retattrs
        bpr_typ callee_ty bpr_value callee_name bpr_arguments operands (before " " bpr_attribute) callattrs
        bpr_instr_metadata md
  | Alloca(x, y, z, w, md) ->
      bprintf b "alloca ";
      if x then bprintf b "inalloca ";
      bpr_typ b y;
      (match z with None -> () | Some q -> bprintf b ", %a" bpr_typ_value q);
      (match w with None -> () | Some q -> bprintf b ", align %d" q);
      bpr_instr_metadata b md
  | Load(x, y, z, w, v, md) ->
      bprintf b "load %a%a%a" (yes "atomic ") x (yes "volatile ") y bpr_typ_value z;
      (match w with None -> () | Some(q, r) -> if q then bprintf b " singlethread"; bprintf b " %a" bpr_ordering r);
      (match v with None -> () | Some q -> bprintf b ", align %d" q);
      bpr_instr_metadata b md
  | Store(x, y, z, w, v, u, md) ->
      bprintf b "store %a%a%a, %a" (yes "atomic ") x (yes "volatile ") y bpr_typ_value z bpr_typ_value w;
      (match v with None -> () | Some(q, r) -> if q then bprintf b " singlethread"; bprintf b " %a" bpr_ordering r);
      (match u with None -> () | Some q -> bprintf b ", align %d" q);
      bpr_instr_metadata b md
  | Cmpxchg(x, y, z, w, v, u, t, md) ->
      bprintf b "cmpxchg %a%a, %a, %a%a %a %a%a"
        (yes "volatile ") x bpr_typ_value y bpr_typ_value z bpr_typ_value w
        (yes " singlthread") v
        bpr_ordering u
        bpr_ordering t
        bpr_instr_metadata md
  | Atomicrmw(x, y, z, w, v, u, md) ->
      bprintf b "atomicrmw %a%a %a, %a%a %a%a"
        (yes "volatile ") x
        bpr_binop y
        bpr_typ_value z
        bpr_typ_value w
        (yes " singlthread") v
        bpr_ordering u
        bpr_instr_metadata md
  | Fence(x, y, md) ->
      bprintf b "fence %a%a%a"
        (yes "singlthread ") x
        bpr_ordering y
        bpr_instr_metadata md
  | Extractvalue(x, y, md) ->
      bprintf b "extractvalue %a%a%a" bpr_typ_value x bpr_index_list y
        bpr_instr_metadata md
  | Insertvalue(x, y, z, md) ->
      bprintf b "insertvalue %a, %a%a%a" bpr_typ_value x bpr_typ_value y bpr_index_list z
        bpr_instr_metadata md
  | Unreachable md ->
      bprintf b "unreachable%a" bpr_instr_metadata md
  | Return(None, md) ->
      bprintf b "ret void%a" bpr_instr_metadata md
  | Return(Some(x, y), md) ->
      bprintf b "ret %a %a%a" bpr_typ x bpr_value y bpr_instr_metadata md
  | Br(x, None, md) ->
      bprintf b "br %a%a" bpr_typ_value x bpr_instr_metadata md
  | Br(x, Some(y, z), md) ->
      bprintf b "br %a, %a, %a%a" bpr_typ_value x bpr_typ_value y bpr_typ_value z bpr_instr_metadata md
  | Indirectbr(x, y, md) ->
      bprintf b "indirectbr %a, [%a]%a" bpr_typ_value x bpr_typ_value_list y bpr_instr_metadata md
  | Resume(x, md) ->
      bprintf b "resume %a%a" bpr_typ_value x bpr_instr_metadata md
  | Switch(x, y, z, md) ->
      bprintf b "switch %a, %a [\n    %a\n  ]%a" bpr_typ_value x bpr_typ_value y
        (between "\n    "
           (fun b (c, d) -> bprintf b "%a, %a" bpr_typ_value c bpr_typ_value d)) z
        bpr_instr_metadata md
  | Invoke(x, y, z, w, v, u, t, s, md) ->
      bprintf b "invoke%a%a %a %a(%a)%a\n          to %a unwind %a%a"
        (opt_before " "  bpr_callingconv) x
        bpr_attributes y
        bpr_typ z
        bpr_value w
        bpr_arguments v
        bpr_attributes u
        bpr_typ_value t
        bpr_typ_value s
        bpr_instr_metadata md);
  bprintf b "\n"

let string_of_rhs  rhs =
  Util.spr bpr_instr (None, rhs)

let string_of_instr instr =
  Util.spr bpr_instr instr



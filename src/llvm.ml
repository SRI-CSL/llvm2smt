(* Copyright (c) 2015, SRI International

   Permission is hereby granted, free of charge, to any person
   obtaining a copy of this software and associated documentation files
   (the "Software"), to deal in the Software without restriction,
   including without limitation the rights to use, copy, modify, merge,
   publish, distribute, sublicense, and/or sell copies of the Software,
   and to permit persons to whom the Software is furnished to do so,
   subject to the following conditions:
   
   The above copyright notice and this permission notice shall be
   included in all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
   NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
   LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
   OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
   WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*)

(*
 * Abstract syntax for LLVM 
 *
 * This seems to support a large subset of LLVM-3.4/3.5 but not all.
 *
 * Known missing features:
 * - prologue and comdat attributes to functions
 *
 * Things known to change in the future (wrt 3.4/3.5):
 * - getelementptr
 * - load 
 *
 *)

type var =
  | Id   of bool * int    (* global?, index *)
  | Name of bool * string (* global?, name *)

type attribute =
  | Align of int                   (* param_attribute *)
  | Byval                          (* param_attribute *)
  | Distinct                       (* metadata_attribute *)
  | Dereferenceable of int         (* param_attribute *) (* return_attribute *)
  | Inalloca                       (* param_attribute *)
  | Inreg                          (* param_attribute *) (* return_attribute *)
  | Nest                           (* param_attribute *)
  | Noalias                        (* param_attribute *) (* return_attribute *)
  | Nocapture                      (* param_attribute *)
  | Nonnull                        (* param_attribute *) (* return_attribute *)
  | Readnone                       (* param_attribute *) (* function_attribute *) (* call_attribute *)
  | Readonly                       (* param_attribute *) (* function_attribute *) (* call_attribute *)
  | Returned                       (* param_attribute *)
  | Signext                        (* param_attribute *) (* return_attribute *)
  | Sret                           (* param_attribute *)
  | Zeroext                        (* param_attribute *) (* return_attribute *)
  | Argmemonly                     (* function_attribute *)
  | Attrgrp of int                 (* function_attribute *)
  | Attr of string * string option (* function_attribute *)
  | Alignstack of int              (* function_attribute *)
  | Alwaysinline                   (* function_attribute *)
  | Builtin                        (* function_attribute *)
  | Cold                           (* function_attribute *)
  | Convergent                     (* function_attribute *)
  | Inaccessiblememonly            (* function_attribute *)
  | Inaccessiblemem_or_argmemonly  (* function_attribute *)
  | Inlinehint                     (* function_attribute *)
  | Jumptable                      (* function_attribute *)
  | Minsize                        (* function_attribute *)
  | Naked                          (* function_attribute *)
  | Nobuiltin                      (* function_attribute *)
  | Noduplicate                    (* function_attribute *)
  | Noimplicitfloat                (* function_attribute *)
  | Noinline                       (* function_attribute *)
  | Nonlazybind                    (* function_attribute *)
  | Noredzone                      (* function_attribute *)
  | Noreturn                       (* function_attribute *) (* call_attribute *)
  | Norecurse                      (* function_attribute *)
  | Nounwind                       (* function_attribute *) (* call_attribute *)
  | Optnone                        (* function_attribute *)
  | Optsize                        (* function_attribute *)
  | Returns_twice                  (* function_attribute *)
  | Safestack                      (* function_attribute *)
  | Sanitize_address               (* function_attribute *)
  | Sanitize_thread                (* function_attribute *)
  | Sanitize_memory                (* function_attribute *)
  | Ssp                            (* function_attribute *)
  | Sspreq                         (* function_attribute *)
  | Sspstrong                      (* function_attribute *)
  | Thunk                          (* function_attribute *)      
  | Uwtable                        (* function_attribute *)
type call_attribute = attribute
type return_attribute = attribute
type param_attribute = attribute
type function_attribute = attribute

type typ =
  | Void
  | Half
  | Float
  | Double
  | X86_fp80
  | X86_mmx
  | Fp128
  | Ppc_fp128
  | Label
  | Metadata
  | Vartyp  of var
  | Integer of int                                                         (* bitwidth *)
  | Funtyp  of typ * (typ * param_attribute list * var option) list * bool (* return type, param types, var_arg? *)
  | Structtyp of bool * typ list                                           (* packed?, fields *)
  | Arraytyp of int * typ                                                  (* array length, element type *)
  | Pointer of typ * int option                                            (* element type, address space *)
  | Vectortyp  of int * typ                                                (* array length, element type *)


let booltyp = Integer 1

module I = struct
  type t =
    | Eq
    | Ne
    | Slt
    | Sgt
    | Sle
    | Sge
    | Ult
    | Ugt
    | Ule
    | Uge
end

module F = struct
  type t =
    | Oeq
    | One
    | Olt
    | Ogt
    | Ole
    | Oge
    | Ord
    | Uno
    | Ueq
    | Une
    | Ult
    | Ugt
    | Ule
    | Uge
    | True
    | False
end

type value =
  | Var            of var
  | Basicblock     of var
  | Mdnode         of int
  | Mdstring       of string
  | Mdnodevector   of (typ * value) option list
  | Undef
  | Zero
  | Null
  | True
  | False
  | Int            of Big_int.big_int
  | Float          of string
  | Blockaddress   of value * value
  | Struct         of bool * (typ * value) list (* packed?, fields *)
  | Vector         of (typ * value) list
  | Array          of (typ * value) list
  | Trunc          of (typ * value) * typ
  | Zext           of (typ * value) * typ
  | Sext           of (typ * value) * typ
  | Fptrunc        of (typ * value) * typ
  | Fpext          of (typ * value) * typ
  | Bitcast        of (typ * value) * typ
  | Addrspacecast  of (typ * value) * typ
  | Uitofp         of (typ * value) * typ
  | Sitofp         of (typ * value) * typ
  | Fptoui         of (typ * value) * typ
  | Fptosi         of (typ * value) * typ
  | Inttoptr       of (typ * value) * typ
  | Ptrtoint       of (typ * value) * typ
  | Extractvalue   of (typ * value) * int list
  | Insertvalue    of (typ * value) * (typ * value) * int list
  | Icmp           of I.t * (typ * value) * (typ * value)
  | Fcmp           of F.t * (typ * value) * (typ * value)
  | Sdiv           of bool * (typ * value) * (typ * value) (* exact?, arg, arg *)
  | Udiv           of bool * (typ * value) * (typ * value) (* exact?, arg, arg *)
  | Lshr           of bool * (typ * value) * (typ * value) (* exact?, arg, arg *)
  | Ashr           of bool * (typ * value) * (typ * value) (* exact?, arg, arg *)
  | Fadd           of (typ * value) * (typ * value)
  | Fsub           of (typ * value) * (typ * value)
  | Fmul           of (typ * value) * (typ * value)
  | Fdiv           of (typ * value) * (typ * value)
  | Urem           of (typ * value) * (typ * value)
  | Srem           of (typ * value) * (typ * value)
  | Frem           of (typ * value) * (typ * value)
  | And            of (typ * value) * (typ * value)
  | Or             of (typ * value) * (typ * value)
  | Xor            of (typ * value) * (typ * value)
  | Getelementptr  of bool * (typ * value) list (* inbounds?, args *)
  | Shufflevector  of (typ * value) list
  | Insertelement  of (typ * value) list
  | Extractelement of (typ * value) list
  | Select         of (typ * value) list
  | Add            of bool * bool * (typ * value) * (typ * value) (* nuw?, nsw?, arg, arg *)
  | Sub            of bool * bool * (typ * value) * (typ * value) (* nuw?, nsw?, arg, arg *)
  | Mul            of bool * bool * (typ * value) * (typ * value) (* nuw?, nsw?, arg, arg *)
  | Shl            of bool * bool * (typ * value) * (typ * value) (* nuw?, nsw?, arg, arg *)
  | Asm            of bool * bool * bool * string * string (* sideeffect?, alignstack?, inteldialect?, arg, arg *)

type callingconv =
  | Ccc
  | Fastcc
  | Intel_ocl_bicc
  | Coldcc
  | X86_stdcallcc
  | X86_fastcallcc
  | X86_thiscallcc
  | X86_cdeclmethodcc
  | Arm_apcscc
  | Arm_aapcscc
  | Arm_aapcs_vfpcc
  | Msp430_intrcc
  | Ptx_kernel
  | Ptx_device
  | Spir_func
  | Spir_kernel
  | X86_64_sysvcc
  | X86_64_win64cc
  | Webkit_jscc
  | Anyregcc
  | Preserve_mostcc
  | Preserve_allcc
  | Cc

type fast_math_flag =
  | Fast
  | Nnan
  | Ninf
  | Nsz
  | Arcp

type ordering =
  | Unordered
  | Monotonic
  | Acquire
  | Release
  | Acq_rel
  | Seq_cst

type landingpad =
  | Catch  of typ * value
  | Filter of typ * value

type binop =
  | Xchg
  | Add
  | Sub
  | And
  | Nand
  | Or
  | Xor
  | Max
  | Min
  | Umax
  | Umin

type instr_metadata = (string * value) list

type instr =
  | Add            of bool * bool * (typ * value) * value * instr_metadata
  | Sub            of bool * bool * (typ * value) * value * instr_metadata
  | Mul            of bool * bool * (typ * value) * value * instr_metadata
  | Shl            of bool * bool * (typ * value) * value * instr_metadata
  | Fadd           of fast_math_flag list * (typ * value) * value * instr_metadata
  | Fsub           of fast_math_flag list * (typ * value) * value * instr_metadata
  | Fmul           of fast_math_flag list * (typ * value) * value * instr_metadata
  | Fdiv           of fast_math_flag list * (typ * value) * value * instr_metadata
  | Frem           of fast_math_flag list * (typ * value) * value * instr_metadata
  | Sdiv           of bool * (typ * value) * value * instr_metadata
  | Udiv           of bool * (typ * value) * value * instr_metadata
  | Lshr           of bool * (typ * value) * value * instr_metadata
  | Ashr           of bool * (typ * value) * value * instr_metadata
  | Urem           of (typ * value) * value * instr_metadata
  | Srem           of (typ * value) * value * instr_metadata
  | And            of (typ * value) * value * instr_metadata
  | Or             of (typ * value) * value * instr_metadata
  | Xor            of (typ * value) * value * instr_metadata
  | Icmp           of I.t * (typ * value) * value * instr_metadata
  | Fcmp           of F.t * (typ * value) * value * instr_metadata
  | Trunc          of (typ * value) * typ * instr_metadata
  | Zext           of (typ * value) * typ * instr_metadata
  | Sext           of (typ * value) * typ * instr_metadata
  | Fptrunc        of (typ * value) * typ * instr_metadata
  | Fpext          of (typ * value) * typ * instr_metadata
  | Bitcast        of (typ * value) * typ * instr_metadata
  | Addrspacecast  of (typ * value) * typ * instr_metadata
  | Uitofp         of (typ * value) * typ * instr_metadata
  | Sitofp         of (typ * value) * typ * instr_metadata
  | Fptoui         of (typ * value) * typ * instr_metadata
  | Fptosi         of (typ * value) * typ * instr_metadata
  | Inttoptr       of (typ * value) * typ * instr_metadata
  | Ptrtoint       of (typ * value) * typ * instr_metadata
  | Va_arg         of (typ * value) * typ * instr_metadata
  | Getelementptr  of bool * (typ * value) list * instr_metadata
  | Extractelement of (typ * value) list * instr_metadata
  | Insertelement  of (typ * value) list * instr_metadata
  | Shufflevector  of (typ * value) list * instr_metadata
  | Select         of (typ * value) list * instr_metadata
  | Phi            of typ * (value * value) list * instr_metadata
  | Landingpad     of typ * (typ * value) * bool * landingpad list * instr_metadata
  | Call           of bool * callingconv option * return_attribute list * typ * value * (typ * param_attribute list * value) list * call_attribute list * instr_metadata
  | Alloca         of bool * typ * (typ * value) option * int option * instr_metadata
  | Load           of bool * bool * (typ * value) * (bool * ordering) option * int option * instr_metadata
  | Store          of bool * bool * (typ * value) * (typ * value) * (bool * ordering) option * int option * instr_metadata
  | Cmpxchg        of bool * (typ * value) * (typ * value) * (typ * value) * bool * ordering * ordering * instr_metadata
  | Atomicrmw      of bool * binop * (typ * value) * (typ * value) * bool * ordering * instr_metadata
  | Fence          of bool * ordering * instr_metadata
  | Extractvalue   of (typ * value) * int list * instr_metadata
  | Insertvalue    of (typ * value) * (typ * value) * int list * instr_metadata
      (* terminator instructions *)
  | Unreachable    of instr_metadata
  | Return         of (typ * value) option * instr_metadata
  | Br             of (typ * value) *  ((typ * value) * (typ * value)) option * instr_metadata
  | Indirectbr     of (typ * value) * (typ * value) list * instr_metadata
  | Resume         of (typ * value) * instr_metadata
  | Switch         of (typ * value) * (typ * value) * ((typ * value) * (typ * value)) list * instr_metadata
  | Invoke         of callingconv option * return_attribute list * typ * value * ((typ * param_attribute list * value) list) * function_attribute list * (typ * value) * (typ * value) * instr_metadata



(*
 *  Compilation Units
 *)

open Llvm
 
type linkage =
  | Extern_weak
  | External
  | Private
  | Internal
  | Weak
  | Weak_odr
  | Linkonce
  | Linkonce_odr
  | Available_externally
  | Appending
  | Common

type visibility =
  | Default
  | Hidden
  | Protected

type dll_storageclass =
  | Dllimport
  | Dllexport

type aliasee =
  | A_bitcast       of (typ * value) * typ
  | A_getelementptr of bool * (typ * value) list
  | A_typ_value     of (typ * value)


(*
 * Symbol tables, aka contexts: map vars to types
 * - each function has a context
 * - each compilation unit has both a
 *   local (for e.g. types) and a global context.
 *)
type vtbl = (var, typ) Hashtbl.t

(* blocks *)
type binfo = {
  mutable bname: var;
  mutable binstrs: (var option * instr) list;
  mutable bseen: bool
}

(*
 * Edge in the control flow graph.
 * Given a block b, we keep track of its predecessors
 * (i.e., the blocks that end with a branch instructions to b)
 * and the conditions under which the branch is taken.
 *
 * Conditions:
 *   Uncond             --> no conditions (i.e., the condition is true)
 *   Eq tau, var, const --> var == const (and both var and const have type tau)
 *   Distinct tau, var, [c1, ..., c_n]  --> (var != c1 & var != c2 & ... & var != c_n)
 *
 * These conditions are enough to handle the br and switch instructions.
 *
 * For invoke and indirect branch, we label the condition as Unsupported.
  *
 * An edge is a pair (source, condition) where source is the name of source block.
 *)
type cfg_condition = 
  | Uncond
  | Eq of typ * value * value
  | Distinct of typ * value * value list
  | Unsupported

type cfg_edge = var * cfg_condition

type cfg_predecessors = (var, cfg_edge) Hashtbl.t


(*
 * predecessors:
 *
 * Each pair in the hashtable is an edge in the cfg.
 * Each edge is of the form: target_block to source_block.
 * In other words edge stores the reverse of control flow.
 *
 * In the hashtable, the key is the target name and the
 * value is the source block name.
 *
 * successors:
 *
 *  The inverse of predecessors.
 *  
 *)

type neighbors = (var, var) Hashtbl.t


(*
 * Function parameters:
 * the boolean flag is to support functions with variable numbers
 * of arguments (varargs stuff):
 * - if the flag is true, the parameter list ends with ... (variadic function)
 *)
type function_parameters = (typ * param_attribute list * var option) list * bool

(* functions *)
type finfo = {
  fcounter: int ref;  (* counter used to produce local variables and types *)
  context: vtbl;      (* local symbol table *)
  predecessors: neighbors;
  successors: neighbors;
  cfg_table: cfg_predecessors;
  mutable flinkage: linkage option;
  mutable fvisibility: visibility option;
  mutable fstorageclass: dll_storageclass option;
  mutable fcallingconv: callingconv option;
  mutable freturnattrs: return_attribute list;
  mutable freturntyp: typ;
  mutable fname: var;
  mutable fparams: function_parameters;
  mutable funnamed_addr: bool;
  mutable fattrs: function_attribute list;
  mutable fsection: string option;
  mutable falign: int option;
  mutable fgc: string option;
  mutable fprefix: (typ * value) option;
  mutable fblocks: binfo list;
}

type thread_local =
  | Localdynamic
  | Initialexec
  | Localexec

(* global variables *)
type ginfo = {
  mutable gname: var;
  mutable glinkage: linkage option;
  mutable gvisibility: visibility option;
  mutable gstorageclass: dll_storageclass option;
  mutable gthread_local: thread_local option option;
  mutable gaddrspace: int option;
  mutable gunnamed_addr: bool;
  mutable gexternally_initialized: bool;
  mutable gconstant: bool;
  mutable gtyp: typ; (* actual type of the global is a pointer to this type *)
  mutable gvalue: value option;
  mutable gsection: string option;
  mutable galign: int option;
}

(* aliases *)
type ainfo = {
  aname: var;
  avisibility: visibility option;
  alinkage: linkage option;
  aaliasee: aliasee
}

(* metadata *)
type mdinfo = {
  mdid: int;
  mdtyp: typ;
  mdcontents: (typ * value) option list;
}

(* compilation unit *)
type cunit = {
  gcontext: vtbl; (* symbol table for global symbols *)
  lcontext: vtbl; (* symbols local to the cu (e.g., types and structs) *)
  dl: Dl.datalayout;  (* deconstruction of the (c)datalayout string  *)
  mutable cdatalayout: string option;
  mutable ctarget: string option;
  mutable casms: string list;
  mutable ctyps: (var * typ option) list;
  mutable cglobals: ginfo list;
  mutable caliases: ainfo list;
  mutable cfuns: finfo list;
  mutable cattrgrps: (int * attribute list) list;
  mutable cmdvars: (string * int list) list;
  mutable cmdnodes: mdinfo list;
}

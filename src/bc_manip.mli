(*
 * LLVM bitcode post parsing processing tools.
 *)

(*
 * Goes through all the function definitions in the cunit and makes sure each finfo.fcounter is correct.
 * This is necessary because C++ has unnamed parameters, and these get replaced by %0, %1, .... %n.
 *  (So we can't assume that the first block of every function has label %0).
 *)
val process_params: Bc.cunit -> unit


(*
 * Assign a label to every block.
 *
 * Blocks may not have explicit names (labels) when parsed.  Any
 * unnamed block is assigned name Id(false,-1) by the parser.  This
 * function finds a correct name.
 * 
 * Must be called after process_params.
 *)
val assign_block_numbers: Bc.cunit -> unit

(*
 * Contexts + global variable table
 * - each compilation units has two symbol tables:
 *   the gcontext stores type information for all the global variables
 *   the lcontext stores type definitions local the unit (for local
 *   types and structs)
 * - each function unit also has a local symbol table (context)
 *   that stores the type information for all the variables local to
 *  the function.
 *
 * Function assign_vartyps fills in these tables.
 * Function typ_of_var queries the type of a variable by reading these tables.
 *)

val assign_vartyps: Bc.cunit -> unit


(*
 * (typ_of_var c f v) --> type of variable v 
 * v must be defined in function f or module c.
 *
 * If v is a global name, this looks in c.gcontext.
 * If v is a local name, this looks first in f.context 
 * then in c.lcontext.
 *
 * Fails with an exception if v is not found in
 * any of these tables.
 *)
val typ_of_var: Bc.cunit -> Bc.finfo -> Llvm.var -> Llvm.typ

(*
 * value_to_var t --> checks whether t is a var or basicbloack 
 * name and returns the name.
 *
 * Fails with an exception if t is not a var or basicblock.
 *)
val value_to_var: Llvm.value -> Llvm.var

(*
 * Compute the cfg predecessor and successor tables of each funit in 
 * a compilation unit.
 *)
val compute_cfg_neighbors: Bc.cunit -> unit

val get_cfg_predecessors: Bc.finfo -> Llvm.var -> Bc.cfg_edge list 

val get_cfg_successors: Bc.finfo -> Llvm.var -> Bc.cfg_edge list 

val get_predecessors: Bc.finfo -> Llvm.var -> Llvm.var list 
    
val get_successors: Bc.finfo -> Llvm.var -> Llvm.var list

(*
 * Get a block given its name.
 *)
val lookup_block: Bc.finfo -> Llvm.var -> Bc.binfo
    

(*
 *  Compute the ranks of the blocks (rank = maximum length of path without a cycle.
 *)
val set_ranks: Bc.finfo -> unit


(*
 * Name of the entry condition of the i-th block in a finfo
 * - first argument = name of the function
 * - second argument = integer index
 *)
val get_entry_condition_name: string -> int -> string

(*
 *
 * Returns a list of all the currently unseen predecessors of the block.
 *
 *)
val get_predecessor_block_list: Bc.finfo -> Bc.binfo -> Bc.binfo list


(*
 * Check whether typ is a vector type
 * - cu, fu: compilation/function
 *)
val is_vector_typ: Bc.cunit -> Bc.finfo -> Llvm.typ -> bool

(*
 * Decompose a vector type:
 * - index_width = smallest k such that 2^k >= number of elements in the vector
 * - range = type of the vector elements
 *) 
val vector_index_width: Bc.cunit -> Bc.finfo -> Llvm.typ -> int

val vector_typ_range: Bc.cunit -> Bc.finfo -> Llvm.typ -> Llvm.typ

val deconstruct_vector_typ: Bc.cunit -> Bc.finfo -> Llvm.typ -> (int * Llvm.typ)

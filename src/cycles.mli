open Graph
  
module G = Pack.Digraph

(*
 * This creates the digraph associated with the finfo.
 *
 * The nodes in the digraph are indexed by integers,
 * as are the blocks.
 *
 * The index of a block is its position in fu.fblocks.
 *
 * The edges in the digraph are the successors:
 * i.e. the index of the source block to the index of
 * the successor block.
 *
 *)
val fu_to_graph: Bc.finfo -> G.t


(*
 * Prints the cycles out to the buffer as a comment. For example:
 *
 *  ;; Function @lhs contains 1 cycle
 *  ;; %4 -> %14 -> %22 -> 
 *  ;;
 *
 *)
val show_cycles: Buffer.t -> Bc.finfo -> G.V.t list list -> unit

(*
 *
 * Returns the list of backwards edges, each edge going from the last element node
 * in the cycle to the first element in the cycle.
 *
 *)
val cycles_to_edges: Bc.finfo -> G.V.t list list -> (Llvm.var * Llvm.var) list
    

    
    

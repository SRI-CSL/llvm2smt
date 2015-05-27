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
 *   Prints a node in the graph
 *)
val print_node: Bc.finfo -> G.V.t -> unit

(* 
 * Retreives the block associated with the node
 *)

val node_to_block: Bc.finfo -> G.V.t -> Bc.binfo
  



    
    

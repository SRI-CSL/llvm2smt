(* graph playground *)

open Graph
open Bc
   

module G = Pack.Digraph

(*
 * The nodes in the digraph are integers.
 * The index of a block is its position in fu.fblocks.
 * This hashtbl maps the block name v to its index.
 *
 *)
let create_indices fu n =
  let indices = Hashtbl.create n in
    for i=0 to n - 1 do
      Hashtbl.add indices (List.nth fu.fblocks i).bname  i;
    done;
    indices
      
(*
 * This creates the digraph associated with the finfo.
 * The nodes in the digraph are the indexes of the blocks 
 * The edges in the digraph are the successors, viewed
 * i.e. the index of the source block to the index of
 * the successor block.
 *
 *)
      
    
let fu_to_graph fu =
  (* the number of blocks a.k.a nodes *)
  let nodecount = (List.length fu.fblocks) in
    (* maps the name of the block to its index *)
  let indices = create_indices fu nodecount in
  let nodes = Array.init nodecount G.V.create in
  let edges = fu.successors in
  let g = (G.create ?size:(Some(Hashtbl.length edges)) ()) in
  let get_index = (fun v -> nodes.(Hashtbl.find indices v)) in
  let add_edge = (fun v0 v1 -> (G.add_edge g (get_index v0) (get_index v1))) in
    Hashtbl.iter add_edge  edges;
    g
      
      

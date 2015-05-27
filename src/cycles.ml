(* graph construction *)

open Graph
open Bc
   

module G = Pack.Digraph


let node_to_block fu node =  (List.nth fu.fblocks (G.V.label node))
			   
let int_to_blockname fu i = (List.nth fu.fblocks i).bname
  
(*
 *
 * This hashtbl maps the block name v to its index.
 *
 *)
let create_indices fu n =
  let indices = Hashtbl.create n in
    List.iter (fun blk -> Hashtbl.add indices blk.bname blk.bindex) fu.fblocks;
    indices

let print_node fu e =
  Printf.eprintf "node %s [%s]\n" (Llvm_pp.string_of_var fu.fname) (Llvm_pp.string_of_var (int_to_blockname fu (G.V.label e)))

      
let fu_to_graph fu =
  (* the number of blocks a.k.a nodes *)
  let nodecount = (List.length fu.fblocks) in
  (* maps the name of the block to its index *)
  let indices = create_indices fu nodecount in
  let nodes = Array.init nodecount G.V.create in
  let edges = fu.successors in
  let g = (G.create ?size:(Some(Hashtbl.length edges)) ()) in
  let get_index = (fun v -> nodes.(Hashtbl.find indices v)) in
  let add_edge = (fun v0 v1 -> (G.add_edge g (get_index v0)(get_index v1))) in
    Hashtbl.iter add_edge  edges;
    g


    
		

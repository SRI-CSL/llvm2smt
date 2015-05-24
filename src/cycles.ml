(* graph playground *)

open Graph
open Bc
open ExtString
   

module G = Pack.Digraph


let int_to_blockname fu i = (List.nth fu.fblocks i).bname
  
	     
(*
 *
 * The nodes in the digraph are indexed by integers,
 * as are the blocks.
 *
 * The index of a block is its position in fu.fblocks.
 *
 * This hashtbl maps the block name v to its index.
 *
 *)
let create_indices fu n =
  let indices = Hashtbl.create n in
    for i=0 to n - 1 do
      let v = int_to_blockname fu i in
	(* Printf.eprintf "%s <-> %d\n" (Llvm_pp.string_of_var v) i; *)
	Hashtbl.add indices  v i;
    done;
    indices
      
(*
 * This creates the digraph associated with the finfo.
 * The nodes in the digraph are labeled by the indexes of the blocks 
 * The edges in the digraph are the successors:
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
  let add_edge = (fun v0 v1 -> (G.add_edge g (get_index v0)(get_index v1))) in
    Hashtbl.iter add_edge  edges;
    g


let show_cycles b fu ll =
  Printf.bprintf  b ";; Function %s contains %d cycles\n" (Llvm_pp.string_of_var fu.fname) (List.length ll);
  let show_cycle l = 
    Printf.bprintf b ";; ";
    List.iter (fun e -> (Printf.bprintf b "%s -> " (Llvm_pp.string_of_var (int_to_blockname fu (G.V.label e))))) l;
    Printf.bprintf b "\n" in
    List.iter show_cycle ll
    
    
let cycle_to_edge fu l =
  let len = List.length l in
  let first = List.nth l 0 in
  let last = List.nth l (len - 1) in
    ((int_to_blockname fu (G.V.label last)), (int_to_blockname fu (G.V.label first)))
       
let cycles_to_edges fu ll =
  List.map (fun l -> cycle_to_edge fu l) ll;
  
    
		

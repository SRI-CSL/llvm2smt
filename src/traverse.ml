(*
 * Test of traversal strategies
 *)

open Graph
open Bc   

module Vertex =
  struct
    type t = Bc.binfo
    let equal b1 b2 = b1.bindex == b2.bindex
    let hash b1 = b1.bindex
    let compare b1 b2 = Pervasives.compare b1.bindex b2.bindex (* b1.brank b2.brank *)
  end

module GG = Imperative.Digraph.Concrete(Vertex)

module Dfs = Traverse.Dfs(GG)

(* module TopSort = Topological.Make(GG) *)

let print_node fu e =
  Printf.eprintf "node %s [%s] rank = %d\n" (Llvm_pp.string_of_var fu.fname) (Llvm_pp.string_of_var e.bname) e.brank

let print_edge fu e0 e1 =
  Printf.eprintf "edge %s [%s] rank = %d --> [%s] rank = %d\n" (Llvm_pp.string_of_var fu.fname) (Llvm_pp.string_of_var e0.bname) e0.brank (Llvm_pp.string_of_var e1.bname) e1.brank

let fu_to_graph fu = 
  let graph = GG.create () in
  let lookup = Bc_manip.lookup_block fu in
  let add_edge = (fun b0 b1 ->
		    let blk0 = (lookup b0) in
		    let blk1 = (lookup b1) in 
		      print_edge fu blk0 blk1;
		      (GG.add_edge graph (lookup b0) (lookup b1))
		 ) in
    Hashtbl.iter add_edge fu.successors;
    graph

      

let node_to_block node = node

let index_to_block fu i = List.nth fu.fblocks i


let rec set_rank_aux fu node stack current =
  begin
    if node.brank < current
    then
      node.brank <- current;
    List.iter
      (fun pred ->
	 if not (List.mem pred.bindex stack)
	 then
	   (set_rank_aux fu pred (pred.bindex :: stack) (current + 1)))
      (List.map (Bc_manip.lookup_block fu) (Bc_manip.get_successors fu  node.bname))
  end
  

let set_ranks fu =
  let root = List.nth fu.fblocks 0 in 
    set_rank_aux fu root [ root.bindex ] 1;
    (* List.iter (print_node fu) fu.fblocks *)
      

    

      

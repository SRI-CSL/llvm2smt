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
    let compare b1 b2 = b1.bindex - b2.bindex
  end

module GG = Imperative.Digraph.Concrete(Vertex)

module Dfs = Traverse.Dfs(GG)

(* module TopSort = Topological.Make(GG) *)

let fu_to_graph fu = 
  let graph = GG.create () in
  let lookup = Bc_manip.lookup_block fu in
  let add_edge = (fun b0 b1 -> (GG.add_edge graph (lookup b0) (lookup b1))) in
    Hashtbl.iter add_edge fu.successors;
    graph


let print_node fu e =
  Printf.eprintf "node %s [%s] rank = %d\n" (Llvm_pp.string_of_var fu.fname) (Llvm_pp.string_of_var e.bname) e.brank

let node_to_block node = node

let index_to_block fu i = List.nth fu.fblocks i


(*
 * Assign a rank to all nodes
 *)
let fu_to_reverse_graph fu =
  let graph = GG.create () in
  let lookup = Bc_manip.lookup_block fu in
  let add_edge = (fun b0 b1 -> (GG.add_edge graph (lookup b0) (lookup b1))) in
    Hashtbl.iter add_edge fu.predecessors;
    graph

let rank fu v =
  let rec max_rank l = 
    match l with
      | [] -> 0
      | (h::tl) -> max h.brank (max_rank tl)
  in
    v.brank <- 1 + max_rank (List.map (Bc_manip.lookup_block fu) (Bc_manip.get_predecessors fu v.bname))

let set_ranks fu =
  let graph = fu_to_reverse_graph fu in
    Dfs.postfix (rank fu) graph;
    List.iter (print_node fu) fu.fblocks



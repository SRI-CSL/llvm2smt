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

let fu_to_gg fu = 
  let graph = GG.create () in
  let lookup = Bc_manip.lookup_block fu in
  let add_edge = (fun b0 b1 -> (GG.add_edge graph (lookup b0) (lookup b1))) in
    Hashtbl.iter add_edge fu.successors;
    graph


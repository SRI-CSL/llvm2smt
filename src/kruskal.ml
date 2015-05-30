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

module Edge = struct
  type t = int
  let compare = Pervasives.compare
  let default = 1
end
	     

module W = struct
  type t = int
  type label = int
  let compare  = Pervasives.compare 
end
 
  
module DG = Imperative.Digraph.ConcreteLabeled(Vertex)(Edge)

module K = Kruskal.Make(DG)(W)


	     
let fu_to_graph fu = 
  let graph = DG.create () in
  let lookup = Bc_manip.lookup_block fu in
  let add_edge = (fun b0 b1 -> (DG.add_edge graph (lookup b0) (lookup b1))) in
    Hashtbl.iter add_edge fu.successors;
    graph



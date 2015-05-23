(* graph playground *)

open Graph
open Bc
   

module G = Pack.Digraph

let fu_to_graph fu =
  let g = (G.create ?size:(Some(List.length fu.fblocks)) ()) in
    g

      

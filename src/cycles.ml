(* graph playground *)

open Graph

module G = Pack.Digraph

let fu_to_graph fu =
  let g = G.create (List.length fu.fblocks) () in
    g

      

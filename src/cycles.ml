(* graph playground *)

open Graph
open Bc
   

module G = Pack.Digraph

let create_indices fu n =
  let indices = Hashtbl.create n in
    for i=0 to n - 1 do
      Hashtbl.add indices (List.nth fu.fblocks i).bname  i;
    done;
    indices
      
      
  
	     
	     
let fu_to_graph fu =
  (* the number of blocks a.k.a nodes *)
  let nodecount = (List.length fu.fblocks) in
    (* maps the name of the block to its index *)
  let indices = create_indices fu nodecount in
  let nodes = Array.init nodecount G.V.create in
  let edges = fu.successors in
  let g = (G.create ?size:(Some(Hashtbl.length edges)) ()) in


    
    Hashtbl.iter (fun v0 v1 -> (G.add_edge g nodes.(Hashtbl.find indices v0) nodes.(Hashtbl.find indices v1)))  edges;
    g

      

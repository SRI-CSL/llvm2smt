open Graph
  
module G = Pack.Digraph

val fu_to_graph: Bc.finfo -> G.t

val show_cycles: Bc.finfo -> G.V.t list list -> unit
	
    

open Graph
  
module G = Pack.Digraph

val fu_to_graph: Bc.finfo -> G.t

val show_cycles: Buffer.t -> Bc.finfo -> G.V.t list list -> unit

val cycles_to_edges: Bc.finfo -> G.V.t list list -> (Llvm.var * Llvm.var) list
    

    
    

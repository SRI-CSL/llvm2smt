open Graph
  
module Vertex : Sig.COMPARABLE

module GG :  Sig.I

val fu_to_graph: Bc.finfo -> GG.t

val print_node: Bc.finfo -> GG.V.t -> unit

val node_to_block:  GG.V.t -> Bc.binfo

      

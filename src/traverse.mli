open Graph

module Vertex : Sig.COMPARABLE

module GG :  Sig.I

val fu_to_graph: Bc.finfo -> GG.t

val print_node: Bc.finfo -> GG.V.t -> unit

(*
 * NOTE: fix this. We're missing the info that GG.V.t is the same as Bc.info.
 *)
val node_to_block:  GG.V.t -> Bc.binfo

val index_to_block: Bc.finfo -> int -> Bc.binfo

val set_ranks: Bc.finfo -> unit
      

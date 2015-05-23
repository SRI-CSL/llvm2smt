open Graph
  
module G = Pack.Digraph

(*
 * We use an implementation of: 
 *
 * Finding all the elementary circuits of a directed graph.
 * D. B. Johnson, SIAM Journal on Computing 4, no. 1, 77-84, 1975.
 * http://dx.doi.org/10.1137/0204007
 *
 * which is an improvement on Tarjan's early algorithm.
 *
 * See:
 *
 * http://mancoosi.org/~abate/finding-all-elementary-circuits-directed-graph
 *
 * and
 *
 * https://github.com/josch/cycles_johnson_abate
 *
 * and
 *
 * https://blog.mister-muffin.de/2012/07/04/enumerating-elementary-circuits-of-a-directed_graph/
 *
 * 
 *)

val find_all_cycles: G.t -> G.V.t list list

    

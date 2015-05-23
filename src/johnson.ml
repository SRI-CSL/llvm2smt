(**************************************************************************)
(*  Copyright (C) 2012 Pietro Abate <pietro.abate@pps.jussieu.fr>         *)
(*  Copyright (C) 2012 Johannes Schauer <j.schauer@email.de>              *)
(*                                                                        *)
(*  This library is free software: you can redistribute it and/or modify  *)
(*  it under the terms of the GNU Lesser General Public License as        *)
(*  published by the Free Software Foundation, either version 3 of the    *)
(*  License, or (at your option) any later version.                       *)
(**************************************************************************)

open Graph
open ExtLib
open ExtString
   

module G = Pack.Digraph

let find_all_cycles g =
  if not G.is_directed then
    assert false;
  (*  stack of nodes in current path *)
  let path = Stack.create () in
    (* vertex: blocked from search *)
  let blocked = Hashtbl.create 1023 in
    (* graph portions that yield no elementary circuit *)
  let b = Hashtbl.create 1023 in
    (* list to accumulate the circuits found  *)
  let result = ref [] in
    
  let rec unblock n =
    if Hashtbl.find blocked n then begin
      Hashtbl.replace blocked n false;
      List.iter unblock (Hashtbl.find b n);
      Hashtbl.replace b n [];
    end
  in
    
  let stack_to_list s = 
    let l = ref [] in
      Stack.iter (fun e -> l:= e::!l) s;
      !l
  in

  let rec circuit thisnode startnode component = 
    let closed = ref false in
      Stack.push thisnode path;
      Hashtbl.replace blocked thisnode true;
      G.iter_succ (fun nextnode ->
		     if G.V.equal nextnode startnode then begin
		       result := ((stack_to_list path))::!result;
		       closed := true;
		     end else begin if not(Hashtbl.find blocked nextnode) then
		       if circuit nextnode startnode component then begin
			 closed := true;
		       end
		     end
		  ) component thisnode;
      if !closed then begin
	unblock thisnode
      end
      else
	G.iter_succ (fun nextnode ->
		       let l = Hashtbl.find b nextnode in
			 if not(List.mem thisnode l) then
			   Hashtbl.replace b nextnode (thisnode::l)
		    ) component thisnode;
      ignore(Stack.pop path);
      !closed
  in
  let module SV = Set.Make(G.V) in
  let extract_subgraph g s =
    let sg = G.create () in
      List.iter (fun v1 ->
		   G.add_vertex sg v1;
		   List.iter (fun e ->
				let v2 = G.E.dst e in
				  if List.mem v2 s then
				    G.add_edge_e sg e
			     ) (G.succ_e g v1)
		) s;
      sg
  in
    (* Johnson's algorithm requires some ordering of the nodes. 
     * They might not be sortable so we assign an arbitrary ordering. 
     *)
  let scc_with_vertex g v =
    let _,scc = G.Components.scc g in
    let n = scc v in
    let sg = G.create () in
      G.iter_vertex (fun v1 ->
		       if (scc v1) = n then
			 List.iter (fun e ->
				      if scc (G.E.dst e) = n then
					G.add_edge_e sg e
				   ) (G.succ_e g v1)
		    ) g;
      sg
  in
    
  let list_min = function
    | [] -> invalid_arg "empty list"
    | h::tl -> List.fold_left min h tl
  in
    
  let sort_components a b =
    compare (list_min a) (list_min b)
  in
    
  let non_degenerate_scc = List.filter (fun scc -> (List.length scc) > 1) (G.Components.scc_list g) in
    
  let non_degenerate_subgraphs =
    List.map
      (fun scc -> extract_subgraph g scc)
      (List.sort ~cmp:sort_components non_degenerate_scc)
  in

    List.iter (fun g ->
		 let vertex_set = G.fold_vertex (fun v l -> v::l) g [] in
		   List.iter (fun s ->
				let component = scc_with_vertex g s in
				  if G.nb_edges component > 0 then begin
				    G.iter_vertex (fun node ->
						     Hashtbl.replace blocked node false;
						     Hashtbl.replace b node [];
						  ) component;
				    ignore(circuit s s component);
				  end;
				  G.remove_vertex g s;
			     ) (List.sort vertex_set);
	      ) non_degenerate_subgraphs;
    
    List.rev !result
      
      
      
    
 

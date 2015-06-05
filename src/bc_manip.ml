open Llvm
open Bc


  
let x_count = ref 0
let bl_count = ref 0
let bl_tbl : (var, int) Hashtbl.t = Hashtbl.create 11
let vartyp_tbl : (var, typ) Hashtbl.t = Hashtbl.create 11
let initialized = ref false
let muxes : (var * var * string) list ref = ref []
let add_mux x = muxes := x::!muxes
let get_muxes() = !muxes
let bl_bits = ref 32
let get_bl_bits() = !bl_bits

let v_map = function
  | Name(true, n) -> "@"^n
  | Name(false, n) -> "%"^n
  | Id(true, n) -> "@"^(string_of_int n)
  | Id(false, n) -> "%"^(string_of_int n)


let is_global = function
  | Name(b, _) -> b
  | Id(b, _) -> b

let is_local v = not (is_global v)

(*
 * Add type of var in table
 *)
let add_vartyp table var typ =
  if Hashtbl.mem table var then
    Printf.eprintf
      "Warning: more than one type for %s in symbol table:\n\told = %s\n\tnew = %s\n"
      (Llvm_pp.string_of_var var)
      (Llvm_pp.string_of_typ (Hashtbl.find table var))
      (Llvm_pp.string_of_typ typ);
  Hashtbl.add table var typ

let global_add_vartype cu var typ =
  add_vartyp (if is_global var then cu.gcontext else cu.lcontext) var typ

let local_add_vartype table var typ =
  assert(is_local var);
  add_vartyp table var typ


(*
 * Lookup the type of var either in the cu's local or global symbol tables 
 * or in the finfo's local table.
 *
 * Note: some 'local' identifiers (i.e., start with %) have global scope (they are in the cu).
 * For example, we get stuff like
 *   %struct.lexer_s = type { ... }
 * in yices_main.ll
 *)
let typ_of_var cu finfo var =
  try 
    (match var with
       | Name(true,_) 
       | Id(true,_) -> Hashtbl.find cu.gcontext var
       | Name(false,_) 
       | Id(false,_) -> 
	   if Hashtbl.mem finfo.context var then 
	     Hashtbl.find finfo.context var 
	   else
	     Hashtbl.find cu.lcontext var)
  with
      Not_found ->
	  (* Void *)
	failwith("Could not find the type of " ^ (Llvm_pp.string_of_var var) ^ " in  " ^  (Llvm_pp.string_of_var finfo.fname)) 

(*

  Blocks may not have explicit names (labels) when parsed.  Any
  unnamed block is assigned name Id(false,-1) by the parser.  This
  function finds a correct name.
  
*)
let assign_block_numbers cu =
  let number_blocks f =
    let number_block n (name, instrs) =
      let rec max n = function
        | [] -> n
        | hd::tl -> if n>hd then max n tl else max hd tl in
      let instr_numbers =
        List.concat
          (List.map
             (function
		| (Some(Id(false, x)), _) -> [x]
		| _ -> [])
             instrs) in
	match name with
	  | Id(false,-1) -> Id(false, n), max n instr_numbers + 1
	  | _ -> name, if instr_numbers = [] then n else max n instr_numbers + 1 in
    let num = f.fcounter in  (*  iam: f.fcounter needs to be AFTER the params have been processed. *)
    let indexref = ref 0 in 
      f.fblocks <-
      List.map
        (fun {bname=name; binstrs=instrs; bseen=seen; bindex=index; } ->
           let name', num' = number_block !num (name, instrs) in
	   let i = !indexref in 
	   let blk = {bname=name'; binstrs=instrs; bseen=seen; bindex=i; brank=0; } in 
             num := num';
	     indexref := i + 1;
	     blk;
        )
        f.fblocks in
    List.iter number_blocks cu.cfuns;
    ()
    

let assign_vartyps_instr locals ctyps (nopt, i) =
  let typ =
    let typ_of (t,v) = t in
    (match i with
    | Add(nuw, nsw, x, y, md) -> typ_of x
    | Sub(nuw, nsw, x, y, md) -> typ_of x
    | Mul(nuw, nsw, x, y, md) -> typ_of x
    | Shl(nuw, nsw, x, y, md) -> typ_of x
    | Fadd(fmf, x, y, md)     -> typ_of x
    | Fsub(fmf, x, y, md)     -> typ_of x
    | Fmul(fmf, x, y, md)     -> typ_of x
    | Fdiv(fmf, x, y, md)     -> typ_of x
    | Frem(fmf, x, y, md)     -> typ_of x
    | Sdiv(e, x, y, md)       -> typ_of x
    | Udiv(e, x, y, md)       -> typ_of x
    | Lshr(e, x, y, md)       -> typ_of x
    | Ashr(e, x, y, md)       -> typ_of x
    | Urem(x, y, md)          -> typ_of x
    | Srem(x, y, md)          -> typ_of x
    | And (x, y, md)          -> typ_of x
    | Or  (x, y, md)          -> typ_of x
    | Xor (x, y, md)          -> typ_of x
    | Icmp(icmp, x, y, md)    -> Integer 1
    | Fcmp(fcmp, x, y, md)    -> Integer 1
    | Trunc(x, y, md)         -> y
    | Zext(x, y, md)          -> y
    | Sext(x, y, md)          -> y
    | Fptrunc(x, y, md)       -> y
    | Fpext(x, y, md)         -> y
    | Bitcast(x, y, md)       -> y
    | Addrspacecast(x, y, md) -> y
    | Uitofp(x, y, md)        -> y
    | Sitofp(x, y, md)        -> y
    | Fptoui(x, y, md)        -> y
    | Fptosi(x, y, md)        -> y
    | Inttoptr(x, y, md)      -> y
    | Ptrtoint(x, y, md)      -> y
    | Va_arg(x, y, md)        -> y
    | Getelementptr(inbounds, x, md) ->
        (match x with
        | (Pointer(ety,aspace),_)::tl ->
            let ety = Arraytyp(1,ety) in (* This is the key to understanding gep --- ety should start out as an Array *)
            let rec loop ety = function
              | [] -> ety
              | (ytyp,y)::tl ->
                  (match ety with
                  | Arraytyp(_,ety') ->
                      (* assume that y is in-bounds *)
                      loop ety' tl
                  | Structtyp(_,field_typs) ->
                      (match y with
                      | Int i ->
                          let ety' =
                            (try List.nth field_typs (Big_int.int_of_big_int i)
                            with _ -> failwith "getelementptr: out-of-bounds struct field selection") in
                          loop ety' tl
                      | _ -> failwith "getelementptr: non-int selector for struct field")
                  | Vartyp v ->
                      let ety' =
                        try
                          match List.assoc v ctyps with
                          | None -> failwith ("getelementptr: opaque type "^(Llvm_pp.string_of_var v))
                          | Some typ -> typ
                        with _ -> failwith ("getelementptr: unknown type "^(Llvm_pp.string_of_var v)) in
                      loop ety' ((ytyp,y)::tl)
                  | _ ->
                      failwith "getelementptr: pointer does not point into an array or struct") in
            Pointer(loop ety tl,aspace)
        | _ -> failwith "getelementptr: must be applied to a pointer")
    | Shufflevector([(Vector(_,typ),_);_;(Vector(m,_),_)], md) -> Vector(m,typ)
    | Insertelement([(typ,_);_;_], md) -> typ
    | Extractelement([(Vector(_,typ),_);_], md ) -> typ
    | Select([_;(typ,_);_], md) -> typ
    | Phi(typ, incoming, md) -> typ
    | Landingpad(x, y, z, w, md) -> x
    | Call(is_tail_call, callconv, retattrs, callee_ty, callee_name, operands, callattrs, md) -> callee_ty
    | Alloca(x, y, z, w, md) -> Pointer(y, None)
    | Load(x, y, (Pointer(typ,_), z), w, v, md) -> typ
    | Store(x, y, z, w, v, u, md) -> typ_of z
    | Cmpxchg(x, y, z, w, v, u, t, md) -> typ_of z
    | Atomicrmw(x, y, z, w, v, u, md) -> typ_of w
    | Fence(x, y, md) -> Void
    | Extractvalue((typ,_), y, md) ->
        let rec loop = function
          | typ, [] -> typ
          | Structtyp(_,l), hd::tl ->
              if hd < 0 || hd >= List.length l then failwith "extractvalue struct index out of range" else
              let typ = List.nth l hd in
              loop (typ, tl)
          | Arraytyp(len,typ), hd::tl ->
              if hd < 0 || hd >= len then  failwith "extractvalue array index out of range" else
              loop (typ, tl)
          | _ -> failwith "extractvalue: not a struct or array" in
        loop (typ, y)
    | Insertvalue(x, y, z, md) -> typ_of x
    | Unreachable md -> Void
    | Return(None, md) -> Void
    | Return(Some(x, y), md) -> Void
    | Br(x, None, md) -> Void
    | Br(x, Some(y, z), md) -> Void
    | Indirectbr(x, y, md) -> Void
    | Resume(x, md) -> Void
    | Switch(x, y, z, md) -> Void
    | Invoke(x, y, z, w, v, u, t, s, md) -> z
    | _ ->  failwith ("assign_vartyps_instr: "^ (Llvm_pp.string_of_rhs i)))
     in
      (match nopt with None -> () | Some var -> local_add_vartype locals var typ)

let assign_vartyps_block locals ctyps b =
  local_add_vartype locals b.bname Label;
  List.iter (assign_vartyps_instr locals ctyps) b.binstrs

let declare_params finfo =
  let locals = finfo.context in
  let param_list =  (fst finfo.fparams) in
  let rec loop param_list  =
    (match param_list with 
       | [] -> ()
       | (t, _, Some x) :: tl ->
	   local_add_vartype locals x t;
	   loop tl;
       | (t, _, None) :: tl ->
	   let x = finfo.fcounter in 
	   let v =  Id(false, !x) in
	     incr x;
	     local_add_vartype locals v t;
	     loop tl;
    )
  in
    loop param_list
      

let process_params cu =
  List.iter declare_params cu.cfuns
    
let value_map g f =
  let h = List.map (fun (ty,op) -> (ty, g op)) in
  let imap = function
    | Va_arg         ((t,v),t2,md) -> Va_arg         ((t,g v),t2,md)
    | Trunc          ((t,v),t2,md) -> Trunc          ((t,g v),t2,md)
    | Zext           ((t,v),t2,md) -> Zext           ((t,g v),t2,md)
    | Sext           ((t,v),t2,md) -> Sext           ((t,g v),t2,md)
    | Fptrunc        ((t,v),t2,md) -> Fptrunc        ((t,g v),t2,md)
    | Fpext          ((t,v),t2,md) -> Fpext          ((t,g v),t2,md)
    | Bitcast        ((t,v),t2,md) -> Bitcast        ((t,g v),t2,md)
    | Addrspacecast  ((t,v),t2,md) -> Addrspacecast  ((t,g v),t2,md)
    | Uitofp         ((t,v),t2,md) -> Uitofp         ((t,g v),t2,md)
    | Sitofp         ((t,v),t2,md) -> Sitofp         ((t,g v),t2,md)
    | Fptoui         ((t,v),t2,md) -> Fptoui         ((t,g v),t2,md)
    | Fptosi         ((t,v),t2,md) -> Fptosi         ((t,g v),t2,md)
    | Inttoptr       ((t,v),t2,md) -> Inttoptr       ((t,g v),t2,md)
    | Ptrtoint       ((t,v),t2,md) -> Ptrtoint       ((t,g v),t2,md)
    | Extractvalue   ((t,v),t2,md) -> Extractvalue   ((t,g v),t2,md)
    | Insertvalue    ((t1,v1),(t2,v2),il,md) -> Insertvalue    ((t1,g v1),(t2,g v2),il,md)
    | Icmp           (a,(t,v1),v2,md) -> Icmp           (a,(t,g v1),v2,md)
    | Fcmp           (a,(t,v1),v2,md) -> Fcmp           (a,(t,g v1),v2,md)
    | Sdiv           (a,(t,v1),v2,md) -> Sdiv           (a,(t,g v1),v2,md)
    | Udiv           (a,(t,v1),v2,md) -> Udiv           (a,(t,g v1),v2,md)
    | Lshr           (a,(t,v1),v2,md) -> Lshr           (a,(t,g v1),v2,md)
    | Ashr           (a,(t,v1),v2,md) -> Ashr           (a,(t,g v1),v2,md)
    | Fadd           (a,(t,v1),v2,md) -> Fadd           (a,(t,g v1),v2,md)
    | Fsub           (a,(t,v1),v2,md) -> Fsub           (a,(t,g v1),v2,md)
    | Fmul           (a,(t,v1),v2,md) -> Fmul           (a,(t,g v1),v2,md)
    | Fdiv           (a,(t,v1),v2,md) -> Fdiv           (a,(t,g v1),v2,md)
    | Frem           (a,(t,v1),v2,md) -> Frem           (a,(t,g v1),v2,md)
    | Urem           ((t,v1),v2,md)   -> Urem           ((t,g v1),g v2,md)
    | Srem           ((t,v1),v2,md)   -> Srem           ((t,g v1),g v2,md)
    | And            ((t,v1),v2,md)   -> And            ((t,g v1),g v2,md)
    | Or             ((t,v1),v2,md)   -> Or             ((t,g v1),g v2,md)
    | Xor            ((t,v1),v2,md)   -> Xor            ((t,g v1),g v2,md)
    | Add            (a,b,(t,v1),v2,md) -> Add            (a,b,(t,g v1),g v2,md)
    | Sub            (a,b,(t,v1),v2,md) -> Sub            (a,b,(t,g v1),g v2,md)
    | Mul            (a,b,(t,v1),v2,md) -> Mul            (a,b,(t,g v1),g v2,md)
    | Shl            (a,b,(t,v1),v2,md) -> Shl            (a,b,(t,g v1),g v2,md)
    | Getelementptr  (a,vs,md) -> Getelementptr  (a,h vs,md)
    | Shufflevector  (vs,md) -> Shufflevector  (h vs,md)
    | Insertelement  (vs,md) -> Insertelement  (h vs,md)
    | Extractelement (vs,md) -> Extractelement (h vs,md)
    | Select         (vs,md) -> Select         (h vs,md)
    | Phi            (t,l,md) -> Phi(t, List.map (fun (v1,v2) -> (g v1, g v2)) l,md)
    | Alloca         (a,b,None,c,md) -> Alloca(a,b,None,c,md)
    | Alloca         (a,b,Some(t,v),c,md) -> Alloca(a,b,Some(t,g v),c,md)
    | Load           (a,b,(t,v),c,d,md) -> Load(a,b,(t,g v),c,d,md)
    | Store          (a,b,(t1,v1),(t2,v2),c,d,md) -> Store(a,b,(t1,g v1),(t2,g v2),c,d,md)
    | Atomicrmw      (a,b,(t1,v1),(t2,v2),c,d,md) -> Atomicrmw(a,b,(t1,g v1),(t2,g v2),c,d,md)
    | Cmpxchg        (a,(t1,v1),(t2,v2),(t3,v3),b,c,d,md) -> Cmpxchg(a,(t1,g v1),(t2,g v2),(t3,g v3),b,c,d,md)
    | Fence          (a,b,md) -> Fence(a,b,md)
    | Unreachable    md -> Unreachable md
    | Return         (None,md) -> Return(None,md)
    | Return         (Some(t,v),md) -> Return(Some(t,g v),md)
    | Resume         ((t,v),md) -> Resume((t,g v),md)
    | Br             ((t,v),None,md) -> Br((t,g v),None,md)
    | Br             ((t1,v1),Some((t2,v2),(t3,v3)),md) -> Br((t1,g v1),Some((t2,g v2),(t3,g v3)),md)
    | Indirectbr     ((t,v),vs,md) -> Indirectbr((t,g v),h vs,md)
    | Switch((t1,v1),(t2,v2),tvs,md) ->
        Switch((t1,g v1),(t2,g v2),
               List.map (fun ((t1,v1),(t2,v2)) -> ((t1,g v1),(t2,g v2))) tvs,
               md)
    | Landingpad(a,(t,v),b,lps,md) ->
        Landingpad(a,(t,g v),b,
                   List.map (function Catch(t,v) -> Catch(t,g v) | Filter(t,v) -> Filter(t,g v)) lps,
                   md)
    | Call(a,b,c,d,v,params,e,md) ->
        Call(a,b,c,d,g v,
             List.map (fun (a,b,v) -> (a,b,g v)) params,
             e,md)
    | Invoke(a,b,c,v,params,d,(t1,v1),(t2,v2),md) ->
        Invoke(a,b,c,g v,
               List.map (fun (a,b,v) -> (a,b,g v)) params,
               d,(t1,g v1),(t2,g v2),md) in
  (f.fblocks <-
    (List.map
      (fun bl ->
        {bname=bl.bname; 
	 binstrs=List.map (fun (nopt,i) -> (nopt, imap i)) bl.binstrs; bseen=bl.bseen; bindex=bl.bindex; brank=bl.brank; })
      f.fblocks))

      
let assign_vartyps cu =
  List.iter
    (function
       | (x, None)   -> ()
       | (x, Some t) -> global_add_vartype cu x t)
    cu.ctyps;
  List.iter
    (fun {gname;gtyp} -> global_add_vartype cu gname (Pointer(gtyp,None)))
    cu.cglobals;
  List.iter
    (fun f ->
       let locals = f.context in
       let ftyp = Pointer(Funtyp(f.freturntyp,fst f.fparams,snd f.fparams), None) in
	 global_add_vartype cu f.fname ftyp; (* function name *)
	 List.iter (assign_vartyps_block locals cu.ctyps) f.fblocks)
    cu.cfuns;
  List.iter
    (fun f ->
       (value_map 
	  (function
	     | Var v ->
		 if typ_of_var cu f v = Label then Basicblock v else Var v
	     | x -> x)) f)
    cu.cfuns

let value_to_var value =
  match value with 
    | (Var v) -> v
    | (Basicblock v) -> v
    | _ -> failwith("Value_to_var failed for " ^ (Llvm_pp.string_of_value value))

(*
 * Predecessors of block in function f 
 * - f must be a Bc.finfo
 * - bname must be a block name
 *)
let get_predecessors f bname =
  let cfgs = Hashtbl.find_all f.cfg_predecessors bname in
    List.map (fun (v, e) -> v) cfgs

let get_successors f bname = 
  let cfgs = Hashtbl.find_all f.cfg_successors bname in
    List.map (fun (v, e) -> v) cfgs

    
(*
 * PROVISIONAL: MORE DATA IN THE PREDECESSOR TABLE
 *)
let get_cfg_predecessors f bname = 
  Hashtbl.find_all f.cfg_predecessors bname

let get_cfg_successors f bname = 
  Hashtbl.find_all f.cfg_successors bname


let add_cfg_predecessor cfg_predecessors key var cond =
  (match key with
     | (Var v)  -> Hashtbl.add cfg_predecessors v (var, cond)
     | (Basicblock v) -> Hashtbl.add cfg_predecessors v (var, cond)
     | _  -> failwith("Unexpected key value for add_cfg_predecessor " ^ (Llvm_pp.string_of_value key))
  )

let add_cfg_successor cfg_successors key var cond =
  (match key with
     | (Var v)  -> Hashtbl.add cfg_successors var (v, cond)
     | (Basicblock v) -> Hashtbl.add cfg_successors var (v, cond)
     | _  -> failwith("Unexpected key value for add_cfg_successor " ^ (Llvm_pp.string_of_value key))
  )

(*
 * Convert a list of pairs ((typ, v1), (typ2, value)) to values (all the types should be the same)
 *)
  
let make_cfg_neighbors f cfg_predecessors cfg_successors =
  (*
   * Convert a list of pairs (typ, val1), (typ2, val2)) to 
   * a list  of val1.
   *)
  let list_of_values = List.map (fun ((_, y), _) -> y) in
    List.iter
      (fun bl ->
	 let add target condition =
	   begin
	     add_cfg_predecessor cfg_predecessors target bl.bname condition;
	     add_cfg_successor cfg_successors target bl.bname condition
	   end
	 in
	   (* The terminator instructions are: ret, br, switch, indirectbr, invoke, resume, and unreachable. *)
	   match List.rev bl.binstrs with
	     | (_,i)::_ ->
		 (match i with
		    | Br((_,target), None, _) ->
			add target Uncond

		    | Br((typ, v),Some((_,target1),(_,target2)),_) ->
			add target1 (Eq(typ, v, True));
			add target2 (Eq(typ, v, False))

		    | Switch((typ, v),(_,default_target),targets,_) ->
			add default_target (Distinct(typ, v, list_of_values targets));
			List.iter
			  (fun ((typ2,v2),(_,target)) -> add target (Eq(typ, v, v2)))
			  targets

		    | Indirectbr(_, targets,_) ->
			List.iter
			  (fun (_,target) -> add target Unsupported)
			  targets

		    | Invoke(_,_,_,_,_,_,(_,target1),(_,target2),_) ->
			add target1 Unsupported; 
			add target2 Unsupported

		    | _ -> (* N.B. 'resume', 'ret', and 'unreachable' have no successors *)
			())
	     | _ -> ())
      f.fblocks

    
let compute_cfg_neighbors_of_finfo f =
  make_cfg_neighbors f f.cfg_predecessors f.cfg_successors

let compute_cfg_neighbors cu =
  List.iter compute_cfg_neighbors_of_finfo cu.cfuns



(*
 * Get a block given its name.
 *)
let lookup_block f name = 
  List.find (fun b -> b.bname = name) f.fblocks



let rec set_rank_aux fu node stack current =
    if node.brank < current
    then
      begin 
	node.brank <- current;
	let pred_blocks = (List.map (lookup_block fu) (get_successors fu  node.bname)) in
	List.iter
	  (fun pred ->
	     if not (List.mem pred.bindex stack)
	     then
	       (set_rank_aux fu pred (pred.bindex :: stack) (current + 1)))
	  pred_blocks
      end
  

let set_ranks fu =
  let root = List.nth fu.fblocks 0 in 
    set_rank_aux fu root [ root.bindex ] 1
      

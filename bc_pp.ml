(*
 * Pretty printing support plus syntactic utils
 *)

open Printf
open Bc
open Llvm
open Llvm_pp
open Util


let bpr_thread_local b = function
  | None                 -> bprintf b "thread_local"
  | Some Localdynamic -> bprintf b "thread_local(localdynamic)"
  | Some Initialexec  -> bprintf b "thread_local(initialexec)"
  | Some Localexec    -> bprintf b "thread_local(localexec)"

let bpr_storageclass b = function
  | Dllimport -> bprintf b "dllimport"
  | Dllexport -> bprintf b "dllexport"

let bpr_linkage b = function
  | External             -> bprintf b "external"
  | Private              -> bprintf b "private"
  | Extern_weak          -> bprintf b "extern_weak"
  | Internal             -> bprintf b "internal"
  | Weak                 -> bprintf b "weak"
  | Weak_odr             -> bprintf b "weak_odr"
  | Linkonce             -> bprintf b "linkonce"
  | Linkonce_odr         -> bprintf b "linkonce_odr"
  | Common               -> bprintf b "common"
  | Appending            -> bprintf b "appending"
  | Available_externally -> bprintf b "available_externally"

let bpr_visibility b = function
  | Default   -> ()
  | Hidden    -> bprintf b "hidden"
  | Protected -> bprintf b "protected"


let bpr_global b g =
  bprintf b "%a = %a%a%a%a%a%a%a%a%a%a%a%a\n"
    bpr_var g.gname
    (opt_after " " bpr_linkage) g.glinkage
    (opt_after " " bpr_visibility) g.gvisibility
    (opt_after " " bpr_storageclass) g.gstorageclass
    (opt_after " " bpr_thread_local) g.gthread_local
    (opt_after " " (fun b -> bprintf b "addrspace(%d)")) g.gaddrspace
    (yes "unnamed_addr ") g.gunnamed_addr
    (yes "externally_initialized ") g.gexternally_initialized
    (yesno "constant " "global ") g.gconstant
    bpr_typ g.gtyp
    (opt_before " " bpr_value) g.gvalue
    (opt (fun b -> bprintf b ", section %s")) g.gsection
    (opt (fun b -> bprintf b ", align %d")) g.galign

let bpr_alias b a =
  bprintf b "%a = " bpr_var a.aname;
  (match a.avisibility with None -> () | Some x -> bprintf b "%a " bpr_visibility x);
  bprintf b "alias ";
  (match a.alinkage with None -> () | Some x -> bprintf b "%a " bpr_linkage x);
  (match a.aaliasee with
  | A_bitcast(x, y) -> bprintf b "bitcast(%a to %a)\n" bpr_typ_value x bpr_typ y
  | A_getelementptr(inbounds, x) -> bprintf b "getelementptr%a(%a)\n" (yes " inbounds ") inbounds bpr_typ_value_list x
  | A_typ_value x -> bprintf b "%a\n" bpr_typ_value x)

let pad_to_column b n =
  let rec column i =
    if i<=0 then 0 else
    if Buffer.nth b (i-1) = '\n' then 0 else
    1 + column (i-1) in
  let column = column (Buffer.length b) in
    if column < n
    then
      for x = column to n-1 do
	Buffer.add_char b ' '
      done
    else
      Buffer.add_char b ' '

(*
 * Predecessors of block in function f 
 * - f must be a Bc.finfo
 * - bname must be a block name
 *)
let get_predecessors f bname = 
  Hashtbl.find_all f.pred_table bname


    
let bpr_block f b first {bname; binstrs}  =
  let pred_list = get_predecessors f bname in
    if pred_list <> []
    then
      (match bname with
	 | Id(_, x) ->
	     if not first then
		 bprintf b "; <label>:%d%a; preds = %a\n" x pad_to_column 50 (between ", " bpr_var) pred_list
	 | Name(_, x) -> bprintf b "%s:%a; preds = %a\n" x pad_to_column 50 (between ", " bpr_var) pred_list)
    else
      (match bname with
	 | Id(_, x) ->
	     if not first then
	       bprintf b "; <label>:%d\n" x
	 | Name(_, x) -> bprintf b "%s:\n" x);
    List.iter (bpr_instr b) binstrs


(* Prints a list of blocks: f is true for the first block only
   This is to avoid printing the first block's label.
*)
let bpr_block_list f b l = 
  let rec iter first l = 
     (match l with 
	| [] -> ()
	| [hd] -> bpr_block f b first hd
	| hd :: tl -> 
	    begin
	      bpr_block f b first hd;
	      bprintf b "\n";
	      iter false tl
	    end)
  in iter true l

let bpr_fparams b fparams =
  bprintf b "(%a%a%a)"
    (between ", " bpr_formal) (fst fparams)
    (yes ", ") (snd fparams && (fst fparams) <> [])
    (yes "...") (snd fparams)

let string_of_fparams fparams =
  Util.spr bpr_fparams fparams

let bpr_function b cu f =
  bprintf b "\n";
  bprintf b "%a %a%a%a%a%a%a %a%a%a%a%a%a%a%a"
    (yesno "declare" "define") (f.fblocks = [])

    (opt_after " " bpr_linkage) f.flinkage
    (opt_after " " bpr_visibility) f.fvisibility
    (opt_after " " bpr_storageclass) f.fstorageclass
    (opt_after " " bpr_callingconv) f.fcallingconv
    (after " " bpr_attribute) f.freturnattrs
    bpr_typ f.freturntyp

    bpr_var f.fname

    bpr_fparams f.fparams
    
    (*
     *  N.B. comdat and prologue have yet to be implemented
     * [section "name"] [comdat [($name)]] [align N] [gc] [prefix Constant] [prologue Constant] { ... }
     *
     *)
    
    (yes " unnamed_addr") f.funnamed_addr
    (before " " bpr_attribute) f.fattrs
    (opt (fun b -> bprintf b " section %s")) f.fsection
    (opt (fun b -> bprintf b " align %d")) f.falign
    (opt (fun b -> bprintf b " gc %s")) f.fgc
    (opt_before " " bpr_typ_value) f.fprefix
  ;

  if f.fblocks = [] then bprintf b "\n" else
    begin
      bprintf b " {\n";
      bpr_block_list f b f.fblocks;
      bprintf b "}\n";
    end


let bpr_mdnode b x =
  bprintf b "!%d = %a %a\n" x.mdid bpr_typ x.mdtyp
    bpr_mdnodevector x.mdcontents

module ISet = Set.Make(
  struct
    type t = int
    let compare = compare
  end)

(*
  iam: returns an list of attributes by going through the
  attributes passed in and expanding any #i's, by looking
  in the groups.
*)
let resolve_attributes groups attributes =
  let rec loop result resolved =
    function
      | [] ->
          result
      | (Attrgrp i)::tl ->
          if ISet.mem i resolved then
            loop result resolved tl
          else
            loop result (ISet.add i resolved) ((List.assoc i groups) @ tl)
      | hd::tl ->
	  if List.mem hd result
	  then
            loop result resolved tl
	  else
            loop  (hd :: result) resolved tl  in
  loop [] ISet.empty attributes

let bpr_cu b cu =
  (match cu.cdatalayout with
  | None -> ()
  | Some x -> bprintf b "target datalayout = %s\n" x);
  (match cu.ctarget with
  | None -> ()
  | Some x -> bprintf b "target triple = %s\n" x);
  List.iter (bprintf b "module asm %s\n") cu.casms;
  if cu.casms == [] then bprintf b "\n";
  (*  bprintf b "\n"; *)
  List.iter
    (function
      | (x, None)   -> bprintf b "%a = type opaque\n" bpr_var x
      | (x, Some t) -> bprintf b "%a = type %a\n" bpr_var x bpr_typ t)
    cu.ctyps;
  if cu.cglobals <> [] then bprintf b "\n";
  List.iter (bpr_global b) cu.cglobals;
  if cu.caliases <> [] then bprintf b "\n";
  List.iter (bpr_alias b) cu.caliases;
  List.iter
    (fun f ->
       let attributes = resolve_attributes cu.cattrgrps f.fattrs in
       let attributes = List.filter (function | Attr _ -> false | _ -> true) attributes in
       let attributes = List.rev attributes in
	 if attributes <> [] then
	  bprintf b "\n; Function Attrs: %a" (between " " bpr_attribute) attributes;
	(bpr_function b cu f))
    cu.cfuns;
  if cu.cattrgrps <> [] then bprintf b "\n";
  List.iter (bpr_attrgrp b) cu.cattrgrps;
  if cu.cmdvars <> [] then bprintf b "\n";
  List.iter
    (fun (x, l) ->
      bprintf b "!%s = !{%s}\n" x (String.concat ", " (List.map (fun y -> "!"^(string_of_int y)) l)))
    cu.cmdvars;
  if cu.cmdnodes <> [] then bprintf b "\n";
  List.iter (bpr_mdnode b) cu.cmdnodes



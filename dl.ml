(*
 *  Parsing the datalayout string into something more
 *  useful. Note that some of the slots of the datalayout
 *  struct could perhaps be adapted better to use, once that
 *  use has been found.
 *
 *)

type alignment = {
  size : int;
  abi: int;
  pref: int;
}


type datalayout  = {
  (* E indicates big endian; e indicates little endian *)
  mutable big_endian: bool;
  (* prior to 3.0 these looked like  ssize:abi:pref ; from 3.0 they are of the form Ssize *)
  mutable stack: int option;
  (* n<size1>:<size2>:<size3> ... *)
  mutable native: int list;
  (* these look like char<size>:<abi>:<pref>  for char in { i, f, v } integers, floats, vectors *)
  mutable integers: alignment list;
  mutable floats: alignment list;
  mutable vectors: alignment list;
  (* we ignore multiple address spaces untill forced otherwise ;  we parse: p:<size>:<abi>:<pref> *)
  mutable pointer: alignment option;
  (* prior to 3.0 these looked like asize:abi:pref ; from 3.0 they are of the form a:<abi>:<pref> *)
  mutable aggregate: alignment option;
  (* char in {e, m, o, w} ;  e = elf, m = mips, o = mach-o, w = windows *)
  mutable mangling: char option;
}

let zero_datalayout =
  let zdl = {
    big_endian = false;
    stack = None;
    native = [];
    integers = [];
    floats = [];
    vectors = [];
    pointer = None;
    aggregate = None;
    mangling = None;
  } in zdl


let native_string_to_int_list str =
  let slist = (Str.split (Str.regexp ":") str) in
  let first =  List.nth slist 0 in
  let len = String.length first in
  let size = int_of_string (String.sub first 1 (len - 1)) in
  let result = size :: (List.map int_of_string (List.tl slist)) in
    result

	 
let data_string_to_alignment str =
  let slist = (Str.split (Str.regexp ":") str) in
  let first =  List.nth slist 0 in
  let len = String.length first in
  let size = int_of_string (String.sub first 1 (len - 1)) in
  let abi = int_of_string (List.nth slist 1) in
  let pref =
    if List.length slist > 2
    then
      int_of_string (List.nth slist 2)
    else
      abi
  in
    { size = size; abi = abi; pref = pref; }

let pointer_string_to_alignment str =
  let slist = (Str.split (Str.regexp ":") str) in
  let size = int_of_string (List.nth slist 1 ) in
  let abi = int_of_string (List.nth slist 2) in
  let pref =
    if List.length slist > 3
    then
      int_of_string (List.nth slist 3)
    else
      abi
  in
    { size = size; abi = abi; pref = pref; }
      
let stack_string_to_int str =
let len = String.length str in
let size = int_of_string (String.sub str 1 (len - 1)) in
  size

let aggregate_string_to_alignment str =
  let slist = (Str.split (Str.regexp ":") str) in
  let first =  List.nth slist 0 in
  let len = String.length first in
  let size = if len = 0 then 0 else int_of_string (String.sub first 1 (len - 1)) in
  let abi = int_of_string (List.nth slist 1) in
  let pref =
    if List.length slist > 2
    then
      int_of_string (List.nth slist 2)
    else
      abi
  in
    { size = size; abi = abi; pref = pref; }

  
  
let dlitem_parse dl item =
  let c = String.get item 0 in
    (match c with
	 'E' -> dl.big_endian <- true
       | 'e' -> dl.big_endian <- false
       | 'm' -> if String.length item = 3 then dl.mangling <- Some(String.get item 2)
       | 'S' -> dl.stack <- Some(stack_string_to_int item)
       | 'i' -> dl.integers <- data_string_to_alignment(item) :: dl.integers
       | 'f' -> dl.floats <- data_string_to_alignment(item) :: dl.floats
       | 'v' -> dl.vectors <- data_string_to_alignment(item) :: dl.vectors 
       | 'p' -> dl.pointer <- Some(pointer_string_to_alignment(item)) 
       | 'a' -> dl.aggregate <- Some(aggregate_string_to_alignment(item)) 
       | 'n' -> dl.native <- native_string_to_int_list(item)
       | _ -> ())

  
	
      
let rec dllist_parse dl dllist =
  (match dllist with
       [] -> ()
     | hd::tl ->
	 begin
	   (dlitem_parse dl hd);
	   (dllist_parse dl tl)
	 end)
	

     
let dl_parse str dl =
  let len = String.length str in
  let chomp = String.sub str 1 (len - 2) in
    let dllist = (Str.split (Str.regexp "-") chomp) in
      dllist_parse dl dllist
	

      


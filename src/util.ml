(*
 * Utilites. More to come.
 *)
open Printf

(*
 * Set this to true to avoid raising exceptions (like seeing double(s))
 *)
let debug = true

   
let between s bpr b =
  let rec loop = function
  | [] -> ()
  | [hd] -> bpr b hd
  | hd::tl ->
      bprintf b "%a%s" bpr hd s;
      loop tl in
  loop

let before s bpr b =
  let rec loop = function
  | [] -> ()
  | hd::tl ->
      bprintf b "%s%a" s bpr hd;
      loop tl in
  loop

let after s bpr b =
  let rec loop = function
  | [] -> ()
  | hd::tl ->
      bprintf b "%a%s" bpr hd s;
      loop tl in
  loop

let opt bpr b = function
  | None -> ()
  | Some x ->
      bprintf b "%a" bpr x

let opt_before s bpr b = function
  | None -> ()
  | Some x ->
      bprintf b "%s%a" s bpr x

let opt_after s bpr b = function
  | None -> ()
  | Some x ->
      bprintf b "%a%s" bpr x s

let yes s b x =
  if x then bprintf b "%s" s

let yesno syes sno b x =
  bprintf b "%s" (if x then syes else sno)

let spr bpr x =
  let b = Buffer.create 100 in
  bpr b x;
  Buffer.contents b

let nfailwith msg =
  if debug
  then
    (Printf.eprintf "%s\n" msg)
  else
    (failwith msg)


let log2ceil n =
  (* accu is 2 ^ k *)
  let rec loop k accu =
    if accu >= n then k else loop (k + 1) (2 * accu)
  in
    loop 0 1


let exp n =
  let rec loop m accu =
    if m <= 0  then accu else loop (m - 1) (2 * accu)
  in
    loop n 1

      
     

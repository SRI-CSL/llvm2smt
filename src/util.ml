(* Copyright (c) 2015, SRI International

   Permission is hereby granted, free of charge, to any person
   obtaining a copy of this software and associated documentation files
   (the "Software"), to deal in the Software without restriction,
   including without limitation the rights to use, copy, modify, merge,
   publish, distribute, sublicense, and/or sell copies of the Software,
   and to permit persons to whom the Software is furnished to do so,
   subject to the following conditions:
   
   The above copyright notice and this permission notice shall be
   included in all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
   NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
   LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
   OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
   WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*)

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

      
     

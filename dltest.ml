open Printf
open Str

let dl_386 = "\"e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128\"" 

let dl_darwin = "\"e-m:o-i64:64-f80:128-n8:16:32:64-S128\"" 

let dl_linux = "\"e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128\"" 

;;			

let dl = Dl.zero_datalayout in  Dl.dl_parse dl_386 dl;
				   
let dl = Dl.zero_datalayout  in  Dl.dl_parse dl_darwin dl;
				   
let dl = Dl.zero_datalayout  in  Dl.dl_parse dl_linux dl;
				   

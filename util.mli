
val between: string ->  (Buffer.t -> 'a -> unit) -> Buffer.t -> 'a list -> unit

val before: string ->  (Buffer.t -> 'a -> unit) -> Buffer.t -> 'a list -> unit

val after: string ->  (Buffer.t -> 'a -> unit) -> Buffer.t -> 'a list -> unit

val opt: (Buffer.t -> 'a -> unit) -> Buffer.t -> 'a option -> unit

val opt_before: string -> (Buffer.t -> 'a -> unit) -> Buffer.t -> 'a option -> unit

val opt_after: string -> (Buffer.t -> 'a -> unit) -> Buffer.t -> 'a option -> unit

val yes:  string -> Buffer.t -> bool -> unit

val yes:  string -> Buffer.t -> bool -> unit

val yesno:  string -> string -> Buffer.t -> bool -> unit
    
(*
 * String printer
 *)
val spr: (Buffer.t -> 'a -> unit) -> 'a -> string

(*
 * Prints a message if Util.debug is true/fails with an exception otherwise.
 *)
val nfailwith: string -> unit

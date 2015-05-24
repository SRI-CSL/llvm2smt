%{

type toplevel =
  | Fun of Bc.finfo
  | Asm of string
  | Target of string
  | Datalayout of string
  | Deplibs of string list
  | Typ of Llvm.var * Llvm.typ option
  | Global of Bc.ginfo
  | Alias of Bc.ainfo
  | MDNodeDefn of Bc.mdinfo
  | MDVarDefn of string * int list
  | Attrgrp of int * Llvm.attribute list

let list_of_string s =
  if String.length s < 2 || String.get s 0 <> '"' || String.get s (String.length s - 1) <> '"' then
    failwith "list_of_string: expected quoted string constant";
  let l = ref [] in
  for i = (String.length s - 2) downto 1 do
    l := (String.get s i)::(!l)
  done;
  let is_hexdigit c =
    ('0' <= c && c <= '9') || ('A' <= c && c <= 'F') || ('A' <= c && c <= 'F') in
  let rec build = function
    | '\\'::x::y::tl when is_hexdigit x && is_hexdigit y ->
        (Scanf.sscanf (Printf.sprintf "%c%c" x y) "%x" (fun i -> i))::(build tl)
    | [] -> []
    | hd::tl -> (Char.code hd)::(build tl) in
  List.map
    (fun i -> (Llvm.Integer 8, Llvm.Int(Big_int.big_int_of_int i)))
    (build !l)

let process_toplevels t =
  let cu = {
    Bc.gcontext = Hashtbl.create 11;
    Bc.lcontext = Hashtbl.create 11;
    Bc.ctarget=None;
    Bc.dl= Dl.zero_datalayout;
    Bc.cdatalayout=None;
    Bc.casms=[];
    Bc.cfuns=[];
    Bc.ctyps=[];
    Bc.cglobals=[];
    Bc.caliases=[];
    Bc.cmdnodes=[];
    Bc.cmdvars=[];
    Bc.cattrgrps=[];
  } in
  let proc = function
    | Fun fi -> cu.Bc.cfuns <- fi::cu.Bc.cfuns
    | Asm x -> cu.Bc.casms <- x::cu.Bc.casms
    | Target x ->
        if cu.Bc.ctarget<>None then failwith "compilation unit with multiple targets"
        else cu.Bc.ctarget <- Some x
    | Datalayout x ->
        if cu.Bc.cdatalayout<>None then failwith "compilation unit with multiple datalayouts"
        else
	  begin
	    cu.Bc.cdatalayout <- Some x;
	    Dl.dl_parse x cu.Bc.dl;
	  end
    | Deplibs _ -> () (* parses but ignored in LLVM 3.4, to be removed in 4.0 *)
    | Typ(x,y) -> cu.Bc.ctyps <- (x,y)::cu.Bc.ctyps
    | Global x -> cu.Bc.cglobals <- x::cu.Bc.cglobals
    | Alias x -> cu.Bc.caliases <- x::cu.Bc.caliases
    | MDNodeDefn x -> cu.Bc.cmdnodes <- x::cu.Bc.cmdnodes
    | MDVarDefn(x,y) -> cu.Bc.cmdvars <- (x,y)::cu.Bc.cmdvars
    | Attrgrp(x,y) -> cu.Bc.cattrgrps <- (x,y)::cu.Bc.cattrgrps in
  List.iter proc (List.rev t);
  cu

%}
%token <string> APFloat
%token <string> APInt
%token <string> APSint
%token <int> AttrGrpID
%token Backslash
%token Comma
%token DotDotDot
%token Eof
%token Equal
%token Exclaim
%token <Llvm.var> GlobalVar
%token <Llvm.var> GlobalID
%token <Llvm.var> LocalVar
%token <Llvm.var> LocalVarID
%token Greater
%token <string> LabelStr
%token Lbrace
%token Less
%token Lparen
%token Lsquare
%token <string> MetadataVar
%token Rbrace
%token Rparen
%token Rsquare
%token Star
%token <string> StringConstant
%token Error
%token Kw_void
%token <int> I
%token Kw_half
%token Kw_float
%token Kw_double
%token Kw_x86_fp80
%token Kw_fp128
%token Kw_ppc_fp128
%token Kw_label
%token Kw_metadata
%token Kw_x86_mmx
%token Kw_true
%token Kw_false
%token Kw_declare
%token Kw_define
%token Kw_global
%token Kw_constant
%token Kw_private
%token Kw_internal
%token Kw_available_externally
%token Kw_linkonce
%token Kw_linkonce_odr
%token Kw_weak
%token Kw_weak_odr
%token Kw_appending
%token Kw_dllimport
%token Kw_dllexport
%token Kw_common
%token Kw_default
%token Kw_hidden
%token Kw_protected
%token Kw_unnamed_addr
%token Kw_externally_initialized
%token Kw_extern_weak
%token Kw_external
%token Kw_thread_local
%token Kw_localdynamic
%token Kw_initialexec
%token Kw_localexec
%token Kw_zeroinitializer
%token Kw_undef
%token Kw_null
%token Kw_to
%token Kw_tail
%token Kw_target
%token Kw_triple
%token Kw_unwind
%token Kw_deplibs
%token Kw_datalayout
%token Kw_volatile
%token Kw_atomic
%token Kw_unordered
%token Kw_monotonic
%token Kw_acquire
%token Kw_release
%token Kw_acq_rel
%token Kw_seq_cst
%token Kw_singlethread
%token Kw_nnan
%token Kw_ninf
%token Kw_nsz
%token Kw_arcp
%token Kw_fast
%token Kw_nuw
%token Kw_nsw
%token Kw_exact
%token Kw_inbounds
%token Kw_align
%token Kw_dereferenceable
%token Kw_addrspace
%token Kw_section
%token Kw_alias
%token Kw_module
%token Kw_asm
%token Kw_sideeffect
%token Kw_alignstack
%token Kw_inteldialect
%token Kw_gc
%token Kw_prefix
%token Kw_ccc
%token Kw_fastcc
%token Kw_coldcc
%token Kw_x86_stdcallcc
%token Kw_x86_fastcallcc
%token Kw_x86_thiscallcc
%token Kw_x86_cdeclmethodcc
%token Kw_arm_apcscc
%token Kw_arm_aapcscc
%token Kw_arm_aapcs_vfpcc
%token Kw_msp430_intrcc
%token Kw_ptx_kernel
%token Kw_ptx_device
%token Kw_spir_kernel
%token Kw_spir_func
%token Kw_intel_ocl_bicc
%token Kw_x86_64_sysvcc
%token Kw_x86_64_win64cc
%token Kw_webkit_jscc
%token Kw_anyregcc
%token Kw_preserve_mostcc
%token Kw_preserve_allcc
%token Kw_cc
%token Kw_c
%token Kw_attributes
%token Kw_alwaysinline
%token Kw_builtin
%token Kw_byval
%token Kw_inalloca
%token Kw_cold
%token Kw_inlinehint
%token Kw_inreg
%token Kw_minsize
%token Kw_naked
%token Kw_nest
%token Kw_noalias
%token Kw_nobuiltin
%token Kw_nocapture
%token Kw_noduplicate
%token Kw_noimplicitfloat
%token Kw_noinline
%token Kw_nonlazybind
%token Kw_noredzone
%token Kw_noreturn
%token Kw_nounwind
%token Kw_nonnull
%token Kw_optnone
%token Kw_optsize
%token Kw_readnone
%token Kw_readonly
%token Kw_returned
%token Kw_returns_twice
%token Kw_signext
%token Kw_sret
%token Kw_ssp
%token Kw_sspreq
%token Kw_sspstrong
%token Kw_sanitize_address
%token Kw_sanitize_thread
%token Kw_sanitize_memory
%token Kw_uwtable
%token Kw_zeroext
%token Kw_type
%token Kw_opaque
%token Kw_eq
%token Kw_ne
%token Kw_slt
%token Kw_sgt
%token Kw_sle
%token Kw_sge
%token Kw_ult
%token Kw_ugt
%token Kw_ule
%token Kw_uge
%token Kw_oeq
%token Kw_one
%token Kw_olt
%token Kw_ogt
%token Kw_ole
%token Kw_oge
%token Kw_ord
%token Kw_uno
%token Kw_ueq
%token Kw_une
%token Kw_xchg
%token Kw_nand
%token Kw_max
%token Kw_min
%token Kw_umax
%token Kw_umin
%token Kw_x
%token Kw_blockaddress
%token Kw_personality
%token Kw_cleanup
%token Kw_catch
%token Kw_filter
%token Kw_add
%token Kw_fadd
%token Kw_sub
%token Kw_fsub
%token Kw_mul
%token Kw_fmul
%token Kw_udiv
%token Kw_sdiv
%token Kw_fdiv
%token Kw_urem
%token Kw_srem
%token Kw_frem
%token Kw_shl
%token Kw_lshr
%token Kw_ashr
%token Kw_and
%token Kw_or
%token Kw_xor
%token Kw_icmp
%token Kw_fcmp
%token Kw_phi
%token Kw_call
%token Kw_trunc
%token Kw_zext
%token Kw_sext
%token Kw_fptrunc
%token Kw_fpext
%token Kw_uitofp
%token Kw_sitofp
%token Kw_fptoui
%token Kw_fptosi
%token Kw_inttoptr
%token Kw_ptrtoint
%token Kw_bitcast
%token Kw_addrspacecast
%token Kw_select
%token Kw_va_arg
%token Kw_ret
%token Kw_br
%token Kw_switch
%token Kw_indirectbr
%token Kw_invoke
%token Kw_resume
%token Kw_unreachable
%token Kw_alloca
%token Kw_load
%token Kw_store
%token Kw_cmpxchg
%token Kw_atomicrmw
%token Kw_fence
%token Kw_getelementptr
%token Kw_extractelement
%token Kw_insertelement
%token Kw_shufflevector
%token Kw_extractvalue
%token Kw_insertvalue
%token Kw_landingpad
%start main
%type <Bc.cunit> main
%%
main:
| toplevel_list { process_toplevels $1 }
;
toplevel_list:
| Eof           { [] }
| toplevel toplevel_list { $1::$2 }
;
toplevel:
| Kw_declare function_header                   { Fun $2 }
| Kw_define function_header function_body      { $2.Bc.fblocks <- $3; Fun $2 }
| Kw_module Kw_asm StringConstant              { Asm $3 }
| Kw_target Kw_triple Equal StringConstant     { Target $4 }
| Kw_target Kw_datalayout Equal StringConstant { Datalayout $4}
| Kw_deplibs Equal Lsquare string_list Rsquare { Deplibs $4 }
| LocalVarID Equal Kw_type Kw_opaque           { Typ($1, None) }
| LocalVarID Equal Kw_type typ                 { Typ($1, Some $4) }
| LocalVar Equal Kw_type Kw_opaque             { Typ($1, None) }
| LocalVar Equal Kw_type typ                   { Typ($1, Some $4) }
| global_eq external_linkage opt_visibility opt_dll_storageclass opt_thread_local
    opt_addrspace opt_unnamed_addr opt_externally_initialized
    constant_or_global typ opt_section_align
                                               { Global {Bc.gname = $1;
                                                         Bc.glinkage = Some $2;
                                                         Bc.gvisibility = $3;
                                                         Bc.gstorageclass = $4;
                                                         Bc.gthread_local = $5;
                                                         Bc.gaddrspace = $6;
                                                         Bc.gunnamed_addr = $7;
                                                         Bc.gexternally_initialized = $8;
                                                         Bc.gconstant = $9;
                                                         Bc.gtyp = $10;
                                                         Bc.gvalue = None;
                                                         Bc.gsection = fst $11;
                                                         Bc.galign = snd $11;}
                                               }
| global_eq non_external_linkage opt_visibility opt_dll_storageclass opt_thread_local
    opt_addrspace opt_unnamed_addr opt_externally_initialized
    constant_or_global typ value opt_section_align
                                               { Global {Bc.gname = $1;
                                                         Bc.glinkage = $2;
                                                         Bc.gvisibility = $3;
                                                         Bc.gstorageclass = $4;
                                                         Bc.gthread_local = $5;
                                                         Bc.gaddrspace = $6;
                                                         Bc.gunnamed_addr = $7;
                                                         Bc.gexternally_initialized = $8;
                                                         Bc.gconstant = $9;
                                                         Bc.gtyp = $10;
                                                         Bc.gvalue = Some $11;
                                                         Bc.gsection = fst $12;
                                                         Bc.galign = snd $12;}
                                               }
| global_eq external_linkage opt_visibility Kw_alias opt_linkage aliasee
    { Alias({Bc.aname=$1; Bc.avisibility=$3; Bc.alinkage=$5; Bc.aaliasee=$6}) }
| global_eq non_external_linkage opt_visibility Kw_alias opt_linkage aliasee
    { Alias({Bc.aname=$1; Bc.avisibility=$3; Bc.alinkage=$5; Bc.aaliasee=$6}) }
| Exclaim APInt Equal typ Exclaim Lbrace mdnodevector Rbrace
    { MDNodeDefn({Bc.mdid=int_of_string $2; Bc.mdtyp=$4; Bc.mdcontents=$7}) }
| MetadataVar Equal Exclaim Lbrace mdlist Rbrace                             { MDVarDefn($1, $5) }
| Kw_attributes AttrGrpID Equal Lbrace group_attributes Rbrace               { Attrgrp($2, $5) }
;
global_eq: /* may want to allow empty here (per llvm parser) but haven't seen it yet and it causes grammar conflicts */
| GlobalID Equal  { $1 }
| GlobalVar Equal { $1 }
;
aliasee:
| Kw_bitcast       Lparen type_value Kw_to typ Rparen         { Bc.A_bitcast($3, $5) }
| Kw_getelementptr opt_inbounds Lparen type_value_list Rparen { Bc.A_getelementptr($2, $4) }
| type_value                                                  { Bc.A_typ_value $1 }
;
string_list:
| /* empty */                { [] }
| StringConstant string_list { $1::$2 }
;
mdlist:
| /* empty */          { [] }
| Exclaim APInt        { [(int_of_string $2)] }
| Exclaim APInt Comma mdlist { (int_of_string $2)::$4 }
;
mdnodevector:
| Kw_null                       { [None] }
| Kw_null Comma mdnodevector    { None::$3 }
| type_value                    { [Some $1] }
| type_value Comma mdnodevector { (Some $1)::$3 }
;
constant_or_global:
| Kw_constant { true }
| Kw_global   { false }
;
function_header:
| opt_linkage opt_visibility opt_dll_storageclass opt_callingconv return_attributes
 typ global_name argument_list opt_unnamed_addr function_attributes opt_section
 opt_align opt_gc opt_prefix
                             {
                               { Bc.fcounter = ref 0;
				 Bc.context =  Hashtbl.create 11;
				 Bc.predecessors =  Hashtbl.create 11;
				 Bc.successors =  Hashtbl.create 11;
				 Bc.cfg_table =  Hashtbl.create 11;
				 Bc.flinkage = $1;
                                 Bc.fvisibility = $2;
                                 Bc.fstorageclass = $3;
                                 Bc.fcallingconv = $4;
                                 Bc.freturnattrs = $5;
                                 Bc.freturntyp = $6;
                                 Bc.fname = $7;
                                 Bc.fparams = $8;
                                 Bc.funnamed_addr = $9;
                                 Bc.fattrs = $10;
                                 Bc.fsection = $11;
                                 Bc.falign = $12;
                                 Bc.fgc = $13;
                                 Bc.fprefix = $14;
                                 Bc.fblocks = [];}
                             }
;
typ:
| Kw_void       { Llvm.Void }
| non_void_type { $1 }
;
non_void_type:
| I                                    { Llvm.Integer $1 }
| Kw_half                              { Llvm.Half }
| Kw_float                             { Llvm.Float }
| Kw_double                            { Llvm.Double }
| Kw_x86_fp80                          { Llvm.X86_fp80 }
| Kw_fp128                             { Llvm.Fp128 }
| Kw_ppc_fp128                         { Llvm.Ppc_fp128 }
| Kw_label                             { Llvm.Label }
| Kw_metadata                          { Llvm.Metadata }
| Kw_x86_mmx                           { Llvm.X86_mmx }
| LocalVar                             { Llvm.Vartyp($1) }
| LocalVarID                           { Llvm.Vartyp($1) }
| Lbrace Rbrace                        { Llvm.Structtyp(false, []) }
| Less Lbrace Rbrace Greater           { Llvm.Structtyp(true, []) }
| Lbrace type_list Rbrace              { Llvm.Structtyp(false, $2) }
| Less Lbrace type_list Rbrace Greater { Llvm.Structtyp(true, $3) }
| Lsquare APInt Kw_x typ Rsquare       { Llvm.Arraytyp(int_of_string $2, $4) }
| Less APInt Kw_x typ Greater          { Llvm.Vector(int_of_string $2, $4) }
| typ opt_addrspace Star               { Llvm.Pointer($1, $2) }
| typ argument_list                    { Llvm.Funtyp($1, fst $2, snd $2) }
;
type_list:
| typ                 { [$1] }
| typ Comma type_list { $1::$3 }
;
global_name:
| GlobalID  { $1 }
| GlobalVar { $1 }
;
argument_list:
Lparen arg_type_list Rparen { $2 }
;
arg_type_list:
| /* empty */                  { ([], false) }
| DotDotDot                    { ([], true) }
| arg_type                     { ([$1], false) }
| arg_type Comma arg_type_list { ($1::(fst $3), snd $3) }
;
arg_type:
| typ param_attribute_list          { ($1, $2, None) }
| typ param_attribute_list LocalVar { ($1, $2, Some $3) }
;
opt_section:
| /* empty */               { None }
| Kw_section StringConstant { Some $2 }
;
opt_align:
| /* empty */    { None }
| Kw_align APInt { Some(int_of_string $2) }
;
opt_inbounds:
| /* empty */ { false }
| Kw_inbounds { true }
;
opt_tail:
| /* empty */ { false }
| Kw_tail     { true }
;
opt_section_align:
| /* empty */                                          { (None    , None) }
| Comma Kw_section StringConstant                      { (Some $3 , None) }
| Comma Kw_align APInt                                 { (None    , Some(int_of_string $3)) }
| Comma Kw_section StringConstant Comma Kw_align APInt { (Some $3 , Some(int_of_string $6)) }
;
align_metadata:
| instruction_metadata { (None, $1) }
| Comma Kw_align APInt instruction_metadata { (Some(int_of_string $3), $4) }
;
opt_gc:
| /* empty */          { None }
| Kw_gc StringConstant { Some $2 }
;
opt_prefix:
| /* empty */         { None }
| Kw_prefix typ value { Some($2, $3) }
;
opt_atomic:
| /* empty */ { false }
| Kw_atomic   { true }
;
opt_volatile:
| /* empty */ { false }
| Kw_volatile { true }
;
value:
| GlobalID                                                                                  { Llvm.Var $1 }
| GlobalVar                                                                                 { Llvm.Var $1 }
| LocalVarID                                                                                { Llvm.Var $1 }
| LocalVar                                                                                  { Llvm.Var $1 }
| Exclaim mdvalue                                                                           { $2 }
| APInt                                                                                     { Llvm.Int(Big_int.big_int_of_string $1) }
| APFloat                                                                                   { Llvm.Float $1 }
| Kw_true                                                                                   { Llvm.True }
| Kw_false                                                                                  { Llvm.False }
| Kw_null                                                                                   { Llvm.Null }
| Kw_undef                                                                                  { Llvm.Undef }
| Kw_zeroinitializer                                                                        { Llvm.Zero }
| Lbrace type_value_list Rbrace                                                             { Llvm.Struct(false, $2) }
| Less Lbrace Rbrace Greater                                                                { Llvm.Struct(true, []) }
| Less Lbrace type_value_LIST Rbrace Greater                                                { Llvm.Struct(true, $3) }
| Less type_value_list Greater                                                              { Llvm.Vector($2) }
| Lsquare type_value_list Rsquare                                                           { Llvm.Array($2) }
| Kw_c StringConstant                                                                       { Llvm.Array(list_of_string $2) }
| Kw_asm opt_sideeffect opt_alignstack opt_inteldialect StringConstant Comma StringConstant { Llvm.Asm($2, $3, $4, $5, $7) }
| Kw_blockaddress               Lparen value Comma value Rparen                             { Llvm.Blockaddress($3, $5) }
| Kw_trunc                      Lparen type_value Kw_to typ Rparen                          { Llvm.Trunc         ($3, $5) }
| Kw_zext                       Lparen type_value Kw_to typ Rparen                          { Llvm.Zext          ($3, $5) }
| Kw_sext                       Lparen type_value Kw_to typ Rparen                          { Llvm.Sext          ($3, $5) }
| Kw_fptrunc                    Lparen type_value Kw_to typ Rparen                          { Llvm.Fptrunc       ($3, $5) }
| Kw_fpext                      Lparen type_value Kw_to typ Rparen                          { Llvm.Fpext         ($3, $5) }
| Kw_bitcast                    Lparen type_value Kw_to typ Rparen                          { Llvm.Bitcast       ($3, $5) }
| Kw_addrspacecast              Lparen type_value Kw_to typ Rparen                          { Llvm.Addrspacecast ($3, $5) }
| Kw_uitofp                     Lparen type_value Kw_to typ Rparen                          { Llvm.Uitofp        ($3, $5) }
| Kw_sitofp                     Lparen type_value Kw_to typ Rparen                          { Llvm.Sitofp        ($3, $5) }
| Kw_fptoui                     Lparen type_value Kw_to typ Rparen                          { Llvm.Fptoui        ($3, $5) }
| Kw_fptosi                     Lparen type_value Kw_to typ Rparen                          { Llvm.Fptosi        ($3, $5) }
| Kw_inttoptr                   Lparen type_value Kw_to typ Rparen                          { Llvm.Inttoptr      ($3, $5) }
| Kw_ptrtoint                   Lparen type_value Kw_to typ Rparen                          { Llvm.Ptrtoint      ($3, $5) }
| Kw_extractvalue               Lparen type_value index_list Rparen                         { Llvm.Extractvalue($3, $4) }
| Kw_insertvalue                Lparen type_value Comma type_value index_list Rparen        { Llvm.Insertvalue($3, $5, $6) }
| Kw_icmp icmp_predicate        Lparen type_value Comma type_value Rparen                   { Llvm.Icmp($2, $4, $6) }
| Kw_fcmp fcmp_predicate        Lparen type_value Comma type_value Rparen                   { Llvm.Fcmp($2, $4, $6) }
| Kw_add opt_nuw_nsw            Lparen type_value Comma type_value Rparen                   { Llvm.Add(fst $2, snd $2, $4, $6) }
| Kw_sub opt_nuw_nsw            Lparen type_value Comma type_value Rparen                   { Llvm.Sub(fst $2, snd $2, $4, $6) }
| Kw_mul opt_nuw_nsw            Lparen type_value Comma type_value Rparen                   { Llvm.Mul(fst $2, snd $2, $4, $6) }
| Kw_shl opt_nuw_nsw            Lparen type_value Comma type_value Rparen                   { Llvm.Shl(fst $2, snd $2, $4, $6) }
| Kw_sdiv opt_exact             Lparen type_value Comma type_value Rparen                   { Llvm.Sdiv($2, $4, $6) }
| Kw_udiv opt_exact             Lparen type_value Comma type_value Rparen                   { Llvm.Udiv($2, $4, $6) }
| Kw_lshr opt_exact             Lparen type_value Comma type_value Rparen                   { Llvm.Lshr($2, $4, $6) }
| Kw_ashr opt_exact             Lparen type_value Comma type_value Rparen                   { Llvm.Ashr($2, $4, $6) }
| Kw_fadd                       Lparen type_value Comma type_value Rparen                   { Llvm.Fadd($3, $5) }
| Kw_fsub                       Lparen type_value Comma type_value Rparen                   { Llvm.Fsub($3, $5) }
| Kw_fmul                       Lparen type_value Comma type_value Rparen                   { Llvm.Fmul($3, $5) }
| Kw_fdiv                       Lparen type_value Comma type_value Rparen                   { Llvm.Fdiv($3, $5) }
| Kw_urem                       Lparen type_value Comma type_value Rparen                   { Llvm.Urem($3, $5) }
| Kw_srem                       Lparen type_value Comma type_value Rparen                   { Llvm.Srem($3, $5) }
| Kw_frem                       Lparen type_value Comma type_value Rparen                   { Llvm.Frem($3, $5) }
| Kw_and                        Lparen type_value Comma type_value Rparen                   { Llvm.And($3, $5) }
| Kw_or                         Lparen type_value Comma type_value Rparen                   { Llvm.Or($3, $5) }
| Kw_xor                        Lparen type_value Comma type_value Rparen                   { Llvm.Xor($3, $5) }
| Kw_getelementptr opt_inbounds Lparen type_value_list Rparen                               { Llvm.Getelementptr($2, $4) }
| Kw_shufflevector              Lparen type_value_list Rparen                               { Llvm.Shufflevector  $3 }
| Kw_insertelement              Lparen type_value_list Rparen                               { Llvm.Insertelement  $3 }
| Kw_extractelement             Lparen type_value_list Rparen                               { Llvm.Extractelement $3 }
| Kw_select                     Lparen type_value_list Rparen                               { Llvm.Select         $3 }
;
mdvalue:
| APInt                      { Llvm.Mdnode(int_of_string $1) }
| StringConstant             { Llvm.Mdstring $1 }
| Lbrace mdnodevector Rbrace { Llvm.Mdnodevector $2 }
;
type_value_LIST_metadata:
| type_value instruction_metadata           { ([$1], $2) }
| type_value Comma type_value_LIST_metadata { ($1::(fst $3), snd $3) }
;
type_value_LIST:
| type_value                       { [$1] }
| type_value Comma type_value_LIST { $1::$3 }
;
type_value_list:
| /* empty */                      { [] }
| type_value                       { [$1] }
| type_value Comma type_value_list { $1::$3 }
;
index_list:
| Comma APInt            { [(int_of_string $2)] }
| Comma APInt index_list { (int_of_string $2)::$3 }
;
index_list_metadata:
| Comma APInt            instruction_metadata { [(int_of_string $2)], $3 }
| Comma APInt index_list_metadata             { (int_of_string $2)::(fst $3), snd $3 }
;
fcmp_predicate:
| Kw_oeq   { Llvm.F.Oeq   }
| Kw_one   { Llvm.F.One   }
| Kw_olt   { Llvm.F.Olt   }
| Kw_ogt   { Llvm.F.Ogt   }
| Kw_ole   { Llvm.F.Ole   }
| Kw_oge   { Llvm.F.Oge   }
| Kw_ord   { Llvm.F.Ord   }
| Kw_uno   { Llvm.F.Uno   }
| Kw_ueq   { Llvm.F.Ueq   }
| Kw_une   { Llvm.F.Une   }
| Kw_ult   { Llvm.F.Ult   }
| Kw_ugt   { Llvm.F.Ugt   }
| Kw_ule   { Llvm.F.Ule   }
| Kw_uge   { Llvm.F.Uge   }
| Kw_true  { Llvm.F.True  }
| Kw_false { Llvm.F.False }
;
icmp_predicate:
| Kw_eq  { Llvm.I.Eq  }
| Kw_ne  { Llvm.I.Ne  }
| Kw_slt { Llvm.I.Slt }
| Kw_sgt { Llvm.I.Sgt }
| Kw_sle { Llvm.I.Sle }
| Kw_sge { Llvm.I.Sge }
| Kw_ult { Llvm.I.Ult }
| Kw_ugt { Llvm.I.Ugt }
| Kw_ule { Llvm.I.Ule }
| Kw_uge { Llvm.I.Uge }
;
function_body:
| Lbrace basicblock_list Rbrace { $2 }
;
basicblock_list:
| basicblock                 { [$1] }
| basicblock basicblock_list { $1::$2 }
;
basicblock:
| LabelStr instruction_list { {Bc.bname=Llvm.Name(false, $1); Bc.binstrs=$2; Bc.bseen=false; Bc.bindex = 0;} }
| instruction_list          { {Bc.bname=Llvm.Id(false, -1); Bc.binstrs=$1; Bc.bseen=false; Bc.bindex = 0;} }
;
instruction_list:
| terminator_instruction { [$1] }
| instruction instruction_list { $1::$2 }
;
instruction_metadata:
| /* empty */ { [] }
| Comma MetadataVar Exclaim APInt instruction_metadata { ($2,Llvm.Mdnode(int_of_string $4))::$5 }
| Comma MetadataVar Exclaim Lbrace mdnodevector Rbrace instruction_metadata { ($2,Llvm.Mdnodevector $5)::$7 }
;
local_eq:
| LocalVarID Equal { $1 }
| LocalVar Equal   { $1 }
;
opt_local:
| /* empty */ { None }
| local_eq    { Some $1 }
;
instruction:
| local_eq Kw_add opt_nuw_nsw type_value Comma value      instruction_metadata { Some $1, Llvm.Add(fst $3, snd $3, $4, $6, $7) }
| local_eq Kw_sub opt_nuw_nsw type_value Comma value      instruction_metadata { Some $1, Llvm.Sub(fst $3, snd $3, $4, $6, $7) }
| local_eq Kw_mul opt_nuw_nsw type_value Comma value      instruction_metadata { Some $1, Llvm.Mul(fst $3, snd $3, $4, $6, $7) }
| local_eq Kw_shl opt_nuw_nsw type_value Comma value      instruction_metadata { Some $1, Llvm.Shl(fst $3, snd $3, $4, $6, $7) }
| local_eq Kw_fadd fast_math_flags type_value Comma value instruction_metadata { Some $1, Llvm.Fadd($3, $4, $6, $7) }
| local_eq Kw_fsub fast_math_flags type_value Comma value instruction_metadata { Some $1, Llvm.Fsub($3, $4, $6, $7) }
| local_eq Kw_fmul fast_math_flags type_value Comma value instruction_metadata { Some $1, Llvm.Fmul($3, $4, $6, $7) }
| local_eq Kw_fdiv fast_math_flags type_value Comma value instruction_metadata { Some $1, Llvm.Fdiv($3, $4, $6, $7) }
| local_eq Kw_frem fast_math_flags type_value Comma value instruction_metadata { Some $1, Llvm.Frem($3, $4, $6, $7) }
| local_eq Kw_sdiv opt_exact type_value Comma value       instruction_metadata { Some $1, Llvm.Sdiv($3, $4, $6, $7) }
| local_eq Kw_udiv opt_exact type_value Comma value       instruction_metadata { Some $1, Llvm.Udiv($3, $4, $6, $7) }
| local_eq Kw_lshr opt_exact type_value Comma value       instruction_metadata { Some $1, Llvm.Lshr($3, $4, $6, $7) }
| local_eq Kw_ashr opt_exact type_value Comma value       instruction_metadata { Some $1, Llvm.Ashr($3, $4, $6, $7) }
| local_eq Kw_urem type_value Comma value                 instruction_metadata { Some $1, Llvm.Urem($3, $5, $6) }
| local_eq Kw_srem type_value Comma value                 instruction_metadata { Some $1, Llvm.Srem($3, $5, $6) }
| local_eq Kw_and type_value Comma value                  instruction_metadata { Some $1, Llvm.And($3, $5, $6) }
| local_eq Kw_or type_value Comma value                   instruction_metadata { Some $1, Llvm.Or($3, $5, $6) }
| local_eq Kw_xor type_value Comma value                  instruction_metadata { Some $1, Llvm.Xor($3, $5, $6) }
| local_eq Kw_icmp icmp_predicate type_value Comma value  instruction_metadata { Some $1, Llvm.Icmp($3, $4, $6, $7) }
| local_eq Kw_fcmp fcmp_predicate type_value Comma value  instruction_metadata { Some $1, Llvm.Fcmp($3, $4, $6, $7) }
| local_eq Kw_trunc type_value Kw_to typ                  instruction_metadata { Some $1, Llvm.Trunc($3, $5, $6) }
| local_eq Kw_zext type_value Kw_to typ                   instruction_metadata { Some $1, Llvm.Zext($3, $5, $6) }
| local_eq Kw_sext type_value Kw_to typ                   instruction_metadata { Some $1, Llvm.Sext($3, $5, $6) }
| local_eq Kw_fptrunc type_value Kw_to typ                instruction_metadata { Some $1, Llvm.Fptrunc($3, $5, $6) }
| local_eq Kw_fpext type_value Kw_to typ                  instruction_metadata { Some $1, Llvm.Fpext($3, $5, $6) }
| local_eq Kw_bitcast type_value Kw_to typ                instruction_metadata { Some $1, Llvm.Bitcast($3, $5, $6) }
| local_eq Kw_addrspacecast type_value Kw_to typ          instruction_metadata { Some $1, Llvm.Addrspacecast($3, $5, $6) }
| local_eq Kw_uitofp type_value Kw_to typ                 instruction_metadata { Some $1, Llvm.Uitofp($3, $5, $6) }
| local_eq Kw_sitofp type_value Kw_to typ                 instruction_metadata { Some $1, Llvm.Sitofp($3, $5, $6) }
| local_eq Kw_fptoui type_value Kw_to typ                 instruction_metadata { Some $1, Llvm.Fptoui($3, $5, $6) }
| local_eq Kw_fptosi type_value Kw_to typ                 instruction_metadata { Some $1, Llvm.Fptosi($3, $5, $6) }
| local_eq Kw_inttoptr type_value Kw_to typ               instruction_metadata { Some $1, Llvm.Inttoptr($3, $5, $6) }
| local_eq Kw_ptrtoint type_value Kw_to typ               instruction_metadata { Some $1, Llvm.Ptrtoint($3, $5, $6) }
| local_eq Kw_va_arg type_value Comma typ                 instruction_metadata { Some $1, Llvm.Va_arg($3, $5, $6) }
| local_eq Kw_getelementptr opt_inbounds type_value_LIST_metadata              { Some $1, Llvm.Getelementptr($3, fst $4, snd $4) }
| local_eq Kw_extractelement type_value_LIST_metadata                          { Some $1, Llvm.Extractelement(fst $3, snd $3) }
| local_eq Kw_insertelement type_value_LIST_metadata                           { Some $1, Llvm.Insertelement(fst $3, snd $3) }
| local_eq Kw_shufflevector type_value_LIST_metadata                           { Some $1, Llvm.Shufflevector(fst $3, snd $3) }
| local_eq Kw_select type_value_LIST_metadata                                  { Some $1, Llvm.Select(fst $3, snd $3) }
| local_eq Kw_phi typ phi_list_metadata                                        { Some $1, Llvm.Phi($3, fst $4, snd $4) }
| local_eq Kw_landingpad typ Kw_personality type_value Kw_cleanup landingpad_list
                                                          instruction_metadata { Some $1, Llvm.Landingpad($3, $5, true, $7, $8) }
| local_eq Kw_landingpad typ Kw_personality type_value nonempty_landingpad_list
                                                          instruction_metadata { Some $1, Llvm.Landingpad($3, $5, false, $6, $7) }
| opt_local opt_tail Kw_call opt_callingconv return_attributes typ value Lparen param_list Rparen call_attributes
                                                          instruction_metadata { $1, Llvm.Call($2, $4, $5, $6, $7, $9, $11, $12) }
| local_eq Kw_alloca alloc_metadata                                            { Some $1, $3 }
| local_eq Kw_load opt_atomic opt_volatile type_value scopeandordering
                                                                align_metadata { Some $1, Llvm.Load($3, $4, $5, $6, fst $7, snd $7) }
| Kw_store opt_atomic opt_volatile type_value Comma type_value scopeandordering
                                                                align_metadata { None, Llvm.Store($2, $3, $4, $6, $7, fst $8, snd $8) }
| local_eq Kw_cmpxchg opt_volatile type_value Comma type_value Comma type_value opt_singlethread ordering ordering
                                                          instruction_metadata { Some $1, Llvm.Cmpxchg($3, $4, $6, $8, $9, $10, $11, $12) }
| local_eq Kw_atomicrmw opt_volatile binop type_value Comma type_value opt_singlethread ordering
                                                          instruction_metadata { Some $1, Llvm.Atomicrmw($3, $4, $5, $7, $8, $9, $10) }
| Kw_fence opt_singlethread ordering                      instruction_metadata { None, Llvm.Fence($2, $3, $4) }
| local_eq Kw_extractvalue type_value index_list_metadata                      { Some $1, Llvm.Extractvalue($3, fst $4, snd $4) }
| local_eq Kw_insertvalue type_value Comma type_value index_list_metadata      { Some $1, Llvm.Insertvalue($3, $5, fst $6, snd $6) }
;
binop:
| Kw_xchg { Llvm.Xchg }
| Kw_add  { Llvm.Add  }
| Kw_sub  { Llvm.Sub  }
| Kw_and  { Llvm.And  }
| Kw_nand { Llvm.Nand }
| Kw_or   { Llvm.Or   }
| Kw_xor  { Llvm.Xor  }
| Kw_max  { Llvm.Max  }
| Kw_min  { Llvm.Min  }
| Kw_umax { Llvm.Umax }
| Kw_umin { Llvm.Umin }
;
phi_list_metadata:
| Lsquare value Comma value Rsquare instruction_metadata    { [($2, $4)], $6 }
| Lsquare value Comma value Rsquare Comma phi_list_metadata { ($2, $4)::(fst $7), snd $7 }
;
nonempty_landingpad_list:
| Kw_catch typ value                  { [Llvm.Catch($2, $3)] }
| Kw_filter typ value                 { [Llvm.Filter($2, $3)] }
| Kw_catch typ value landingpad_list  { (Llvm.Catch($2, $3))::$4 }
| Kw_filter typ value landingpad_list { (Llvm.Filter($2, $3))::$4 }
;
landingpad_list:
| /* empty */                         { [] }
| nonempty_landingpad_list            { $1 }
;
ordering:
| Kw_unordered { Llvm.Unordered }
| Kw_monotonic { Llvm.Monotonic }
| Kw_acquire   { Llvm.Acquire   }
| Kw_release   { Llvm.Release   }
| Kw_acq_rel   { Llvm.Acq_rel   }
| Kw_seq_cst   { Llvm.Seq_cst   }
;
opt_singlethread:
| /* empty */               { false }
| Kw_singlethread           { true }
scopeandordering:
| /* empty */               { None }
| opt_singlethread ordering { Some($1, $2) }
;
alloc_metadata:
| Kw_inalloca typ Comma type_value Comma Kw_align APInt instruction_metadata { Llvm.Alloca(true,  $2, Some $4, Some(int_of_string $7), $8) }
| Kw_inalloca typ Comma type_value                      instruction_metadata { Llvm.Alloca(true,  $2, Some $4, None, $5) }
| Kw_inalloca typ Comma Kw_align APInt                  instruction_metadata { Llvm.Alloca(true,  $2, None, Some(int_of_string $5), $6) }
| Kw_inalloca typ                                       instruction_metadata { Llvm.Alloca(true,  $2, None, None, $3) }
| typ Comma type_value Comma Kw_align APInt             instruction_metadata { Llvm.Alloca(false, $1, Some $3, Some(int_of_string $6), $7) }
| typ Comma type_value                                  instruction_metadata { Llvm.Alloca(false, $1, Some $3, None, $4) }
| typ Comma Kw_align APInt                              instruction_metadata { Llvm.Alloca(false, $1, None, Some(int_of_string $4), $5) }
| typ                                                   instruction_metadata { Llvm.Alloca(false, $1, None, None, $2) }
;
fast_math_flags:
| /* empty */                    { [] }
| fast_math_flag fast_math_flags { $1::$2 }
;
fast_math_flag:
| Kw_fast { Llvm.Fast }
| Kw_nnan { Llvm.Nnan }
| Kw_ninf { Llvm.Ninf }
| Kw_nsz  { Llvm.Nsz  }
| Kw_arcp { Llvm.Arcp }
;
terminator_instruction:
| Kw_unreachable                                                   instruction_metadata { None, Llvm.Unreachable $2 }
| Kw_ret Kw_void                                                   instruction_metadata { None, Llvm.Return(None,$3) } /* we need to distinguish void from all other types else we have a dependent grammar */
| Kw_ret non_void_type value                                       instruction_metadata { None, Llvm.Return(Some($2, $3),$4) }
| Kw_br type_value                                                 instruction_metadata { None, Llvm.Br($2, None, $3) }
| Kw_br type_value Comma type_value Comma type_value               instruction_metadata { None, Llvm.Br($2, Some($4, $6), $7) }
| Kw_indirectbr type_value Comma Lsquare type_value_LIST Rsquare   instruction_metadata { None, Llvm.Indirectbr($2, $5, $7) }
| Kw_resume type_value                                             instruction_metadata { None, Llvm.Resume($2, $3) }
| Kw_switch type_value Comma type_value Lsquare jump_table Rsquare instruction_metadata { None, Llvm.Switch($2, $4, $6, $8) }
| opt_local Kw_invoke opt_callingconv return_attributes typ value Lparen param_list Rparen function_attributes Kw_to type_value Kw_unwind type_value instruction_metadata { $1, Llvm.Invoke($3, $4, $5, $6, $8, $10, $12, $14, $15) }
;
call_attributes:
| /* empty */                    { [] }
| call_attribute call_attributes { $1::$2 }
;
call_attribute:
| AttrGrpID   { Llvm.Attrgrp($1) }
| Kw_noreturn { Llvm.Noreturn }
| Kw_nounwind { Llvm.Nounwind }
| Kw_readnone { Llvm.Readnone }
| Kw_readonly { Llvm.Readonly }
;
function_attributes:
| /* empty */                            { [] }
| function_attribute function_attributes { $1::$2 }
;
function_attribute:
| AttrGrpID                                { Llvm.Attrgrp($1) }
| StringConstant Equal StringConstant      { Llvm.Attr($1, Some $3) }
| Kw_alignstack Equal Lparen APInt Rparen  { Llvm.Alignstack(int_of_string $4) }
| Kw_alwaysinline                          { Llvm.Alwaysinline     }
| Kw_builtin                               { Llvm.Builtin          }
| Kw_cold                                  { Llvm.Cold             }
| Kw_inlinehint                            { Llvm.Inlinehint       }
| Kw_minsize                               { Llvm.Minsize          }
| Kw_naked                                 { Llvm.Naked            }
| Kw_nobuiltin                             { Llvm.Nobuiltin        }
| Kw_noduplicate                           { Llvm.Noduplicate      }
| Kw_noimplicitfloat                       { Llvm.Noimplicitfloat  }
| Kw_noinline                              { Llvm.Noinline         }
| Kw_nonlazybind                           { Llvm.Nonlazybind      }
| Kw_noredzone                             { Llvm.Noredzone        }
| Kw_noreturn                              { Llvm.Noreturn         }
| Kw_nounwind                              { Llvm.Nounwind         }
| Kw_optnone                               { Llvm.Optnone          }
| Kw_optsize                               { Llvm.Optsize          }
| Kw_readnone                              { Llvm.Readnone         }
| Kw_readonly                              { Llvm.Readonly         }
| Kw_returns_twice                         { Llvm.Returns_twice    }
| Kw_ssp                                   { Llvm.Ssp              }
| Kw_sspreq                                { Llvm.Sspreq           }
| Kw_sspstrong                             { Llvm.Sspstrong        }
| Kw_sanitize_address                      { Llvm.Sanitize_address }
| Kw_sanitize_thread                       { Llvm.Sanitize_thread  }
| Kw_sanitize_memory                       { Llvm.Sanitize_memory  }
| Kw_uwtable                               { Llvm.Uwtable          }
;
group_attributes:
| /* empty */                      { [] }
| group_attribute group_attributes { $1::$2 }
;
group_attribute:
| StringConstant                      { Llvm.Attr($1, None) }
| StringConstant Equal StringConstant { Llvm.Attr($1, Some $3) }
| Kw_align Equal APInt                { Llvm.Align(int_of_string $3) }
| Kw_alignstack Equal APInt           { Llvm.Alignstack(int_of_string $3) }
| Kw_alwaysinline                     { Llvm.Alwaysinline    }
| Kw_builtin                          { Llvm.Builtin         }
| Kw_cold                             { Llvm.Cold            }
| Kw_inlinehint                       { Llvm.Inlinehint      }
| Kw_minsize                          { Llvm.Minsize         }
| Kw_naked                            { Llvm.Naked           }
| Kw_nobuiltin                        { Llvm.Nobuiltin       }
| Kw_noduplicate                      { Llvm.Noduplicate     }
| Kw_noimplicitfloat                  { Llvm.Noimplicitfloat }
| Kw_noinline                         { Llvm.Noinline        }
| Kw_nonlazybind                      { Llvm.Nonlazybind     }
| Kw_noredzone                        { Llvm.Noredzone       }
| Kw_noreturn                         { Llvm.Noreturn        }
| Kw_nounwind                         { Llvm.Nounwind        }
| Kw_optnone                          { Llvm.Optnone         }
| Kw_optsize                          { Llvm.Optsize         }
| Kw_readnone                         { Llvm.Readnone        }
| Kw_readonly                         { Llvm.Readonly        }
| Kw_returns_twice                    { Llvm.Returns_twice   }
| Kw_ssp                              { Llvm.Ssp             }
| Kw_sspreq                           { Llvm.Sspreq          }
| Kw_sspstrong                        { Llvm.Sspstrong       }
| Kw_sanitize_address                 { Llvm.Sanitize_address}
| Kw_sanitize_thread                  { Llvm.Sanitize_thread }
| Kw_sanitize_memory                  { Llvm.Sanitize_memory }
| Kw_uwtable                          { Llvm.Uwtable         }
;
param_list:
| /* empty */            { [] }
| param                  { [$1] }
| param Comma param_list { $1::$3 }
;
param:
| typ param_attribute_list value { ($1, $2, $3) }
;
param_attribute_list:
| /* empty */                          { [] }
| param_attribute param_attribute_list { $1::$2 }
param_attribute:
| Kw_align APInt                          { Llvm.Align(int_of_string $2) }
| Kw_byval                                { Llvm.Byval     }
| Kw_dereferenceable Lparen APInt Rparen  { Llvm.Dereferenceable(int_of_string $3) }
| Kw_inalloca                             { Llvm.Inalloca  }
| Kw_inreg                                { Llvm.Inreg     }
| Kw_nest                                 { Llvm.Nest      }
| Kw_noalias                              { Llvm.Noalias   }
| Kw_nocapture                            { Llvm.Nocapture }
| Kw_nonnull                              { Llvm.Nonnull   }
| Kw_readnone                             { Llvm.Readnone  }
| Kw_readonly                             { Llvm.Readonly  }
| Kw_returned                             { Llvm.Returned  }
| Kw_signext                              { Llvm.Signext   }
| Kw_sret                                 { Llvm.Sret      }
| Kw_zeroext                              { Llvm.Zeroext   }
;
jump_table:
| /* empty */                            { [] }
| type_value Comma type_value jump_table { ($1,$3)::$4 }
;
type_value:
| typ value { ($1, $2) }
;
opt_sideeffect:
| /* empty */   { false }
| Kw_sideeffect { true }
;
opt_alignstack:
| /* empty */   { false }
| Kw_alignstack { true }
;
opt_inteldialect:
| /* empty */     { false }
| Kw_inteldialect { true }
;
opt_exact:
| /* empty */ { false }
| Kw_exact    { true }
;
opt_nuw_nsw:
| /* empty */   { (false, false) }
| Kw_nuw Kw_nsw { (true, true)   }
| Kw_nsw Kw_nuw { (true, true)   }
| Kw_nuw        { (true, false)  }
| Kw_nsw        { (false, true)  }
;
opt_thread_local:
| /* empty */                                   { None }
| Kw_thread_local                               { Some None }
| Kw_thread_local Lparen Kw_localdynamic Rparen { Some (Some Bc.Localdynamic) }
| Kw_thread_local Lparen Kw_initialexec Rparen  { Some (Some Bc.Initialexec) }
| Kw_thread_local Lparen Kw_localexec Rparen    { Some (Some Bc.Localexec) }
;
opt_addrspace:
| /* empty */                      { None }
| Kw_addrspace Lparen APInt Rparen { Some (int_of_string $3) }
;
opt_unnamed_addr:
| /* empty */     { false }
| Kw_unnamed_addr { true }
;
opt_externally_initialized:
| /* empty */               { false }
| Kw_externally_initialized { true }
;
opt_dll_storageclass:
| /* empty */  { None }
| Kw_dllimport { Some Bc.Dllimport }
| Kw_dllexport { Some Bc.Dllexport }
;
opt_linkage:
| external_linkage     { Some $1 }
| non_external_linkage { $1 }
;
external_linkage:
| Kw_extern_weak { Bc.Extern_weak }
| Kw_external    { Bc.External }
;
non_external_linkage:
| /* empty */             { None }
| Kw_private              { Some Bc.Private }
| Kw_internal             { Some Bc.Internal }
| Kw_weak                 { Some Bc.Weak }
| Kw_weak_odr             { Some Bc.Weak_odr }
| Kw_linkonce             { Some Bc.Linkonce }
| Kw_linkonce_odr         { Some Bc.Linkonce_odr }
| Kw_available_externally { Some Bc.Available_externally }
| Kw_appending            { Some Bc.Appending }
| Kw_common               { Some Bc.Common }
;
opt_visibility:
| /* empty */  { None }
| Kw_default   { Some Bc.Default }
| Kw_hidden    { Some Bc.Hidden }
| Kw_protected { Some Bc.Protected }
;
opt_callingconv:
| /* empty */          { None }
| Kw_ccc               { Some Llvm.Ccc               }
| Kw_fastcc            { Some Llvm.Fastcc            }
| Kw_intel_ocl_bicc    { Some Llvm.Intel_ocl_bicc    }
| Kw_coldcc            { Some Llvm.Coldcc            }
| Kw_x86_stdcallcc     { Some Llvm.X86_stdcallcc     }
| Kw_x86_fastcallcc    { Some Llvm.X86_fastcallcc    }
| Kw_x86_thiscallcc    { Some Llvm.X86_thiscallcc    }
| Kw_x86_cdeclmethodcc { Some Llvm.X86_cdeclmethodcc }
| Kw_arm_apcscc        { Some Llvm.Arm_apcscc        }
| Kw_arm_aapcscc       { Some Llvm.Arm_aapcscc       }
| Kw_arm_aapcs_vfpcc   { Some Llvm.Arm_aapcs_vfpcc   }
| Kw_msp430_intrcc     { Some Llvm.Msp430_intrcc     }
| Kw_ptx_kernel        { Some Llvm.Ptx_kernel        }
| Kw_ptx_device        { Some Llvm.Ptx_device        }
| Kw_spir_func         { Some Llvm.Spir_func         }
| Kw_spir_kernel       { Some Llvm.Spir_kernel       }
| Kw_x86_64_sysvcc     { Some Llvm.X86_64_sysvcc     }
| Kw_x86_64_win64cc    { Some Llvm.X86_64_win64cc    }
| Kw_webkit_jscc       { Some Llvm.Webkit_jscc       }
| Kw_anyregcc          { Some Llvm.Anyregcc          }
| Kw_preserve_mostcc   { Some Llvm.Preserve_mostcc   }
| Kw_preserve_allcc    { Some Llvm.Preserve_allcc    }
| Kw_cc                { Some Llvm.Cc                }
;
return_attributes:
| /* empty */                        { [] }
| return_attribute return_attributes { $1::$2 }
;
return_attribute:
| Kw_inreg   { Llvm.Inreg  }
| Kw_dereferenceable Lparen APInt Rparen  { Llvm.Dereferenceable(int_of_string $3) }
| Kw_noalias { Llvm.Noalias}
| Kw_signext { Llvm.Signext}
| Kw_zeroext { Llvm.Zeroext}
| Kw_nonnull { Llvm.Nonnull}
;

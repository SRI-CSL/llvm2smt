{
open Llparse
let keyword_table = Hashtbl.create 53
let keyword k = try Hashtbl.find keyword_table k with Not_found -> Error
let _ =
  List.iter (fun (kwd, tok) -> Hashtbl.add keyword_table kwd tok)
    [
     "true"                   ,Kw_true;
     "false"                  ,Kw_false;
     "declare"                ,Kw_declare;
     "define"                 ,Kw_define;
     "global"                 ,Kw_global;
     "constant"               ,Kw_constant;
     "private"                ,Kw_private;
     "internal"               ,Kw_internal;
     "available_externally"   ,Kw_available_externally;
     "linkonce"               ,Kw_linkonce;
     "linkonce_odr"           ,Kw_linkonce_odr;
     "weak"                   ,Kw_weak;
     "weak_odr"               ,Kw_weak_odr;
     "appending"              ,Kw_appending;
     "dllimport"              ,Kw_dllimport;
     "dllexport"              ,Kw_dllexport;
     "common"                 ,Kw_common;
     "default"                ,Kw_default;
     "hidden"                 ,Kw_hidden;
     "protected"              ,Kw_protected;
     "unnamed_addr"           ,Kw_unnamed_addr;
     "externally_initialized" ,Kw_externally_initialized;
     "extern_weak"            ,Kw_extern_weak;
     "external"               ,Kw_external;
     "thread_local"           ,Kw_thread_local;
     "localdynamic"           ,Kw_localdynamic;
     "initialexec"            ,Kw_initialexec;
     "localexec"              ,Kw_localexec;
     "zeroinitializer"        ,Kw_zeroinitializer;
     "undef"                  ,Kw_undef;
     "null"                   ,Kw_null;
     "to"                     ,Kw_to;
     "tail"                   ,Kw_tail;
     "target"                 ,Kw_target;
     "triple"                 ,Kw_triple;
     "unwind"                 ,Kw_unwind;
     "deplibs"                ,Kw_deplibs (* FIXME: Remove in 4.0. *);
     "datalayout"             ,Kw_datalayout;
     "volatile"               ,Kw_volatile;
     "atomic"                 ,Kw_atomic;
     "unordered"              ,Kw_unordered;
     "monotonic"              ,Kw_monotonic;
     "acquire"                ,Kw_acquire;
     "release"                ,Kw_release;
     "acq_rel"                ,Kw_acq_rel;
     "seq_cst"                ,Kw_seq_cst;
     "singlethread"           ,Kw_singlethread;
     "nnan"                   ,Kw_nnan;
     "ninf"                   ,Kw_ninf;
     "nsz"                    ,Kw_nsz;
     "arcp"                   ,Kw_arcp;
     "fast"                   ,Kw_fast;
     "nuw"                    ,Kw_nuw;
     "nsw"                    ,Kw_nsw;
     "exact"                  ,Kw_exact;
     "inbounds"               ,Kw_inbounds;
     "align"                  ,Kw_align;
     "addrspace"              ,Kw_addrspace;
     "section"                ,Kw_section;
     "alias"                  ,Kw_alias;
     "module"                 ,Kw_module;
     "asm"                    ,Kw_asm;
     "sideeffect"             ,Kw_sideeffect;
     "alignstack"             ,Kw_alignstack;
     "inteldialect"           ,Kw_inteldialect;
     "gc"                     ,Kw_gc;
     "prefix"                 ,Kw_prefix;
     "ccc"                    ,Kw_ccc;
     "fastcc"                 ,Kw_fastcc;
     "coldcc"                 ,Kw_coldcc;
     "x86_stdcallcc"          ,Kw_x86_stdcallcc;
     "x86_fastcallcc"         ,Kw_x86_fastcallcc;
     "x86_thiscallcc"         ,Kw_x86_thiscallcc;
     "x86_cdeclmethodcc"      ,Kw_x86_cdeclmethodcc;
     "arm_apcscc"             ,Kw_arm_apcscc;
     "arm_aapcscc"            ,Kw_arm_aapcscc;
     "arm_aapcs_vfpcc"        ,Kw_arm_aapcs_vfpcc;
     "msp430_intrcc"          ,Kw_msp430_intrcc;
     "ptx_kernel"             ,Kw_ptx_kernel;
     "ptx_device"             ,Kw_ptx_device;
     "spir_kernel"            ,Kw_spir_kernel;
     "spir_func"              ,Kw_spir_func;
     "intel_ocl_bicc"         ,Kw_intel_ocl_bicc;
     "x86_64_sysvcc"          ,Kw_x86_64_sysvcc;
     "x86_64_win64cc"         ,Kw_x86_64_win64cc;
     "webkit_jscc"            ,Kw_webkit_jscc;
     "anyregcc"               ,Kw_anyregcc;
     "preserve_mostcc"        ,Kw_preserve_mostcc;
     "preserve_allcc"         ,Kw_preserve_allcc;
     "cc"                     ,Kw_cc;
     "c"                      ,Kw_c;
     "attributes"             ,Kw_attributes;
     "argmemonly"             ,Kw_argmemonly;
     "alwaysinline"           ,Kw_alwaysinline;
     "builtin"                ,Kw_builtin;
     "byval"                  ,Kw_byval;
     "inalloca"               ,Kw_inalloca;
     "cold"                   ,Kw_cold;
     "inlinehint"             ,Kw_inlinehint;
     "inreg"                  ,Kw_inreg;
     "minsize"                ,Kw_minsize;
     "naked"                  ,Kw_naked;
     "nest"                   ,Kw_nest;
     "noalias"                ,Kw_noalias;
     "nobuiltin"              ,Kw_nobuiltin;
     "nocapture"              ,Kw_nocapture;
     "noduplicate"            ,Kw_noduplicate;
     "noimplicitfloat"        ,Kw_noimplicitfloat;
     "noinline"               ,Kw_noinline;
     "nonlazybind"            ,Kw_nonlazybind;
     "noredzone"              ,Kw_noredzone;
     "noreturn"               ,Kw_noreturn;
     "nounwind"               ,Kw_nounwind;
     "norecurse"              ,Kw_norecurse;     
     "optnone"                ,Kw_optnone;
     "optsize"                ,Kw_optsize;
     "readnone"               ,Kw_readnone;
     "readonly"               ,Kw_readonly;
     "returned"               ,Kw_returned;
     "nonnull"                ,Kw_nonnull;
     "dereferenceable"        ,Kw_dereferenceable;
     "returns_twice"          ,Kw_returns_twice;
     "signext"                ,Kw_signext;
     "sret"                   ,Kw_sret;
     "ssp"                    ,Kw_ssp;
     "sspreq"                 ,Kw_sspreq;
     "sspstrong"              ,Kw_sspstrong;
     "sanitize_address"       ,Kw_sanitize_address;
     "sanitize_thread"        ,Kw_sanitize_thread;
     "sanitize_memory"        ,Kw_sanitize_memory;
     "uwtable"                ,Kw_uwtable;
     "zeroext"                ,Kw_zeroext;
     "type"                   ,Kw_type;
     "opaque"                 ,Kw_opaque;
     "eq"                     ,Kw_eq;
     "ne"                     ,Kw_ne;
     "slt"                    ,Kw_slt;
     "sgt"                    ,Kw_sgt;
     "sle"                    ,Kw_sle;
     "sge"                    ,Kw_sge;
     "ult"                    ,Kw_ult;
     "ugt"                    ,Kw_ugt;
     "ule"                    ,Kw_ule;
     "uge"                    ,Kw_uge;
     "oeq"                    ,Kw_oeq;
     "one"                    ,Kw_one;
     "olt"                    ,Kw_olt;
     "ogt"                    ,Kw_ogt;
     "ole"                    ,Kw_ole;
     "oge"                    ,Kw_oge;
     "ord"                    ,Kw_ord;
     "uno"                    ,Kw_uno;
     "ueq"                    ,Kw_ueq;
     "une"                    ,Kw_une;
     "xchg"                   ,Kw_xchg;
     "nand"                   ,Kw_nand;
     "max"                    ,Kw_max;
     "min"                    ,Kw_min;
     "umax"                   ,Kw_umax;
     "umin"                   ,Kw_umin;
     "x"                      ,Kw_x;
     "blockaddress"           ,Kw_blockaddress;
     "personality"            ,Kw_personality;
     "cleanup"                ,Kw_cleanup;
     "catch"                  ,Kw_catch;
     "filter"                 ,Kw_filter;
     "void"                   ,Kw_void;
     "half"                   ,Kw_half;
     "float"                  ,Kw_float;
     "double"                 ,Kw_double;
     "x86_fp80"               ,Kw_x86_fp80;
     "fp128"                  ,Kw_fp128;
     "ppc_fp128"              ,Kw_ppc_fp128;
     "label"                  ,Kw_label;
     "metadata"               ,Kw_metadata;
     "x86_mmx"                ,Kw_x86_mmx;
     "add"                    ,Kw_add;
     "fadd"                   ,Kw_fadd;
     "sub"                    ,Kw_sub;
     "fsub"                   ,Kw_fsub;
     "mul"                    ,Kw_mul;
     "fmul"                   ,Kw_fmul;
     "udiv"                   ,Kw_udiv;
     "sdiv"                   ,Kw_sdiv;
     "fdiv"                   ,Kw_fdiv;
     "urem"                   ,Kw_urem;
     "srem"                   ,Kw_srem;
     "frem"                   ,Kw_frem;
     "shl"                    ,Kw_shl;
     "lshr"                   ,Kw_lshr;
     "ashr"                   ,Kw_ashr;
     "and"                    ,Kw_and;
     "or"                     ,Kw_or;
     "xor"                    ,Kw_xor;
     "icmp"                   ,Kw_icmp;
     "fcmp"                   ,Kw_fcmp;
     "phi"                    ,Kw_phi;
     "call"                   ,Kw_call;
     "trunc"                  ,Kw_trunc;
     "zext"                   ,Kw_zext;
     "sext"                   ,Kw_sext;
     "fptrunc"                ,Kw_fptrunc;
     "fpext"                  ,Kw_fpext;
     "uitofp"                 ,Kw_uitofp;
     "sitofp"                 ,Kw_sitofp;
     "fptoui"                 ,Kw_fptoui;
     "fptosi"                 ,Kw_fptosi;
     "inttoptr"               ,Kw_inttoptr;
     "ptrtoint"               ,Kw_ptrtoint;
     "bitcast"                ,Kw_bitcast;
     "addrspacecast"          ,Kw_addrspacecast;
     "select"                 ,Kw_select;
     "va_arg"                 ,Kw_va_arg;
     "ret"                    ,Kw_ret;
     "br"                     ,Kw_br;
     "switch"                 ,Kw_switch;
     "indirectbr"             ,Kw_indirectbr;
     "invoke"                 ,Kw_invoke;
     "resume"                 ,Kw_resume;
     "unreachable"            ,Kw_unreachable;
     "alloca"                 ,Kw_alloca;
     "load"                   ,Kw_load;
     "store"                  ,Kw_store;
     "cmpxchg"                ,Kw_cmpxchg;
     "atomicrmw"              ,Kw_atomicrmw;
     "fence"                  ,Kw_fence;
     "getelementptr"          ,Kw_getelementptr;
     "extractelement"         ,Kw_extractelement;
     "insertelement"          ,Kw_insertelement;
     "shufflevector"          ,Kw_shufflevector;
     "extractvalue"           ,Kw_extractvalue;
     "insertvalue"            ,Kw_insertvalue;
     "landingpad"             ,Kw_landingpad
   ]

}

let digit     = ['0'-'9']
let hexdigit  = ['0'-'9' 'a'-'f' 'A'-'F']
let idchar0   = ['-' 'a'-'z' 'A'-'Z' '$' '.' '_']
let idchar    = ['-' 'a'-'z' 'A'-'Z' '$' '.' '_' '0'-'9']
let metachar0 = ['-' 'a'-'z' 'A'-'Z' '$' '.' '_' '$' '\\']
let metachar  = ['-' 'a'-'z' 'A'-'Z' '$' '.' '_' '$' '\\' '0'-'9']
let dquote    = '"'
let notdquote = [^'"']
let plusminus = ['-''+']

rule token =
parse eof                                                    { Eof }
| ['\000' ' ' '\t' '\r']+                                    { token lexbuf }
| '\n'                                                       { Lexing.new_line lexbuf; token lexbuf }
| ';' [^'\n''\r']*                                           { token lexbuf }
| plusminus? digit+ '.' digit* (['e''E'] plusminus? digit+)? { APFloat(Lexing.lexeme lexbuf) }
| plusminus? digit+                                          { APInt(Lexing.lexeme lexbuf) }
| '@' (dquote notdquote* dquote as x)                        { GlobalVar(Llvm.Name(true,x)) }
| '@' (idchar0 idchar* as x)                                 { GlobalVar(Llvm.Name(true,x)) }
| '@' (digit+ as x)                                          { GlobalID(Llvm.Id(true,int_of_string x)) }
| '%' (dquote notdquote* dquote as x)                        { LocalVar(Llvm.Name(false,x)) }
| '%' (idchar0 idchar* as x)                                 { LocalVar(Llvm.Name(false,x)) }
| '%' (digit+ as x)                                          { LocalVarID(Llvm.Id(false,int_of_string x)) }
| (dquote notdquote+ dquote as x) ':'                        { LabelStr x }
| dquote notdquote* dquote                                   { StringConstant(Lexing.lexeme lexbuf) }
| (idchar+ as x) ':'                                         { LabelStr x }
| "..."                                                      { DotDotDot }
| 'i' (digit+ as numbits)                                    { I(int_of_string numbits) }
| ['u' 's'] "0x" hexdigit+                                   { APSint(Lexing.lexeme lexbuf) }
| "cc"                                                       { Kw_cc }
| ['_' 'a'-'z' 'A'-'Z'] idchar*                              { keyword(Lexing.lexeme lexbuf) }
| '!' (metachar0 metachar* as x)                             { MetadataVar x }
| '!'                                                        { Exclaim }
| '#' (digit+ as x)                                          { AttrGrpID(int_of_string x) }
| '0' 'x' hexdigit+                                          { APFloat(Lexing.lexeme lexbuf) }
| '0' 'x' 'K' hexdigit+                                      { APFloat(Lexing.lexeme lexbuf) }
| '0' 'x' 'L' hexdigit+                                      { APFloat(Lexing.lexeme lexbuf) }
| '0' 'x' 'M' hexdigit+                                      { APFloat(Lexing.lexeme lexbuf) }
| '='                                                        { Equal }
| '['                                                        { Lsquare }
| ']'                                                        { Rsquare }
| '{'                                                        { Lbrace }
| '}'                                                        { Rbrace }
| '<'                                                        { Less }
| '>'                                                        { Greater }
| '('                                                        { Lparen }
| ')'                                                        { Rparen }
| ','                                                        { Comma }
| '*'                                                        { Star }
| '\\'                                                       { Backslash }
| _                                                          { Error }

{
let parse ch =
  let lexbuf = Lexing.from_channel ch in
  let cu =
    try main token lexbuf
    with Parsing.Parse_error ->
      let p = Lexing.lexeme_start_p lexbuf in
      Printf.eprintf "Parse error at line %d character %d, the lexeme is %s\n"
        p.Lexing.pos_lnum
        (p.Lexing.pos_cnum - p.Lexing.pos_bol)
        (Lexing.lexeme lexbuf);
      failwith "Giving up" in
  cu
}

; ModuleID = 'minisat.darwin.bc'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

%"class.Minisat::Solver" = type { i32 (...)**, %"class.Minisat::vec", %"class.Minisat::vec.0", i32, double, double, double, double, i8, i32, i32, i8, i8, double, i32, double, double, double, i32, double, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i8, %"class.Minisat::vec.1", %"class.Minisat::vec.1", double, %"class.Minisat::vec.2", double, %"class.Minisat::OccLists", %"class.Minisat::vec", %"class.Minisat::vec.5", %"class.Minisat::vec.5", %"class.Minisat::vec.0", %"class.Minisat::vec.6", %"class.Minisat::vec.7", i32, i32, i64, %"class.Minisat::vec.0", %"class.Minisat::Heap", double, i8, [7 x i8], %"class.Minisat::ClauseAllocator", %"class.Minisat::vec.5", %"class.Minisat::vec.0", %"class.Minisat::vec.0", %"class.Minisat::vec.0", double, double, i32, i64, i64, i8 }
%"class.Minisat::vec.1" = type { i32*, i32, i32 }
%"class.Minisat::vec.2" = type { double*, i32, i32 }
%"class.Minisat::OccLists" = type { %"class.Minisat::vec.3", %"class.Minisat::vec.5", %"class.Minisat::vec.0", %"struct.Minisat::Solver::WatcherDeleted" }
%"class.Minisat::vec.3" = type { %"class.Minisat::vec.4"*, i32, i32 }
%"class.Minisat::vec.4" = type { %"struct.Minisat::Solver::Watcher"*, i32, i32 }
%"struct.Minisat::Solver::Watcher" = type { i32, %"struct.Minisat::Lit" }
%"struct.Minisat::Lit" = type { i32 }
%"struct.Minisat::Solver::WatcherDeleted" = type { %"class.Minisat::ClauseAllocator"* }
%"class.Minisat::vec" = type { %"class.Minisat::lbool"*, i32, i32 }
%"class.Minisat::lbool" = type { i8 }
%"class.Minisat::vec.6" = type { i32*, i32, i32 }
%"class.Minisat::vec.7" = type { %"struct.Minisat::Solver::VarData"*, i32, i32 }
%"struct.Minisat::Solver::VarData" = type { i32, i32 }
%"class.Minisat::Heap" = type { %"struct.Minisat::Solver::VarOrderLt", %"class.Minisat::vec.6", %"class.Minisat::vec.6" }
%"struct.Minisat::Solver::VarOrderLt" = type { %"class.Minisat::vec.2"* }
%"class.Minisat::ClauseAllocator" = type { [20 x i8], i8, [3 x i8] }
%"class.Minisat::vec.5" = type { i8*, i32, i32 }
%"class.Minisat::vec.0" = type { %"struct.Minisat::Lit"*, i32, i32 }
%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }
%"class.Minisat::vec.8" = type { %"class.Minisat::Option"**, i32, i32 }
%"class.Minisat::Option" = type { i32 (...)**, i8*, i8*, i8*, i8* }
%"class.Minisat::DoubleOption" = type { %"class.Minisat::Option", %"struct.Minisat::DoubleRange", double }
%"struct.Minisat::DoubleRange" = type { double, double, i8, i8 }
%"class.Minisat::IntOption" = type { %"class.Minisat::Option", %"struct.Minisat::IntRange", i32 }
%"struct.Minisat::IntRange" = type { i32, i32 }
%"class.Minisat::BoolOption" = type { %"class.Minisat::Option", i8 }
%struct.rusage = type { %struct.timeval, %struct.timeval, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.timeval = type { i64, i32 }
%"class.Minisat::StreamBuffer" = type { i8*, [1048576 x i8], i32, i32 }
%struct.rlimit = type { i64, i64 }
%"class.Minisat::RegionAllocator" = type { i32*, i32, i32, i32 }
%"class.Minisat::Clause" = type { %struct.anon, [0 x %union.anon] }
%struct.anon = type { [4 x i8] }
%union.anon = type { %"struct.Minisat::Lit" }
%struct.reduceDB_lt = type { %"class.Minisat::ClauseAllocator"* }
%struct.malloc_statistics_t = type { i32, i64, i64, i64 }
%struct._malloc_zone_t = type { i8*, i8*, i64 (%struct._malloc_zone_t*, i8*)*, i8* (%struct._malloc_zone_t*, i64)*, i8* (%struct._malloc_zone_t*, i64, i64)*, i8* (%struct._malloc_zone_t*, i64)*, void (%struct._malloc_zone_t*, i8*)*, i8* (%struct._malloc_zone_t*, i8*, i64)*, void (%struct._malloc_zone_t*)*, i8*, i32 (%struct._malloc_zone_t*, i64, i8**, i32)*, void (%struct._malloc_zone_t*, i8**, i32)*, %struct.malloc_introspection_t*, i32, i8* (%struct._malloc_zone_t*, i64, i64)*, void (%struct._malloc_zone_t*, i8*, i64)*, i64 (%struct._malloc_zone_t*, i64)* }
%struct.malloc_introspection_t = type { i32 (i32, i8*, i32, i64, i32 (i32, i64, i64, i8**)*, void (i32, i8*, i32, %struct.vm_range_t*, i32)*)*, i64 (%struct._malloc_zone_t*, i64)*, i32 (%struct._malloc_zone_t*)*, void (%struct._malloc_zone_t*, i32)*, void (%struct._malloc_zone_t*, i8*)*, void (%struct._malloc_zone_t*)*, void (%struct._malloc_zone_t*)*, {}*, i32 (%struct._malloc_zone_t*)*, i32 (%struct._malloc_zone_t*)*, void (%struct._malloc_zone_t*)*, void (%struct._malloc_zone_t*, i8*)*, void (%struct._malloc_zone_t*, void (i8*, i8*)*)* }
%struct.vm_range_t = type { i64, i64 }

@.str = private unnamed_addr constant [30 x i8] c"restarts              : %llu\0A\00", align 1
@.str1 = private unnamed_addr constant [47 x i8] c"conflicts             : %-12llu   (%.0f /sec)\0A\00", align 1
@.str2 = private unnamed_addr constant [65 x i8] c"decisions             : %-12llu   (%4.2f %% random) (%.0f /sec)\0A\00", align 1
@.str3 = private unnamed_addr constant [47 x i8] c"propagations          : %-12llu   (%.0f /sec)\0A\00", align 1
@.str4 = private unnamed_addr constant [54 x i8] c"conflict literals     : %-12llu   (%4.2f %% deleted)\0A\00", align 1
@.str5 = private unnamed_addr constant [33 x i8] c"Memory used           : %.2f MB\0A\00", align 1
@.str6 = private unnamed_addr constant [30 x i8] c"CPU time              : %g s\0A\00", align 1
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTSN7Minisat20OutOfMemoryExceptionE = linkonce_odr constant [33 x i8] c"N7Minisat20OutOfMemoryExceptionE\00"
@_ZTIN7Minisat20OutOfMemoryExceptionE = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([33 x i8]* @_ZTSN7Minisat20OutOfMemoryExceptionE, i32 0, i32 0) }
@.str7 = private unnamed_addr constant [112 x i8] c"USAGE: %s [options] <input-file> <result-output-file>\0A\0A  where input may be either in plain or gzipped DIMACS.\0A\00", align 1
@.str8 = private unnamed_addr constant [5 x i8] c"MAIN\00", align 1
@.str9 = private unnamed_addr constant [5 x i8] c"verb\00", align 1
@.str10 = private unnamed_addr constant [44 x i8] c"Verbosity level (0=silent, 1=some, 2=more).\00", align 1
@.str11 = private unnamed_addr constant [8 x i8] c"cpu-lim\00", align 1
@.str12 = private unnamed_addr constant [39 x i8] c"Limit on CPU time allowed in seconds.\0A\00", align 1
@.str13 = private unnamed_addr constant [8 x i8] c"mem-lim\00", align 1
@.str14 = private unnamed_addr constant [37 x i8] c"Limit on memory usage in megabytes.\0A\00", align 1
@_ZL6solver = internal unnamed_addr global %"class.Minisat::Solver"* null, align 8
@.str18 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str19 = private unnamed_addr constant [32 x i8] c"ERROR! Could not open file: %s\0A\00", align 1
@.str20 = private unnamed_addr constant [8 x i8] c"<stdin>\00", align 1
@.str23 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str24 = private unnamed_addr constant [73 x i8] c"|  Number of variables:  %12d                                         |\0A\00", align 1
@.str25 = private unnamed_addr constant [73 x i8] c"|  Number of clauses:    %12d                                         |\0A\00", align 1
@.str26 = private unnamed_addr constant [75 x i8] c"|  Parse time:           %12.2f s                                       |\0A\00", align 1
@.str27 = private unnamed_addr constant [7 x i8] c"UNSAT\0A\00", align 1
@.str31 = private unnamed_addr constant [15 x i8] c"UNSATISFIABLE\0A\00", align 1
@.str32 = private unnamed_addr constant [13 x i8] c"SATISFIABLE\0A\00", align 1
@.str33 = private unnamed_addr constant [15 x i8] c"INDETERMINATE\0A\00", align 1
@.str34 = private unnamed_addr constant [5 x i8] c"SAT\0A\00", align 1
@.str35 = private unnamed_addr constant [7 x i8] c"%s%s%d\00", align 1
@.str36 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str37 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str38 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str39 = private unnamed_addr constant [4 x i8] c" 0\0A\00", align 1
@.str40 = private unnamed_addr constant [7 x i8] c"INDET\0A\00", align 1
@.str41 = private unnamed_addr constant [6 x i8] c"p cnf\00", align 1
@.str42 = private unnamed_addr constant [34 x i8] c"PARSE ERROR! Unexpected char: %c\0A\00", align 1
@__stderrp = external global %struct.__sFILE*
@.str43 = private unnamed_addr constant [61 x i8] c"WARNING! DIMACS header mismatch: wrong number of variables.\0A\00", align 1
@.str44 = private unnamed_addr constant [59 x i8] c"WARNING! DIMACS header mismatch: wrong number of clauses.\0A\00", align 1
@.str46 = private unnamed_addr constant [8 x i8] c"<int32>\00", align 1
@_ZTVN7Minisat9IntOptionE = linkonce_odr unnamed_addr constant [6 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN7Minisat9IntOptionE to i8*), i8* bitcast (void (%"class.Minisat::IntOption"*)* @_ZN7Minisat9IntOptionD1Ev to i8*), i8* bitcast (void (%"class.Minisat::IntOption"*)* @_ZN7Minisat9IntOptionD0Ev to i8*), i8* bitcast (i1 (%"class.Minisat::IntOption"*, i8*)* @_ZN7Minisat9IntOption5parseEPKc to i8*), i8* bitcast (void (%"class.Minisat::IntOption"*, i1)* @_ZN7Minisat9IntOption4helpEb to i8*)]
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSN7Minisat9IntOptionE = linkonce_odr constant [21 x i8] c"N7Minisat9IntOptionE\00"
@_ZTSN7Minisat6OptionE = linkonce_odr constant [18 x i8] c"N7Minisat6OptionE\00"
@_ZTIN7Minisat6OptionE = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([18 x i8]* @_ZTSN7Minisat6OptionE, i32 0, i32 0) }
@_ZTIN7Minisat9IntOptionE = linkonce_odr constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([21 x i8]* @_ZTSN7Minisat9IntOptionE, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat6OptionE to i8*) }
@.str47 = private unnamed_addr constant [18 x i8] c"  -%-12s = %-8s [\00", align 1
@.str48 = private unnamed_addr constant [5 x i8] c"imin\00", align 1
@.str49 = private unnamed_addr constant [4 x i8] c"%4d\00", align 1
@.str50 = private unnamed_addr constant [5 x i8] c" .. \00", align 1
@.str51 = private unnamed_addr constant [5 x i8] c"imax\00", align 1
@.str52 = private unnamed_addr constant [17 x i8] c"] (default: %d)\0A\00", align 1
@.str53 = private unnamed_addr constant [13 x i8] c"\0A        %s\0A\00", align 1
@.str55 = private unnamed_addr constant [49 x i8] c"ERROR! value <%s> is too large for option \22%s\22.\0A\00", align 1
@.str56 = private unnamed_addr constant [49 x i8] c"ERROR! value <%s> is too small for option \22%s\22.\0A\00", align 1
@_ZTVN7Minisat6OptionE = linkonce_odr unnamed_addr constant [6 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat6OptionE to i8*), i8* bitcast (void (%"class.Minisat::Option"*)* @_ZN7Minisat6OptionD1Ev to i8*), i8* bitcast (void (%"class.Minisat::Option"*)* @_ZN7Minisat6OptionD0Ev to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*)]
@_ZZN7Minisat6Option13getOptionListEvE7options = linkonce_odr global %"class.Minisat::vec.8" zeroinitializer, align 8
@_ZGVZN7Minisat6Option13getOptionListEvE7options = linkonce_odr global i64 0
@__dso_handle = external global i8
@str57 = private unnamed_addr constant [20 x i8] c"*** INTERRUPTED ***\00"
@str59 = private unnamed_addr constant [14 x i8] c"INDETERMINATE\00"
@str60 = private unnamed_addr constant [14 x i8] c"UNSATISFIABLE\00"
@str61 = private unnamed_addr constant [80 x i8] c"===============================================================================\00"
@str62 = private unnamed_addr constant [27 x i8] c"Solved by unit propagation\00"
@str64 = private unnamed_addr constant [80 x i8] c"============================[ Problem Statistics ]=============================\00"
@str65 = private unnamed_addr constant [80 x i8] c"|                                                                             |\00"
@str66 = private unnamed_addr constant [54 x i8] c"Reading from standard input... Use '--help' for help.\00"
@str67 = private unnamed_addr constant [55 x i8] c"WARNING! Could not set resource limit: Virtual memory.\00"
@str68 = private unnamed_addr constant [49 x i8] c"WARNING! Could not set resource limit: CPU-time.\00"
@_ZL13opt_var_decay = internal global %"class.Minisat::DoubleOption" zeroinitializer, align 8
@.str15 = private unnamed_addr constant [10 x i8] c"var-decay\00", align 1
@.str116 = private unnamed_addr constant [35 x i8] c"The variable activity decay factor\00", align 1
@_ZL16opt_clause_decay = internal global %"class.Minisat::DoubleOption" zeroinitializer, align 8
@.str317 = private unnamed_addr constant [10 x i8] c"cla-decay\00", align 1
@.str418 = private unnamed_addr constant [33 x i8] c"The clause activity decay factor\00", align 1
@_ZL19opt_random_var_freq = internal global %"class.Minisat::DoubleOption" zeroinitializer, align 8
@.str619 = private unnamed_addr constant [9 x i8] c"rnd-freq\00", align 1
@.str720 = private unnamed_addr constant [82 x i8] c"The frequency with which the decision heuristic tries to choose a random variable\00", align 1
@_ZL15opt_random_seed = internal global %"class.Minisat::DoubleOption" zeroinitializer, align 8
@.str921 = private unnamed_addr constant [9 x i8] c"rnd-seed\00", align 1
@.str1022 = private unnamed_addr constant [38 x i8] c"Used by the random variable selection\00", align 1
@_ZL14opt_ccmin_mode = internal global %"class.Minisat::IntOption" zeroinitializer, align 8
@.str1223 = private unnamed_addr constant [11 x i8] c"ccmin-mode\00", align 1
@.str1324 = private unnamed_addr constant [64 x i8] c"Controls conflict clause minimization (0=none, 1=basic, 2=deep)\00", align 1
@_ZL16opt_phase_saving = internal global %"class.Minisat::IntOption" zeroinitializer, align 8
@.str1525 = private unnamed_addr constant [13 x i8] c"phase-saving\00", align 1
@.str16 = private unnamed_addr constant [63 x i8] c"Controls the level of phase saving (0=none, 1=limited, 2=full)\00", align 1
@_ZL16opt_rnd_init_act = internal global %"class.Minisat::BoolOption" zeroinitializer, align 8
@.str1826 = private unnamed_addr constant [9 x i8] c"rnd-init\00", align 1
@.str1927 = private unnamed_addr constant [31 x i8] c"Randomize the initial activity\00", align 1
@_ZL16opt_luby_restart = internal global %"class.Minisat::BoolOption" zeroinitializer, align 8
@.str21 = private unnamed_addr constant [5 x i8] c"luby\00", align 1
@.str22 = private unnamed_addr constant [30 x i8] c"Use the Luby restart sequence\00", align 1
@_ZL17opt_restart_first = internal global %"class.Minisat::IntOption" zeroinitializer, align 8
@.str2428 = private unnamed_addr constant [7 x i8] c"rfirst\00", align 1
@.str2529 = private unnamed_addr constant [26 x i8] c"The base restart interval\00", align 1
@_ZL15opt_restart_inc = internal global %"class.Minisat::DoubleOption" zeroinitializer, align 8
@.str2730 = private unnamed_addr constant [5 x i8] c"rinc\00", align 1
@.str28 = private unnamed_addr constant [33 x i8] c"Restart interval increase factor\00", align 1
@_ZL16opt_garbage_frac = internal global %"class.Minisat::DoubleOption" zeroinitializer, align 8
@.str30 = private unnamed_addr constant [8 x i8] c"gc-frac\00", align 1
@.str3131 = private unnamed_addr constant [79 x i8] c"The fraction of wasted memory allowed before a garbage collection is triggered\00", align 1
@_ZTVN7Minisat6SolverE = unnamed_addr constant [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat6SolverE to i8*), i8* bitcast (void (%"class.Minisat::Solver"*)* @_ZN7Minisat6SolverD1Ev to i8*), i8* bitcast (void (%"class.Minisat::Solver"*)* @_ZN7Minisat6SolverD0Ev to i8*), i8* bitcast (void (%"class.Minisat::Solver"*)* @_ZN7Minisat6Solver14garbageCollectEv to i8*)]
@__func__._ZN7Minisat6Solver10addClause_ERNS_3vecINS_3LitEEE = private unnamed_addr constant [11 x i8] c"addClause_\00", align 1
@.str3232 = private unnamed_addr constant [50 x i8] c"/Users/bruno/SAL/src/minisat-2.2.0/core/Solver.cc\00", align 1
@.str3333 = private unnamed_addr constant [21 x i8] c"decisionLevel() == 0\00", align 1
@__func__._ZN7Minisat6Solver12attachClauseEj = private unnamed_addr constant [13 x i8] c"attachClause\00", align 1
@.str3434 = private unnamed_addr constant [13 x i8] c"c.size() > 1\00", align 1
@__func__._ZN7Minisat6Solver12detachClauseEjb = private unnamed_addr constant [13 x i8] c"detachClause\00", align 1
@__func__._ZN7Minisat6Solver7analyzeEjRNS_3vecINS_3LitEEERi = private unnamed_addr constant [8 x i8] c"analyze\00", align 1
@.str3535 = private unnamed_addr constant [20 x i8] c"confl != CRef_Undef\00", align 1
@__func__._ZN7Minisat6Solver12litRedundantENS_3LitEj = private unnamed_addr constant [13 x i8] c"litRedundant\00", align 1
@.str3636 = private unnamed_addr constant [48 x i8] c"reason(var(analyze_stack.last())) != CRef_Undef\00", align 1
@__func__._ZN7Minisat6Solver12analyzeFinalENS_3LitERNS_3vecIS1_EE = private unnamed_addr constant [13 x i8] c"analyzeFinal\00", align 1
@.str3737 = private unnamed_addr constant [13 x i8] c"level(x) > 0\00", align 1
@__func__._ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj = private unnamed_addr constant [17 x i8] c"uncheckedEnqueue\00", align 1
@.str3838 = private unnamed_addr constant [20 x i8] c"value(p) == l_Undef\00", align 1
@__func__._ZN7Minisat6Solver9propagateEv = private unnamed_addr constant [10 x i8] c"propagate\00", align 1
@.str3939 = private unnamed_addr constant [18 x i8] c"c[1] == false_lit\00", align 1
@__func__._ZN7Minisat6Solver8simplifyEv = private unnamed_addr constant [9 x i8] c"simplify\00", align 1
@__func__._ZN7Minisat6Solver6searchEi = private unnamed_addr constant [7 x i8] c"search\00", align 1
@.str4040 = private unnamed_addr constant [3 x i8] c"ok\00", align 1
@.str4141 = private unnamed_addr constant [50 x i8] c"| %9d | %7d %8d %8d | %8d %8d %6.0f | %6.3f %% |\0A\00", align 1
@.str4642 = private unnamed_addr constant [6 x i8] c"%s%d \00", align 1
@.str4743 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str4844 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str4945 = private unnamed_addr constant [3 x i8] c"0\0A\00", align 1
@.str5046 = private unnamed_addr constant [3 x i8] c"wr\00", align 1
@.str5147 = private unnamed_addr constant [24 x i8] c"could not open file %s\0A\00", align 1
@.str5248 = private unnamed_addr constant [20 x i8] c"p cnf 1 2\0A1 0\0A-1 0\0A\00", align 1
@.str5349 = private unnamed_addr constant [13 x i8] c"p cnf %d %d\0A\00", align 1
@__func__._ZN7Minisat6Solver8toDimacsEP7__sFILERKNS_3vecINS_3LitEEE = private unnamed_addr constant [9 x i8] c"toDimacs\00", align 1
@.str54 = private unnamed_addr constant [33 x i8] c"value(assumptions[i]) != l_False\00", align 1
@.str5550 = private unnamed_addr constant [8 x i8] c"%s%d 0\0A\00", align 1
@.str5651 = private unnamed_addr constant [37 x i8] c"Wrote %d clauses with %d variables.\0A\00", align 1
@.str57 = private unnamed_addr constant [65 x i8] c"|  Garbage collection:   %12d bytes => %12d bytes             |\0A\00", align 1
@_ZTSN7Minisat6SolverE = constant [18 x i8] c"N7Minisat6SolverE\00"
@_ZTIN7Minisat6SolverE = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([18 x i8]* @_ZTSN7Minisat6SolverE, i32 0, i32 0) }
@__func__._ZN7Minisat3vecIjE6shrinkEi = private unnamed_addr constant [7 x i8] c"shrink\00", align 1
@.str58 = private unnamed_addr constant [45 x i8] c"/Users/bruno/SAL/src/minisat-2.2.0/mtl/Vec.h\00", align 1
@.str59 = private unnamed_addr constant [13 x i8] c"nelems <= sz\00", align 1
@__func__._ZNK7Minisat15RegionAllocatorIjEixEj = private unnamed_addr constant [11 x i8] c"operator[]\00", align 1
@.str60 = private unnamed_addr constant [47 x i8] c"/Users/bruno/SAL/src/minisat-2.2.0/mtl/Alloc.h\00", align 1
@.str61 = private unnamed_addr constant [17 x i8] c"r >= 0 && r < sz\00", align 1
@__func__._ZN7Minisat3vecINS_3LitEE5push_ERKS1_ = private unnamed_addr constant [6 x i8] c"push_\00", align 1
@.str62 = private unnamed_addr constant [9 x i8] c"sz < cap\00", align 1
@__func__._ZN7Minisat3vecINS_3LitEE3popEv = private unnamed_addr constant [4 x i8] c"pop\00", align 1
@.str63 = private unnamed_addr constant [7 x i8] c"sz > 0\00", align 1
@.str64 = private unnamed_addr constant [46 x i8] c"/Users/bruno/SAL/src/minisat-2.2.0/mtl/Heap.h\00", align 1
@.str65 = private unnamed_addr constant [20 x i8] c"index < heap.size()\00", align 1
@__func__._ZN7MinisatL6removeINS_3vecINS_6Solver7WatcherEEES3_EEvRT_RKT0_ = private unnamed_addr constant [7 x i8] c"remove\00", align 1
@.str66 = private unnamed_addr constant [45 x i8] c"/Users/bruno/SAL/src/minisat-2.2.0/mtl/Alg.h\00", align 1
@.str67 = private unnamed_addr constant [14 x i8] c"j < ts.size()\00", align 1
@.str68 = private unnamed_addr constant [54 x i8] c"/Users/bruno/SAL/src/minisat-2.2.0/core/SolverTypes.h\00", align 1
@.str69 = private unnamed_addr constant [17 x i8] c"header.has_extra\00", align 1
@__func__._ZN7Minisat15RegionAllocatorIjE3leaEj = private unnamed_addr constant [4 x i8] c"lea\00", align 1
@__func__._ZN7Minisat15RegionAllocatorIjE5allocEi = private unnamed_addr constant [6 x i8] c"alloc\00", align 1
@.str70 = private unnamed_addr constant [9 x i8] c"size > 0\00", align 1
@__func__._ZN7Minisat15RegionAllocatorIjE8capacityEj = private unnamed_addr constant [9 x i8] c"capacity\00", align 1
@.str71 = private unnamed_addr constant [8 x i8] c"cap > 0\00", align 1
@__func__._ZN7Minisat6Clause8activityEv = private unnamed_addr constant [9 x i8] c"activity\00", align 1
@__func__._ZN7Minisat4HeapINS_6Solver10VarOrderLtEE6insertEi = private unnamed_addr constant [7 x i8] c"insert\00", align 1
@.str73 = private unnamed_addr constant [11 x i8] c"!inHeap(n)\00", align 1
@.str74 = private unnamed_addr constant [7 x i8] c"<bool>\00", align 1
@_ZTVN7Minisat10BoolOptionE = linkonce_odr unnamed_addr constant [6 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN7Minisat10BoolOptionE to i8*), i8* bitcast (void (%"class.Minisat::BoolOption"*)* @_ZN7Minisat10BoolOptionD1Ev to i8*), i8* bitcast (void (%"class.Minisat::BoolOption"*)* @_ZN7Minisat10BoolOptionD0Ev to i8*), i8* bitcast (i1 (%"class.Minisat::BoolOption"*, i8*)* @_ZN7Minisat10BoolOption5parseEPKc to i8*), i8* bitcast (void (%"class.Minisat::BoolOption"*, i1)* @_ZN7Minisat10BoolOption4helpEb to i8*)]
@_ZTSN7Minisat10BoolOptionE = linkonce_odr constant [23 x i8] c"N7Minisat10BoolOptionE\00"
@_ZTIN7Minisat10BoolOptionE = linkonce_odr constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([23 x i8]* @_ZTSN7Minisat10BoolOptionE, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat6OptionE to i8*) }
@.str75 = private unnamed_addr constant [14 x i8] c"  -%s, -no-%s\00", align 1
@.str77 = private unnamed_addr constant [15 x i8] c"(default: %s)\0A\00", align 1
@.str78 = private unnamed_addr constant [3 x i8] c"on\00", align 1
@.str79 = private unnamed_addr constant [4 x i8] c"off\00", align 1
@.str80 = private unnamed_addr constant [13 x i8] c"\0A        %s\0A\00", align 1
@.str82 = private unnamed_addr constant [4 x i8] c"no-\00", align 1
@.str83 = private unnamed_addr constant [8 x i8] c"<int32>\00", align 1
@.str84 = private unnamed_addr constant [18 x i8] c"  -%-12s = %-8s [\00", align 1
@.str85 = private unnamed_addr constant [5 x i8] c"imin\00", align 1
@.str86 = private unnamed_addr constant [4 x i8] c"%4d\00", align 1
@.str87 = private unnamed_addr constant [5 x i8] c" .. \00", align 1
@.str88 = private unnamed_addr constant [5 x i8] c"imax\00", align 1
@.str89 = private unnamed_addr constant [17 x i8] c"] (default: %d)\0A\00", align 1
@.str91 = private unnamed_addr constant [49 x i8] c"ERROR! value <%s> is too large for option \22%s\22.\0A\00", align 1
@.str92 = private unnamed_addr constant [49 x i8] c"ERROR! value <%s> is too small for option \22%s\22.\0A\00", align 1
@.str93 = private unnamed_addr constant [9 x i8] c"<double>\00", align 1
@_ZTVN7Minisat12DoubleOptionE = linkonce_odr unnamed_addr constant [6 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN7Minisat12DoubleOptionE to i8*), i8* bitcast (void (%"class.Minisat::DoubleOption"*)* @_ZN7Minisat12DoubleOptionD1Ev to i8*), i8* bitcast (void (%"class.Minisat::DoubleOption"*)* @_ZN7Minisat12DoubleOptionD0Ev to i8*), i8* bitcast (i1 (%"class.Minisat::DoubleOption"*, i8*)* @_ZN7Minisat12DoubleOption5parseEPKc to i8*), i8* bitcast (void (%"class.Minisat::DoubleOption"*, i1)* @_ZN7Minisat12DoubleOption4helpEb to i8*)]
@_ZTSN7Minisat12DoubleOptionE = linkonce_odr constant [25 x i8] c"N7Minisat12DoubleOptionE\00"
@_ZTIN7Minisat12DoubleOptionE = linkonce_odr constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([25 x i8]* @_ZTSN7Minisat12DoubleOptionE, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat6OptionE to i8*) }
@.str94 = private unnamed_addr constant [50 x i8] c"  -%-12s = %-8s %c%4.2g .. %4.2g%c (default: %g)\0A\00", align 1
@.str95 = private unnamed_addr constant [5 x i8] c"CORE\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__I_a, i8* null }]
@str96 = private unnamed_addr constant [80 x i8] c"============================[ Search Statistics ]==============================\00"
@str97 = private unnamed_addr constant [80 x i8] c"| Conflicts |          ORIGINAL         |          LEARNT          | Progress |\00"
@str98 = private unnamed_addr constant [80 x i8] c"|           |    Vars  Clauses Literals |    Limit  Clauses Lit/Cl |          |\00"
@str99 = private unnamed_addr constant [80 x i8] c"===============================================================================\00"
@.str72 = private unnamed_addr constant [3 x i8] c"--\00", align 1
@.str173 = private unnamed_addr constant [5 x i8] c"help\00", align 1
@.str274 = private unnamed_addr constant [6 x i8] c"-verb\00", align 1
@.str475 = private unnamed_addr constant [52 x i8] c"ERROR! Unknown flag \22%s\22. Use '--%shelp' for help.\0A\00", align 1
@.str576 = private unnamed_addr constant [15 x i8] c"\0A%s OPTIONS:\0A\0A\00", align 1
@.str777 = private unnamed_addr constant [17 x i8] c"\0AHELP OPTIONS:\0A\0A\00", align 1
@.str878 = private unnamed_addr constant [39 x i8] c"  --%shelp        Print help message.\0A\00", align 1
@.str979 = private unnamed_addr constant [47 x i8] c"  --%shelp-verb   Print verbose help message.\0A\00", align 1
@_ZZN7Minisat6Option14getUsageStringEvE9usage_str = linkonce_odr global i8* null, align 8
@_ZZN7Minisat6Option19getHelpPrefixStringEvE15help_prefix_str = linkonce_odr global i8* getelementptr inbounds ([1 x i8]* @.str1080, i64 0, i64 0), align 8
@.str1080 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: ssp uwtable
define void @_Z10printStatsRN7Minisat6SolverE(%"class.Minisat::Solver"* nocapture readonly %solver) #0 {
  %ru.i = alloca %struct.rusage, align 8
  %1 = bitcast %struct.rusage* %ru.i to i8*
  call void @llvm.lifetime.start(i64 144, i8* %1) #2
  %2 = call i32 @getrusage(i32 0, %struct.rusage* %ru.i)
  %3 = getelementptr inbounds %struct.rusage* %ru.i, i64 0, i32 0, i32 0
  %4 = load i64* %3, align 8, !tbaa !3
  %5 = sitofp i64 %4 to double
  %6 = getelementptr inbounds %struct.rusage* %ru.i, i64 0, i32 0, i32 1
  %7 = load i32* %6, align 8, !tbaa !10
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.000000e+06
  %10 = fadd double %5, %9
  call void @llvm.lifetime.end(i64 144, i8* %1) #2
  %11 = call double @_ZN7Minisat11memUsedPeakEv()
  %12 = getelementptr inbounds %"class.Minisat::Solver"* %solver, i64 0, i32 21
  %13 = load i64* %12, align 8, !tbaa !11
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str, i64 0, i64 0), i64 %13)
  %15 = getelementptr inbounds %"class.Minisat::Solver"* %solver, i64 0, i32 25
  %16 = load i64* %15, align 8, !tbaa !30
  %17 = uitofp i64 %16 to double
  %18 = fdiv double %17, %10
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str1, i64 0, i64 0), i64 %16, double %18)
  %20 = getelementptr inbounds %"class.Minisat::Solver"* %solver, i64 0, i32 22
  %21 = load i64* %20, align 8, !tbaa !31
  %22 = getelementptr inbounds %"class.Minisat::Solver"* %solver, i64 0, i32 23
  %23 = load i64* %22, align 8, !tbaa !32
  %24 = uitofp i64 %23 to float
  %25 = fmul float %24, 1.000000e+02
  %26 = uitofp i64 %21 to float
  %27 = fdiv float %25, %26
  %28 = fpext float %27 to double
  %29 = uitofp i64 %21 to double
  %30 = fdiv double %29, %10
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([65 x i8]* @.str2, i64 0, i64 0), i64 %21, double %28, double %30)
  %32 = getelementptr inbounds %"class.Minisat::Solver"* %solver, i64 0, i32 24
  %33 = load i64* %32, align 8, !tbaa !33
  %34 = uitofp i64 %33 to double
  %35 = fdiv double %34, %10
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str3, i64 0, i64 0), i64 %33, double %35)
  %37 = getelementptr inbounds %"class.Minisat::Solver"* %solver, i64 0, i32 30
  %38 = load i64* %37, align 8, !tbaa !34
  %39 = getelementptr inbounds %"class.Minisat::Solver"* %solver, i64 0, i32 29
  %40 = load i64* %39, align 8, !tbaa !35
  %41 = sub i64 %40, %38
  %42 = mul i64 %41, 100
  %43 = uitofp i64 %42 to double
  %44 = uitofp i64 %40 to double
  %45 = fdiv double %43, %44
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str4, i64 0, i64 0), i64 %38, double %45)
  %47 = fcmp une double %11, 0.000000e+00
  br i1 %47, label %48, label %50

; <label>:48                                      ; preds = %0
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str5, i64 0, i64 0), double %11)
  br label %50

; <label>:50                                      ; preds = %48, %0
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str6, i64 0, i64 0), double %10)
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %ru.i21 = alloca %struct.rusage, align 8
  %lits.i.i = alloca %"class.Minisat::vec.0", align 8
  %in.i = alloca %"class.Minisat::StreamBuffer", align 8
  %ru.i = alloca %struct.rusage, align 8
  %1 = alloca i32, align 4
  %verb = alloca %"class.Minisat::IntOption", align 8
  %cpu_lim = alloca %"class.Minisat::IntOption", align 8
  %mem_lim = alloca %"class.Minisat::IntOption", align 8
  %S = alloca %"class.Minisat::Solver", align 8
  %rl = alloca %struct.rlimit, align 8
  %rl1 = alloca %struct.rlimit, align 8
  store i32 %argc, i32* %1, align 4, !tbaa !36
  invoke void @_ZN7Minisat12setUsageHelpEPKc(i8* getelementptr inbounds ([112 x i8]* @.str7, i64 0, i64 0))
          to label %2 unwind label %129

; <label>:2                                       ; preds = %0
  %3 = bitcast %"class.Minisat::IntOption"* %verb to i8*
  call void @llvm.lifetime.start(i64 56, i8* %3) #2
  %4 = getelementptr inbounds %"class.Minisat::IntOption"* %verb, i64 0, i32 0
  %5 = getelementptr inbounds %"class.Minisat::IntOption"* %verb, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat6OptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %5, align 8, !tbaa !37
  %6 = getelementptr inbounds %"class.Minisat::IntOption"* %verb, i64 0, i32 0, i32 1
  store i8* getelementptr inbounds ([5 x i8]* @.str9, i64 0, i64 0), i8** %6, align 8, !tbaa !39
  %7 = getelementptr inbounds %"class.Minisat::IntOption"* %verb, i64 0, i32 0, i32 2
  store i8* getelementptr inbounds ([44 x i8]* @.str10, i64 0, i64 0), i8** %7, align 8, !tbaa !41
  %8 = getelementptr inbounds %"class.Minisat::IntOption"* %verb, i64 0, i32 0, i32 3
  store i8* getelementptr inbounds ([5 x i8]* @.str8, i64 0, i64 0), i8** %8, align 8, !tbaa !42
  %9 = getelementptr inbounds %"class.Minisat::IntOption"* %verb, i64 0, i32 0, i32 4
  store i8* getelementptr inbounds ([8 x i8]* @.str46, i64 0, i64 0), i8** %9, align 8, !tbaa !43
  %10 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %12, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i

; <label>:12                                      ; preds = %2
  %13 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i, label %15

; <label>:15                                      ; preds = %12
  call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %16 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i

_ZN7Minisat6Option13getOptionListEv.exit.i.i.i:   ; preds = %15, %12, %2
  %17 = load i64* bitcast (i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1) to i64*), align 8
  %18 = trunc i64 %17 to i32
  %19 = lshr i64 %17, 32
  %20 = trunc i64 %19 to i32
  %21 = icmp eq i32 %18, %20
  br i1 %21, label %22, label %24

; <label>:22                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i
  %23 = add nsw i32 %18, 1
  invoke void @_ZN7Minisat3vecIPNS_6OptionEE8capacityEi(%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i32 %23)
          to label %.noexc unwind label %129

.noexc:                                           ; preds = %22
  %.pre.i.i.i.i = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  br label %24

; <label>:24                                      ; preds = %.noexc, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i
  %25 = phi i32 [ %.pre.i.i.i.i, %.noexc ], [ %18, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i ]
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %27 = sext i32 %25 to i64
  %28 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %29 = getelementptr inbounds %"class.Minisat::Option"** %28, i64 %27
  store %"class.Minisat::Option"* %4, %"class.Minisat::Option"** %29, align 8, !tbaa !47
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat9IntOptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %5, align 8, !tbaa !37
  %30 = getelementptr inbounds %"class.Minisat::IntOption"* %verb, i64 0, i32 1
  %31 = bitcast %"struct.Minisat::IntRange"* %30 to i64*
  store i64 8589934592, i64* %31, align 8
  %32 = getelementptr inbounds %"class.Minisat::IntOption"* %verb, i64 0, i32 2
  store i32 1, i32* %32, align 8, !tbaa !48
  %33 = bitcast %"class.Minisat::IntOption"* %cpu_lim to i8*
  call void @llvm.lifetime.start(i64 56, i8* %33) #2
  %34 = getelementptr inbounds %"class.Minisat::IntOption"* %cpu_lim, i64 0, i32 0
  %35 = getelementptr inbounds %"class.Minisat::IntOption"* %cpu_lim, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat6OptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %35, align 8, !tbaa !37
  %36 = getelementptr inbounds %"class.Minisat::IntOption"* %cpu_lim, i64 0, i32 0, i32 1
  store i8* getelementptr inbounds ([8 x i8]* @.str11, i64 0, i64 0), i8** %36, align 8, !tbaa !39
  %37 = getelementptr inbounds %"class.Minisat::IntOption"* %cpu_lim, i64 0, i32 0, i32 2
  store i8* getelementptr inbounds ([39 x i8]* @.str12, i64 0, i64 0), i8** %37, align 8, !tbaa !41
  %38 = getelementptr inbounds %"class.Minisat::IntOption"* %cpu_lim, i64 0, i32 0, i32 3
  store i8* getelementptr inbounds ([5 x i8]* @.str8, i64 0, i64 0), i8** %38, align 8, !tbaa !42
  %39 = getelementptr inbounds %"class.Minisat::IntOption"* %cpu_lim, i64 0, i32 0, i32 4
  store i8* getelementptr inbounds ([8 x i8]* @.str46, i64 0, i64 0), i8** %39, align 8, !tbaa !43
  %40 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %41 = icmp eq i8 %40, 0
  br i1 %41, label %42, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i10

; <label>:42                                      ; preds = %24
  %43 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i10, label %45

; <label>:45                                      ; preds = %42
  call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %46 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i10

_ZN7Minisat6Option13getOptionListEv.exit.i.i.i10: ; preds = %45, %42, %24
  %47 = load i64* bitcast (i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1) to i64*), align 8
  %48 = trunc i64 %47 to i32
  %49 = lshr i64 %47, 32
  %50 = trunc i64 %49 to i32
  %51 = icmp eq i32 %48, %50
  br i1 %51, label %52, label %54

; <label>:52                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i10
  %53 = add nsw i32 %48, 1
  invoke void @_ZN7Minisat3vecIPNS_6OptionEE8capacityEi(%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i32 %53)
          to label %.noexc12 unwind label %133

.noexc12:                                         ; preds = %52
  %.pre.i.i.i.i11 = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  br label %54

; <label>:54                                      ; preds = %.noexc12, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i10
  %55 = phi i32 [ %.pre.i.i.i.i11, %.noexc12 ], [ %48, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i10 ]
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %57 = sext i32 %55 to i64
  %58 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %59 = getelementptr inbounds %"class.Minisat::Option"** %58, i64 %57
  store %"class.Minisat::Option"* %34, %"class.Minisat::Option"** %59, align 8, !tbaa !47
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat9IntOptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %35, align 8, !tbaa !37
  %60 = getelementptr inbounds %"class.Minisat::IntOption"* %cpu_lim, i64 0, i32 1
  %61 = bitcast %"struct.Minisat::IntRange"* %60 to i64*
  store i64 9223372032559808512, i64* %61, align 8
  %62 = getelementptr inbounds %"class.Minisat::IntOption"* %cpu_lim, i64 0, i32 2
  store i32 2147483647, i32* %62, align 8, !tbaa !48
  %63 = bitcast %"class.Minisat::IntOption"* %mem_lim to i8*
  call void @llvm.lifetime.start(i64 56, i8* %63) #2
  %64 = getelementptr inbounds %"class.Minisat::IntOption"* %mem_lim, i64 0, i32 0
  %65 = getelementptr inbounds %"class.Minisat::IntOption"* %mem_lim, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat6OptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %65, align 8, !tbaa !37
  %66 = getelementptr inbounds %"class.Minisat::IntOption"* %mem_lim, i64 0, i32 0, i32 1
  store i8* getelementptr inbounds ([8 x i8]* @.str13, i64 0, i64 0), i8** %66, align 8, !tbaa !39
  %67 = getelementptr inbounds %"class.Minisat::IntOption"* %mem_lim, i64 0, i32 0, i32 2
  store i8* getelementptr inbounds ([37 x i8]* @.str14, i64 0, i64 0), i8** %67, align 8, !tbaa !41
  %68 = getelementptr inbounds %"class.Minisat::IntOption"* %mem_lim, i64 0, i32 0, i32 3
  store i8* getelementptr inbounds ([5 x i8]* @.str8, i64 0, i64 0), i8** %68, align 8, !tbaa !42
  %69 = getelementptr inbounds %"class.Minisat::IntOption"* %mem_lim, i64 0, i32 0, i32 4
  store i8* getelementptr inbounds ([8 x i8]* @.str46, i64 0, i64 0), i8** %69, align 8, !tbaa !43
  %70 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %71 = icmp eq i8 %70, 0
  br i1 %71, label %72, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i14

; <label>:72                                      ; preds = %54
  %73 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i14, label %75

; <label>:75                                      ; preds = %72
  call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %76 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i14

_ZN7Minisat6Option13getOptionListEv.exit.i.i.i14: ; preds = %75, %72, %54
  %77 = load i64* bitcast (i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1) to i64*), align 8
  %78 = trunc i64 %77 to i32
  %79 = lshr i64 %77, 32
  %80 = trunc i64 %79 to i32
  %81 = icmp eq i32 %78, %80
  br i1 %81, label %82, label %84

; <label>:82                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i14
  %83 = add nsw i32 %78, 1
  invoke void @_ZN7Minisat3vecIPNS_6OptionEE8capacityEi(%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i32 %83)
          to label %.noexc16 unwind label %137

.noexc16:                                         ; preds = %82
  %.pre.i.i.i.i15 = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  br label %84

; <label>:84                                      ; preds = %.noexc16, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i14
  %85 = phi i32 [ %.pre.i.i.i.i15, %.noexc16 ], [ %78, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i14 ]
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %87 = sext i32 %85 to i64
  %88 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %89 = getelementptr inbounds %"class.Minisat::Option"** %88, i64 %87
  store %"class.Minisat::Option"* %64, %"class.Minisat::Option"** %89, align 8, !tbaa !47
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat9IntOptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %65, align 8, !tbaa !37
  %90 = getelementptr inbounds %"class.Minisat::IntOption"* %mem_lim, i64 0, i32 1
  %91 = bitcast %"struct.Minisat::IntRange"* %90 to i64*
  store i64 9223372032559808512, i64* %91, align 8
  %92 = getelementptr inbounds %"class.Minisat::IntOption"* %mem_lim, i64 0, i32 2
  store i32 2147483647, i32* %92, align 8, !tbaa !48
  invoke void @_ZN7Minisat12parseOptionsERiPPcb(i32* %1, i8** %argv, i1 zeroext true)
          to label %93 unwind label %141

; <label>:93                                      ; preds = %84
  %94 = bitcast %"class.Minisat::Solver"* %S to i8*
  call void @llvm.lifetime.start(i64 688, i8* %94) #2
  invoke void @_ZN7Minisat6SolverC1Ev(%"class.Minisat::Solver"* %S)
          to label %95 unwind label %141

; <label>:95                                      ; preds = %93
  %96 = bitcast %struct.rusage* %ru.i to i8*
  call void @llvm.lifetime.start(i64 144, i8* %96) #2
  %97 = invoke i32 @getrusage(i32 0, %struct.rusage* %ru.i)
          to label %98 unwind label %145

; <label>:98                                      ; preds = %95
  %99 = getelementptr inbounds %struct.rusage* %ru.i, i64 0, i32 0, i32 0
  %100 = load i64* %99, align 8, !tbaa !3
  %101 = sitofp i64 %100 to double
  %102 = getelementptr inbounds %struct.rusage* %ru.i, i64 0, i32 0, i32 1
  %103 = load i32* %102, align 8, !tbaa !10
  %104 = sitofp i32 %103 to double
  %105 = fdiv double %104, 1.000000e+06
  %106 = fadd double %101, %105
  call void @llvm.lifetime.end(i64 144, i8* %96) #2
  %107 = load i32* %32, align 8, !tbaa !36
  %108 = getelementptr inbounds %"class.Minisat::Solver"* %S, i64 0, i32 3
  store i32 %107, i32* %108, align 8, !tbaa !51
  store %"class.Minisat::Solver"* %S, %"class.Minisat::Solver"** @_ZL6solver, align 8, !tbaa !47
  %109 = invoke void (i32)* (i32, void (i32)*)* @signal(i32 2, void (i32)* @_ZL11SIGINT_exiti)
          to label %110 unwind label %145

; <label>:110                                     ; preds = %98
  %111 = invoke void (i32)* (i32, void (i32)*)* @signal(i32 24, void (i32)* @_ZL11SIGINT_exiti)
          to label %112 unwind label %145

; <label>:112                                     ; preds = %110
  %113 = load i32* %62, align 8, !tbaa !36
  %114 = icmp eq i32 %113, 2147483647
  br i1 %114, label %148, label %115

; <label>:115                                     ; preds = %112
  %116 = invoke i32 @"\01_getrlimit"(i32 0, %struct.rlimit* %rl)
          to label %117 unwind label %145

; <label>:117                                     ; preds = %115
  %118 = getelementptr inbounds %struct.rlimit* %rl, i64 0, i32 1
  %119 = load i64* %118, align 8, !tbaa !52
  %120 = icmp eq i64 %119, 9223372036854775807
  %.pre144 = load i32* %62, align 8, !tbaa !36
  %121 = sext i32 %.pre144 to i64
  %122 = icmp ult i64 %121, %119
  %or.cond148 = or i1 %120, %122
  br i1 %or.cond148, label %._crit_edge143, label %148

._crit_edge143:                                   ; preds = %117
  %123 = sext i32 %.pre144 to i64
  %124 = getelementptr inbounds %struct.rlimit* %rl, i64 0, i32 0
  store i64 %123, i64* %124, align 8, !tbaa !54
  %125 = invoke i32 @"\01_setrlimit"(i32 0, %struct.rlimit* %rl)
          to label %126 unwind label %145

; <label>:126                                     ; preds = %._crit_edge143
  %127 = icmp eq i32 %125, -1
  br i1 %127, label %128, label %148

; <label>:128                                     ; preds = %126
  %puts54 = call i32 @puts(i8* getelementptr inbounds ([49 x i8]* @str68, i64 0, i64 0))
  br label %148

; <label>:129                                     ; preds = %22, %0
  %130 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*)
  %131 = extractvalue { i8*, i32 } %130, 0
  %132 = extractvalue { i8*, i32 } %130, 1
  br label %445

; <label>:133                                     ; preds = %52
  %134 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*)
  %135 = extractvalue { i8*, i32 } %134, 0
  %136 = extractvalue { i8*, i32 } %134, 1
  br label %445

; <label>:137                                     ; preds = %82
  %138 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*)
  %139 = extractvalue { i8*, i32 } %138, 0
  %140 = extractvalue { i8*, i32 } %138, 1
  br label %445

; <label>:141                                     ; preds = %_ZN7Minisat3vecINS_3LitEED1Ev.exit31, %93, %84
  %142 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*)
  %143 = extractvalue { i8*, i32 } %142, 0
  %144 = extractvalue { i8*, i32 } %142, 1
  br label %445

; <label>:145                                     ; preds = %365, %363, %352, %350, %348, %331, %317, %312, %193, %185, %.thread, %171, %160, %151, %._crit_edge143, %115, %110, %98, %95
  %146 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*)
  br label %.body

.body:                                            ; preds = %.preheader.i.i.i5.i.i, %.nonloopexit.i.i, %145
  %eh.lpad-body = phi { i8*, i32 } [ %146, %145 ], [ %lpad.phi.i.i, %.preheader.i.i.i5.i.i ], [ %lpad.phi.i.i, %.nonloopexit.i.i ]
  %147 = extractvalue { i8*, i32 } %eh.lpad-body, 0
  br label %442

; <label>:148                                     ; preds = %128, %126, %117, %112
  %149 = load i32* %92, align 8, !tbaa !36
  %150 = icmp eq i32 %149, 2147483647
  br i1 %150, label %166, label %151

; <label>:151                                     ; preds = %148
  %152 = sext i32 %149 to i64
  %153 = shl nsw i64 %152, 20
  %154 = invoke i32 @"\01_getrlimit"(i32 5, %struct.rlimit* %rl1)
          to label %155 unwind label %145

; <label>:155                                     ; preds = %151
  %156 = getelementptr inbounds %struct.rlimit* %rl1, i64 0, i32 1
  %157 = load i64* %156, align 8, !tbaa !52
  %158 = icmp eq i64 %157, 9223372036854775807
  %159 = icmp ult i64 %153, %157
  %or.cond = or i1 %158, %159
  br i1 %or.cond, label %160, label %166

; <label>:160                                     ; preds = %155
  %161 = getelementptr inbounds %struct.rlimit* %rl1, i64 0, i32 0
  store i64 %153, i64* %161, align 8, !tbaa !54
  %162 = invoke i32 @"\01_setrlimit"(i32 5, %struct.rlimit* %rl1)
          to label %163 unwind label %145

; <label>:163                                     ; preds = %160
  %164 = icmp eq i32 %162, -1
  br i1 %164, label %165, label %166

; <label>:165                                     ; preds = %163
  %puts53 = call i32 @puts(i8* getelementptr inbounds ([55 x i8]* @str67, i64 0, i64 0))
  br label %166

; <label>:166                                     ; preds = %165, %163, %155, %148
  %167 = load i32* %1, align 4, !tbaa !36
  %168 = icmp eq i32 %167, 1
  br i1 %168, label %169, label %.thread

; <label>:169                                     ; preds = %166
  %puts52 = call i32 @puts(i8* getelementptr inbounds ([54 x i8]* @str66, i64 0, i64 0))
  %.pr = load i32* %1, align 4, !tbaa !36
  %170 = icmp eq i32 %.pr, 1
  br i1 %170, label %171, label %.thread

; <label>:171                                     ; preds = %169
  %172 = invoke i8* @gzdopen(i32 0, i8* getelementptr inbounds ([3 x i8]* @.str18, i64 0, i64 0))
          to label %176 unwind label %145

.thread:                                          ; preds = %169, %166
  %173 = getelementptr inbounds i8** %argv, i64 1
  %174 = load i8** %173, align 8, !tbaa !47
  %175 = invoke i8* @gzopen(i8* %174, i8* getelementptr inbounds ([3 x i8]* @.str18, i64 0, i64 0))
          to label %176 unwind label %145

; <label>:176                                     ; preds = %.thread, %171
  %177 = phi i8* [ %172, %171 ], [ %175, %.thread ]
  %178 = icmp eq i8* %177, null
  br i1 %178, label %179, label %189

; <label>:179                                     ; preds = %176
  %180 = load i32* %1, align 4, !tbaa !36
  %181 = icmp eq i32 %180, 1
  br i1 %181, label %185, label %182

; <label>:182                                     ; preds = %179
  %183 = getelementptr inbounds i8** %argv, i64 1
  %184 = load i8** %183, align 8, !tbaa !47
  br label %185

; <label>:185                                     ; preds = %182, %179
  %186 = phi i8* [ %184, %182 ], [ getelementptr inbounds ([8 x i8]* @.str20, i64 0, i64 0), %179 ]
  %187 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str19, i64 0, i64 0), i8* %186)
  invoke void @exit(i32 1) #16
          to label %188 unwind label %145

; <label>:188                                     ; preds = %185
  unreachable

; <label>:189                                     ; preds = %176
  %190 = load i32* %108, align 8, !tbaa !51
  %191 = icmp sgt i32 %190, 0
  br i1 %191, label %192, label %193

; <label>:192                                     ; preds = %189
  %puts50 = call i32 @puts(i8* getelementptr inbounds ([80 x i8]* @str64, i64 0, i64 0))
  %puts51 = call i32 @puts(i8* getelementptr inbounds ([80 x i8]* @str65, i64 0, i64 0))
  br label %193

; <label>:193                                     ; preds = %192, %189
  %194 = bitcast %"class.Minisat::StreamBuffer"* %in.i to i8*
  call void @llvm.lifetime.start(i64 1048592, i8* %194) #2
  %195 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in.i, i64 0, i32 0
  store i8* %177, i8** %195, align 8, !tbaa !55
  %196 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in.i, i64 0, i32 2
  %197 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in.i, i64 0, i32 3
  store i32 0, i32* %197, align 4, !tbaa !57
  store i32 0, i32* %196, align 8, !tbaa !58
  %198 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in.i, i64 0, i32 1, i64 0
  %199 = invoke i32 @gzread(i8* %177, i8* %198, i32 1048576)
          to label %.noexc20 unwind label %145

.noexc20:                                         ; preds = %193
  store i32 %199, i32* %197, align 4, !tbaa !57
  %200 = bitcast %"class.Minisat::vec.0"* %lits.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %200)
  call void @llvm.memset.p0i8.i64(i8* %200, i8 0, i64 16, i32 8, i1 false) #2
  %201 = getelementptr inbounds %"class.Minisat::vec.0"* %lits.i.i, i64 0, i32 0
  %202 = getelementptr inbounds %"class.Minisat::Solver"* %S, i64 0, i32 43, i32 1
  %203 = getelementptr inbounds %"class.Minisat::vec.0"* %lits.i.i, i64 0, i32 1
  %204 = getelementptr inbounds %"class.Minisat::vec.0"* %lits.i.i, i64 0, i32 2
  %205 = bitcast i32* %203 to i64*
  br label %_ZN7MinisatL8skipLineINS_12StreamBufferEEEvRT_.exit.outer.i.i

_ZN7MinisatL8skipLineINS_12StreamBufferEEEvRT_.exit.outer.i.i: ; preds = %_ZN7MinisatL10readClauseINS_12StreamBufferENS_6SolverEEEvRT_RT0_RNS_3vecINS_3LitEEE.exit.i.i, %.noexc20
  %cnt.0.ph.i.i = phi i32 [ 0, %.noexc20 ], [ %296, %_ZN7MinisatL10readClauseINS_12StreamBufferENS_6SolverEEEvRT_RT0_RNS_3vecINS_3LitEEE.exit.i.i ]
  %clauses.0.ph.i.i = phi i32 [ 0, %.noexc20 ], [ %clauses.0.ph34.i.i, %_ZN7MinisatL10readClauseINS_12StreamBufferENS_6SolverEEEvRT_RT0_RNS_3vecINS_3LitEEE.exit.i.i ]
  %vars.0.ph.i.i = phi i32 [ 0, %.noexc20 ], [ %vars.0.ph35.i.i, %_ZN7MinisatL10readClauseINS_12StreamBufferENS_6SolverEEEvRT_RT0_RNS_3vecINS_3LitEEE.exit.i.i ]
  br label %_ZN7MinisatL8skipLineINS_12StreamBufferEEEvRT_.exit.outer33.i.i

_ZN7MinisatL8skipLineINS_12StreamBufferEEEvRT_.exit.outer33.i.i: ; preds = %246, %_ZN7MinisatL8skipLineINS_12StreamBufferEEEvRT_.exit.outer.i.i
  %clauses.0.ph34.i.i = phi i32 [ %247, %246 ], [ %clauses.0.ph.i.i, %_ZN7MinisatL8skipLineINS_12StreamBufferEEEvRT_.exit.outer.i.i ]
  %vars.0.ph35.i.i = phi i32 [ %245, %246 ], [ %vars.0.ph.i.i, %_ZN7MinisatL8skipLineINS_12StreamBufferEEEvRT_.exit.outer.i.i ]
  %.pre.i.pre.i.i = load i32* %197, align 4, !tbaa !57
  br label %_ZN7Minisat12StreamBufferppEv.exit.i.outer.i.i

_ZN7Minisat12StreamBufferppEv.exit.i.outer.i.i:   ; preds = %_ZN7Minisat12StreamBufferppEv.exit.i16._crit_edge.i.i, %_ZN7Minisat12StreamBufferppEv.exit.i16.i.i, %.noexc.i.i, %_ZN7MinisatL8skipLineINS_12StreamBufferEEEvRT_.exit.outer33.i.i
  %206 = phi i32 [ %.pre.i.pre.i.i, %_ZN7MinisatL8skipLineINS_12StreamBufferEEEvRT_.exit.outer33.i.i ], [ %219, %.noexc.i.i ], [ %267, %_ZN7Minisat12StreamBufferppEv.exit.i16._crit_edge.i.i ], [ %267, %_ZN7Minisat12StreamBufferppEv.exit.i16.i.i ]
  %.pre.i.i = load i32* %196, align 8, !tbaa !58
  %207 = sext i32 %.pre.i.i to i64
  br label %_ZN7Minisat12StreamBufferppEv.exit.i.i.i

_ZN7Minisat12StreamBufferppEv.exit.i.i.i:         ; preds = %.critedge.i.i.i, %_ZN7Minisat12StreamBufferppEv.exit.i.outer.i.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.critedge.i.i.i ], [ %207, %_ZN7Minisat12StreamBufferppEv.exit.i.outer.i.i ]
  %208 = trunc i64 %indvars.iv.i to i32
  %209 = icmp slt i32 %208, %206
  br i1 %209, label %_ZNK7Minisat12StreamBufferdeEv.exit.i.i.i, label %_ZNK7Minisat12StreamBufferdeEv.exit.thread.i.i

_ZNK7Minisat12StreamBufferdeEv.exit.i.i.i:        ; preds = %_ZN7Minisat12StreamBufferppEv.exit.i.i.i
  %210 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in.i, i64 0, i32 1, i64 %indvars.iv.i
  %211 = load i8* %210, align 1, !tbaa !59
  %212 = icmp ugt i8 %211, 8
  br i1 %212, label %_ZNK7Minisat12StreamBufferdeEv.exit1.i.i.i, label %_ZNK7Minisat12StreamBufferdeEv.exit13.thread.i.i

_ZNK7Minisat12StreamBufferdeEv.exit1.i.i.i:       ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit.i.i.i
  %213 = icmp ult i8 %211, 14
  %214 = icmp eq i8 %211, 32
  %or.cond.i.i = or i1 %213, %214
  br i1 %or.cond.i.i, label %.critedge.i.i.i, label %_ZNK7Minisat12StreamBufferdeEv.exit7.i.i

.critedge.i.i.i:                                  ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit1.i.i.i
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, 1
  %215 = trunc i64 %indvars.iv.next.i to i32
  store i32 %215, i32* %196, align 8, !tbaa !58
  %216 = icmp slt i32 %215, %206
  br i1 %216, label %_ZN7Minisat12StreamBufferppEv.exit.i.i.i, label %217

; <label>:217                                     ; preds = %.critedge.i.i.i
  store i32 0, i32* %196, align 8, !tbaa !58
  %218 = load i8** %195, align 8, !tbaa !55
  %219 = invoke i32 @gzread(i8* %218, i8* %198, i32 1048576)
          to label %.noexc.i.i unwind label %.loopexit.i.i

.noexc.i.i:                                       ; preds = %217
  store i32 %219, i32* %197, align 4, !tbaa !57
  br label %_ZN7Minisat12StreamBufferppEv.exit.i.outer.i.i

.loopexit.i.i:                                    ; preds = %217
  %lpad.loopexit.i.i = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*)
  br label %.nonloopexit.i.i

.nonloopexit.loopexit.i.i:                        ; preds = %.lr.ph.i.i.i
  %lpad.loopexit18.i.i = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*)
  br label %.nonloopexit.i.i

.nonloopexit.nonloopexit.loopexit.i.i:            ; preds = %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit.i.i.i, %287
  %lpad.loopexit21.i.i = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*)
  br label %.nonloopexit.i.i

.nonloopexit.nonloopexit.nonloopexit.loopexit.i.i: ; preds = %264
  %lpad.loopexit23.i.i = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*)
  br label %.nonloopexit.i.i

.nonloopexit.nonloopexit.nonloopexit.nonloopexit.loopexit.i.i: ; preds = %241
  %lpad.loopexit26.i.i = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*)
  br label %.nonloopexit.i.i

.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.loopexit.loopexit.i.i: ; preds = %246, %244
  %lpad.loopexit31.i.i = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*)
  br label %.nonloopexit.i.i

.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.loopexit.nonloopexit.i.i: ; preds = %_ZN7MinisatL10readClauseINS_12StreamBufferENS_6SolverEEEvRT_RT0_RNS_3vecINS_3LitEEE.exit.i.i, %_ZN7Minisat3vecINS_3LitEE5clearEb.exit.preheader.i.i.i
  %lpad.nonloopexit.i.i = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*)
  br label %.nonloopexit.i.i

.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.i.i: ; preds = %253
  %lpad.nonloopexit29.i.i = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*)
  br label %.nonloopexit.i.i

.nonloopexit.i.i:                                 ; preds = %.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.i.i, %.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.loopexit.nonloopexit.i.i, %.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.loopexit.loopexit.i.i, %.nonloopexit.nonloopexit.nonloopexit.nonloopexit.loopexit.i.i, %.nonloopexit.nonloopexit.nonloopexit.loopexit.i.i, %.nonloopexit.nonloopexit.loopexit.i.i, %.nonloopexit.loopexit.i.i, %.loopexit.i.i
  %lpad.phi.i.i = phi { i8*, i32 } [ %lpad.loopexit.i.i, %.loopexit.i.i ], [ %lpad.loopexit18.i.i, %.nonloopexit.loopexit.i.i ], [ %lpad.loopexit21.i.i, %.nonloopexit.nonloopexit.loopexit.i.i ], [ %lpad.loopexit23.i.i, %.nonloopexit.nonloopexit.nonloopexit.loopexit.i.i ], [ %lpad.loopexit26.i.i, %.nonloopexit.nonloopexit.nonloopexit.nonloopexit.loopexit.i.i ], [ %lpad.nonloopexit29.i.i, %.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.i.i ], [ %lpad.loopexit31.i.i, %.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.loopexit.loopexit.i.i ], [ %lpad.nonloopexit.i.i, %.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.loopexit.nonloopexit.i.i ]
  %220 = load %"struct.Minisat::Lit"** %201, align 8, !tbaa !60
  %221 = icmp eq %"struct.Minisat::Lit"* %220, null
  br i1 %221, label %.body, label %.preheader.i.i.i5.i.i

.preheader.i.i.i5.i.i:                            ; preds = %.nonloopexit.i.i
  store i32 0, i32* %203, align 8, !tbaa !61
  %222 = bitcast %"struct.Minisat::Lit"* %220 to i8*
  call void @free(i8* %222) #2
  store %"struct.Minisat::Lit"* null, %"struct.Minisat::Lit"** %201, align 8, !tbaa !60
  store i32 0, i32* %204, align 4, !tbaa !62
  br label %.body

_ZNK7Minisat12StreamBufferdeEv.exit7.i.i:         ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit1.i.i.i
  switch i8 %211, label %_ZNK7Minisat12StreamBufferdeEv.exit13.thread.i.i [
    i8 112, label %.loopexit.i
    i8 99, label %_ZNK7Minisat12StreamBufferdeEv.exit.i15.i.i
  ]

.loopexit.i:                                      ; preds = %_ZN7Minisat12StreamBufferppEv.exit.backedge.i._crit_edge.i.i, %_ZNK7Minisat12StreamBufferdeEv.exit7.i.i
  %223 = phi i32 [ %.pre98.i.i, %_ZN7Minisat12StreamBufferppEv.exit.backedge.i._crit_edge.i.i ], [ %208, %_ZNK7Minisat12StreamBufferdeEv.exit7.i.i ]
  %224 = phi i32 [ %238, %_ZN7Minisat12StreamBufferppEv.exit.backedge.i._crit_edge.i.i ], [ %206, %_ZNK7Minisat12StreamBufferdeEv.exit7.i.i ]
  %225 = phi i32 [ %phitmp.i.i, %_ZN7Minisat12StreamBufferppEv.exit.backedge.i._crit_edge.i.i ], [ 112, %_ZNK7Minisat12StreamBufferdeEv.exit7.i.i ]
  %.02.i.i.i = phi i8* [ %235, %_ZN7Minisat12StreamBufferppEv.exit.backedge.i._crit_edge.i.i ], [ getelementptr inbounds ([6 x i8]* @.str41, i64 0, i64 0), %_ZNK7Minisat12StreamBufferdeEv.exit7.i.i ]
  %226 = icmp slt i32 %223, %224
  br i1 %226, label %227, label %_ZNK7Minisat12StreamBufferdeEv.exit.i9.i.i

; <label>:227                                     ; preds = %.loopexit.i
  %228 = sext i32 %223 to i64
  %229 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in.i, i64 0, i32 1, i64 %228
  %230 = load i8* %229, align 1, !tbaa !59
  %231 = zext i8 %230 to i32
  br label %_ZNK7Minisat12StreamBufferdeEv.exit.i9.i.i

_ZNK7Minisat12StreamBufferdeEv.exit.i9.i.i:       ; preds = %227, %.loopexit.i
  %232 = phi i32 [ %231, %227 ], [ -1, %.loopexit.i ]
  %233 = icmp eq i32 %225, %232
  br i1 %233, label %234, label %_ZN7MinisatL10eagerMatchINS_12StreamBufferEEEbRT_PKc.exit.i.i

; <label>:234                                     ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit.i9.i.i
  %235 = getelementptr inbounds i8* %.02.i.i.i, i64 1
  %236 = add nsw i32 %223, 1
  store i32 %236, i32* %196, align 8, !tbaa !58
  %237 = icmp slt i32 %236, %224
  br i1 %237, label %_ZN7Minisat12StreamBufferppEv.exit.backedge.i.i.i, label %241

_ZN7Minisat12StreamBufferppEv.exit.backedge.i.i.i: ; preds = %.noexc10.i.i, %234
  %238 = phi i32 [ %224, %234 ], [ %243, %.noexc10.i.i ]
  %239 = load i8* %235, align 1, !tbaa !59
  %240 = icmp eq i8 %239, 0
  br i1 %240, label %244, label %_ZN7Minisat12StreamBufferppEv.exit.backedge.i._crit_edge.i.i

_ZN7Minisat12StreamBufferppEv.exit.backedge.i._crit_edge.i.i: ; preds = %_ZN7Minisat12StreamBufferppEv.exit.backedge.i.i.i
  %.pre98.i.i = load i32* %196, align 8, !tbaa !58
  %phitmp.i.i = sext i8 %239 to i32
  br label %.loopexit.i

; <label>:241                                     ; preds = %234
  store i32 0, i32* %196, align 8, !tbaa !58
  %242 = load i8** %195, align 8, !tbaa !55
  %243 = invoke i32 @gzread(i8* %242, i8* %198, i32 1048576)
          to label %.noexc10.i.i unwind label %.nonloopexit.nonloopexit.nonloopexit.nonloopexit.loopexit.i.i

.noexc10.i.i:                                     ; preds = %241
  store i32 %243, i32* %197, align 4, !tbaa !57
  br label %_ZN7Minisat12StreamBufferppEv.exit.backedge.i.i.i

; <label>:244                                     ; preds = %_ZN7Minisat12StreamBufferppEv.exit.backedge.i.i.i
  %245 = invoke fastcc i32 @_ZN7MinisatL8parseIntINS_12StreamBufferEEEiRT_(%"class.Minisat::StreamBuffer"* %in.i)
          to label %246 unwind label %.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.loopexit.loopexit.i.i

; <label>:246                                     ; preds = %244
  %247 = invoke fastcc i32 @_ZN7MinisatL8parseIntINS_12StreamBufferEEEiRT_(%"class.Minisat::StreamBuffer"* %in.i)
          to label %_ZN7MinisatL8skipLineINS_12StreamBufferEEEvRT_.exit.outer33.i.i unwind label %.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.loopexit.loopexit.i.i

_ZN7MinisatL10eagerMatchINS_12StreamBufferEEEbRT_PKc.exit.i.i: ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit.i9.i.i
  br i1 %226, label %248, label %253

; <label>:248                                     ; preds = %_ZN7MinisatL10eagerMatchINS_12StreamBufferEEEbRT_PKc.exit.i.i
  %249 = sext i32 %223 to i64
  %250 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in.i, i64 0, i32 1, i64 %249
  %251 = load i8* %250, align 1, !tbaa !59
  %252 = zext i8 %251 to i32
  br label %253

; <label>:253                                     ; preds = %248, %_ZN7MinisatL10eagerMatchINS_12StreamBufferEEEbRT_PKc.exit.i.i
  %254 = phi i32 [ %252, %248 ], [ -1, %_ZN7MinisatL10eagerMatchINS_12StreamBufferEEEbRT_PKc.exit.i.i ]
  %255 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str42, i64 0, i64 0), i32 %254)
  invoke void @exit(i32 3) #16
          to label %256 unwind label %.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.i.i

; <label>:256                                     ; preds = %253
  unreachable

_ZNK7Minisat12StreamBufferdeEv.exit.i15.i.i:      ; preds = %_ZN7Minisat12StreamBufferppEv.exit.i16._crit_edge.i.i, %_ZNK7Minisat12StreamBufferdeEv.exit7.i.i
  %257 = phi i32 [ %267, %_ZN7Minisat12StreamBufferppEv.exit.i16._crit_edge.i.i ], [ %206, %_ZNK7Minisat12StreamBufferdeEv.exit7.i.i ]
  %258 = phi i32 [ %.pre100.i.i, %_ZN7Minisat12StreamBufferppEv.exit.i16._crit_edge.i.i ], [ %208, %_ZNK7Minisat12StreamBufferdeEv.exit7.i.i ]
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in.i, i64 0, i32 1, i64 %259
  %261 = load i8* %260, align 1, !tbaa !59
  %phitmp.i.i.i = icmp eq i8 %261, 10
  %262 = add nsw i32 %258, 1
  store i32 %262, i32* %196, align 8, !tbaa !58
  %263 = icmp slt i32 %262, %257
  br i1 %263, label %_ZN7Minisat12StreamBufferppEv.exit.i16.i.i, label %264

; <label>:264                                     ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit.i15.i.i
  store i32 0, i32* %196, align 8, !tbaa !58
  %265 = load i8** %195, align 8, !tbaa !55
  %266 = invoke i32 @gzread(i8* %265, i8* %198, i32 1048576)
          to label %.noexc17.i.i unwind label %.nonloopexit.nonloopexit.nonloopexit.loopexit.i.i

.noexc17.i.i:                                     ; preds = %264
  store i32 %266, i32* %197, align 4, !tbaa !57
  br label %_ZN7Minisat12StreamBufferppEv.exit.i16.i.i

_ZN7Minisat12StreamBufferppEv.exit.i16.i.i:       ; preds = %.noexc17.i.i, %_ZNK7Minisat12StreamBufferdeEv.exit.i15.i.i
  %267 = phi i32 [ %257, %_ZNK7Minisat12StreamBufferdeEv.exit.i15.i.i ], [ %266, %.noexc17.i.i ]
  br i1 %phitmp.i.i.i, label %_ZN7Minisat12StreamBufferppEv.exit.i.outer.i.i, label %_ZN7Minisat12StreamBufferppEv.exit.i16._crit_edge.i.i

_ZN7Minisat12StreamBufferppEv.exit.i16._crit_edge.i.i: ; preds = %_ZN7Minisat12StreamBufferppEv.exit.i16.i.i
  %.pre100.i.i = load i32* %196, align 8, !tbaa !58
  %not..i.i.i.i = icmp slt i32 %.pre100.i.i, %267
  br i1 %not..i.i.i.i, label %_ZNK7Minisat12StreamBufferdeEv.exit.i15.i.i, label %_ZN7Minisat12StreamBufferppEv.exit.i.outer.i.i

_ZNK7Minisat12StreamBufferdeEv.exit13.thread.i.i: ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit7.i.i, %_ZNK7Minisat12StreamBufferdeEv.exit.i.i.i
  %268 = load %"struct.Minisat::Lit"** %201, align 8, !tbaa !60
  %269 = icmp eq %"struct.Minisat::Lit"* %268, null
  br i1 %269, label %_ZN7Minisat3vecINS_3LitEE5clearEb.exit.preheader.i.i.i, label %.preheader.i.i.i.i

.preheader.i.i.i.i:                               ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit13.thread.i.i
  store i32 0, i32* %203, align 8, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE5clearEb.exit.preheader.i.i.i

_ZN7Minisat3vecINS_3LitEE5clearEb.exit.preheader.i.i.i: ; preds = %.preheader.i.i.i.i, %_ZNK7Minisat12StreamBufferdeEv.exit13.thread.i.i
  %270 = invoke fastcc i32 @_ZN7MinisatL8parseIntINS_12StreamBufferEEEiRT_(%"class.Minisat::StreamBuffer"* %in.i)
          to label %.noexc1.i.i unwind label %.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.loopexit.nonloopexit.i.i

.noexc1.i.i:                                      ; preds = %_ZN7Minisat3vecINS_3LitEE5clearEb.exit.preheader.i.i.i
  %271 = icmp eq i32 %270, 0
  br i1 %271, label %_ZN7MinisatL10readClauseINS_12StreamBufferENS_6SolverEEEvRT_RT0_RNS_3vecINS_3LitEEE.exit.i.i, label %.lr.ph1.i.i.i

.lr.ph1.i.i.i:                                    ; preds = %.noexc4.i.i, %.noexc1.i.i
  %272 = phi i32 [ %294, %.noexc4.i.i ], [ %270, %.noexc1.i.i ]
  %ispos.i.i.i = icmp sgt i32 %272, -1
  %neg.i.i.i = sub i32 0, %272
  %273 = select i1 %ispos.i.i.i, i32 %272, i32 %neg.i.i.i
  %274 = load i32* %202, align 8, !tbaa !63
  %275 = icmp sgt i32 %273, %274
  br i1 %275, label %.lr.ph.i.i.i, label %._crit_edge.i.i.i

.lr.ph.i.i.i:                                     ; preds = %.noexc2.i.i, %.lr.ph1.i.i.i
  %276 = invoke i32 @_ZN7Minisat6Solver6newVarEbb(%"class.Minisat::Solver"* %S, i1 zeroext true, i1 zeroext true)
          to label %.noexc2.i.i unwind label %.nonloopexit.loopexit.i.i

.noexc2.i.i:                                      ; preds = %.lr.ph.i.i.i
  %277 = load i32* %202, align 8, !tbaa !63
  %278 = icmp sgt i32 %273, %277
  br i1 %278, label %.lr.ph.i.i.i, label %._crit_edge.i.i.i

._crit_edge.i.i.i:                                ; preds = %.noexc2.i.i, %.lr.ph1.i.i.i
  %279 = shl i32 %273, 1
  %280 = add i32 %279, -2
  %not..i.i.i = icmp slt i32 %272, 1
  %281 = zext i1 %not..i.i.i to i32
  %..i.i.i = or i32 %280, %281
  %282 = load i64* %205, align 8
  %283 = trunc i64 %282 to i32
  %284 = lshr i64 %282, 32
  %285 = trunc i64 %284 to i32
  %286 = icmp eq i32 %283, %285
  br i1 %286, label %287, label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit.i.i.i

; <label>:287                                     ; preds = %._crit_edge.i.i.i
  %288 = add nsw i32 %283, 1
  invoke void @_ZN7Minisat3vecINS_3LitEE8capacityEi(%"class.Minisat::vec.0"* %lits.i.i, i32 %288)
          to label %.noexc3.i.i unwind label %.nonloopexit.nonloopexit.loopexit.i.i

.noexc3.i.i:                                      ; preds = %287
  %.pre.i.i.i.i19 = load i32* %203, align 8, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit.i.i.i

_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit.i.i.i:  ; preds = %.noexc3.i.i, %._crit_edge.i.i.i
  %289 = phi i32 [ %.pre.i.i.i.i19, %.noexc3.i.i ], [ %283, %._crit_edge.i.i.i ]
  %290 = add nsw i32 %289, 1
  store i32 %290, i32* %203, align 8, !tbaa !61
  %291 = sext i32 %289 to i64
  %292 = load %"struct.Minisat::Lit"** %201, align 8, !tbaa !60
  %293 = getelementptr inbounds %"struct.Minisat::Lit"* %292, i64 %291, i32 0
  store i32 %..i.i.i, i32* %293, align 4, !tbaa !36
  %294 = invoke fastcc i32 @_ZN7MinisatL8parseIntINS_12StreamBufferEEEiRT_(%"class.Minisat::StreamBuffer"* %in.i)
          to label %.noexc4.i.i unwind label %.nonloopexit.nonloopexit.loopexit.i.i

.noexc4.i.i:                                      ; preds = %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit.i.i.i
  %295 = icmp eq i32 %294, 0
  br i1 %295, label %_ZN7MinisatL10readClauseINS_12StreamBufferENS_6SolverEEEvRT_RT0_RNS_3vecINS_3LitEEE.exit.i.i, label %.lr.ph1.i.i.i

_ZN7MinisatL10readClauseINS_12StreamBufferENS_6SolverEEEvRT_RT0_RNS_3vecINS_3LitEEE.exit.i.i: ; preds = %.noexc4.i.i, %.noexc1.i.i
  %296 = add nsw i32 %cnt.0.ph.i.i, 1
  %297 = invoke zeroext i1 @_ZN7Minisat6Solver10addClause_ERNS_3vecINS_3LitEEE(%"class.Minisat::Solver"* %S, %"class.Minisat::vec.0"* %lits.i.i)
          to label %_ZN7MinisatL8skipLineINS_12StreamBufferEEEvRT_.exit.outer.i.i unwind label %.nonloopexit.nonloopexit.nonloopexit.nonloopexit.nonloopexit.loopexit.nonloopexit.i.i

_ZNK7Minisat12StreamBufferdeEv.exit.thread.i.i:   ; preds = %_ZN7Minisat12StreamBufferppEv.exit.i.i.i
  %298 = load i32* %202, align 8, !tbaa !63
  %299 = icmp eq i32 %vars.0.ph35.i.i, %298
  br i1 %299, label %303, label %300

; <label>:300                                     ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit.thread.i.i
  %301 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %302 = call i64 @fwrite(i8* getelementptr inbounds ([61 x i8]* @.str43, i64 0, i64 0), i64 60, i64 1, %struct.__sFILE* %301)
  br label %303

; <label>:303                                     ; preds = %300, %_ZNK7Minisat12StreamBufferdeEv.exit.thread.i.i
  %304 = icmp eq i32 %cnt.0.ph.i.i, %clauses.0.ph34.i.i
  br i1 %304, label %308, label %305

; <label>:305                                     ; preds = %303
  %306 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %307 = call i64 @fwrite(i8* getelementptr inbounds ([59 x i8]* @.str44, i64 0, i64 0), i64 58, i64 1, %struct.__sFILE* %306)
  br label %308

; <label>:308                                     ; preds = %305, %303
  %309 = load %"struct.Minisat::Lit"** %201, align 8, !tbaa !60
  %310 = icmp eq %"struct.Minisat::Lit"* %309, null
  br i1 %310, label %312, label %.preheader.i.i.i.i.i

.preheader.i.i.i.i.i:                             ; preds = %308
  store i32 0, i32* %203, align 8, !tbaa !61
  %311 = bitcast %"struct.Minisat::Lit"* %309 to i8*
  call void @free(i8* %311) #2
  store %"struct.Minisat::Lit"* null, %"struct.Minisat::Lit"** %201, align 8, !tbaa !60
  store i32 0, i32* %204, align 4, !tbaa !62
  br label %312

; <label>:312                                     ; preds = %.preheader.i.i.i.i.i, %308
  call void @llvm.lifetime.end(i64 16, i8* %200)
  call void @llvm.lifetime.end(i64 1048592, i8* %194) #2
  %313 = invoke i32 @gzclose(i8* %177)
          to label %314 unwind label %145

; <label>:314                                     ; preds = %312
  %315 = load i32* %1, align 4, !tbaa !36
  %316 = icmp sgt i32 %315, 2
  br i1 %316, label %317, label %321

; <label>:317                                     ; preds = %314
  %318 = getelementptr inbounds i8** %argv, i64 2
  %319 = load i8** %318, align 8, !tbaa !47
  %320 = invoke %struct.__sFILE* @"\01_fopen"(i8* %319, i8* getelementptr inbounds ([3 x i8]* @.str23, i64 0, i64 0))
          to label %321 unwind label %145

; <label>:321                                     ; preds = %317, %314
  %322 = phi %struct.__sFILE* [ %320, %317 ], [ null, %314 ]
  %323 = load i32* %108, align 8, !tbaa !51
  %324 = icmp sgt i32 %323, 0
  br i1 %324, label %325, label %331

; <label>:325                                     ; preds = %321
  %326 = load i32* %202, align 8, !tbaa !63
  %327 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([73 x i8]* @.str24, i64 0, i64 0), i32 %326)
  %328 = getelementptr inbounds %"class.Minisat::Solver"* %S, i64 0, i32 32, i32 1
  %329 = load i32* %328, align 8, !tbaa !64
  %330 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([73 x i8]* @.str25, i64 0, i64 0), i32 %329)
  br label %331

; <label>:331                                     ; preds = %325, %321
  %332 = bitcast %struct.rusage* %ru.i21 to i8*
  call void @llvm.lifetime.start(i64 144, i8* %332) #2
  %333 = invoke i32 @getrusage(i32 0, %struct.rusage* %ru.i21)
          to label %334 unwind label %145

; <label>:334                                     ; preds = %331
  %335 = getelementptr inbounds %struct.rusage* %ru.i21, i64 0, i32 0, i32 0
  %336 = load i64* %335, align 8, !tbaa !3
  %337 = getelementptr inbounds %struct.rusage* %ru.i21, i64 0, i32 0, i32 1
  %338 = load i32* %337, align 8, !tbaa !10
  call void @llvm.lifetime.end(i64 144, i8* %332) #2
  %339 = load i32* %108, align 8, !tbaa !51
  %340 = icmp sgt i32 %339, 0
  br i1 %340, label %341, label %348

; <label>:341                                     ; preds = %334
  %342 = sitofp i32 %338 to double
  %343 = fdiv double %342, 1.000000e+06
  %344 = sitofp i64 %336 to double
  %345 = fadd double %344, %343
  %346 = fsub double %345, %106
  %347 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([75 x i8]* @.str26, i64 0, i64 0), double %346)
  %puts49 = call i32 @puts(i8* getelementptr inbounds ([80 x i8]* @str65, i64 0, i64 0))
  br label %348

; <label>:348                                     ; preds = %341, %334
  %349 = invoke void (i32)* (i32, void (i32)*)* @signal(i32 2, void (i32)* @_ZL16SIGINT_interrupti)
          to label %350 unwind label %145

; <label>:350                                     ; preds = %348
  %351 = invoke void (i32)* (i32, void (i32)*)* @signal(i32 24, void (i32)* @_ZL16SIGINT_interrupti)
          to label %352 unwind label %145

; <label>:352                                     ; preds = %350
  %353 = invoke zeroext i1 @_ZN7Minisat6Solver8simplifyEv(%"class.Minisat::Solver"* %S)
          to label %354 unwind label %145

; <label>:354                                     ; preds = %352
  br i1 %353, label %367, label %355

; <label>:355                                     ; preds = %354
  %356 = icmp eq %struct.__sFILE* %322, null
  br i1 %356, label %360, label %357

; <label>:357                                     ; preds = %355
  %358 = call i64 @fwrite(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), i64 6, i64 1, %struct.__sFILE* %322)
  %359 = call i32 @fclose(%struct.__sFILE* %322)
  br label %360

; <label>:360                                     ; preds = %357, %355
  %361 = load i32* %108, align 8, !tbaa !51
  %362 = icmp sgt i32 %361, 0
  br i1 %362, label %363, label %365

; <label>:363                                     ; preds = %360
  %puts46 = call i32 @puts(i8* getelementptr inbounds ([80 x i8]* @str61, i64 0, i64 0))
  %puts47 = call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str62, i64 0, i64 0))
  invoke void @_Z10printStatsRN7Minisat6SolverE(%"class.Minisat::Solver"* %S)
          to label %364 unwind label %145

; <label>:364                                     ; preds = %363
  %putchar = call i32 @putchar(i32 10)
  br label %365

; <label>:365                                     ; preds = %364, %360
  %puts45 = call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str60, i64 0, i64 0))
  invoke void @exit(i32 20) #16
          to label %366 unwind label %145

; <label>:366                                     ; preds = %365
  unreachable

; <label>:367                                     ; preds = %354
  %368 = getelementptr inbounds %"class.Minisat::Solver"* %S, i64 0, i32 47
  %369 = getelementptr inbounds %"class.Minisat::vec.0"* %368, i64 0, i32 0
  %370 = load %"struct.Minisat::Lit"** %369, align 8, !tbaa !60
  %371 = icmp eq %"struct.Minisat::Lit"* %370, null
  %.phi.trans.insert.i.i = getelementptr inbounds %"class.Minisat::Solver"* %S, i64 0, i32 47, i32 1
  br i1 %371, label %_ZN7Minisat3vecINS_3LitEE5clearEb.exit.i.i, label %_ZN7Minisat3vecINS_3LitEE5clearEb.exit.i.i.thread

_ZN7Minisat3vecINS_3LitEE5clearEb.exit.i.i.thread: ; preds = %367
  store i32 0, i32* %.phi.trans.insert.i.i, align 8, !tbaa !61
  br label %_ZNK7Minisat3vecINS_3LitEE6copyToERS2_.exit.i

_ZN7Minisat3vecINS_3LitEE5clearEb.exit.i.i:       ; preds = %367
  %.pre.i.i24 = load i32* %.phi.trans.insert.i.i, align 8, !tbaa !61
  %372 = icmp slt i32 %.pre.i.i24, 0
  br i1 %372, label %373, label %_ZNK7Minisat3vecINS_3LitEE6copyToERS2_.exit.i

; <label>:373                                     ; preds = %_ZN7Minisat3vecINS_3LitEE5clearEb.exit.i.i
  invoke void @_ZN7Minisat3vecINS_3LitEE8capacityEi(%"class.Minisat::vec.0"* %368, i32 0)
          to label %.noexc27 unwind label %_ZN7Minisat3vecINS_3LitEED1Ev.exit

.noexc27:                                         ; preds = %373
  %374 = load i32* %.phi.trans.insert.i.i, align 8, !tbaa !61
  %375 = icmp slt i32 %374, 0
  br i1 %375, label %.lr.ph.i.i.i25, label %._crit_edge.i.i.i26

.lr.ph.i.i.i25:                                   ; preds = %.noexc27
  %376 = sext i32 %374 to i64
  br label %377

; <label>:377                                     ; preds = %383, %.lr.ph.i.i.i25
  %indvars.iv.i.i.i = phi i64 [ %376, %.lr.ph.i.i.i25 ], [ %indvars.iv.next.i.i.i, %383 ]
  %378 = load %"struct.Minisat::Lit"** %369, align 8, !tbaa !60
  %379 = getelementptr inbounds %"struct.Minisat::Lit"* %378, i64 %indvars.iv.i.i.i
  %380 = icmp eq %"struct.Minisat::Lit"* %379, null
  br i1 %380, label %383, label %381

; <label>:381                                     ; preds = %377
  %382 = getelementptr inbounds %"struct.Minisat::Lit"* %379, i64 0, i32 0
  store i32 0, i32* %382, align 4
  br label %383

; <label>:383                                     ; preds = %381, %377
  %indvars.iv.next.i.i.i = add nsw i64 %indvars.iv.i.i.i, 1
  %384 = trunc i64 %indvars.iv.next.i.i.i to i32
  %385 = icmp slt i32 %384, 0
  br i1 %385, label %377, label %._crit_edge.i.i.i26

._crit_edge.i.i.i26:                              ; preds = %383, %.noexc27
  store i32 0, i32* %.phi.trans.insert.i.i, align 8, !tbaa !61
  br label %_ZNK7Minisat3vecINS_3LitEE6copyToERS2_.exit.i

_ZNK7Minisat3vecINS_3LitEE6copyToERS2_.exit.i:    ; preds = %._crit_edge.i.i.i26, %_ZN7Minisat3vecINS_3LitEE5clearEb.exit.i.i, %_ZN7Minisat3vecINS_3LitEE5clearEb.exit.i.i.thread
  %386 = invoke i8 @_ZN7Minisat6Solver6solve_Ev(%"class.Minisat::Solver"* %S)
          to label %_ZN7Minisat6Solver12solveLimitedERKNS_3vecINS_3LitEEE.exit unwind label %_ZN7Minisat3vecINS_3LitEED1Ev.exit

_ZN7Minisat6Solver12solveLimitedERKNS_3vecINS_3LitEEE.exit: ; preds = %_ZNK7Minisat3vecINS_3LitEE6copyToERS2_.exit.i
  %387 = load i32* %108, align 8, !tbaa !51
  %388 = icmp sgt i32 %387, 0
  br i1 %388, label %389, label %393

; <label>:389                                     ; preds = %_ZN7Minisat6Solver12solveLimitedERKNS_3vecINS_3LitEEE.exit
  invoke void @_Z10printStatsRN7Minisat6SolverE(%"class.Minisat::Solver"* %S)
          to label %390 unwind label %_ZN7Minisat3vecINS_3LitEED1Ev.exit

; <label>:390                                     ; preds = %389
  %putchar48 = call i32 @putchar(i32 10)
  br label %393

_ZN7Minisat3vecINS_3LitEED1Ev.exit:               ; preds = %389, %_ZNK7Minisat3vecINS_3LitEE6copyToERS2_.exit.i, %373
  %391 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*)
  %392 = extractvalue { i8*, i32 } %391, 0
  br label %442

; <label>:393                                     ; preds = %390, %_ZN7Minisat6Solver12solveLimitedERKNS_3vecINS_3LitEEE.exit
  %394 = icmp eq i8 %386, 0
  br i1 %394, label %399, label %395

; <label>:395                                     ; preds = %393
  %396 = icmp eq i8 %386, 1
  %397 = select i1 %396, [15 x i8]* @.str31, [15 x i8]* @.str33
  %398 = getelementptr inbounds [15 x i8]* %397, i64 0, i64 0
  br label %399

; <label>:399                                     ; preds = %395, %393
  %400 = phi i8* [ %398, %395 ], [ getelementptr inbounds ([13 x i8]* @.str32, i64 0, i64 0), %393 ]
  %401 = call i32 (i8*, ...)* @printf(i8* %400)
  %402 = icmp eq %struct.__sFILE* %322, null
  br i1 %402, label %437, label %403

; <label>:403                                     ; preds = %399
  br i1 %394, label %404, label %429

; <label>:404                                     ; preds = %403
  %405 = call i64 @fwrite(i8* getelementptr inbounds ([5 x i8]* @.str34, i64 0, i64 0), i64 4, i64 1, %struct.__sFILE* %322)
  %406 = load i32* %202, align 8, !tbaa !63
  %407 = icmp sgt i32 %406, 0
  br i1 %407, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %404
  %408 = getelementptr inbounds %"class.Minisat::Solver"* %S, i64 0, i32 1, i32 0
  br label %409

; <label>:409                                     ; preds = %425, %.lr.ph
  %410 = phi i32 [ %406, %.lr.ph ], [ %426, %425 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.pre-phi, %425 ]
  %411 = load %"class.Minisat::lbool"** %408, align 8, !tbaa !65
  %412 = getelementptr inbounds %"class.Minisat::lbool"* %411, i64 %indvars.iv, i32 0
  %413 = load i8* %412, align 1, !tbaa !66
  %414 = and i8 %413, 2
  %415 = icmp eq i8 %414, 0
  br i1 %415, label %416, label %._crit_edge145

._crit_edge145:                                   ; preds = %409
  %indvars.iv.next.pre = add nuw nsw i64 %indvars.iv, 1
  %.pre146 = trunc i64 %indvars.iv.next.pre to i32
  br label %425

; <label>:416                                     ; preds = %409
  %417 = trunc i64 %indvars.iv to i32
  %418 = icmp eq i32 %417, 0
  %419 = select i1 %418, i8* getelementptr inbounds ([1 x i8]* @.str36, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str37, i64 0, i64 0)
  %420 = icmp eq i8 %413, 0
  %421 = select i1 %420, i8* getelementptr inbounds ([1 x i8]* @.str36, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str38, i64 0, i64 0)
  %422 = add nsw i64 %indvars.iv, 1
  %423 = trunc i64 %422 to i32
  %424 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %322, i8* getelementptr inbounds ([7 x i8]* @.str35, i64 0, i64 0), i8* %419, i8* %421, i32 %423)
  %.pre = load i32* %202, align 8, !tbaa !63
  br label %425

; <label>:425                                     ; preds = %416, %._crit_edge145
  %.pre-phi = phi i32 [ %.pre146, %._crit_edge145 ], [ %423, %416 ]
  %indvars.iv.next.pre-phi = phi i64 [ %indvars.iv.next.pre, %._crit_edge145 ], [ %422, %416 ]
  %426 = phi i32 [ %410, %._crit_edge145 ], [ %.pre, %416 ]
  %427 = icmp slt i32 %.pre-phi, %426
  br i1 %427, label %409, label %._crit_edge

._crit_edge:                                      ; preds = %425, %404
  %428 = call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str39, i64 0, i64 0), i64 3, i64 1, %struct.__sFILE* %322)
  br label %435

; <label>:429                                     ; preds = %403
  %430 = icmp eq i8 %386, 1
  br i1 %430, label %431, label %433

; <label>:431                                     ; preds = %429
  %432 = call i64 @fwrite(i8* getelementptr inbounds ([7 x i8]* @.str27, i64 0, i64 0), i64 6, i64 1, %struct.__sFILE* %322)
  br label %435

; <label>:433                                     ; preds = %429
  %434 = call i64 @fwrite(i8* getelementptr inbounds ([7 x i8]* @.str40, i64 0, i64 0), i64 6, i64 1, %struct.__sFILE* %322)
  br label %435

; <label>:435                                     ; preds = %433, %431, %._crit_edge
  %436 = call i32 @fclose(%struct.__sFILE* %322)
  br label %437

; <label>:437                                     ; preds = %435, %399
  br i1 %394, label %_ZN7Minisat3vecINS_3LitEED1Ev.exit31, label %438

; <label>:438                                     ; preds = %437
  %439 = icmp eq i8 %386, 1
  %440 = select i1 %439, i32 20, i32 0
  br label %_ZN7Minisat3vecINS_3LitEED1Ev.exit31

_ZN7Minisat3vecINS_3LitEED1Ev.exit31:             ; preds = %438, %437
  %441 = phi i32 [ %440, %438 ], [ 10, %437 ]
  invoke void @_ZN7Minisat6SolverD1Ev(%"class.Minisat::Solver"* %S)
          to label %444 unwind label %141

; <label>:442                                     ; preds = %_ZN7Minisat3vecINS_3LitEED1Ev.exit, %.body
  %eh.lpad-body.sink = phi { i8*, i32 } [ %eh.lpad-body, %.body ], [ %391, %_ZN7Minisat3vecINS_3LitEED1Ev.exit ]
  %.0 = phi i8* [ %147, %.body ], [ %392, %_ZN7Minisat3vecINS_3LitEED1Ev.exit ]
  %443 = extractvalue { i8*, i32 } %eh.lpad-body.sink, 1
  invoke void @_ZN7Minisat6SolverD1Ev(%"class.Minisat::Solver"* %S)
          to label %445 unwind label %458

; <label>:444                                     ; preds = %_ZN7Minisat3vecINS_3LitEED1Ev.exit31
  call void @llvm.lifetime.end(i64 688, i8* %94) #2
  call void @llvm.lifetime.end(i64 56, i8* %63) #2
  call void @llvm.lifetime.end(i64 56, i8* %33) #2
  call void @llvm.lifetime.end(i64 56, i8* %3) #2
  ret i32 %441

; <label>:445                                     ; preds = %442, %141, %137, %133, %129
  %.46 = phi i32 [ %132, %129 ], [ %136, %133 ], [ %140, %137 ], [ %443, %442 ], [ %144, %141 ]
  %.4 = phi i8* [ %131, %129 ], [ %135, %133 ], [ %139, %137 ], [ %.0, %442 ], [ %143, %141 ]
  %446 = call i32 @llvm.eh.typeid.for(i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*)) #2
  %447 = icmp eq i32 %.46, %446
  br i1 %447, label %448, label %455

; <label>:448                                     ; preds = %445
  %449 = call i8* @__cxa_begin_catch(i8* %.4) #2
  %puts = call i32 @puts(i8* getelementptr inbounds ([80 x i8]* @str61, i64 0, i64 0))
  %puts44 = call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str59, i64 0, i64 0))
  invoke void @exit(i32 0) #16
          to label %450 unwind label %451

; <label>:450                                     ; preds = %448
  unreachable

; <label>:451                                     ; preds = %448
  %452 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %453 = extractvalue { i8*, i32 } %452, 0
  %454 = extractvalue { i8*, i32 } %452, 1
  invoke void @__cxa_end_catch()
          to label %455 unwind label %458

; <label>:455                                     ; preds = %451, %445
  %.57 = phi i32 [ %454, %451 ], [ %.46, %445 ]
  %.5 = phi i8* [ %453, %451 ], [ %.4, %445 ]
  %456 = insertvalue { i8*, i32 } undef, i8* %.5, 0
  %457 = insertvalue { i8*, i32 } %456, i32 %.57, 1
  resume { i8*, i32 } %457

; <label>:458                                     ; preds = %451, %442
  %459 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %460 = extractvalue { i8*, i32 } %459, 0
  call void @__clang_call_terminate(i8* %460) #17
  unreachable
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

declare void (i32)* @signal(i32, void (i32)*) #3

; Function Attrs: noreturn ssp uwtable
define internal void @_ZL11SIGINT_exiti(i32 %signum) #4 {
  %putchar = tail call i32 @putchar(i32 10)
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @str57, i64 0, i64 0))
  %1 = load %"class.Minisat::Solver"** @_ZL6solver, align 8, !tbaa !47
  %2 = getelementptr inbounds %"class.Minisat::Solver"* %1, i64 0, i32 3
  %3 = load i32* %2, align 4, !tbaa !51
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  tail call void @_Z10printStatsRN7Minisat6SolverE(%"class.Minisat::Solver"* %1)
  %putchar1 = tail call i32 @putchar(i32 10)
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @str57, i64 0, i64 0))
  br label %6

; <label>:6                                       ; preds = %5, %0
  tail call void @_exit(i32 1) #16
  unreachable
}

declare i32 @"\01_getrlimit"(i32, %struct.rlimit*) #3

declare i32 @"\01_setrlimit"(i32, %struct.rlimit*) #3

declare i8* @gzdopen(i32, i8*) #3

declare i8* @gzopen(i8*, i8*) #3

; Function Attrs: noreturn
declare void @exit(i32) #5

declare i32 @gzclose(i8*) #3

declare %struct.__sFILE* @"\01_fopen"(i8*, i8*) #3

; Function Attrs: nounwind ssp uwtable
define internal void @_ZL16SIGINT_interrupti(i32 %signum) #6 {
  %1 = load %"class.Minisat::Solver"** @_ZL6solver, align 8, !tbaa !47
  %2 = getelementptr inbounds %"class.Minisat::Solver"* %1, i64 0, i32 62
  store i8 1, i8* %2, align 1, !tbaa !68
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct.__sFILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i32 @fclose(%struct.__sFILE* nocapture) #1

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #7 {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #2
  tail call void @_ZSt9terminatev() #17
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: inlinehint nounwind readnone ssp uwtable
define linkonce_odr void @_ZN7Minisat9IntOptionD1Ev(%"class.Minisat::IntOption"* nocapture %this) unnamed_addr #8 align 2 {
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.eh.typeid.for(i8*) #9

declare void @__cxa_end_catch()

; Function Attrs: ssp uwtable
define internal fastcc i32 @_ZN7MinisatL8parseIntINS_12StreamBufferEEEiRT_(%"class.Minisat::StreamBuffer"* %in) #0 {
  %1 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in, i64 0, i32 2
  %2 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in, i64 0, i32 3
  %3 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in, i64 0, i32 0
  %4 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in, i64 0, i32 1, i64 0
  %.pre.i = load i32* %2, align 4, !tbaa !57
  br label %_ZN7Minisat12StreamBufferppEv.exit.i.outer

_ZN7Minisat12StreamBufferppEv.exit.i.outer:       ; preds = %16, %0
  %5 = phi i32 [ %.pre.i, %0 ], [ %18, %16 ]
  %.pre = load i32* %1, align 4, !tbaa !58
  br label %_ZN7Minisat12StreamBufferppEv.exit.i

_ZN7Minisat12StreamBufferppEv.exit.i:             ; preds = %.critedge.i, %_ZN7Minisat12StreamBufferppEv.exit.i.outer
  %6 = phi i32 [ %.pre, %_ZN7Minisat12StreamBufferppEv.exit.i.outer ], [ %14, %.critedge.i ]
  %7 = icmp slt i32 %6, %5
  br i1 %7, label %_ZNK7Minisat12StreamBufferdeEv.exit.i, label %_ZN7Minisat12StreamBufferppEv.exit1

_ZNK7Minisat12StreamBufferdeEv.exit.i:            ; preds = %_ZN7Minisat12StreamBufferppEv.exit.i
  %8 = sext i32 %6 to i64
  %9 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in, i64 0, i32 1, i64 %8
  %10 = load i8* %9, align 1, !tbaa !59
  %11 = icmp ugt i8 %10, 8
  br i1 %11, label %_ZNK7Minisat12StreamBufferdeEv.exit1.i, label %_ZNK7Minisat12StreamBufferdeEv.exit

_ZNK7Minisat12StreamBufferdeEv.exit1.i:           ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit.i
  %12 = icmp ult i8 %10, 14
  %13 = icmp eq i8 %10, 32
  %or.cond = or i1 %12, %13
  br i1 %or.cond, label %.critedge.i, label %_ZN7MinisatL14skipWhitespaceINS_12StreamBufferEEEvRT_.exit

.critedge.i:                                      ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit1.i
  %14 = add nsw i32 %6, 1
  store i32 %14, i32* %1, align 4, !tbaa !58
  %15 = icmp slt i32 %14, %5
  br i1 %15, label %_ZN7Minisat12StreamBufferppEv.exit.i, label %16

; <label>:16                                      ; preds = %.critedge.i
  store i32 0, i32* %1, align 4, !tbaa !58
  %17 = load i8** %3, align 8, !tbaa !55
  %18 = tail call i32 @gzread(i8* %17, i8* %4, i32 1048576)
  store i32 %18, i32* %2, align 4, !tbaa !57
  br label %_ZN7Minisat12StreamBufferppEv.exit.i.outer

_ZN7MinisatL14skipWhitespaceINS_12StreamBufferEEEvRT_.exit: ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit1.i
  br i1 %7, label %_ZNK7Minisat12StreamBufferdeEv.exit, label %_ZN7Minisat12StreamBufferppEv.exit1

_ZNK7Minisat12StreamBufferdeEv.exit:              ; preds = %_ZN7MinisatL14skipWhitespaceINS_12StreamBufferEEEvRT_.exit, %_ZNK7Minisat12StreamBufferdeEv.exit.i
  %19 = sext i32 %6 to i64
  %20 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in, i64 0, i32 1, i64 %19
  %21 = load i8* %20, align 1, !tbaa !59
  %22 = icmp eq i8 %21, 45
  br i1 %22, label %23, label %_ZNK7Minisat12StreamBufferdeEv.exit.thread

; <label>:23                                      ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit
  %24 = add nsw i32 %6, 1
  store i32 %24, i32* %1, align 4, !tbaa !58
  %25 = icmp slt i32 %24, %5
  br i1 %25, label %_ZN7Minisat12StreamBufferppEv.exit1, label %26

; <label>:26                                      ; preds = %23
  store i32 0, i32* %1, align 4, !tbaa !58
  %27 = load i8** %3, align 8, !tbaa !55
  %28 = tail call i32 @gzread(i8* %27, i8* %4, i32 1048576)
  store i32 %28, i32* %2, align 4, !tbaa !57
  br label %_ZN7Minisat12StreamBufferppEv.exit1

_ZNK7Minisat12StreamBufferdeEv.exit.thread:       ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit
  br i1 %7, label %_ZNK7Minisat12StreamBufferdeEv.exit2, label %_ZN7Minisat12StreamBufferppEv.exit1

_ZNK7Minisat12StreamBufferdeEv.exit2:             ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit.thread
  %29 = sext i32 %6 to i64
  %30 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in, i64 0, i32 1, i64 %29
  %31 = load i8* %30, align 1, !tbaa !59
  %32 = icmp eq i8 %31, 43
  br i1 %32, label %33, label %_ZN7Minisat12StreamBufferppEv.exit1

; <label>:33                                      ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit2
  %34 = add nsw i32 %6, 1
  store i32 %34, i32* %1, align 4, !tbaa !58
  %35 = icmp slt i32 %34, %5
  br i1 %35, label %_ZN7Minisat12StreamBufferppEv.exit1, label %36

; <label>:36                                      ; preds = %33
  store i32 0, i32* %1, align 4, !tbaa !58
  %37 = load i8** %3, align 8, !tbaa !55
  %38 = tail call i32 @gzread(i8* %37, i8* %4, i32 1048576)
  store i32 %38, i32* %2, align 4, !tbaa !57
  br label %_ZN7Minisat12StreamBufferppEv.exit1

_ZN7Minisat12StreamBufferppEv.exit1:              ; preds = %36, %33, %_ZNK7Minisat12StreamBufferdeEv.exit2, %_ZNK7Minisat12StreamBufferdeEv.exit.thread, %26, %23, %_ZN7MinisatL14skipWhitespaceINS_12StreamBufferEEEvRT_.exit, %_ZN7Minisat12StreamBufferppEv.exit.i
  %39 = phi i32 [ %5, %_ZNK7Minisat12StreamBufferdeEv.exit2 ], [ %5, %23 ], [ %28, %26 ], [ %5, %33 ], [ %38, %36 ], [ %5, %_ZNK7Minisat12StreamBufferdeEv.exit.thread ], [ %5, %_ZN7MinisatL14skipWhitespaceINS_12StreamBufferEEEvRT_.exit ], [ %5, %_ZN7Minisat12StreamBufferppEv.exit.i ]
  %neg.0 = phi i1 [ false, %_ZNK7Minisat12StreamBufferdeEv.exit2 ], [ true, %23 ], [ true, %26 ], [ false, %33 ], [ false, %36 ], [ false, %_ZNK7Minisat12StreamBufferdeEv.exit.thread ], [ false, %_ZN7MinisatL14skipWhitespaceINS_12StreamBufferEEEvRT_.exit ], [ false, %_ZN7Minisat12StreamBufferppEv.exit.i ]
  %40 = load i32* %1, align 4, !tbaa !58
  %41 = icmp slt i32 %40, %39
  br i1 %41, label %_ZNK7Minisat12StreamBufferdeEv.exit8, label %_ZNK7Minisat12StreamBufferdeEv.exit8.thread.thread16

_ZNK7Minisat12StreamBufferdeEv.exit8.thread.thread16: ; preds = %_ZN7Minisat12StreamBufferppEv.exit1
  %42 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  br label %_ZNK7Minisat12StreamBufferdeEv.exit6

_ZNK7Minisat12StreamBufferdeEv.exit8:             ; preds = %_ZN7Minisat12StreamBufferppEv.exit1
  %43 = sext i32 %40 to i64
  %44 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in, i64 0, i32 1, i64 %43
  %45 = load i8* %44, align 1, !tbaa !59
  %46 = icmp ult i8 %45, 48
  br i1 %46, label %_ZNK7Minisat12StreamBufferdeEv.exit8.thread.thread, label %_ZNK7Minisat12StreamBufferdeEv.exit7

_ZNK7Minisat12StreamBufferdeEv.exit8.thread.thread: ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit8
  %47 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  br label %50

_ZNK7Minisat12StreamBufferdeEv.exit7:             ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit8
  %48 = icmp ugt i8 %45, 57
  br i1 %48, label %_ZNK7Minisat12StreamBufferdeEv.exit8.thread, label %_ZNK7Minisat12StreamBufferdeEv.exit5

_ZNK7Minisat12StreamBufferdeEv.exit8.thread:      ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit7
  %49 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  br i1 %41, label %50, label %_ZNK7Minisat12StreamBufferdeEv.exit6

; <label>:50                                      ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit8.thread, %_ZNK7Minisat12StreamBufferdeEv.exit8.thread.thread
  %51 = phi %struct.__sFILE* [ %47, %_ZNK7Minisat12StreamBufferdeEv.exit8.thread.thread ], [ %49, %_ZNK7Minisat12StreamBufferdeEv.exit8.thread ]
  %52 = sext i32 %40 to i64
  %53 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in, i64 0, i32 1, i64 %52
  %54 = load i8* %53, align 1, !tbaa !59
  %55 = zext i8 %54 to i32
  br label %_ZNK7Minisat12StreamBufferdeEv.exit6

_ZNK7Minisat12StreamBufferdeEv.exit6:             ; preds = %50, %_ZNK7Minisat12StreamBufferdeEv.exit8.thread, %_ZNK7Minisat12StreamBufferdeEv.exit8.thread.thread16
  %56 = phi %struct.__sFILE* [ %51, %50 ], [ %49, %_ZNK7Minisat12StreamBufferdeEv.exit8.thread ], [ %42, %_ZNK7Minisat12StreamBufferdeEv.exit8.thread.thread16 ]
  %57 = phi i32 [ %55, %50 ], [ -1, %_ZNK7Minisat12StreamBufferdeEv.exit8.thread ], [ -1, %_ZNK7Minisat12StreamBufferdeEv.exit8.thread.thread16 ]
  %58 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %56, i8* getelementptr inbounds ([34 x i8]* @.str42, i64 0, i64 0), i32 %57)
  tail call void @exit(i32 3) #16
  unreachable

_ZNK7Minisat12StreamBufferdeEv.exit5:             ; preds = %_ZN7Minisat12StreamBufferppEv.exit.backedge._ZNK7Minisat12StreamBufferdeEv.exit5_crit_edge, %_ZNK7Minisat12StreamBufferdeEv.exit7
  %59 = phi i32 [ %73, %_ZN7Minisat12StreamBufferppEv.exit.backedge._ZNK7Minisat12StreamBufferdeEv.exit5_crit_edge ], [ %39, %_ZNK7Minisat12StreamBufferdeEv.exit7 ]
  %60 = phi i8 [ %.pre13, %_ZN7Minisat12StreamBufferppEv.exit.backedge._ZNK7Minisat12StreamBufferdeEv.exit5_crit_edge ], [ %45, %_ZNK7Minisat12StreamBufferdeEv.exit7 ]
  %61 = phi i32 [ %74, %_ZN7Minisat12StreamBufferppEv.exit.backedge._ZNK7Minisat12StreamBufferdeEv.exit5_crit_edge ], [ %40, %_ZNK7Minisat12StreamBufferdeEv.exit7 ]
  %val.010 = phi i32 [ %70, %_ZN7Minisat12StreamBufferppEv.exit.backedge._ZNK7Minisat12StreamBufferdeEv.exit5_crit_edge ], [ 0, %_ZNK7Minisat12StreamBufferdeEv.exit7 ]
  %62 = icmp ugt i8 %60, 47
  br i1 %62, label %63, label %.critedge

; <label>:63                                      ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit5
  %64 = icmp slt i32 %61, %59
  br i1 %64, label %_ZNK7Minisat12StreamBufferdeEv.exit4, label %_ZNK7Minisat12StreamBufferdeEv.exit3

_ZNK7Minisat12StreamBufferdeEv.exit4:             ; preds = %63
  %65 = icmp ult i8 %60, 58
  br i1 %65, label %66, label %.critedge

; <label>:66                                      ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit4
  %67 = zext i8 %60 to i32
  %phitmp = add i32 %67, -48
  br label %_ZNK7Minisat12StreamBufferdeEv.exit3

_ZNK7Minisat12StreamBufferdeEv.exit3:             ; preds = %66, %63
  %68 = phi i32 [ %phitmp, %66 ], [ -49, %63 ]
  %69 = mul nsw i32 %val.010, 10
  %70 = add nsw i32 %68, %69
  %71 = add nsw i32 %61, 1
  store i32 %71, i32* %1, align 4, !tbaa !58
  %72 = icmp slt i32 %71, %59
  br i1 %72, label %_ZN7Minisat12StreamBufferppEv.exit.backedge, label %76

_ZN7Minisat12StreamBufferppEv.exit.backedge:      ; preds = %76, %_ZNK7Minisat12StreamBufferdeEv.exit3
  %73 = phi i32 [ %59, %_ZNK7Minisat12StreamBufferdeEv.exit3 ], [ %78, %76 ]
  %74 = phi i32 [ %71, %_ZNK7Minisat12StreamBufferdeEv.exit3 ], [ %.pre14, %76 ]
  %75 = icmp slt i32 %74, %73
  br i1 %75, label %_ZN7Minisat12StreamBufferppEv.exit.backedge._ZNK7Minisat12StreamBufferdeEv.exit5_crit_edge, label %.critedge

_ZN7Minisat12StreamBufferppEv.exit.backedge._ZNK7Minisat12StreamBufferdeEv.exit5_crit_edge: ; preds = %_ZN7Minisat12StreamBufferppEv.exit.backedge
  %.phi.trans.insert = sext i32 %74 to i64
  %.phi.trans.insert12 = getelementptr inbounds %"class.Minisat::StreamBuffer"* %in, i64 0, i32 1, i64 %.phi.trans.insert
  %.pre13 = load i8* %.phi.trans.insert12, align 1, !tbaa !59
  br label %_ZNK7Minisat12StreamBufferdeEv.exit5

; <label>:76                                      ; preds = %_ZNK7Minisat12StreamBufferdeEv.exit3
  store i32 0, i32* %1, align 4, !tbaa !58
  %77 = load i8** %3, align 8, !tbaa !55
  %78 = tail call i32 @gzread(i8* %77, i8* %4, i32 1048576)
  store i32 %78, i32* %2, align 4, !tbaa !57
  %.pre14 = load i32* %1, align 4, !tbaa !58
  br label %_ZN7Minisat12StreamBufferppEv.exit.backedge

.critedge:                                        ; preds = %_ZN7Minisat12StreamBufferppEv.exit.backedge, %_ZNK7Minisat12StreamBufferdeEv.exit4, %_ZNK7Minisat12StreamBufferdeEv.exit5
  %val.0.lcssa = phi i32 [ %val.010, %_ZNK7Minisat12StreamBufferdeEv.exit4 ], [ %val.010, %_ZNK7Minisat12StreamBufferdeEv.exit5 ], [ %70, %_ZN7Minisat12StreamBufferppEv.exit.backedge ]
  %79 = sub nsw i32 0, %val.0.lcssa
  %80 = select i1 %neg.0, i32 %79, i32 %val.0.lcssa
  ret i32 %80
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat3vecINS_3LitEE8capacityEi(%"class.Minisat::vec.0"* nocapture %this, i32 %min_cap) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::vec.0"* %this, i64 0, i32 2
  %2 = load i32* %1, align 4, !tbaa !62
  %3 = icmp slt i32 %2, %min_cap
  br i1 %3, label %4, label %35

; <label>:4                                       ; preds = %0
  %5 = add i32 %min_cap, 1
  %6 = sub i32 %5, %2
  %7 = and i32 %6, -2
  %8 = ashr i32 %2, 1
  %9 = add nsw i32 %8, 2
  %10 = and i32 %9, -2
  %11 = sub nsw i32 %10, %7
  %12 = ashr i32 %11, 31
  %13 = and i32 %12, %7
  %14 = xor i32 %12, -1
  %15 = and i32 %10, %14
  %16 = add nsw i32 %13, %15
  %17 = sub nsw i32 2147483647, %2
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %33, label %19

; <label>:19                                      ; preds = %4
  %20 = getelementptr inbounds %"class.Minisat::vec.0"* %this, i64 0, i32 0
  %21 = load %"struct.Minisat::Lit"** %20, align 8, !tbaa !60
  %22 = bitcast %"struct.Minisat::Lit"* %21 to i8*
  %23 = add nsw i32 %16, %2
  store i32 %23, i32* %1, align 4, !tbaa !62
  %24 = sext i32 %23 to i64
  %25 = shl nsw i64 %24, 2
  %26 = tail call i8* @realloc(i8* %22, i64 %25)
  %27 = bitcast i8* %26 to %"struct.Minisat::Lit"*
  store %"struct.Minisat::Lit"* %27, %"struct.Minisat::Lit"** %20, align 8, !tbaa !60
  %28 = icmp eq i8* %26, null
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %19
  %30 = tail call i32* @__error()
  %31 = load i32* %30, align 4, !tbaa !36
  %32 = icmp eq i32 %31, 12
  br i1 %32, label %33, label %35

; <label>:33                                      ; preds = %29, %4
  %34 = tail call i8* @__cxa_allocate_exception(i64 1) #2
  tail call void @__cxa_throw(i8* %34, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*), i8* null) #16
  unreachable

; <label>:35                                      ; preds = %29, %19, %0
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @realloc(i8* nocapture, i64) #1

declare i32* @__error() #3

declare i8* @__cxa_allocate_exception(i64)

declare void @__cxa_throw(i8*, i8*, i8*)

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

declare i32 @gzread(i8*, i8*, i32) #3

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: noreturn
declare void @_exit(i32) #5

; Function Attrs: inlinehint nounwind ssp uwtable
define linkonce_odr void @_ZN7Minisat9IntOptionD0Ev(%"class.Minisat::IntOption"* %this) unnamed_addr #10 align 2 {
  %1 = bitcast %"class.Minisat::IntOption"* %this to i8*
  tail call void @_ZdlPv(i8* %1) #18
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr zeroext i1 @_ZN7Minisat9IntOption5parseEPKc(%"class.Minisat::IntOption"* nocapture %this, i8* %str) unnamed_addr #0 align 2 {
.lr.ph.i:
  %end = alloca i8*, align 8
  %0 = load i8* %str, align 1, !tbaa !59
  %1 = icmp eq i8 %0, 45
  br i1 %1, label %2, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit

; <label>:2                                       ; preds = %.lr.ph.i
  %3 = getelementptr inbounds i8* %str, i64 1
  %4 = getelementptr inbounds %"class.Minisat::IntOption"* %this, i64 0, i32 0, i32 1
  %5 = load i8** %4, align 8, !tbaa !39
  %6 = load i8* %5, align 1, !tbaa !59
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %.lr.ph.i3, label %.lr.ph.i9

; <label>:8                                       ; preds = %.lr.ph.i9
  %9 = getelementptr inbounds i8* %5, i64 %indvars.iv.next.i8
  %10 = load i8* %9, align 1, !tbaa !59
  %11 = icmp eq i8 %10, 0
  %.sum = add i64 %indvars.iv.i7, 2
  %12 = getelementptr inbounds i8* %str, i64 %.sum
  br i1 %11, label %.lr.ph.i3, label %.lr.ph.i9

.lr.ph.i9:                                        ; preds = %8, %2
  %indvars.iv.i7 = phi i64 [ %indvars.iv.next.i8, %8 ], [ 0, %2 ]
  %13 = phi i8* [ %12, %8 ], [ %3, %2 ]
  %14 = phi i8 [ %10, %8 ], [ %6, %2 ]
  %15 = load i8* %13, align 1, !tbaa !59
  %16 = icmp eq i8 %15, %14
  %indvars.iv.next.i8 = add nuw nsw i64 %indvars.iv.i7, 1
  br i1 %16, label %8, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit

.lr.ph.i3:                                        ; preds = %8, %2
  %str14.ph = phi i8* [ %3, %2 ], [ %12, %8 ]
  %17 = load i8* %str14.ph, align 1, !tbaa !59
  %18 = icmp eq i8 %17, 61
  br i1 %18, label %19, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit

; <label>:19                                      ; preds = %.lr.ph.i3
  %20 = getelementptr inbounds i8* %str14.ph, i64 1
  %21 = call i64 @strtol(i8* %20, i8** %end, i32 10)
  %22 = trunc i64 %21 to i32
  %23 = load i8** %end, align 8, !tbaa !47
  %24 = icmp eq i8* %23, null
  br i1 %24, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit, label %25

; <label>:25                                      ; preds = %19
  %26 = getelementptr inbounds %"class.Minisat::IntOption"* %this, i64 0, i32 1, i32 1
  %27 = load i32* %26, align 4, !tbaa !69
  %28 = icmp sgt i32 %22, %27
  br i1 %28, label %29, label %33

; <label>:29                                      ; preds = %25
  %30 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %31 = load i8** %4, align 8, !tbaa !39
  %32 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %30, i8* getelementptr inbounds ([49 x i8]* @.str55, i64 0, i64 0), i8* %20, i8* %31)
  tail call void @exit(i32 1) #16
  unreachable

; <label>:33                                      ; preds = %25
  %34 = getelementptr inbounds %"class.Minisat::IntOption"* %this, i64 0, i32 1, i32 0
  %35 = load i32* %34, align 4, !tbaa !70
  %36 = icmp slt i32 %22, %35
  br i1 %36, label %37, label %41

; <label>:37                                      ; preds = %33
  %38 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %39 = load i8** %4, align 8, !tbaa !39
  %40 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %38, i8* getelementptr inbounds ([49 x i8]* @.str56, i64 0, i64 0), i8* %20, i8* %39)
  tail call void @exit(i32 1) #16
  unreachable

; <label>:41                                      ; preds = %33
  %42 = getelementptr inbounds %"class.Minisat::IntOption"* %this, i64 0, i32 2
  store i32 %22, i32* %42, align 4, !tbaa !48
  br label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit

_ZN7MinisatL5matchIPKcEEbRT_S2_.exit:             ; preds = %41, %19, %.lr.ph.i3, %.lr.ph.i9, %.lr.ph.i
  %.0 = phi i1 [ true, %41 ], [ false, %19 ], [ false, %.lr.ph.i3 ], [ false, %.lr.ph.i ], [ false, %.lr.ph.i9 ]
  ret i1 %.0
}

; Function Attrs: nounwind ssp uwtable
define linkonce_odr void @_ZN7Minisat9IntOption4helpEb(%"class.Minisat::IntOption"* nocapture readonly %this, i1 zeroext %verbose) unnamed_addr #6 align 2 {
  %1 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %2 = getelementptr inbounds %"class.Minisat::IntOption"* %this, i64 0, i32 0, i32 1
  %3 = load i8** %2, align 8, !tbaa !39
  %4 = getelementptr inbounds %"class.Minisat::IntOption"* %this, i64 0, i32 0, i32 4
  %5 = load i8** %4, align 8, !tbaa !43
  %6 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([18 x i8]* @.str47, i64 0, i64 0), i8* %3, i8* %5)
  %7 = getelementptr inbounds %"class.Minisat::IntOption"* %this, i64 0, i32 1, i32 0
  %8 = load i32* %7, align 4, !tbaa !70
  %9 = icmp eq i32 %8, -2147483648
  %10 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  br i1 %9, label %11, label %13

; <label>:11                                      ; preds = %0
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8]* @.str48, i64 0, i64 0), i64 4, i64 1, %struct.__sFILE* %10)
  br label %15

; <label>:13                                      ; preds = %0
  %14 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %10, i8* getelementptr inbounds ([4 x i8]* @.str49, i64 0, i64 0), i32 %8)
  br label %15

; <label>:15                                      ; preds = %13, %11
  %16 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8]* @.str50, i64 0, i64 0), i64 4, i64 1, %struct.__sFILE* %16)
  %18 = getelementptr inbounds %"class.Minisat::IntOption"* %this, i64 0, i32 1, i32 1
  %19 = load i32* %18, align 4, !tbaa !69
  %20 = icmp eq i32 %19, 2147483647
  %21 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  br i1 %20, label %22, label %24

; <label>:22                                      ; preds = %15
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8]* @.str51, i64 0, i64 0), i64 4, i64 1, %struct.__sFILE* %21)
  br label %26

; <label>:24                                      ; preds = %15
  %25 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %21, i8* getelementptr inbounds ([4 x i8]* @.str49, i64 0, i64 0), i32 %19)
  br label %26

; <label>:26                                      ; preds = %24, %22
  %27 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %28 = getelementptr inbounds %"class.Minisat::IntOption"* %this, i64 0, i32 2
  %29 = load i32* %28, align 4, !tbaa !48
  %30 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %27, i8* getelementptr inbounds ([17 x i8]* @.str52, i64 0, i64 0), i32 %29)
  br i1 %verbose, label %31, label %37

; <label>:31                                      ; preds = %26
  %32 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %33 = getelementptr inbounds %"class.Minisat::IntOption"* %this, i64 0, i32 0, i32 2
  %34 = load i8** %33, align 8, !tbaa !41
  %35 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %32, i8* getelementptr inbounds ([13 x i8]* @.str53, i64 0, i64 0), i8* %34)
  %36 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %fputc = tail call i32 @fputc(i32 10, %struct.__sFILE* %36)
  br label %37

; <label>:37                                      ; preds = %31, %26
  ret void
}

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #1

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #11

; Function Attrs: nounwind readnone ssp uwtable
define linkonce_odr void @_ZN7Minisat6OptionD1Ev(%"class.Minisat::Option"* nocapture %this) unnamed_addr #12 align 2 {
  ret void
}

; Function Attrs: nounwind ssp uwtable
define linkonce_odr void @_ZN7Minisat6OptionD0Ev(%"class.Minisat::Option"* %this) unnamed_addr #6 align 2 {
  %1 = bitcast %"class.Minisat::Option"* %this to i8*
  tail call void @_ZdlPv(i8* %1) #18
  ret void
}

declare void @__cxa_pure_virtual()

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat3vecIPNS_6OptionEE8capacityEi(%"class.Minisat::vec.8"* nocapture %this, i32 %min_cap) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::vec.8"* %this, i64 0, i32 2
  %2 = load i32* %1, align 4, !tbaa !71
  %3 = icmp slt i32 %2, %min_cap
  br i1 %3, label %4, label %35

; <label>:4                                       ; preds = %0
  %5 = add i32 %min_cap, 1
  %6 = sub i32 %5, %2
  %7 = and i32 %6, -2
  %8 = ashr i32 %2, 1
  %9 = add nsw i32 %8, 2
  %10 = and i32 %9, -2
  %11 = sub nsw i32 %10, %7
  %12 = ashr i32 %11, 31
  %13 = and i32 %12, %7
  %14 = xor i32 %12, -1
  %15 = and i32 %10, %14
  %16 = add nsw i32 %13, %15
  %17 = sub nsw i32 2147483647, %2
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %33, label %19

; <label>:19                                      ; preds = %4
  %20 = getelementptr inbounds %"class.Minisat::vec.8"* %this, i64 0, i32 0
  %21 = load %"class.Minisat::Option"*** %20, align 8, !tbaa !46
  %22 = bitcast %"class.Minisat::Option"** %21 to i8*
  %23 = add nsw i32 %16, %2
  store i32 %23, i32* %1, align 4, !tbaa !71
  %24 = sext i32 %23 to i64
  %25 = shl nsw i64 %24, 3
  %26 = tail call i8* @realloc(i8* %22, i64 %25)
  %27 = bitcast i8* %26 to %"class.Minisat::Option"**
  store %"class.Minisat::Option"** %27, %"class.Minisat::Option"*** %20, align 8, !tbaa !46
  %28 = icmp eq i8* %26, null
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %19
  %30 = tail call i32* @__error()
  %31 = load i32* %30, align 4, !tbaa !36
  %32 = icmp eq i32 %31, 12
  br i1 %32, label %33, label %35

; <label>:33                                      ; preds = %29, %4
  %34 = tail call i8* @__cxa_allocate_exception(i64 1) #2
  tail call void @__cxa_throw(i8* %34, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*), i8* null) #16
  unreachable

; <label>:35                                      ; preds = %29, %19, %0
  ret void
}

; Function Attrs: nounwind
declare i32 @__cxa_guard_acquire(i64*) #2

; Function Attrs: nounwind ssp uwtable
define linkonce_odr void @_ZN7Minisat3vecIPNS_6OptionEED1Ev(%"class.Minisat::vec.8"* nocapture %this) unnamed_addr #6 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::vec.8"* %this, i64 0, i32 0
  %2 = load %"class.Minisat::Option"*** %1, align 8, !tbaa !46
  %3 = icmp eq %"class.Minisat::Option"** %2, null
  br i1 %3, label %_ZN7Minisat3vecIPNS_6OptionEED2Ev.exit, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %0
  %4 = getelementptr inbounds %"class.Minisat::vec.8"* %this, i64 0, i32 1
  store i32 0, i32* %4, align 4, !tbaa !44
  %5 = bitcast %"class.Minisat::Option"** %2 to i8*
  tail call void @free(i8* %5) #2
  store %"class.Minisat::Option"** null, %"class.Minisat::Option"*** %1, align 8, !tbaa !46
  %6 = getelementptr inbounds %"class.Minisat::vec.8"* %this, i64 0, i32 2
  store i32 0, i32* %6, align 4, !tbaa !71
  br label %_ZN7Minisat3vecIPNS_6OptionEED2Ev.exit

_ZN7Minisat3vecIPNS_6OptionEED2Ev.exit:           ; preds = %.preheader.i.i, %0
  ret void
}

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #2

; Function Attrs: nounwind
declare void @__cxa_guard_release(i64*) #2

declare i32 @getrusage(i32, %struct.rusage*) #3

; Function Attrs: nounwind
declare i32 @putchar(i32) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct.__sFILE* nocapture) #2

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct.__sFILE* nocapture) #2

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6SolverC2Ev(%"class.Minisat::Solver"* %this) unnamed_addr #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([5 x i8*]* @_ZTVN7Minisat6SolverE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, align 8, !tbaa !37
  %2 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 1
  %3 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 4
  %4 = bitcast %"class.Minisat::vec"* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 36, i32 8, i1 false)
  %5 = load double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL13opt_var_decay, i64 0, i32 2), align 8, !tbaa !72
  store double %5, double* %3, align 8, !tbaa !73
  %6 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 5
  %7 = load double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_clause_decay, i64 0, i32 2), align 8, !tbaa !72
  store double %7, double* %6, align 8, !tbaa !74
  %8 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 6
  %9 = load double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL19opt_random_var_freq, i64 0, i32 2), align 8, !tbaa !72
  store double %9, double* %8, align 8, !tbaa !75
  %10 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 7
  %11 = load double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_random_seed, i64 0, i32 2), align 8, !tbaa !72
  store double %11, double* %10, align 8, !tbaa !76
  %12 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 8
  %13 = load i8* getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_luby_restart, i64 0, i32 1), align 8, !tbaa !77, !range !78
  store i8 %13, i8* %12, align 1, !tbaa !79
  %14 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 9
  %15 = load i32* getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL14opt_ccmin_mode, i64 0, i32 2), align 8, !tbaa !36
  store i32 %15, i32* %14, align 4, !tbaa !80
  %16 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 10
  %17 = load i32* getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL16opt_phase_saving, i64 0, i32 2), align 8, !tbaa !36
  store i32 %17, i32* %16, align 4, !tbaa !81
  %18 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 11
  store i8 0, i8* %18, align 1, !tbaa !82
  %19 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 12
  %20 = load i8* getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_rnd_init_act, i64 0, i32 1), align 8, !tbaa !77, !range !78
  store i8 %20, i8* %19, align 1, !tbaa !83
  %21 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 13
  %22 = load double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_garbage_frac, i64 0, i32 2), align 8, !tbaa !72
  store double %22, double* %21, align 8, !tbaa !84
  %23 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 14
  %24 = load i32* getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL17opt_restart_first, i64 0, i32 2), align 8, !tbaa !36
  store i32 %24, i32* %23, align 4, !tbaa !85
  %25 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 15
  %26 = load double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_restart_inc, i64 0, i32 2), align 8, !tbaa !72
  store double %26, double* %25, align 8, !tbaa !86
  %27 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 16
  store double 0x3FD5555555555555, double* %27, align 8, !tbaa !87
  %28 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 17
  store double 1.100000e+00, double* %28, align 8, !tbaa !88
  %29 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 18
  store i32 100, i32* %29, align 4, !tbaa !89
  %30 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 19
  store double 1.500000e+00, double* %30, align 8, !tbaa !90
  %31 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 20
  %32 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 31
  %33 = bitcast i64* %31 to i8*
  call void @llvm.memset.p0i8.i64(i8* %33, i8 0, i64 88, i32 8, i1 false)
  store i8 1, i8* %32, align 1, !tbaa !91
  %34 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32
  %35 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 34
  %36 = bitcast %"class.Minisat::vec.1"* %34 to i8*
  call void @llvm.memset.p0i8.i64(i8* %36, i8 0, i64 32, i32 8, i1 false)
  store double 1.000000e+00, double* %35, align 8, !tbaa !92
  %37 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 35
  %38 = bitcast %"class.Minisat::vec.2"* %37 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %38, i8 0, i64 16, i32 8, i1 false) #2
  %39 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 36
  store double 1.000000e+00, double* %39, align 8, !tbaa !93
  %40 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37
  %41 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %42 = bitcast %"class.Minisat::OccLists"* %40 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %42, i8 0, i64 48, i32 8, i1 false)
  %43 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 3, i32 0
  store %"class.Minisat::ClauseAllocator"* %41, %"class.Minisat::ClauseAllocator"** %43, align 8, !tbaa !59
  %44 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38
  %45 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 45
  %46 = bitcast %"class.Minisat::vec"* %44 to i8*
  call void @llvm.memset.p0i8.i64(i8* %46, i8 0, i64 100, i32 8, i1 false)
  store i32 -1, i32* %45, align 4, !tbaa !94
  %47 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 46
  %48 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 0, i32 0
  %49 = bitcast i64* %47 to i8*
  call void @llvm.memset.p0i8.i64(i8* %49, i8 0, i64 24, i32 8, i1 false)
  store %"class.Minisat::vec.2"* %37, %"class.Minisat::vec.2"** %48, align 8
  %50 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 1
  %51 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 50
  %52 = bitcast %"class.Minisat::vec.6"* %50 to i8*
  call void @llvm.memset.p0i8.i64(i8* %52, i8 0, i64 40, i32 8, i1 false)
  store i8 1, i8* %51, align 1, !tbaa !95
  %53 = bitcast %"class.Minisat::ClauseAllocator"* %41 to %"class.Minisat::RegionAllocator"*
  %54 = getelementptr inbounds %"class.Minisat::ClauseAllocator"* %41, i64 0, i32 0, i64 0
  tail call void @llvm.memset.p0i8.i64(i8* %54, i8 0, i64 20, i32 8, i1 false)
  invoke void @_ZN7Minisat15RegionAllocatorIjE8capacityEj(%"class.Minisat::RegionAllocator"* %53, i32 1048576)
          to label %55 unwind label %62

; <label>:55                                      ; preds = %0
  %56 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 1
  store i8 0, i8* %56, align 1, !tbaa !96
  %57 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 53
  %58 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 60
  %59 = bitcast %"class.Minisat::vec.5"* %57 to i8*
  call void @llvm.memset.p0i8.i64(i8* %59, i8 0, i64 64, i32 8, i1 false)
  %60 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 62
  %61 = bitcast i64* %58 to i8*
  call void @llvm.memset.p0i8.i64(i8* %61, i8 -1, i64 16, i32 8, i1 false)
  store i8 0, i8* %60, align 1, !tbaa !68
  ret void

; <label>:62                                      ; preds = %0
  %63 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %64 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 2, i32 0
  %65 = load i32** %64, align 8, !tbaa !97
  %66 = icmp eq i32* %65, null
  br i1 %66, label %_ZN7Minisat3vecIiED1Ev.exit.i.i, label %.preheader.i.i.i.i.i39

.preheader.i.i.i.i.i39:                           ; preds = %62
  %67 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 2, i32 1
  store i32 0, i32* %67, align 4, !tbaa !98
  %68 = bitcast i32* %65 to i8*
  tail call void @free(i8* %68) #2
  store i32* null, i32** %64, align 8, !tbaa !97
  %69 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 2, i32 2
  store i32 0, i32* %69, align 4, !tbaa !99
  br label %_ZN7Minisat3vecIiED1Ev.exit.i.i

_ZN7Minisat3vecIiED1Ev.exit.i.i:                  ; preds = %.preheader.i.i.i.i.i39, %62
  %70 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 1, i32 0
  %71 = load i32** %70, align 8, !tbaa !97
  %72 = icmp eq i32* %71, null
  br i1 %72, label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEED1Ev.exit, label %.preheader.i.i.i1.i.i

.preheader.i.i.i1.i.i:                            ; preds = %_ZN7Minisat3vecIiED1Ev.exit.i.i
  %73 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 1, i32 1
  store i32 0, i32* %73, align 4, !tbaa !98
  %74 = bitcast i32* %71 to i8*
  tail call void @free(i8* %74) #2
  store i32* null, i32** %70, align 8, !tbaa !97
  %75 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 1, i32 2
  store i32 0, i32* %75, align 4, !tbaa !99
  br label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEED1Ev.exit

_ZN7Minisat4HeapINS_6Solver10VarOrderLtEED1Ev.exit: ; preds = %.preheader.i.i.i1.i.i, %_ZN7Minisat3vecIiED1Ev.exit.i.i
  %76 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 47, i32 0
  %77 = load %"struct.Minisat::Lit"** %76, align 8, !tbaa !60
  %78 = icmp eq %"struct.Minisat::Lit"* %77, null
  br i1 %78, label %_ZN7Minisat3vecINS_3LitEED1Ev.exit38, label %.preheader.i.i.i37

.preheader.i.i.i37:                               ; preds = %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEED1Ev.exit
  %79 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 47, i32 1
  store i32 0, i32* %79, align 4, !tbaa !61
  %80 = bitcast %"struct.Minisat::Lit"* %77 to i8*
  tail call void @free(i8* %80) #2
  store %"struct.Minisat::Lit"* null, %"struct.Minisat::Lit"** %76, align 8, !tbaa !60
  %81 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 47, i32 2
  store i32 0, i32* %81, align 4, !tbaa !62
  br label %_ZN7Minisat3vecINS_3LitEED1Ev.exit38

_ZN7Minisat3vecINS_3LitEED1Ev.exit38:             ; preds = %.preheader.i.i.i37, %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEED1Ev.exit
  %82 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 0
  %83 = load %"struct.Minisat::Solver::VarData"** %82, align 8, !tbaa !100
  %84 = icmp eq %"struct.Minisat::Solver::VarData"* %83, null
  br i1 %84, label %_ZN7Minisat3vecINS_6Solver7VarDataEED1Ev.exit, label %.preheader.i.i.i36

.preheader.i.i.i36:                               ; preds = %_ZN7Minisat3vecINS_3LitEED1Ev.exit38
  %85 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 1
  store i32 0, i32* %85, align 4, !tbaa !63
  %86 = bitcast %"struct.Minisat::Solver::VarData"* %83 to i8*
  tail call void @free(i8* %86) #2
  store %"struct.Minisat::Solver::VarData"* null, %"struct.Minisat::Solver::VarData"** %82, align 8, !tbaa !100
  %87 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 2
  store i32 0, i32* %87, align 4, !tbaa !101
  br label %_ZN7Minisat3vecINS_6Solver7VarDataEED1Ev.exit

_ZN7Minisat3vecINS_6Solver7VarDataEED1Ev.exit:    ; preds = %.preheader.i.i.i36, %_ZN7Minisat3vecINS_3LitEED1Ev.exit38
  %88 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 0
  %89 = load i32** %88, align 8, !tbaa !97
  %90 = icmp eq i32* %89, null
  br i1 %90, label %_ZN7Minisat3vecIiED1Ev.exit, label %.preheader.i.i.i35

.preheader.i.i.i35:                               ; preds = %_ZN7Minisat3vecINS_6Solver7VarDataEED1Ev.exit
  %91 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 1
  store i32 0, i32* %91, align 4, !tbaa !98
  %92 = bitcast i32* %89 to i8*
  tail call void @free(i8* %92) #2
  store i32* null, i32** %88, align 8, !tbaa !97
  %93 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 2
  store i32 0, i32* %93, align 4, !tbaa !99
  br label %_ZN7Minisat3vecIiED1Ev.exit

_ZN7Minisat3vecIiED1Ev.exit:                      ; preds = %.preheader.i.i.i35, %_ZN7Minisat3vecINS_6Solver7VarDataEED1Ev.exit
  %94 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 0
  %95 = load %"struct.Minisat::Lit"** %94, align 8, !tbaa !60
  %96 = icmp eq %"struct.Minisat::Lit"* %95, null
  br i1 %96, label %_ZN7Minisat3vecINS_3LitEED1Ev.exit34, label %.preheader.i.i.i33

.preheader.i.i.i33:                               ; preds = %_ZN7Minisat3vecIiED1Ev.exit
  %97 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 1
  store i32 0, i32* %97, align 4, !tbaa !61
  %98 = bitcast %"struct.Minisat::Lit"* %95 to i8*
  tail call void @free(i8* %98) #2
  store %"struct.Minisat::Lit"* null, %"struct.Minisat::Lit"** %94, align 8, !tbaa !60
  %99 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 2
  store i32 0, i32* %99, align 4, !tbaa !62
  br label %_ZN7Minisat3vecINS_3LitEED1Ev.exit34

_ZN7Minisat3vecINS_3LitEED1Ev.exit34:             ; preds = %.preheader.i.i.i33, %_ZN7Minisat3vecIiED1Ev.exit
  %100 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 40, i32 0
  %101 = load i8** %100, align 8, !tbaa !102
  %102 = icmp eq i8* %101, null
  br i1 %102, label %_ZN7Minisat3vecIcED1Ev.exit32, label %.preheader.i.i.i31

.preheader.i.i.i31:                               ; preds = %_ZN7Minisat3vecINS_3LitEED1Ev.exit34
  %103 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 40, i32 1
  store i32 0, i32* %103, align 4, !tbaa !103
  tail call void @free(i8* %101) #2
  store i8* null, i8** %100, align 8, !tbaa !102
  %104 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 40, i32 2
  store i32 0, i32* %104, align 4, !tbaa !104
  br label %_ZN7Minisat3vecIcED1Ev.exit32

_ZN7Minisat3vecIcED1Ev.exit32:                    ; preds = %.preheader.i.i.i31, %_ZN7Minisat3vecINS_3LitEED1Ev.exit34
  %105 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 39, i32 0
  %106 = load i8** %105, align 8, !tbaa !102
  %107 = icmp eq i8* %106, null
  br i1 %107, label %_ZN7Minisat3vecIcED1Ev.exit, label %.preheader.i.i.i30

.preheader.i.i.i30:                               ; preds = %_ZN7Minisat3vecIcED1Ev.exit32
  %108 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 39, i32 1
  store i32 0, i32* %108, align 4, !tbaa !103
  tail call void @free(i8* %106) #2
  store i8* null, i8** %105, align 8, !tbaa !102
  %109 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 39, i32 2
  store i32 0, i32* %109, align 4, !tbaa !104
  br label %_ZN7Minisat3vecIcED1Ev.exit

_ZN7Minisat3vecIcED1Ev.exit:                      ; preds = %.preheader.i.i.i30, %_ZN7Minisat3vecIcED1Ev.exit32
  %110 = getelementptr inbounds %"class.Minisat::vec"* %44, i64 0, i32 0
  %111 = load %"class.Minisat::lbool"** %110, align 8, !tbaa !65
  %112 = icmp eq %"class.Minisat::lbool"* %111, null
  br i1 %112, label %_ZN7Minisat3vecINS_5lboolEED1Ev.exit29, label %.preheader.i.i.i28

.preheader.i.i.i28:                               ; preds = %_ZN7Minisat3vecIcED1Ev.exit
  %113 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 1
  store i32 0, i32* %113, align 4, !tbaa !105
  %114 = getelementptr inbounds %"class.Minisat::lbool"* %111, i64 0, i32 0
  tail call void @free(i8* %114) #2
  store %"class.Minisat::lbool"* null, %"class.Minisat::lbool"** %110, align 8, !tbaa !65
  %115 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 2
  store i32 0, i32* %115, align 4, !tbaa !106
  br label %_ZN7Minisat3vecINS_5lboolEED1Ev.exit29

_ZN7Minisat3vecINS_5lboolEED1Ev.exit29:           ; preds = %.preheader.i.i.i28, %_ZN7Minisat3vecIcED1Ev.exit
  %116 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2, i32 0
  %117 = load %"struct.Minisat::Lit"** %116, align 8, !tbaa !60
  %118 = icmp eq %"struct.Minisat::Lit"* %117, null
  br i1 %118, label %_ZN7Minisat3vecINS_3LitEED1Ev.exit.i.i, label %.preheader.i.i.i.i.i

.preheader.i.i.i.i.i:                             ; preds = %_ZN7Minisat3vecINS_5lboolEED1Ev.exit29
  %119 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2, i32 1
  store i32 0, i32* %119, align 4, !tbaa !61
  %120 = bitcast %"struct.Minisat::Lit"* %117 to i8*
  tail call void @free(i8* %120) #2
  store %"struct.Minisat::Lit"* null, %"struct.Minisat::Lit"** %116, align 8, !tbaa !60
  %121 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2, i32 2
  store i32 0, i32* %121, align 4, !tbaa !62
  br label %_ZN7Minisat3vecINS_3LitEED1Ev.exit.i.i

_ZN7Minisat3vecINS_3LitEED1Ev.exit.i.i:           ; preds = %.preheader.i.i.i.i.i, %_ZN7Minisat3vecINS_5lboolEED1Ev.exit29
  %122 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 1, i32 0
  %123 = load i8** %122, align 8, !tbaa !102
  %124 = icmp eq i8* %123, null
  br i1 %124, label %_ZN7Minisat3vecIcED1Ev.exit.i.i, label %.preheader.i.i.i2.i.i

.preheader.i.i.i2.i.i:                            ; preds = %_ZN7Minisat3vecINS_3LitEED1Ev.exit.i.i
  %125 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 1, i32 1
  store i32 0, i32* %125, align 4, !tbaa !103
  tail call void @free(i8* %123) #2
  store i8* null, i8** %122, align 8, !tbaa !102
  %126 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 1, i32 2
  store i32 0, i32* %126, align 4, !tbaa !104
  br label %_ZN7Minisat3vecIcED1Ev.exit.i.i

_ZN7Minisat3vecIcED1Ev.exit.i.i:                  ; preds = %.preheader.i.i.i2.i.i, %_ZN7Minisat3vecINS_3LitEED1Ev.exit.i.i
  %127 = getelementptr inbounds %"class.Minisat::OccLists"* %40, i64 0, i32 0, i32 0
  %128 = load %"class.Minisat::vec.4"** %127, align 8, !tbaa !107
  %129 = icmp eq %"class.Minisat::vec.4"* %128, null
  br i1 %129, label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEED1Ev.exit, label %.preheader.i.i.i3.i.i

.preheader.i.i.i3.i.i:                            ; preds = %_ZN7Minisat3vecIcED1Ev.exit.i.i
  %130 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 0, i32 1
  %131 = load i32* %130, align 4, !tbaa !108
  %132 = icmp sgt i32 %131, 0
  br i1 %132, label %.lr.ph.i.i.i.i.i, label %._crit_edge.i.i.i.i.i

.lr.ph.i.i.i.i.i:                                 ; preds = %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i, %.preheader.i.i.i3.i.i
  %133 = phi i32 [ %141, %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i ], [ %131, %.preheader.i.i.i3.i.i ]
  %134 = phi %"class.Minisat::vec.4"* [ %.pre.i.i.i.i.i, %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i ], [ %128, %.preheader.i.i.i3.i.i ]
  %indvars.iv.i.i.i.i.i = phi i64 [ %indvars.iv.next.i.i.i.i.i, %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i ], [ 0, %.preheader.i.i.i3.i.i ]
  %135 = getelementptr inbounds %"class.Minisat::vec.4"* %134, i64 %indvars.iv.i.i.i.i.i, i32 0
  %136 = load %"struct.Minisat::Solver::Watcher"** %135, align 8, !tbaa !109
  %137 = icmp eq %"struct.Minisat::Solver::Watcher"* %136, null
  br i1 %137, label %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i, label %.preheader.i.i.i.i.i.i.i.i

.preheader.i.i.i.i.i.i.i.i:                       ; preds = %.lr.ph.i.i.i.i.i
  %138 = getelementptr inbounds %"class.Minisat::vec.4"* %134, i64 %indvars.iv.i.i.i.i.i, i32 1
  store i32 0, i32* %138, align 4, !tbaa !111
  %139 = bitcast %"struct.Minisat::Solver::Watcher"* %136 to i8*
  tail call void @free(i8* %139) #2
  store %"struct.Minisat::Solver::Watcher"* null, %"struct.Minisat::Solver::Watcher"** %135, align 8, !tbaa !109
  %140 = getelementptr inbounds %"class.Minisat::vec.4"* %134, i64 %indvars.iv.i.i.i.i.i, i32 2
  store i32 0, i32* %140, align 4, !tbaa !112
  %.pre2.i.i.i.i.i = load i32* %130, align 4, !tbaa !108
  %.pre.i.i.pre.i.i.i = load %"class.Minisat::vec.4"** %127, align 8, !tbaa !107
  br label %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i

_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i: ; preds = %.preheader.i.i.i.i.i.i.i.i, %.lr.ph.i.i.i.i.i
  %.pre.i.i.i.i.i = phi %"class.Minisat::vec.4"* [ %134, %.lr.ph.i.i.i.i.i ], [ %.pre.i.i.pre.i.i.i, %.preheader.i.i.i.i.i.i.i.i ]
  %141 = phi i32 [ %133, %.lr.ph.i.i.i.i.i ], [ %.pre2.i.i.i.i.i, %.preheader.i.i.i.i.i.i.i.i ]
  %indvars.iv.next.i.i.i.i.i = add nuw nsw i64 %indvars.iv.i.i.i.i.i, 1
  %142 = trunc i64 %indvars.iv.next.i.i.i.i.i to i32
  %143 = icmp slt i32 %142, %141
  br i1 %143, label %.lr.ph.i.i.i.i.i, label %._crit_edge.i.i.i.i.i

._crit_edge.i.i.i.i.i:                            ; preds = %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i, %.preheader.i.i.i3.i.i
  %144 = phi %"class.Minisat::vec.4"* [ %128, %.preheader.i.i.i3.i.i ], [ %.pre.i.i.i.i.i, %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i ]
  store i32 0, i32* %130, align 4, !tbaa !108
  %145 = bitcast %"class.Minisat::vec.4"* %144 to i8*
  tail call void @free(i8* %145) #2
  store %"class.Minisat::vec.4"* null, %"class.Minisat::vec.4"** %127, align 8, !tbaa !107
  %146 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 0, i32 2
  store i32 0, i32* %146, align 4, !tbaa !113
  br label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEED1Ev.exit

_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEED1Ev.exit: ; preds = %._crit_edge.i.i.i.i.i, %_ZN7Minisat3vecIcED1Ev.exit.i.i
  %147 = getelementptr inbounds %"class.Minisat::vec.2"* %37, i64 0, i32 0
  %148 = load double** %147, align 8, !tbaa !114
  %149 = icmp eq double* %148, null
  br i1 %149, label %_ZN7Minisat3vecIdED1Ev.exit, label %.preheader.i.i.i27

.preheader.i.i.i27:                               ; preds = %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEED1Ev.exit
  %150 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 35, i32 1
  store i32 0, i32* %150, align 4, !tbaa !115
  %151 = bitcast double* %148 to i8*
  tail call void @free(i8* %151) #2
  store double* null, double** %147, align 8, !tbaa !114
  %152 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 35, i32 2
  store i32 0, i32* %152, align 4, !tbaa !116
  br label %_ZN7Minisat3vecIdED1Ev.exit

_ZN7Minisat3vecIdED1Ev.exit:                      ; preds = %.preheader.i.i.i27, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEED1Ev.exit
  %153 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33, i32 0
  %154 = load i32** %153, align 8, !tbaa !117
  %155 = icmp eq i32* %154, null
  br i1 %155, label %_ZN7Minisat3vecIjED1Ev.exit26, label %.preheader.i.i.i25

.preheader.i.i.i25:                               ; preds = %_ZN7Minisat3vecIdED1Ev.exit
  %156 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33, i32 1
  store i32 0, i32* %156, align 4, !tbaa !64
  %157 = bitcast i32* %154 to i8*
  tail call void @free(i8* %157) #2
  store i32* null, i32** %153, align 8, !tbaa !117
  %158 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33, i32 2
  store i32 0, i32* %158, align 4, !tbaa !118
  br label %_ZN7Minisat3vecIjED1Ev.exit26

_ZN7Minisat3vecIjED1Ev.exit26:                    ; preds = %.preheader.i.i.i25, %_ZN7Minisat3vecIdED1Ev.exit
  %159 = getelementptr inbounds %"class.Minisat::vec.1"* %34, i64 0, i32 0
  %160 = load i32** %159, align 8, !tbaa !117
  %161 = icmp eq i32* %160, null
  br i1 %161, label %_ZN7Minisat3vecIjED1Ev.exit, label %.preheader.i.i.i24

.preheader.i.i.i24:                               ; preds = %_ZN7Minisat3vecIjED1Ev.exit26
  %162 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32, i32 1
  store i32 0, i32* %162, align 4, !tbaa !64
  %163 = bitcast i32* %160 to i8*
  tail call void @free(i8* %163) #2
  store i32* null, i32** %159, align 8, !tbaa !117
  %164 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32, i32 2
  store i32 0, i32* %164, align 4, !tbaa !118
  br label %_ZN7Minisat3vecIjED1Ev.exit

_ZN7Minisat3vecIjED1Ev.exit:                      ; preds = %.preheader.i.i.i24, %_ZN7Minisat3vecIjED1Ev.exit26
  %165 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 2, i32 0
  %166 = load %"struct.Minisat::Lit"** %165, align 8, !tbaa !60
  %167 = icmp eq %"struct.Minisat::Lit"* %166, null
  br i1 %167, label %_ZN7Minisat3vecINS_3LitEED1Ev.exit, label %.preheader.i.i.i23

.preheader.i.i.i23:                               ; preds = %_ZN7Minisat3vecIjED1Ev.exit
  %168 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 2, i32 1
  store i32 0, i32* %168, align 4, !tbaa !61
  %169 = bitcast %"struct.Minisat::Lit"* %166 to i8*
  tail call void @free(i8* %169) #2
  store %"struct.Minisat::Lit"* null, %"struct.Minisat::Lit"** %165, align 8, !tbaa !60
  %170 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 2, i32 2
  store i32 0, i32* %170, align 4, !tbaa !62
  br label %_ZN7Minisat3vecINS_3LitEED1Ev.exit

_ZN7Minisat3vecINS_3LitEED1Ev.exit:               ; preds = %.preheader.i.i.i23, %_ZN7Minisat3vecIjED1Ev.exit
  %171 = getelementptr inbounds %"class.Minisat::vec"* %2, i64 0, i32 0
  %172 = load %"class.Minisat::lbool"** %171, align 8, !tbaa !65
  %173 = icmp eq %"class.Minisat::lbool"* %172, null
  br i1 %173, label %_ZN7Minisat3vecINS_5lboolEED1Ev.exit, label %.preheader.i.i.i

.preheader.i.i.i:                                 ; preds = %_ZN7Minisat3vecINS_3LitEED1Ev.exit
  %174 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 1, i32 1
  store i32 0, i32* %174, align 4, !tbaa !105
  %175 = getelementptr inbounds %"class.Minisat::lbool"* %172, i64 0, i32 0
  tail call void @free(i8* %175) #2
  store %"class.Minisat::lbool"* null, %"class.Minisat::lbool"** %171, align 8, !tbaa !65
  %176 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 1, i32 2
  store i32 0, i32* %176, align 4, !tbaa !106
  br label %_ZN7Minisat3vecINS_5lboolEED1Ev.exit

_ZN7Minisat3vecINS_5lboolEED1Ev.exit:             ; preds = %.preheader.i.i.i, %_ZN7Minisat3vecINS_3LitEED1Ev.exit
  resume { i8*, i32 } %63
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6SolverC1Ev(%"class.Minisat::Solver"* %this) #0 align 2 {
  tail call void @_ZN7Minisat6SolverC2Ev(%"class.Minisat::Solver"* %this)
  ret void
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6SolverD2Ev(%"class.Minisat::Solver"* %this) unnamed_addr #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([5 x i8*]* @_ZTVN7Minisat6SolverE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, align 8, !tbaa !37
  %2 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 56, i32 0
  %3 = load %"struct.Minisat::Lit"** %2, align 8, !tbaa !60
  %4 = icmp eq %"struct.Minisat::Lit"* %3, null
  br i1 %4, label %_ZN7Minisat3vecINS_3LitEED1Ev.exit, label %.preheader.i.i.i

.preheader.i.i.i:                                 ; preds = %0
  %5 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 56, i32 1
  store i32 0, i32* %5, align 4, !tbaa !61
  %6 = bitcast %"struct.Minisat::Lit"* %3 to i8*
  tail call void @free(i8* %6) #2
  store %"struct.Minisat::Lit"* null, %"struct.Minisat::Lit"** %2, align 8, !tbaa !60
  %7 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 56, i32 2
  store i32 0, i32* %7, align 4, !tbaa !62
  br label %_ZN7Minisat3vecINS_3LitEED1Ev.exit

_ZN7Minisat3vecINS_3LitEED1Ev.exit:               ; preds = %.preheader.i.i.i, %0
  %8 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 55, i32 0
  %9 = load %"struct.Minisat::Lit"** %8, align 8, !tbaa !60
  %10 = icmp eq %"struct.Minisat::Lit"* %9, null
  br i1 %10, label %_ZN7Minisat3vecINS_3LitEED1Ev.exit24, label %.preheader.i.i.i23

.preheader.i.i.i23:                               ; preds = %_ZN7Minisat3vecINS_3LitEED1Ev.exit
  %11 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 55, i32 1
  store i32 0, i32* %11, align 4, !tbaa !61
  %12 = bitcast %"struct.Minisat::Lit"* %9 to i8*
  tail call void @free(i8* %12) #2
  store %"struct.Minisat::Lit"* null, %"struct.Minisat::Lit"** %8, align 8, !tbaa !60
  %13 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 55, i32 2
  store i32 0, i32* %13, align 4, !tbaa !62
  br label %_ZN7Minisat3vecINS_3LitEED1Ev.exit24

_ZN7Minisat3vecINS_3LitEED1Ev.exit24:             ; preds = %.preheader.i.i.i23, %_ZN7Minisat3vecINS_3LitEED1Ev.exit
  %14 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 54, i32 0
  %15 = load %"struct.Minisat::Lit"** %14, align 8, !tbaa !60
  %16 = icmp eq %"struct.Minisat::Lit"* %15, null
  br i1 %16, label %_ZN7Minisat3vecINS_3LitEED1Ev.exit26, label %.preheader.i.i.i25

.preheader.i.i.i25:                               ; preds = %_ZN7Minisat3vecINS_3LitEED1Ev.exit24
  %17 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 54, i32 1
  store i32 0, i32* %17, align 4, !tbaa !61
  %18 = bitcast %"struct.Minisat::Lit"* %15 to i8*
  tail call void @free(i8* %18) #2
  store %"struct.Minisat::Lit"* null, %"struct.Minisat::Lit"** %14, align 8, !tbaa !60
  %19 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 54, i32 2
  store i32 0, i32* %19, align 4, !tbaa !62
  br label %_ZN7Minisat3vecINS_3LitEED1Ev.exit26

_ZN7Minisat3vecINS_3LitEED1Ev.exit26:             ; preds = %.preheader.i.i.i25, %_ZN7Minisat3vecINS_3LitEED1Ev.exit24
  %20 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 53, i32 0
  %21 = load i8** %20, align 8, !tbaa !102
  %22 = icmp eq i8* %21, null
  br i1 %22, label %_ZN7Minisat3vecIcED1Ev.exit, label %.preheader.i.i.i27

.preheader.i.i.i27:                               ; preds = %_ZN7Minisat3vecINS_3LitEED1Ev.exit26
  %23 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 53, i32 1
  store i32 0, i32* %23, align 4, !tbaa !103
  tail call void @free(i8* %21) #2
  store i8* null, i8** %20, align 8, !tbaa !102
  %24 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 53, i32 2
  store i32 0, i32* %24, align 4, !tbaa !104
  br label %_ZN7Minisat3vecIcED1Ev.exit

_ZN7Minisat3vecIcED1Ev.exit:                      ; preds = %.preheader.i.i.i27, %_ZN7Minisat3vecINS_3LitEED1Ev.exit26
  %25 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %26 = bitcast %"class.Minisat::ClauseAllocator"* %25 to i32**
  %27 = load i32** %26, align 8, !tbaa !119
  %28 = icmp eq i32* %27, null
  br i1 %28, label %_ZN7Minisat15ClauseAllocatorD1Ev.exit, label %29

; <label>:29                                      ; preds = %_ZN7Minisat3vecIcED1Ev.exit
  %30 = bitcast i32* %27 to i8*
  tail call void @free(i8* %30) #2
  br label %_ZN7Minisat15ClauseAllocatorD1Ev.exit

_ZN7Minisat15ClauseAllocatorD1Ev.exit:            ; preds = %29, %_ZN7Minisat3vecIcED1Ev.exit
  %31 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 2, i32 0
  %32 = load i32** %31, align 8, !tbaa !97
  %33 = icmp eq i32* %32, null
  br i1 %33, label %_ZN7Minisat3vecIiED1Ev.exit.i.i, label %.preheader.i.i.i.i.i

.preheader.i.i.i.i.i:                             ; preds = %_ZN7Minisat15ClauseAllocatorD1Ev.exit
  %34 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 2, i32 1
  store i32 0, i32* %34, align 4, !tbaa !98
  %35 = bitcast i32* %32 to i8*
  tail call void @free(i8* %35) #2
  store i32* null, i32** %31, align 8, !tbaa !97
  %36 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 2, i32 2
  store i32 0, i32* %36, align 4, !tbaa !99
  br label %_ZN7Minisat3vecIiED1Ev.exit.i.i

_ZN7Minisat3vecIiED1Ev.exit.i.i:                  ; preds = %.preheader.i.i.i.i.i, %_ZN7Minisat15ClauseAllocatorD1Ev.exit
  %37 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 1, i32 0
  %38 = load i32** %37, align 8, !tbaa !97
  %39 = icmp eq i32* %38, null
  br i1 %39, label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEED1Ev.exit, label %.preheader.i.i.i1.i.i

.preheader.i.i.i1.i.i:                            ; preds = %_ZN7Minisat3vecIiED1Ev.exit.i.i
  %40 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 1, i32 1
  store i32 0, i32* %40, align 4, !tbaa !98
  %41 = bitcast i32* %38 to i8*
  tail call void @free(i8* %41) #2
  store i32* null, i32** %37, align 8, !tbaa !97
  %42 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 1, i32 2
  store i32 0, i32* %42, align 4, !tbaa !99
  br label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEED1Ev.exit

_ZN7Minisat4HeapINS_6Solver10VarOrderLtEED1Ev.exit: ; preds = %.preheader.i.i.i1.i.i, %_ZN7Minisat3vecIiED1Ev.exit.i.i
  %43 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 47, i32 0
  %44 = load %"struct.Minisat::Lit"** %43, align 8, !tbaa !60
  %45 = icmp eq %"struct.Minisat::Lit"* %44, null
  br i1 %45, label %_ZN7Minisat3vecINS_3LitEED1Ev.exit29, label %.preheader.i.i.i28

.preheader.i.i.i28:                               ; preds = %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEED1Ev.exit
  %46 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 47, i32 1
  store i32 0, i32* %46, align 4, !tbaa !61
  %47 = bitcast %"struct.Minisat::Lit"* %44 to i8*
  tail call void @free(i8* %47) #2
  store %"struct.Minisat::Lit"* null, %"struct.Minisat::Lit"** %43, align 8, !tbaa !60
  %48 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 47, i32 2
  store i32 0, i32* %48, align 4, !tbaa !62
  br label %_ZN7Minisat3vecINS_3LitEED1Ev.exit29

_ZN7Minisat3vecINS_3LitEED1Ev.exit29:             ; preds = %.preheader.i.i.i28, %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEED1Ev.exit
  %49 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 0
  %50 = load %"struct.Minisat::Solver::VarData"** %49, align 8, !tbaa !100
  %51 = icmp eq %"struct.Minisat::Solver::VarData"* %50, null
  br i1 %51, label %_ZN7Minisat3vecINS_6Solver7VarDataEED1Ev.exit, label %.preheader.i.i.i30

.preheader.i.i.i30:                               ; preds = %_ZN7Minisat3vecINS_3LitEED1Ev.exit29
  %52 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 1
  store i32 0, i32* %52, align 4, !tbaa !63
  %53 = bitcast %"struct.Minisat::Solver::VarData"* %50 to i8*
  tail call void @free(i8* %53) #2
  store %"struct.Minisat::Solver::VarData"* null, %"struct.Minisat::Solver::VarData"** %49, align 8, !tbaa !100
  %54 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 2
  store i32 0, i32* %54, align 4, !tbaa !101
  br label %_ZN7Minisat3vecINS_6Solver7VarDataEED1Ev.exit

_ZN7Minisat3vecINS_6Solver7VarDataEED1Ev.exit:    ; preds = %.preheader.i.i.i30, %_ZN7Minisat3vecINS_3LitEED1Ev.exit29
  %55 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 0
  %56 = load i32** %55, align 8, !tbaa !97
  %57 = icmp eq i32* %56, null
  br i1 %57, label %_ZN7Minisat3vecIiED1Ev.exit, label %.preheader.i.i.i31

.preheader.i.i.i31:                               ; preds = %_ZN7Minisat3vecINS_6Solver7VarDataEED1Ev.exit
  %58 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 1
  store i32 0, i32* %58, align 4, !tbaa !98
  %59 = bitcast i32* %56 to i8*
  tail call void @free(i8* %59) #2
  store i32* null, i32** %55, align 8, !tbaa !97
  %60 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 2
  store i32 0, i32* %60, align 4, !tbaa !99
  br label %_ZN7Minisat3vecIiED1Ev.exit

_ZN7Minisat3vecIiED1Ev.exit:                      ; preds = %.preheader.i.i.i31, %_ZN7Minisat3vecINS_6Solver7VarDataEED1Ev.exit
  %61 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 0
  %62 = load %"struct.Minisat::Lit"** %61, align 8, !tbaa !60
  %63 = icmp eq %"struct.Minisat::Lit"* %62, null
  br i1 %63, label %_ZN7Minisat3vecINS_3LitEED1Ev.exit33, label %.preheader.i.i.i32

.preheader.i.i.i32:                               ; preds = %_ZN7Minisat3vecIiED1Ev.exit
  %64 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 1
  store i32 0, i32* %64, align 4, !tbaa !61
  %65 = bitcast %"struct.Minisat::Lit"* %62 to i8*
  tail call void @free(i8* %65) #2
  store %"struct.Minisat::Lit"* null, %"struct.Minisat::Lit"** %61, align 8, !tbaa !60
  %66 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 2
  store i32 0, i32* %66, align 4, !tbaa !62
  br label %_ZN7Minisat3vecINS_3LitEED1Ev.exit33

_ZN7Minisat3vecINS_3LitEED1Ev.exit33:             ; preds = %.preheader.i.i.i32, %_ZN7Minisat3vecIiED1Ev.exit
  %67 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 40, i32 0
  %68 = load i8** %67, align 8, !tbaa !102
  %69 = icmp eq i8* %68, null
  br i1 %69, label %_ZN7Minisat3vecIcED1Ev.exit35, label %.preheader.i.i.i34

.preheader.i.i.i34:                               ; preds = %_ZN7Minisat3vecINS_3LitEED1Ev.exit33
  %70 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 40, i32 1
  store i32 0, i32* %70, align 4, !tbaa !103
  tail call void @free(i8* %68) #2
  store i8* null, i8** %67, align 8, !tbaa !102
  %71 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 40, i32 2
  store i32 0, i32* %71, align 4, !tbaa !104
  br label %_ZN7Minisat3vecIcED1Ev.exit35

_ZN7Minisat3vecIcED1Ev.exit35:                    ; preds = %.preheader.i.i.i34, %_ZN7Minisat3vecINS_3LitEED1Ev.exit33
  %72 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 39, i32 0
  %73 = load i8** %72, align 8, !tbaa !102
  %74 = icmp eq i8* %73, null
  br i1 %74, label %_ZN7Minisat3vecIcED1Ev.exit37, label %.preheader.i.i.i36

.preheader.i.i.i36:                               ; preds = %_ZN7Minisat3vecIcED1Ev.exit35
  %75 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 39, i32 1
  store i32 0, i32* %75, align 4, !tbaa !103
  tail call void @free(i8* %73) #2
  store i8* null, i8** %72, align 8, !tbaa !102
  %76 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 39, i32 2
  store i32 0, i32* %76, align 4, !tbaa !104
  br label %_ZN7Minisat3vecIcED1Ev.exit37

_ZN7Minisat3vecIcED1Ev.exit37:                    ; preds = %.preheader.i.i.i36, %_ZN7Minisat3vecIcED1Ev.exit35
  %77 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %78 = load %"class.Minisat::lbool"** %77, align 8, !tbaa !65
  %79 = icmp eq %"class.Minisat::lbool"* %78, null
  br i1 %79, label %_ZN7Minisat3vecINS_5lboolEED1Ev.exit, label %.preheader.i.i.i38

.preheader.i.i.i38:                               ; preds = %_ZN7Minisat3vecIcED1Ev.exit37
  %80 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 1
  store i32 0, i32* %80, align 4, !tbaa !105
  %81 = getelementptr inbounds %"class.Minisat::lbool"* %78, i64 0, i32 0
  tail call void @free(i8* %81) #2
  store %"class.Minisat::lbool"* null, %"class.Minisat::lbool"** %77, align 8, !tbaa !65
  %82 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 2
  store i32 0, i32* %82, align 4, !tbaa !106
  br label %_ZN7Minisat3vecINS_5lboolEED1Ev.exit

_ZN7Minisat3vecINS_5lboolEED1Ev.exit:             ; preds = %.preheader.i.i.i38, %_ZN7Minisat3vecIcED1Ev.exit37
  %83 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2, i32 0
  %84 = load %"struct.Minisat::Lit"** %83, align 8, !tbaa !60
  %85 = icmp eq %"struct.Minisat::Lit"* %84, null
  br i1 %85, label %_ZN7Minisat3vecINS_3LitEED1Ev.exit.i.i, label %.preheader.i.i.i.i.i39

.preheader.i.i.i.i.i39:                           ; preds = %_ZN7Minisat3vecINS_5lboolEED1Ev.exit
  %86 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2, i32 1
  store i32 0, i32* %86, align 4, !tbaa !61
  %87 = bitcast %"struct.Minisat::Lit"* %84 to i8*
  tail call void @free(i8* %87) #2
  store %"struct.Minisat::Lit"* null, %"struct.Minisat::Lit"** %83, align 8, !tbaa !60
  %88 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2, i32 2
  store i32 0, i32* %88, align 4, !tbaa !62
  br label %_ZN7Minisat3vecINS_3LitEED1Ev.exit.i.i

_ZN7Minisat3vecINS_3LitEED1Ev.exit.i.i:           ; preds = %.preheader.i.i.i.i.i39, %_ZN7Minisat3vecINS_5lboolEED1Ev.exit
  %89 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 1, i32 0
  %90 = load i8** %89, align 8, !tbaa !102
  %91 = icmp eq i8* %90, null
  br i1 %91, label %_ZN7Minisat3vecIcED1Ev.exit.i.i, label %.preheader.i.i.i2.i.i

.preheader.i.i.i2.i.i:                            ; preds = %_ZN7Minisat3vecINS_3LitEED1Ev.exit.i.i
  %92 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 1, i32 1
  store i32 0, i32* %92, align 4, !tbaa !103
  tail call void @free(i8* %90) #2
  store i8* null, i8** %89, align 8, !tbaa !102
  %93 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 1, i32 2
  store i32 0, i32* %93, align 4, !tbaa !104
  br label %_ZN7Minisat3vecIcED1Ev.exit.i.i

_ZN7Minisat3vecIcED1Ev.exit.i.i:                  ; preds = %.preheader.i.i.i2.i.i, %_ZN7Minisat3vecINS_3LitEED1Ev.exit.i.i
  %94 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 0, i32 0
  %95 = load %"class.Minisat::vec.4"** %94, align 8, !tbaa !107
  %96 = icmp eq %"class.Minisat::vec.4"* %95, null
  br i1 %96, label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEED1Ev.exit, label %.preheader.i.i.i3.i.i

.preheader.i.i.i3.i.i:                            ; preds = %_ZN7Minisat3vecIcED1Ev.exit.i.i
  %97 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 0, i32 1
  %98 = load i32* %97, align 4, !tbaa !108
  %99 = icmp sgt i32 %98, 0
  br i1 %99, label %.lr.ph.i.i.i.i.i, label %._crit_edge.i.i.i.i.i

.lr.ph.i.i.i.i.i:                                 ; preds = %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i, %.preheader.i.i.i3.i.i
  %100 = phi i32 [ %108, %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i ], [ %98, %.preheader.i.i.i3.i.i ]
  %101 = phi %"class.Minisat::vec.4"* [ %.pre.i.i.i.i.i, %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i ], [ %95, %.preheader.i.i.i3.i.i ]
  %indvars.iv.i.i.i.i.i = phi i64 [ %indvars.iv.next.i.i.i.i.i, %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i ], [ 0, %.preheader.i.i.i3.i.i ]
  %102 = getelementptr inbounds %"class.Minisat::vec.4"* %101, i64 %indvars.iv.i.i.i.i.i, i32 0
  %103 = load %"struct.Minisat::Solver::Watcher"** %102, align 8, !tbaa !109
  %104 = icmp eq %"struct.Minisat::Solver::Watcher"* %103, null
  br i1 %104, label %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i, label %.preheader.i.i.i.i.i.i.i.i

.preheader.i.i.i.i.i.i.i.i:                       ; preds = %.lr.ph.i.i.i.i.i
  %105 = getelementptr inbounds %"class.Minisat::vec.4"* %101, i64 %indvars.iv.i.i.i.i.i, i32 1
  store i32 0, i32* %105, align 4, !tbaa !111
  %106 = bitcast %"struct.Minisat::Solver::Watcher"* %103 to i8*
  tail call void @free(i8* %106) #2
  store %"struct.Minisat::Solver::Watcher"* null, %"struct.Minisat::Solver::Watcher"** %102, align 8, !tbaa !109
  %107 = getelementptr inbounds %"class.Minisat::vec.4"* %101, i64 %indvars.iv.i.i.i.i.i, i32 2
  store i32 0, i32* %107, align 4, !tbaa !112
  %.pre2.i.i.i.i.i = load i32* %97, align 4, !tbaa !108
  %.pre.i.i.pre.i.i.i = load %"class.Minisat::vec.4"** %94, align 8, !tbaa !107
  br label %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i

_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i: ; preds = %.preheader.i.i.i.i.i.i.i.i, %.lr.ph.i.i.i.i.i
  %.pre.i.i.i.i.i = phi %"class.Minisat::vec.4"* [ %101, %.lr.ph.i.i.i.i.i ], [ %.pre.i.i.pre.i.i.i, %.preheader.i.i.i.i.i.i.i.i ]
  %108 = phi i32 [ %100, %.lr.ph.i.i.i.i.i ], [ %.pre2.i.i.i.i.i, %.preheader.i.i.i.i.i.i.i.i ]
  %indvars.iv.next.i.i.i.i.i = add nuw nsw i64 %indvars.iv.i.i.i.i.i, 1
  %109 = trunc i64 %indvars.iv.next.i.i.i.i.i to i32
  %110 = icmp slt i32 %109, %108
  br i1 %110, label %.lr.ph.i.i.i.i.i, label %._crit_edge.i.i.i.i.i

._crit_edge.i.i.i.i.i:                            ; preds = %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i, %.preheader.i.i.i3.i.i
  %111 = phi %"class.Minisat::vec.4"* [ %95, %.preheader.i.i.i3.i.i ], [ %.pre.i.i.i.i.i, %_ZN7Minisat3vecINS_6Solver7WatcherEED1Ev.exit.i.i.i.i.i ]
  store i32 0, i32* %97, align 4, !tbaa !108
  %112 = bitcast %"class.Minisat::vec.4"* %111 to i8*
  tail call void @free(i8* %112) #2
  store %"class.Minisat::vec.4"* null, %"class.Minisat::vec.4"** %94, align 8, !tbaa !107
  %113 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 0, i32 2
  store i32 0, i32* %113, align 4, !tbaa !113
  br label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEED1Ev.exit

_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEED1Ev.exit: ; preds = %._crit_edge.i.i.i.i.i, %_ZN7Minisat3vecIcED1Ev.exit.i.i
  %114 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 35, i32 0
  %115 = load double** %114, align 8, !tbaa !114
  %116 = icmp eq double* %115, null
  br i1 %116, label %_ZN7Minisat3vecIdED1Ev.exit, label %.preheader.i.i.i40

.preheader.i.i.i40:                               ; preds = %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEED1Ev.exit
  %117 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 35, i32 1
  store i32 0, i32* %117, align 4, !tbaa !115
  %118 = bitcast double* %115 to i8*
  tail call void @free(i8* %118) #2
  store double* null, double** %114, align 8, !tbaa !114
  %119 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 35, i32 2
  store i32 0, i32* %119, align 4, !tbaa !116
  br label %_ZN7Minisat3vecIdED1Ev.exit

_ZN7Minisat3vecIdED1Ev.exit:                      ; preds = %.preheader.i.i.i40, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEED1Ev.exit
  %120 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33, i32 0
  %121 = load i32** %120, align 8, !tbaa !117
  %122 = icmp eq i32* %121, null
  br i1 %122, label %_ZN7Minisat3vecIjED1Ev.exit, label %.preheader.i.i.i41

.preheader.i.i.i41:                               ; preds = %_ZN7Minisat3vecIdED1Ev.exit
  %123 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33, i32 1
  store i32 0, i32* %123, align 4, !tbaa !64
  %124 = bitcast i32* %121 to i8*
  tail call void @free(i8* %124) #2
  store i32* null, i32** %120, align 8, !tbaa !117
  %125 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33, i32 2
  store i32 0, i32* %125, align 4, !tbaa !118
  br label %_ZN7Minisat3vecIjED1Ev.exit

_ZN7Minisat3vecIjED1Ev.exit:                      ; preds = %.preheader.i.i.i41, %_ZN7Minisat3vecIdED1Ev.exit
  %126 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32, i32 0
  %127 = load i32** %126, align 8, !tbaa !117
  %128 = icmp eq i32* %127, null
  br i1 %128, label %_ZN7Minisat3vecIjED1Ev.exit43, label %.preheader.i.i.i42

.preheader.i.i.i42:                               ; preds = %_ZN7Minisat3vecIjED1Ev.exit
  %129 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32, i32 1
  store i32 0, i32* %129, align 4, !tbaa !64
  %130 = bitcast i32* %127 to i8*
  tail call void @free(i8* %130) #2
  store i32* null, i32** %126, align 8, !tbaa !117
  %131 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32, i32 2
  store i32 0, i32* %131, align 4, !tbaa !118
  br label %_ZN7Minisat3vecIjED1Ev.exit43

_ZN7Minisat3vecIjED1Ev.exit43:                    ; preds = %.preheader.i.i.i42, %_ZN7Minisat3vecIjED1Ev.exit
  %132 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 2, i32 0
  %133 = load %"struct.Minisat::Lit"** %132, align 8, !tbaa !60
  %134 = icmp eq %"struct.Minisat::Lit"* %133, null
  br i1 %134, label %_ZN7Minisat3vecINS_3LitEED1Ev.exit45, label %.preheader.i.i.i44

.preheader.i.i.i44:                               ; preds = %_ZN7Minisat3vecIjED1Ev.exit43
  %135 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 2, i32 1
  store i32 0, i32* %135, align 4, !tbaa !61
  %136 = bitcast %"struct.Minisat::Lit"* %133 to i8*
  tail call void @free(i8* %136) #2
  store %"struct.Minisat::Lit"* null, %"struct.Minisat::Lit"** %132, align 8, !tbaa !60
  %137 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 2, i32 2
  store i32 0, i32* %137, align 4, !tbaa !62
  br label %_ZN7Minisat3vecINS_3LitEED1Ev.exit45

_ZN7Minisat3vecINS_3LitEED1Ev.exit45:             ; preds = %.preheader.i.i.i44, %_ZN7Minisat3vecIjED1Ev.exit43
  %138 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 1, i32 0
  %139 = load %"class.Minisat::lbool"** %138, align 8, !tbaa !65
  %140 = icmp eq %"class.Minisat::lbool"* %139, null
  br i1 %140, label %_ZN7Minisat3vecINS_5lboolEED1Ev.exit47, label %.preheader.i.i.i46

.preheader.i.i.i46:                               ; preds = %_ZN7Minisat3vecINS_3LitEED1Ev.exit45
  %141 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 1, i32 1
  store i32 0, i32* %141, align 4, !tbaa !105
  %142 = getelementptr inbounds %"class.Minisat::lbool"* %139, i64 0, i32 0
  tail call void @free(i8* %142) #2
  store %"class.Minisat::lbool"* null, %"class.Minisat::lbool"** %138, align 8, !tbaa !65
  %143 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 1, i32 2
  store i32 0, i32* %143, align 4, !tbaa !106
  br label %_ZN7Minisat3vecINS_5lboolEED1Ev.exit47

_ZN7Minisat3vecINS_5lboolEED1Ev.exit47:           ; preds = %.preheader.i.i.i46, %_ZN7Minisat3vecINS_3LitEED1Ev.exit45
  ret void
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6SolverD1Ev(%"class.Minisat::Solver"* %this) #0 align 2 {
  tail call void @_ZN7Minisat6SolverD2Ev(%"class.Minisat::Solver"* %this)
  ret void
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6SolverD0Ev(%"class.Minisat::Solver"* %this) unnamed_addr #0 align 2 {
  invoke void @_ZN7Minisat6SolverD2Ev(%"class.Minisat::Solver"* %this)
          to label %_ZN7Minisat6SolverD1Ev.exit unwind label %2

_ZN7Minisat6SolverD1Ev.exit:                      ; preds = %0
  %1 = bitcast %"class.Minisat::Solver"* %this to i8*
  tail call void @_ZdlPv(i8* %1) #18
  ret void

; <label>:2                                       ; preds = %0
  %3 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %4 = bitcast %"class.Minisat::Solver"* %this to i8*
  tail call void @_ZdlPv(i8* %4) #18
  resume { i8*, i32 } %3
}

; Function Attrs: ssp uwtable
define i32 @_ZN7Minisat6Solver6newVarEbb(%"class.Minisat::Solver"* nocapture %this, i1 zeroext %sign, i1 zeroext %dvar) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 1
  %2 = load i32* %1, align 4, !tbaa !63
  %3 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37
  %4 = shl nsw i32 %2, 1
  %5 = or i32 %4, 1
  %6 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 0, i32 1
  %7 = load i32* %6, align 4, !tbaa !108
  %8 = icmp slt i32 %7, %5
  br i1 %8, label %9, label %_ZN7Minisat3vecINS0_INS_6Solver7WatcherEEEE6growToEi.exit.i

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds %"class.Minisat::OccLists"* %3, i64 0, i32 0
  tail call void @_ZN7Minisat3vecINS0_INS_6Solver7WatcherEEEE8capacityEi(%"class.Minisat::vec.3"* %10, i32 %5)
  %11 = load i32* %6, align 4, !tbaa !108
  %12 = icmp slt i32 %11, %5
  br i1 %12, label %.lr.ph.i2.i, label %._crit_edge.i5.i

.lr.ph.i2.i:                                      ; preds = %9
  %13 = getelementptr inbounds %"class.Minisat::OccLists"* %3, i64 0, i32 0, i32 0
  %14 = sext i32 %11 to i64
  br label %15

; <label>:15                                      ; preds = %21, %.lr.ph.i2.i
  %indvars.iv.i3.i = phi i64 [ %14, %.lr.ph.i2.i ], [ %indvars.iv.next.i4.i, %21 ]
  %16 = load %"class.Minisat::vec.4"** %13, align 8, !tbaa !107
  %17 = getelementptr inbounds %"class.Minisat::vec.4"* %16, i64 %indvars.iv.i3.i
  %18 = icmp eq %"class.Minisat::vec.4"* %17, null
  br i1 %18, label %21, label %19

; <label>:19                                      ; preds = %15
  %20 = bitcast %"class.Minisat::vec.4"* %17 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %20, i8 0, i64 16, i32 8, i1 false) #2
  br label %21

; <label>:21                                      ; preds = %19, %15
  %indvars.iv.next.i4.i = add nsw i64 %indvars.iv.i3.i, 1
  %22 = trunc i64 %indvars.iv.next.i4.i to i32
  %23 = icmp slt i32 %22, %5
  br i1 %23, label %15, label %._crit_edge.i5.i

._crit_edge.i5.i:                                 ; preds = %21, %9
  store i32 %5, i32* %6, align 4, !tbaa !108
  br label %_ZN7Minisat3vecINS0_INS_6Solver7WatcherEEEE6growToEi.exit.i

_ZN7Minisat3vecINS0_INS_6Solver7WatcherEEEE6growToEi.exit.i: ; preds = %._crit_edge.i5.i, %0
  %24 = phi i32 [ %5, %._crit_edge.i5.i ], [ %7, %0 ]
  %25 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 1
  %26 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 1, i32 1
  %27 = load i32* %26, align 4, !tbaa !103
  %28 = icmp slt i32 %27, %5
  br i1 %28, label %29, label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE4initERKS1_.exit

; <label>:29                                      ; preds = %_ZN7Minisat3vecINS0_INS_6Solver7WatcherEEEE6growToEi.exit.i
  tail call void @_ZN7Minisat3vecIcE8capacityEi(%"class.Minisat::vec.5"* %25, i32 %5)
  %30 = load i32* %26, align 4, !tbaa !103
  %31 = icmp slt i32 %30, %5
  br i1 %31, label %.lr.ph.i.i, label %._crit_edge.i.i

.lr.ph.i.i:                                       ; preds = %29
  %32 = getelementptr inbounds %"class.Minisat::vec.5"* %25, i64 0, i32 0
  %33 = sext i32 %30 to i64
  br label %34

; <label>:34                                      ; preds = %34, %.lr.ph.i.i
  %indvars.iv.i.i = phi i64 [ %33, %.lr.ph.i.i ], [ %indvars.iv.next.i.i, %34 ]
  %35 = load i8** %32, align 8, !tbaa !102
  %36 = getelementptr inbounds i8* %35, i64 %indvars.iv.i.i
  store i8 0, i8* %36, align 1, !tbaa !59
  %indvars.iv.next.i.i = add nsw i64 %indvars.iv.i.i, 1
  %37 = trunc i64 %indvars.iv.next.i.i to i32
  %38 = icmp slt i32 %37, %5
  br i1 %38, label %34, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %34, %29
  store i32 %5, i32* %26, align 4, !tbaa !103
  %.pre = load i32* %6, align 4, !tbaa !108
  br label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE4initERKS1_.exit

_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE4initERKS1_.exit: ; preds = %._crit_edge.i.i, %_ZN7Minisat3vecINS0_INS_6Solver7WatcherEEEE6growToEi.exit.i
  %39 = phi i32 [ %27, %_ZN7Minisat3vecINS0_INS_6Solver7WatcherEEEE6growToEi.exit.i ], [ %5, %._crit_edge.i.i ]
  %40 = phi i32 [ %24, %_ZN7Minisat3vecINS0_INS_6Solver7WatcherEEEE6growToEi.exit.i ], [ %.pre, %._crit_edge.i.i ]
  %41 = add nsw i32 %5, 1
  %42 = icmp slt i32 %40, %41
  br i1 %42, label %43, label %_ZN7Minisat3vecINS0_INS_6Solver7WatcherEEEE6growToEi.exit.i6

; <label>:43                                      ; preds = %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE4initERKS1_.exit
  %44 = getelementptr inbounds %"class.Minisat::OccLists"* %3, i64 0, i32 0
  tail call void @_ZN7Minisat3vecINS0_INS_6Solver7WatcherEEEE8capacityEi(%"class.Minisat::vec.3"* %44, i32 %41)
  %45 = load i32* %6, align 4, !tbaa !108
  %46 = icmp slt i32 %45, %41
  br i1 %46, label %.lr.ph.i2.i1, label %._crit_edge.i5.i5

.lr.ph.i2.i1:                                     ; preds = %43
  %47 = getelementptr inbounds %"class.Minisat::OccLists"* %3, i64 0, i32 0, i32 0
  %48 = sext i32 %45 to i64
  br label %49

; <label>:49                                      ; preds = %55, %.lr.ph.i2.i1
  %indvars.iv.i3.i2 = phi i64 [ %48, %.lr.ph.i2.i1 ], [ %indvars.iv.next.i4.i3, %55 ]
  %50 = load %"class.Minisat::vec.4"** %47, align 8, !tbaa !107
  %51 = getelementptr inbounds %"class.Minisat::vec.4"* %50, i64 %indvars.iv.i3.i2
  %52 = icmp eq %"class.Minisat::vec.4"* %51, null
  br i1 %52, label %55, label %53

; <label>:53                                      ; preds = %49
  %54 = bitcast %"class.Minisat::vec.4"* %51 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %54, i8 0, i64 16, i32 8, i1 false) #2
  br label %55

; <label>:55                                      ; preds = %53, %49
  %indvars.iv.next.i4.i3 = add nsw i64 %indvars.iv.i3.i2, 1
  %56 = trunc i64 %indvars.iv.next.i4.i3 to i32
  %57 = icmp slt i32 %56, %41
  br i1 %57, label %49, label %._crit_edge.i5.i5

._crit_edge.i5.i5:                                ; preds = %55, %43
  store i32 %41, i32* %6, align 4, !tbaa !108
  %.pre21 = load i32* %26, align 4, !tbaa !103
  br label %_ZN7Minisat3vecINS0_INS_6Solver7WatcherEEEE6growToEi.exit.i6

_ZN7Minisat3vecINS0_INS_6Solver7WatcherEEEE6growToEi.exit.i6: ; preds = %._crit_edge.i5.i5, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE4initERKS1_.exit
  %58 = phi i32 [ %.pre21, %._crit_edge.i5.i5 ], [ %39, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE4initERKS1_.exit ]
  %59 = icmp slt i32 %58, %41
  br i1 %59, label %60, label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE4initERKS1_.exit11

; <label>:60                                      ; preds = %_ZN7Minisat3vecINS0_INS_6Solver7WatcherEEEE6growToEi.exit.i6
  tail call void @_ZN7Minisat3vecIcE8capacityEi(%"class.Minisat::vec.5"* %25, i32 %41)
  %61 = load i32* %26, align 4, !tbaa !103
  %62 = icmp slt i32 %61, %41
  br i1 %62, label %.lr.ph.i.i7, label %._crit_edge.i.i10

.lr.ph.i.i7:                                      ; preds = %60
  %63 = getelementptr inbounds %"class.Minisat::vec.5"* %25, i64 0, i32 0
  %64 = sext i32 %61 to i64
  br label %65

; <label>:65                                      ; preds = %65, %.lr.ph.i.i7
  %indvars.iv.i.i8 = phi i64 [ %64, %.lr.ph.i.i7 ], [ %indvars.iv.next.i.i9, %65 ]
  %66 = load i8** %63, align 8, !tbaa !102
  %67 = getelementptr inbounds i8* %66, i64 %indvars.iv.i.i8
  store i8 0, i8* %67, align 1, !tbaa !59
  %indvars.iv.next.i.i9 = add nsw i64 %indvars.iv.i.i8, 1
  %68 = trunc i64 %indvars.iv.next.i.i9 to i32
  %69 = icmp slt i32 %68, %41
  br i1 %69, label %65, label %._crit_edge.i.i10

._crit_edge.i.i10:                                ; preds = %65, %60
  store i32 %41, i32* %26, align 4, !tbaa !103
  br label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE4initERKS1_.exit11

_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE4initERKS1_.exit11: ; preds = %._crit_edge.i.i10, %_ZN7Minisat3vecINS0_INS_6Solver7WatcherEEEE6growToEi.exit.i6
  %70 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38
  %71 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 1
  %72 = load i32* %71, align 4, !tbaa !105
  %73 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 2
  %74 = load i32* %73, align 4, !tbaa !106
  %75 = icmp eq i32 %72, %74
  br i1 %75, label %76, label %_ZN7Minisat3vecINS_5lboolEE4pushERKS1_.exit

; <label>:76                                      ; preds = %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE4initERKS1_.exit11
  %77 = add nsw i32 %72, 1
  tail call void @_ZN7Minisat3vecINS_5lboolEE8capacityEi(%"class.Minisat::vec"* %70, i32 %77)
  %.pre.i12 = load i32* %71, align 4, !tbaa !105
  br label %_ZN7Minisat3vecINS_5lboolEE4pushERKS1_.exit

_ZN7Minisat3vecINS_5lboolEE4pushERKS1_.exit:      ; preds = %76, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE4initERKS1_.exit11
  %78 = phi i32 [ %.pre.i12, %76 ], [ %72, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE4initERKS1_.exit11 ]
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %71, align 4, !tbaa !105
  %80 = sext i32 %78 to i64
  %81 = getelementptr inbounds %"class.Minisat::vec"* %70, i64 0, i32 0
  %82 = load %"class.Minisat::lbool"** %81, align 8, !tbaa !65
  %83 = getelementptr inbounds %"class.Minisat::lbool"* %82, i64 %80, i32 0
  store i8 2, i8* %83, align 1
  %84 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43
  %85 = load i32* %1, align 4, !tbaa !63
  %86 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 2
  %87 = load i32* %86, align 4, !tbaa !101
  %88 = icmp eq i32 %85, %87
  br i1 %88, label %89, label %_ZN7Minisat3vecINS_6Solver7VarDataEE4pushERKS2_.exit

; <label>:89                                      ; preds = %_ZN7Minisat3vecINS_5lboolEE4pushERKS1_.exit
  %90 = add nsw i32 %85, 1
  tail call void @_ZN7Minisat3vecINS_6Solver7VarDataEE8capacityEi(%"class.Minisat::vec.7"* %84, i32 %90)
  %.pre.i14 = load i32* %1, align 4, !tbaa !63
  br label %_ZN7Minisat3vecINS_6Solver7VarDataEE4pushERKS2_.exit

_ZN7Minisat3vecINS_6Solver7VarDataEE4pushERKS2_.exit: ; preds = %89, %_ZN7Minisat3vecINS_5lboolEE4pushERKS1_.exit
  %91 = phi i32 [ %.pre.i14, %89 ], [ %85, %_ZN7Minisat3vecINS_5lboolEE4pushERKS1_.exit ]
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %1, align 4, !tbaa !63
  %93 = sext i32 %91 to i64
  %94 = getelementptr inbounds %"class.Minisat::vec.7"* %84, i64 0, i32 0
  %95 = load %"struct.Minisat::Solver::VarData"** %94, align 8, !tbaa !100
  %96 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %95, i64 %93
  %97 = bitcast %"struct.Minisat::Solver::VarData"* %96 to i64*
  store i64 4294967295, i64* %97, align 4
  %98 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 35
  %99 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 12
  %100 = load i8* %99, align 1, !tbaa !83, !range !78
  %101 = icmp eq i8 %100, 0
  br i1 %101, label %113, label %102

; <label>:102                                     ; preds = %_ZN7Minisat3vecINS_6Solver7VarDataEE4pushERKS2_.exit
  %103 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 7
  %104 = load double* %103, align 8, !tbaa !72
  %105 = fmul double %104, 1.389796e+06
  %106 = fdiv double %105, 0x41DFFFFFFFC00000
  %107 = fptosi double %106 to i32
  %108 = sitofp i32 %107 to double
  %109 = fmul double %108, 0x41DFFFFFFFC00000
  %110 = fsub double %105, %109
  store double %110, double* %103, align 8, !tbaa !72
  %111 = fdiv double %110, 0x41DFFFFFFFC00000
  %112 = fmul double %111, 1.000000e-05
  br label %113

; <label>:113                                     ; preds = %102, %_ZN7Minisat3vecINS_6Solver7VarDataEE4pushERKS2_.exit
  %114 = phi double [ %112, %102 ], [ 0.000000e+00, %_ZN7Minisat3vecINS_6Solver7VarDataEE4pushERKS2_.exit ]
  %115 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 35, i32 1
  %116 = load i32* %115, align 4, !tbaa !115
  %117 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 35, i32 2
  %118 = load i32* %117, align 4, !tbaa !116
  %119 = icmp eq i32 %116, %118
  br i1 %119, label %120, label %_ZN7Minisat3vecIdE4pushERKd.exit

; <label>:120                                     ; preds = %113
  %121 = add nsw i32 %116, 1
  tail call void @_ZN7Minisat3vecIdE8capacityEi(%"class.Minisat::vec.2"* %98, i32 %121)
  %.pre.i16 = load i32* %115, align 4, !tbaa !115
  br label %_ZN7Minisat3vecIdE4pushERKd.exit

_ZN7Minisat3vecIdE4pushERKd.exit:                 ; preds = %120, %113
  %122 = phi i32 [ %.pre.i16, %120 ], [ %116, %113 ]
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %115, align 4, !tbaa !115
  %124 = sext i32 %122 to i64
  %125 = getelementptr inbounds %"class.Minisat::vec.2"* %98, i64 0, i32 0
  %126 = load double** %125, align 8, !tbaa !114
  %127 = getelementptr inbounds double* %126, i64 %124
  store double %114, double* %127, align 8, !tbaa !72
  %128 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 53
  %129 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 53, i32 1
  %130 = load i32* %129, align 4, !tbaa !103
  %131 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 53, i32 2
  %132 = load i32* %131, align 4, !tbaa !104
  %133 = icmp eq i32 %130, %132
  br i1 %133, label %134, label %_ZN7Minisat3vecIcE4pushERKc.exit18

; <label>:134                                     ; preds = %_ZN7Minisat3vecIdE4pushERKd.exit
  %135 = add nsw i32 %130, 1
  tail call void @_ZN7Minisat3vecIcE8capacityEi(%"class.Minisat::vec.5"* %128, i32 %135)
  %.pre.i17 = load i32* %129, align 4, !tbaa !103
  br label %_ZN7Minisat3vecIcE4pushERKc.exit18

_ZN7Minisat3vecIcE4pushERKc.exit18:               ; preds = %134, %_ZN7Minisat3vecIdE4pushERKd.exit
  %136 = phi i32 [ %.pre.i17, %134 ], [ %130, %_ZN7Minisat3vecIdE4pushERKd.exit ]
  %137 = add nsw i32 %136, 1
  store i32 %137, i32* %129, align 4, !tbaa !103
  %138 = sext i32 %136 to i64
  %139 = getelementptr inbounds %"class.Minisat::vec.5"* %128, i64 0, i32 0
  %140 = load i8** %139, align 8, !tbaa !102
  %141 = getelementptr inbounds i8* %140, i64 %138
  store i8 0, i8* %141, align 1, !tbaa !59
  %142 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 39
  %143 = zext i1 %sign to i8
  %144 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 39, i32 1
  %145 = load i32* %144, align 4, !tbaa !103
  %146 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 39, i32 2
  %147 = load i32* %146, align 4, !tbaa !104
  %148 = icmp eq i32 %145, %147
  br i1 %148, label %149, label %_ZN7Minisat3vecIcE4pushERKc.exit

; <label>:149                                     ; preds = %_ZN7Minisat3vecIcE4pushERKc.exit18
  %150 = add nsw i32 %145, 1
  tail call void @_ZN7Minisat3vecIcE8capacityEi(%"class.Minisat::vec.5"* %142, i32 %150)
  %.pre.i15 = load i32* %144, align 4, !tbaa !103
  br label %_ZN7Minisat3vecIcE4pushERKc.exit

_ZN7Minisat3vecIcE4pushERKc.exit:                 ; preds = %149, %_ZN7Minisat3vecIcE4pushERKc.exit18
  %151 = phi i32 [ %.pre.i15, %149 ], [ %145, %_ZN7Minisat3vecIcE4pushERKc.exit18 ]
  %152 = add nsw i32 %151, 1
  store i32 %152, i32* %144, align 4, !tbaa !103
  %153 = sext i32 %151 to i64
  %154 = getelementptr inbounds %"class.Minisat::vec.5"* %142, i64 0, i32 0
  %155 = load i8** %154, align 8, !tbaa !102
  %156 = getelementptr inbounds i8* %155, i64 %153
  store i8 %143, i8* %156, align 1, !tbaa !59
  %157 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 40
  %158 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 40, i32 1
  %159 = load i32* %158, align 4, !tbaa !103
  %160 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 40, i32 2
  %161 = load i32* %160, align 4, !tbaa !104
  %162 = icmp eq i32 %159, %161
  br i1 %162, label %163, label %165

; <label>:163                                     ; preds = %_ZN7Minisat3vecIcE4pushERKc.exit
  %164 = add nsw i32 %159, 1
  tail call void @_ZN7Minisat3vecIcE8capacityEi(%"class.Minisat::vec.5"* %157, i32 %164)
  %.pre.i13 = load i32* %158, align 4, !tbaa !103
  br label %165

; <label>:165                                     ; preds = %163, %_ZN7Minisat3vecIcE4pushERKc.exit
  %166 = phi i32 [ %.pre.i13, %163 ], [ %159, %_ZN7Minisat3vecIcE4pushERKc.exit ]
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds %"class.Minisat::vec.5"* %157, i64 0, i32 0
  %169 = load i8** %168, align 8, !tbaa !102
  %170 = getelementptr inbounds i8* %169, i64 %167
  %171 = icmp eq i8* %170, null
  br i1 %171, label %_ZN7Minisat3vecIcE4pushEv.exit, label %172

; <label>:172                                     ; preds = %165
  store i8 0, i8* %170, align 1, !tbaa !59
  %.pre1.i = load i32* %158, align 4, !tbaa !103
  br label %_ZN7Minisat3vecIcE4pushEv.exit

_ZN7Minisat3vecIcE4pushEv.exit:                   ; preds = %172, %165
  %173 = phi i32 [ %.pre1.i, %172 ], [ %166, %165 ]
  %174 = add nsw i32 %173, 1
  store i32 %174, i32* %158, align 4, !tbaa !103
  %175 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41
  %176 = add nsw i32 %2, 1
  tail call void @_ZN7Minisat3vecINS_3LitEE8capacityEi(%"class.Minisat::vec.0"* %175, i32 %176)
  %177 = sext i32 %2 to i64
  %178 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 40, i32 0
  %179 = load i8** %178, align 8, !tbaa !102
  %180 = getelementptr inbounds i8* %179, i64 %177
  %181 = load i8* %180, align 1, !tbaa !59
  %182 = icmp eq i8 %181, 0
  br i1 %dvar, label %183, label %.critedge.i

; <label>:183                                     ; preds = %_ZN7Minisat3vecIcE4pushEv.exit
  br i1 %182, label %184, label %.thread.i

; <label>:184                                     ; preds = %183
  %185 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 26
  %186 = load i64* %185, align 8, !tbaa !121
  %187 = add i64 %186, 1
  store i64 %187, i64* %185, align 8, !tbaa !121
  br label %.thread.i

.critedge.i:                                      ; preds = %_ZN7Minisat3vecIcE4pushEv.exit
  br i1 %182, label %.thread.i, label %188

; <label>:188                                     ; preds = %.critedge.i
  %189 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 26
  %190 = load i64* %189, align 8, !tbaa !121
  %191 = add i64 %190, -1
  store i64 %191, i64* %189, align 8, !tbaa !121
  br label %.thread.i

.thread.i:                                        ; preds = %188, %.critedge.i, %184, %183
  %192 = zext i1 %dvar to i8
  store i8 %192, i8* %180, align 1, !tbaa !59
  %193 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48
  %194 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 2, i32 1
  %195 = load i32* %194, align 4, !tbaa !98
  %196 = icmp sgt i32 %195, %2
  br i1 %196, label %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.i.i, label %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread.i.i

_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.i.i: ; preds = %.thread.i
  %197 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 2, i32 0
  %198 = load i32** %197, align 8, !tbaa !97
  %199 = getelementptr inbounds i32* %198, i64 %177
  %200 = load i32* %199, align 4, !tbaa !36
  %201 = icmp sgt i32 %200, -1
  br i1 %201, label %_ZN7Minisat6Solver14setDecisionVarEib.exit, label %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread.i.i

_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread.i.i: ; preds = %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.i.i, %.thread.i
  %202 = load i8** %178, align 8, !tbaa !102
  %203 = getelementptr inbounds i8* %202, i64 %177
  %204 = load i8* %203, align 1, !tbaa !59
  %205 = icmp eq i8 %204, 0
  br i1 %205, label %_ZN7Minisat6Solver14setDecisionVarEib.exit, label %206

; <label>:206                                     ; preds = %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread.i.i
  tail call void @_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE6insertEi(%"class.Minisat::Heap"* %193, i32 %2)
  br label %_ZN7Minisat6Solver14setDecisionVarEib.exit

_ZN7Minisat6Solver14setDecisionVarEib.exit:       ; preds = %206, %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread.i.i, %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.i.i
  ret i32 %2
}

; Function Attrs: ssp uwtable
define zeroext i1 @_ZN7Minisat6Solver10addClause_ERNS_3vecINS_3LitEEE(%"class.Minisat::Solver"* nocapture %this, %"class.Minisat::vec.0"* nocapture %ps) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 1
  %2 = load i32* %1, align 4, !tbaa !98
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %5, label %4, !prof !122

; <label>:4                                       ; preds = %0
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZN7Minisat6Solver10addClause_ERNS_3vecINS_3LitEEE, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 134, i8* getelementptr inbounds ([21 x i8]* @.str3333, i64 0, i64 0)) #16
  unreachable

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 31
  %7 = load i8* %6, align 1, !tbaa !91, !range !78
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %.loopexit, label %9

; <label>:9                                       ; preds = %5
  %10 = getelementptr inbounds %"class.Minisat::vec.0"* %ps, i64 0, i32 0
  %11 = load %"struct.Minisat::Lit"** %10, align 8, !tbaa !60
  %12 = getelementptr inbounds %"class.Minisat::vec.0"* %ps, i64 0, i32 1
  %13 = load i32* %12, align 4, !tbaa !61
  tail call void @_ZN7Minisat4sortINS_3LitENS_16LessThan_defaultIS1_EEEEvPT_iT0_(%"struct.Minisat::Lit"* %11, i32 %13) #2
  %14 = load i32* %12, align 4, !tbaa !61
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %9
  %16 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  br label %17

; <label>:17                                      ; preds = %39, %.lr.ph
  %18 = phi i32 [ %14, %.lr.ph ], [ %40, %39 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %39 ]
  %p.sroa.0.017 = phi i32 [ -2, %.lr.ph ], [ %p.sroa.0.1, %39 ]
  %j.015 = phi i32 [ 0, %.lr.ph ], [ %j.1, %39 ]
  %19 = load %"struct.Minisat::Lit"** %10, align 8, !tbaa !60
  %20 = getelementptr inbounds %"struct.Minisat::Lit"* %19, i64 %indvars.iv, i32 0
  %21 = load i32* %20, align 4
  %22 = ashr i32 %21, 1
  %23 = sext i32 %22 to i64
  %24 = load %"class.Minisat::lbool"** %16, align 8, !tbaa !65
  %25 = getelementptr inbounds %"class.Minisat::lbool"* %24, i64 %23, i32 0
  %26 = load i8* %25, align 1, !tbaa !66
  %p.coerce.tr.i = trunc i32 %21 to i8
  %27 = and i8 %p.coerce.tr.i, 1
  %28 = icmp eq i8 %26, %27
  %29 = xor i32 %p.sroa.0.017, 1
  %30 = icmp eq i32 %21, %29
  %or.cond = or i1 %28, %30
  br i1 %or.cond, label %.loopexit, label %31

; <label>:31                                      ; preds = %17
  %32 = xor i8 %26, %27
  %33 = icmp ne i8 %32, 1
  %34 = icmp ne i32 %21, %p.sroa.0.017
  %or.cond11 = and i1 %34, %33
  br i1 %or.cond11, label %35, label %39

; <label>:35                                      ; preds = %31
  %36 = add nsw i32 %j.015, 1
  %37 = sext i32 %j.015 to i64
  %38 = getelementptr inbounds %"struct.Minisat::Lit"* %19, i64 %37, i32 0
  store i32 %21, i32* %38, align 4
  %.pre = load i32* %12, align 4, !tbaa !61
  br label %39

; <label>:39                                      ; preds = %35, %31
  %40 = phi i32 [ %.pre, %35 ], [ %18, %31 ]
  %j.1 = phi i32 [ %36, %35 ], [ %j.015, %31 ]
  %p.sroa.0.1 = phi i32 [ %21, %35 ], [ %p.sroa.0.017, %31 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = trunc i64 %indvars.iv.next to i32
  %42 = icmp slt i32 %41, %40
  br i1 %42, label %17, label %._crit_edge

._crit_edge:                                      ; preds = %39, %9
  %.pr = phi i32 [ %14, %9 ], [ %40, %39 ]
  %i.0.lcssa = phi i32 [ 0, %9 ], [ %41, %39 ]
  %j.0.lcssa = phi i32 [ 0, %9 ], [ %j.1, %39 ]
  %43 = sub nsw i32 %i.0.lcssa, %j.0.lcssa
  %44 = icmp slt i32 %.pr, %43
  br i1 %44, label %47, label %.preheader.i, !prof !123

.preheader.i:                                     ; preds = %._crit_edge
  %45 = icmp sgt i32 %43, 0
  br i1 %45, label %.lr.ph.i, label %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit

.lr.ph.i:                                         ; preds = %.preheader.i
  %46 = sub i32 %.pr, %43
  store i32 %46, i32* %12, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit

; <label>:47                                      ; preds = %._crit_edge
  tail call void @__assert_rtn(i8* getelementptr inbounds ([7 x i8]* @__func__._ZN7Minisat3vecIjE6shrinkEi, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 64, i8* getelementptr inbounds ([13 x i8]* @.str59, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit:          ; preds = %.lr.ph.i, %.preheader.i
  %48 = phi i32 [ %46, %.lr.ph.i ], [ %.pr, %.preheader.i ]
  switch i32 %48, label %90 [
    i32 0, label %49
    i32 1, label %50
  ]

; <label>:49                                      ; preds = %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit
  store i8 0, i8* %6, align 1, !tbaa !91
  br label %.loopexit

; <label>:50                                      ; preds = %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit
  %51 = load %"struct.Minisat::Lit"** %10, align 8, !tbaa !60
  %52 = getelementptr inbounds %"struct.Minisat::Lit"* %51, i64 0, i32 0
  %53 = load i32* %52, align 4
  %54 = ashr i32 %53, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %57 = load %"class.Minisat::lbool"** %56, align 8, !tbaa !65
  %58 = getelementptr inbounds %"class.Minisat::lbool"* %57, i64 %55, i32 0
  %59 = load i8* %58, align 1, !tbaa !66
  %60 = and i8 %59, 2
  %61 = icmp eq i8 %60, 0
  br i1 %61, label %62, label %63, !prof !123

; <label>:62                                      ; preds = %50
  tail call void @__assert_rtn(i8* getelementptr inbounds ([17 x i8]* @__func__._ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 432, i8* getelementptr inbounds ([20 x i8]* @.str3838, i64 0, i64 0)) #16
  unreachable

; <label>:63                                      ; preds = %50
  %64 = and i32 %53, 1
  %65 = xor i32 %64, 1
  %66 = trunc i32 %65 to i8
  %67 = xor i8 %66, 1
  store i8 %67, i8* %58, align 1, !tbaa !59
  %68 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 0
  %69 = load %"struct.Minisat::Solver::VarData"** %68, align 8, !tbaa !100
  %70 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %69, i64 %55
  %71 = load i32* %1, align 4, !tbaa !98
  %72 = zext i32 %71 to i64
  %73 = shl nuw i64 %72, 32
  %74 = or i64 %73, 4294967295
  %75 = bitcast %"struct.Minisat::Solver::VarData"* %70 to i64*
  store i64 %74, i64* %75, align 4
  %76 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 1
  %77 = load i32* %76, align 4, !tbaa !61
  %78 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 2
  %79 = load i32* %78, align 4, !tbaa !62
  %80 = icmp slt i32 %77, %79
  br i1 %80, label %_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit, label %81, !prof !122

; <label>:81                                      ; preds = %63
  tail call void @__assert_rtn(i8* getelementptr inbounds ([6 x i8]* @__func__._ZN7Minisat3vecINS_3LitEE5push_ERKS1_, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 75, i8* getelementptr inbounds ([9 x i8]* @.str62, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit: ; preds = %63
  %82 = add nsw i32 %77, 1
  store i32 %82, i32* %76, align 4, !tbaa !61
  %83 = sext i32 %77 to i64
  %84 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 0
  %85 = load %"struct.Minisat::Lit"** %84, align 8, !tbaa !60
  %86 = getelementptr inbounds %"struct.Minisat::Lit"* %85, i64 %83, i32 0
  store i32 %53, i32* %86, align 4, !tbaa !36
  %87 = tail call i32 @_ZN7Minisat6Solver9propagateEv(%"class.Minisat::Solver"* %this)
  %88 = icmp eq i32 %87, -1
  %89 = zext i1 %88 to i8
  store i8 %89, i8* %6, align 1, !tbaa !91
  br label %.loopexit

; <label>:90                                      ; preds = %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit
  %91 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %92 = tail call i32 @_ZN7Minisat15ClauseAllocator5allocINS_3vecINS_3LitEEEEEjRKT_b(%"class.Minisat::ClauseAllocator"* %91, %"class.Minisat::vec.0"* %ps, i1 zeroext false)
  %93 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32
  %94 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32, i32 1
  %95 = load i32* %94, align 4, !tbaa !64
  %96 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32, i32 2
  %97 = load i32* %96, align 4, !tbaa !118
  %98 = icmp eq i32 %95, %97
  br i1 %98, label %99, label %_ZN7Minisat3vecIjE4pushERKj.exit

; <label>:99                                      ; preds = %90
  %100 = add nsw i32 %95, 1
  tail call void @_ZN7Minisat3vecIjE8capacityEi(%"class.Minisat::vec.1"* %93, i32 %100)
  %.pre.i = load i32* %94, align 4, !tbaa !64
  br label %_ZN7Minisat3vecIjE4pushERKj.exit

_ZN7Minisat3vecIjE4pushERKj.exit:                 ; preds = %99, %90
  %101 = phi i32 [ %.pre.i, %99 ], [ %95, %90 ]
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %94, align 4, !tbaa !64
  %103 = sext i32 %101 to i64
  %104 = getelementptr inbounds %"class.Minisat::vec.1"* %93, i64 0, i32 0
  %105 = load i32** %104, align 8, !tbaa !117
  %106 = getelementptr inbounds i32* %105, i64 %103
  store i32 %92, i32* %106, align 4, !tbaa !36
  tail call void @_ZN7Minisat6Solver12attachClauseEj(%"class.Minisat::Solver"* %this, i32 %92)
  br label %.loopexit

.loopexit:                                        ; preds = %_ZN7Minisat3vecIjE4pushERKj.exit, %_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit, %49, %17, %5
  %.0 = phi i1 [ false, %49 ], [ %88, %_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit ], [ true, %_ZN7Minisat3vecIjE4pushERKj.exit ], [ false, %5 ], [ true, %17 ]
  ret i1 %.0
}

; Function Attrs: noreturn
declare void @__assert_rtn(i8*, i8*, i32, i8*) #5

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj(%"class.Minisat::Solver"* nocapture %this, i32 %p.coerce, i32 %from) #0 align 2 {
  %1 = ashr i32 %p.coerce, 1
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %4 = load %"class.Minisat::lbool"** %3, align 8, !tbaa !65
  %5 = getelementptr inbounds %"class.Minisat::lbool"* %4, i64 %2, i32 0
  %6 = load i8* %5, align 1, !tbaa !66
  %7 = and i8 %6, 2
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %9, label %10, !prof !123

; <label>:9                                       ; preds = %0
  tail call void @__assert_rtn(i8* getelementptr inbounds ([17 x i8]* @__func__._ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 432, i8* getelementptr inbounds ([20 x i8]* @.str3838, i64 0, i64 0)) #16
  unreachable

; <label>:10                                      ; preds = %0
  %11 = and i32 %p.coerce, 1
  %12 = xor i32 %11, 1
  %13 = trunc i32 %12 to i8
  %14 = xor i8 %13, 1
  store i8 %14, i8* %5, align 1, !tbaa !59
  %15 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 0
  %16 = load %"struct.Minisat::Solver::VarData"** %15, align 8, !tbaa !100
  %17 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %16, i64 %2
  %18 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 1
  %19 = load i32* %18, align 4, !tbaa !98
  %20 = zext i32 %19 to i64
  %21 = shl nuw i64 %20, 32
  %22 = zext i32 %from to i64
  %23 = or i64 %21, %22
  %24 = bitcast %"struct.Minisat::Solver::VarData"* %17 to i64*
  store i64 %23, i64* %24, align 4
  %25 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 1
  %26 = load i32* %25, align 4, !tbaa !61
  %27 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 2
  %28 = load i32* %27, align 4, !tbaa !62
  %29 = icmp slt i32 %26, %28
  br i1 %29, label %_ZN7Minisat3vecINS_3LitEE5push_ERKS1_.exit, label %30, !prof !122

; <label>:30                                      ; preds = %10
  tail call void @__assert_rtn(i8* getelementptr inbounds ([6 x i8]* @__func__._ZN7Minisat3vecINS_3LitEE5push_ERKS1_, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 75, i8* getelementptr inbounds ([9 x i8]* @.str62, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat3vecINS_3LitEE5push_ERKS1_.exit:       ; preds = %10
  %31 = add nsw i32 %26, 1
  store i32 %31, i32* %25, align 4, !tbaa !61
  %32 = sext i32 %26 to i64
  %33 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 0
  %34 = load %"struct.Minisat::Lit"** %33, align 8, !tbaa !60
  %35 = getelementptr inbounds %"struct.Minisat::Lit"* %34, i64 %32, i32 0
  store i32 %p.coerce, i32* %35, align 4, !tbaa !36
  ret void
}

; Function Attrs: ssp uwtable
define i32 @_ZN7Minisat6Solver9propagateEv(%"class.Minisat::Solver"* nocapture %this) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37
  %2 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2, i32 1
  %3 = load i32* %2, align 4, !tbaa !61
  %4 = icmp sgt i32 %3, 0
  %5 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2, i32 0
  br i1 %4, label %.lr.ph.i, label %._crit_edge.i

.lr.ph.i:                                         ; preds = %0
  %6 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 1, i32 0
  br label %7

; <label>:7                                       ; preds = %19, %.lr.ph.i
  %8 = phi i32 [ %3, %.lr.ph.i ], [ %20, %19 ]
  %indvars.iv.i = phi i64 [ 0, %.lr.ph.i ], [ %indvars.iv.next.i, %19 ]
  %9 = load %"struct.Minisat::Lit"** %5, align 8, !tbaa !60
  %10 = getelementptr inbounds %"struct.Minisat::Lit"* %9, i64 %indvars.iv.i
  %11 = getelementptr inbounds %"struct.Minisat::Lit"* %10, i64 0, i32 0
  %12 = load i32* %11, align 4
  %13 = sext i32 %12 to i64
  %14 = load i8** %6, align 8, !tbaa !102
  %15 = getelementptr inbounds i8* %14, i64 %13
  %16 = load i8* %15, align 1, !tbaa !59
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %19, label %18

; <label>:18                                      ; preds = %7
  tail call void @_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE5cleanERKS1_(%"class.Minisat::OccLists"* %1, %"struct.Minisat::Lit"* %10)
  %.pre.i = load i32* %2, align 4, !tbaa !61
  br label %19

; <label>:19                                      ; preds = %18, %7
  %20 = phi i32 [ %8, %7 ], [ %.pre.i, %18 ]
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %21 = trunc i64 %indvars.iv.next.i to i32
  %22 = icmp slt i32 %21, %20
  br i1 %22, label %7, label %._crit_edge.i

._crit_edge.i:                                    ; preds = %19, %0
  %23 = load %"struct.Minisat::Lit"** %5, align 8, !tbaa !60
  %24 = icmp eq %"struct.Minisat::Lit"* %23, null
  br i1 %24, label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.preheader, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %._crit_edge.i
  store i32 0, i32* %2, align 4, !tbaa !61
  br label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.preheader

_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.preheader: ; preds = %.preheader.i.i, %._crit_edge.i
  %25 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 44
  %26 = load i32* %25, align 4, !tbaa !124
  %27 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 1
  %28 = load i32* %27, align 4, !tbaa !61
  %29 = icmp slt i32 %26, %28
  br i1 %29, label %.lr.ph131, label %216

.lr.ph131:                                        ; preds = %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.preheader
  %30 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 0
  %31 = getelementptr inbounds %"class.Minisat::OccLists"* %1, i64 0, i32 0, i32 0
  %32 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %33 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %34 = bitcast i8* %33 to i32*
  %35 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %36 = bitcast %"class.Minisat::ClauseAllocator"* %35 to i32**
  %37 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 0
  %38 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 1
  %39 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 2
  br label %40

; <label>:40                                      ; preds = %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.backedge, %.lr.ph131
  %41 = phi i32 [ %26, %.lr.ph131 ], [ %211, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.backedge ]
  %confl.0130 = phi i32 [ -1, %.lr.ph131 ], [ %confl.1.ph.ph111, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.backedge ]
  %num_props.0129 = phi i32 [ 0, %.lr.ph131 ], [ %49, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.backedge ]
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %25, align 4, !tbaa !124
  %43 = sext i32 %41 to i64
  %44 = load %"struct.Minisat::Lit"** %30, align 8, !tbaa !60
  %45 = getelementptr inbounds %"struct.Minisat::Lit"* %44, i64 %43, i32 0
  %46 = load i32* %45, align 4, !tbaa !36
  %47 = sext i32 %46 to i64
  %48 = load %"class.Minisat::vec.4"** %31, align 8, !tbaa !107
  %49 = add nsw i32 %num_props.0129, 1
  %50 = getelementptr inbounds %"class.Minisat::vec.4"* %48, i64 %47, i32 0
  %51 = load %"struct.Minisat::Solver::Watcher"** %50, align 8, !tbaa !109
  %52 = getelementptr inbounds %"class.Minisat::vec.4"* %48, i64 %47, i32 1
  %53 = load i32* %52, align 4, !tbaa !111
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %51, i64 %54
  %56 = icmp eq i32 %53, 0
  br i1 %56, label %._crit_edge63, label %.lr.ph62.lr.ph.lr.ph

.lr.ph62.lr.ph.lr.ph:                             ; preds = %40
  %57 = bitcast %"struct.Minisat::Solver::Watcher"* %51 to i8*
  %58 = xor i32 %46, 1
  %59 = shl nsw i64 %54, 3
  %uglygep.sum = add i64 %59, -1
  br label %.lr.ph62.lr.ph

..loopexit_crit_edge:                             ; preds = %172
  %scevgep.sum = add i64 %171, 2
  %scevgep183 = getelementptr %"struct.Minisat::Solver::Watcher"* %i.061, i64 %scevgep.sum
  %scevgep184.sum = add i64 %171, 2
  %scevgep185 = getelementptr %"struct.Minisat::Solver::Watcher"* %j.0.ph88, i64 %scevgep184.sum
  br label %.loopexit

.loopexit:                                        ; preds = %168, %..loopexit_crit_edge
  %i.1.lcssa = phi %"struct.Minisat::Solver::Watcher"* [ %scevgep183, %..loopexit_crit_edge ], [ %98, %168 ]
  %j.1.lcssa = phi %"struct.Minisat::Solver::Watcher"* [ %scevgep185, %..loopexit_crit_edge ], [ %155, %168 ]
  %60 = icmp eq %"struct.Minisat::Solver::Watcher"* %i.1.lcssa, %55
  br i1 %60, label %._crit_edge63, label %.lr.ph62.lr.ph

.lr.ph62.lr.ph:                                   ; preds = %.loopexit, %.lr.ph62.lr.ph.lr.ph
  %confl.1.ph.ph115 = phi i32 [ %confl.0130, %.lr.ph62.lr.ph.lr.ph ], [ %80, %.loopexit ]
  %i.0.ph.ph114 = phi %"struct.Minisat::Solver::Watcher"* [ %51, %.lr.ph62.lr.ph.lr.ph ], [ %i.1.lcssa, %.loopexit ]
  %j.0.ph.ph113 = phi %"struct.Minisat::Solver::Watcher"* [ %51, %.lr.ph62.lr.ph.lr.ph ], [ %j.1.lcssa, %.loopexit ]
  br label %.lr.ph62

.lr.ph62:                                         ; preds = %.outer.backedge, %.lr.ph62.lr.ph
  %i.0.ph90 = phi %"struct.Minisat::Solver::Watcher"* [ %i.0.ph.ph114, %.lr.ph62.lr.ph ], [ %i.0.ph.be, %.outer.backedge ]
  %j.0.ph88 = phi %"struct.Minisat::Solver::Watcher"* [ %j.0.ph.ph113, %.lr.ph62.lr.ph ], [ %j.0.ph.be, %.outer.backedge ]
  br label %61

; <label>:61                                      ; preds = %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit, %.lr.ph62
  %i.061 = phi %"struct.Minisat::Solver::Watcher"* [ %i.0.ph90, %.lr.ph62 ], [ %98, %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit ]
  %62 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %i.061, i64 0, i32 1, i32 0
  %63 = load i32* %62, align 4
  %64 = ashr i32 %63, 1
  %65 = sext i32 %64 to i64
  %66 = load %"class.Minisat::lbool"** %32, align 8, !tbaa !65
  %67 = getelementptr inbounds %"class.Minisat::lbool"* %66, i64 %65, i32 0
  %68 = load i8* %67, align 1, !tbaa !66
  %p.coerce.tr.i15 = trunc i32 %63 to i8
  %69 = and i8 %p.coerce.tr.i15, 1
  %70 = icmp eq i8 %68, %69
  br i1 %70, label %71, label %78

; <label>:71                                      ; preds = %61
  %72 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %j.0.ph88, i64 1
  %73 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %i.061, i64 1
  %74 = bitcast %"struct.Minisat::Solver::Watcher"* %i.061 to i64*
  %75 = bitcast %"struct.Minisat::Solver::Watcher"* %j.0.ph88 to i64*
  %76 = load i64* %74, align 4
  store i64 %76, i64* %75, align 4
  br label %.outer.backedge

.outer.backedge:                                  ; preds = %_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit, %111, %71
  %j.0.ph.be = phi %"struct.Minisat::Solver::Watcher"* [ %72, %71 ], [ %112, %111 ], [ %155, %_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit ]
  %i.0.ph.be = phi %"struct.Minisat::Solver::Watcher"* [ %73, %71 ], [ %98, %111 ], [ %98, %_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit ]
  %77 = icmp eq %"struct.Minisat::Solver::Watcher"* %i.0.ph.be, %55
  br i1 %77, label %._crit_edge63, label %.lr.ph62

; <label>:78                                      ; preds = %61
  %79 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %i.061, i64 0, i32 0
  %80 = load i32* %79, align 4, !tbaa !125
  %81 = load i32* %34, align 4, !tbaa !128
  %phitmp.i.i = icmp ugt i32 %81, %80
  br i1 %phitmp.i.i, label %_ZN7Minisat15ClauseAllocatorixEj.exit, label %82, !prof !122

; <label>:82                                      ; preds = %78
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit:            ; preds = %78
  %83 = zext i32 %80 to i64
  %84 = load i32** %36, align 8, !tbaa !119
  %85 = getelementptr inbounds i32* %84, i64 %83
  %86 = bitcast i32* %85 to %"class.Minisat::Clause"*
  %.sum = add i64 %83, 1
  %87 = getelementptr inbounds i32* %84, i64 %.sum
  %88 = load i32* %87, align 4, !tbaa !129
  %89 = icmp eq i32 %88, %58
  %.sum25 = add i64 %83, 2
  %90 = getelementptr inbounds i32* %84, i64 %.sum25
  br i1 %89, label %91, label %_ZN7Minisat15ClauseAllocatorixEj.exit._crit_edge

; <label>:91                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit
  %92 = load i32* %90, align 4, !tbaa !36
  store i32 %92, i32* %87, align 4, !tbaa !36
  store i32 %58, i32* %90, align 4
  br label %_ZN7Minisat15ClauseAllocatorixEj.exit._crit_edge

_ZN7Minisat15ClauseAllocatorixEj.exit._crit_edge: ; preds = %91, %_ZN7Minisat15ClauseAllocatorixEj.exit
  %93 = phi i32 [ %92, %91 ], [ %88, %_ZN7Minisat15ClauseAllocatorixEj.exit ]
  %94 = load i32* %90, align 4, !tbaa !129
  %95 = icmp eq i32 %94, %58
  br i1 %95, label %97, label %96, !prof !122

; <label>:96                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit._crit_edge
  tail call void @__assert_rtn(i8* getelementptr inbounds ([10 x i8]* @__func__._ZN7Minisat6Solver9propagateEv, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 474, i8* getelementptr inbounds ([18 x i8]* @.str3939, i64 0, i64 0)) #16
  unreachable

; <label>:97                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit._crit_edge
  %98 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %i.061, i64 1
  %99 = icmp eq i32 %93, %63
  br i1 %99, label %.preheader, label %103

.preheader:                                       ; preds = %103, %97
  %100 = load i32* %85, align 4
  %101 = icmp ugt i32 %100, 95
  br i1 %101, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %102 = load %"class.Minisat::lbool"** %32, align 8, !tbaa !65
  br label %121

; <label>:103                                     ; preds = %97
  %104 = ashr i32 %93, 1
  %105 = sext i32 %104 to i64
  %106 = load %"class.Minisat::lbool"** %32, align 8, !tbaa !65
  %107 = getelementptr inbounds %"class.Minisat::lbool"* %106, i64 %105, i32 0
  %108 = load i8* %107, align 1, !tbaa !66
  %p.coerce.tr.i14 = trunc i32 %93 to i8
  %109 = and i8 %p.coerce.tr.i14, 1
  %110 = icmp eq i8 %108, %109
  br i1 %110, label %111, label %.preheader

; <label>:111                                     ; preds = %103
  %112 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %j.0.ph88, i64 1
  %113 = bitcast %"struct.Minisat::Solver::Watcher"* %j.0.ph88 to i64*
  %114 = zext i32 %93 to i64
  %115 = shl nuw i64 %114, 32
  %116 = or i64 %115, %83
  store i64 %116, i64* %113, align 4
  br label %.outer.backedge

; <label>:117                                     ; preds = %121
  %118 = lshr i32 %100, 5
  %119 = trunc i64 %indvars.iv.next to i32
  %120 = icmp slt i32 %119, %118
  br i1 %120, label %121, label %._crit_edge

; <label>:121                                     ; preds = %117, %.lr.ph
  %indvars.iv = phi i64 [ 2, %.lr.ph ], [ %indvars.iv.next, %117 ]
  %122 = getelementptr inbounds %"class.Minisat::Clause"* %86, i64 0, i32 1, i64 %indvars.iv, i32 0, i32 0
  %123 = load i32* %122, align 4
  %124 = ashr i32 %123, 1
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds %"class.Minisat::lbool"* %102, i64 %125, i32 0
  %127 = load i8* %126, align 1, !tbaa !66
  %p.coerce.tr.i13 = trunc i32 %123 to i8
  %128 = and i8 %p.coerce.tr.i13, 1
  %129 = xor i8 %127, %128
  %130 = icmp eq i8 %129, 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %130, label %117, label %131

; <label>:131                                     ; preds = %121
  store i32 %123, i32* %90, align 4, !tbaa !36
  store i32 %58, i32* %122, align 4
  %132 = load i32* %90, align 4
  %133 = xor i32 %132, 1
  %134 = sext i32 %133 to i64
  %135 = load %"class.Minisat::vec.4"** %31, align 8, !tbaa !107
  %136 = getelementptr inbounds %"class.Minisat::vec.4"* %135, i64 %134
  %137 = getelementptr inbounds %"class.Minisat::vec.4"* %135, i64 %134, i32 1
  %138 = load i32* %137, align 4, !tbaa !111
  %139 = getelementptr inbounds %"class.Minisat::vec.4"* %135, i64 %134, i32 2
  %140 = load i32* %139, align 4, !tbaa !112
  %141 = icmp eq i32 %138, %140
  br i1 %141, label %142, label %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit

; <label>:142                                     ; preds = %131
  %143 = add nsw i32 %138, 1
  tail call void @_ZN7Minisat3vecINS_6Solver7WatcherEE8capacityEi(%"class.Minisat::vec.4"* %136, i32 %143)
  %.pre.i12 = load i32* %137, align 4, !tbaa !111
  br label %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit

_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit: ; preds = %142, %131
  %144 = phi i32 [ %.pre.i12, %142 ], [ %138, %131 ]
  %145 = add nsw i32 %144, 1
  store i32 %145, i32* %137, align 4, !tbaa !111
  %146 = sext i32 %144 to i64
  %147 = getelementptr inbounds %"class.Minisat::vec.4"* %136, i64 0, i32 0
  %148 = load %"struct.Minisat::Solver::Watcher"** %147, align 8, !tbaa !109
  %149 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %148, i64 %146
  %150 = bitcast %"struct.Minisat::Solver::Watcher"* %149 to i64*
  %151 = zext i32 %93 to i64
  %152 = shl nuw i64 %151, 32
  %153 = or i64 %152, %83
  store i64 %153, i64* %150, align 4
  %154 = icmp eq %"struct.Minisat::Solver::Watcher"* %98, %55
  br i1 %154, label %._crit_edge63, label %61

._crit_edge:                                      ; preds = %117, %.preheader
  %155 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %j.0.ph88, i64 1
  %156 = bitcast %"struct.Minisat::Solver::Watcher"* %j.0.ph88 to i64*
  %157 = zext i32 %93 to i64
  %158 = shl nuw i64 %157, 32
  %159 = or i64 %158, %83
  store i64 %159, i64* %156, align 4
  %160 = ashr i32 %93, 1
  %161 = sext i32 %160 to i64
  %162 = load %"class.Minisat::lbool"** %32, align 8, !tbaa !65
  %163 = getelementptr inbounds %"class.Minisat::lbool"* %162, i64 %161, i32 0
  %164 = load i8* %163, align 1, !tbaa !66
  %p.coerce.tr.i = trunc i32 %93 to i8
  %165 = and i8 %p.coerce.tr.i, 1
  %166 = xor i8 %164, %165
  %167 = icmp eq i8 %166, 1
  br i1 %167, label %168, label %179

; <label>:168                                     ; preds = %._crit_edge
  %169 = load i32* %27, align 4, !tbaa !61
  store i32 %169, i32* %25, align 4, !tbaa !124
  %170 = icmp ult %"struct.Minisat::Solver::Watcher"* %98, %55
  br i1 %170, label %.lr.ph31, label %.loopexit

.lr.ph31:                                         ; preds = %168
  %.lcssa168180 = ptrtoint %"struct.Minisat::Solver::Watcher"* %98 to i64
  %scevgep179.sum = sub i64 %uglygep.sum, %.lcssa168180
  %scevgep181 = getelementptr i8* %57, i64 %scevgep179.sum
  %scevgep181182 = ptrtoint i8* %scevgep181 to i64
  %171 = lshr i64 %scevgep181182, 3
  br label %172

; <label>:172                                     ; preds = %172, %.lr.ph31
  %i.129 = phi %"struct.Minisat::Solver::Watcher"* [ %98, %.lr.ph31 ], [ %174, %172 ]
  %j.128 = phi %"struct.Minisat::Solver::Watcher"* [ %155, %.lr.ph31 ], [ %173, %172 ]
  %173 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %j.128, i64 1
  %174 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %i.129, i64 1
  %175 = bitcast %"struct.Minisat::Solver::Watcher"* %i.129 to i64*
  %176 = bitcast %"struct.Minisat::Solver::Watcher"* %j.128 to i64*
  %177 = load i64* %175, align 4
  store i64 %177, i64* %176, align 4
  %178 = icmp ult %"struct.Minisat::Solver::Watcher"* %174, %55
  br i1 %178, label %172, label %..loopexit_crit_edge

; <label>:179                                     ; preds = %._crit_edge
  %180 = and i8 %164, 2
  %181 = icmp eq i8 %180, 0
  br i1 %181, label %182, label %183, !prof !123

; <label>:182                                     ; preds = %179
  tail call void @__assert_rtn(i8* getelementptr inbounds ([17 x i8]* @__func__._ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 432, i8* getelementptr inbounds ([20 x i8]* @.str3838, i64 0, i64 0)) #16
  unreachable

; <label>:183                                     ; preds = %179
  %184 = and i32 %93, 1
  %185 = xor i32 %184, 1
  %186 = trunc i32 %185 to i8
  %187 = xor i8 %186, 1
  store i8 %187, i8* %163, align 1, !tbaa !59
  %188 = load %"struct.Minisat::Solver::VarData"** %37, align 8, !tbaa !100
  %189 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %188, i64 %161
  %190 = load i32* %38, align 4, !tbaa !98
  %191 = zext i32 %190 to i64
  %192 = shl nuw i64 %191, 32
  %193 = or i64 %192, %83
  %194 = bitcast %"struct.Minisat::Solver::VarData"* %189 to i64*
  store i64 %193, i64* %194, align 4
  %195 = load i32* %27, align 4, !tbaa !61
  %196 = load i32* %39, align 4, !tbaa !62
  %197 = icmp slt i32 %195, %196
  br i1 %197, label %_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit, label %198, !prof !122

; <label>:198                                     ; preds = %183
  tail call void @__assert_rtn(i8* getelementptr inbounds ([6 x i8]* @__func__._ZN7Minisat3vecINS_3LitEE5push_ERKS1_, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 75, i8* getelementptr inbounds ([9 x i8]* @.str62, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit: ; preds = %183
  %199 = add nsw i32 %195, 1
  store i32 %199, i32* %27, align 4, !tbaa !61
  %200 = sext i32 %195 to i64
  %201 = load %"struct.Minisat::Lit"** %30, align 8, !tbaa !60
  %202 = getelementptr inbounds %"struct.Minisat::Lit"* %201, i64 %200, i32 0
  store i32 %93, i32* %202, align 4, !tbaa !36
  br label %.outer.backedge

._crit_edge63:                                    ; preds = %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit, %.outer.backedge, %.loopexit, %40
  %confl.1.ph.ph111 = phi i32 [ %confl.0130, %40 ], [ %confl.1.ph.ph115, %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit ], [ %confl.1.ph.ph115, %.outer.backedge ], [ %80, %.loopexit ]
  %j.0.ph72 = phi %"struct.Minisat::Solver::Watcher"* [ %51, %40 ], [ %j.0.ph88, %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit ], [ %j.0.ph.be, %.outer.backedge ], [ %j.1.lcssa, %.loopexit ]
  %i.0.lcssa = phi %"struct.Minisat::Solver::Watcher"* [ %51, %40 ], [ %55, %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit ], [ %55, %.outer.backedge ], [ %55, %.loopexit ]
  %203 = ptrtoint %"struct.Minisat::Solver::Watcher"* %i.0.lcssa to i64
  %204 = ptrtoint %"struct.Minisat::Solver::Watcher"* %j.0.ph72 to i64
  %205 = sub i64 %203, %204
  %206 = lshr exact i64 %205, 3
  %207 = trunc i64 %206 to i32
  %208 = load i32* %52, align 4, !tbaa !111
  %209 = icmp slt i32 %208, %207
  br i1 %209, label %215, label %.preheader.i, !prof !123

.preheader.i:                                     ; preds = %._crit_edge63
  %210 = icmp sgt i32 %207, 0
  br i1 %210, label %.lr.ph.i11, label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.backedge

_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.backedge: ; preds = %.lr.ph.i11, %.preheader.i
  %211 = load i32* %25, align 4, !tbaa !124
  %212 = load i32* %27, align 4, !tbaa !61
  %213 = icmp slt i32 %211, %212
  br i1 %213, label %40, label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit._crit_edge

.lr.ph.i11:                                       ; preds = %.preheader.i
  %214 = sub i32 %208, %207
  store i32 %214, i32* %52, align 4, !tbaa !111
  br label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.backedge

; <label>:215                                     ; preds = %._crit_edge63
  tail call void @__assert_rtn(i8* getelementptr inbounds ([7 x i8]* @__func__._ZN7Minisat3vecIjE6shrinkEi, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 64, i8* getelementptr inbounds ([13 x i8]* @.str59, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit._crit_edge: ; preds = %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.backedge
  %phitmp = sext i32 %49 to i64
  br label %216

; <label>:216                                     ; preds = %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit._crit_edge, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.preheader
  %confl.0.lcssa = phi i32 [ %confl.1.ph.ph111, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit._crit_edge ], [ -1, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.preheader ]
  %num_props.0.lcssa = phi i64 [ %phitmp, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit._crit_edge ], [ 0, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.preheader ]
  %217 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 24
  %218 = load i64* %217, align 8, !tbaa !33
  %219 = add i64 %218, %num_props.0.lcssa
  store i64 %219, i64* %217, align 8, !tbaa !33
  %220 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 46
  %221 = load i64* %220, align 8, !tbaa !130
  %222 = sub nsw i64 %221, %num_props.0.lcssa
  store i64 %222, i64* %220, align 8, !tbaa !130
  ret i32 %confl.0.lcssa
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6Solver12attachClauseEj(%"class.Minisat::Solver"* nocapture %this, i32 %cr) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %2 = bitcast i8* %1 to i32*
  %3 = load i32* %2, align 4, !tbaa !128
  %phitmp.i.i = icmp ugt i32 %3, %cr
  br i1 %phitmp.i.i, label %_ZN7Minisat15ClauseAllocatorixEj.exit, label %4, !prof !122

; <label>:4                                       ; preds = %0
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit:            ; preds = %0
  %5 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %6 = zext i32 %cr to i64
  %7 = bitcast %"class.Minisat::ClauseAllocator"* %5 to i32**
  %8 = load i32** %7, align 8, !tbaa !119
  %9 = getelementptr inbounds i32* %8, i64 %6
  %10 = load i32* %9, align 4
  %11 = icmp ult i32 %10, 64
  br i1 %11, label %12, label %13, !prof !123

; <label>:12                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit
  tail call void @__assert_rtn(i8* getelementptr inbounds ([13 x i8]* @__func__._ZN7Minisat6Solver12attachClauseEj, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 164, i8* getelementptr inbounds ([13 x i8]* @.str3434, i64 0, i64 0)) #16
  unreachable

; <label>:13                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit
  %.sum = add i64 %6, 1
  %14 = getelementptr inbounds i32* %8, i64 %.sum
  %15 = load i32* %14, align 4
  %16 = xor i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 0, i32 0
  %19 = load %"class.Minisat::vec.4"** %18, align 8, !tbaa !107
  %20 = getelementptr inbounds %"class.Minisat::vec.4"* %19, i64 %17
  %.sum10 = add i64 %6, 2
  %21 = getelementptr inbounds i32* %8, i64 %.sum10
  %22 = load i32* %21, align 4
  %23 = getelementptr inbounds %"class.Minisat::vec.4"* %19, i64 %17, i32 1
  %24 = load i32* %23, align 4, !tbaa !111
  %25 = getelementptr inbounds %"class.Minisat::vec.4"* %19, i64 %17, i32 2
  %26 = load i32* %25, align 4, !tbaa !112
  %27 = icmp eq i32 %24, %26
  br i1 %27, label %28, label %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit5

; <label>:28                                      ; preds = %13
  %29 = add nsw i32 %24, 1
  tail call void @_ZN7Minisat3vecINS_6Solver7WatcherEE8capacityEi(%"class.Minisat::vec.4"* %20, i32 %29)
  %.pre.i4 = load i32* %23, align 4, !tbaa !111
  br label %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit5

_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit5: ; preds = %28, %13
  %30 = phi i32 [ %.pre.i4, %28 ], [ %24, %13 ]
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %23, align 4, !tbaa !111
  %32 = sext i32 %30 to i64
  %33 = getelementptr inbounds %"class.Minisat::vec.4"* %20, i64 0, i32 0
  %34 = load %"struct.Minisat::Solver::Watcher"** %33, align 8, !tbaa !109
  %35 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %34, i64 %32
  %36 = bitcast %"struct.Minisat::Solver::Watcher"* %35 to i64*
  %37 = zext i32 %22 to i64
  %38 = shl nuw i64 %37, 32
  %39 = or i64 %38, %6
  store i64 %39, i64* %36, align 4
  %40 = load i32* %21, align 4
  %41 = xor i32 %40, 1
  %42 = sext i32 %41 to i64
  %43 = load %"class.Minisat::vec.4"** %18, align 8, !tbaa !107
  %44 = getelementptr inbounds %"class.Minisat::vec.4"* %43, i64 %42
  %45 = load i32* %14, align 4
  %46 = getelementptr inbounds %"class.Minisat::vec.4"* %43, i64 %42, i32 1
  %47 = load i32* %46, align 4, !tbaa !111
  %48 = getelementptr inbounds %"class.Minisat::vec.4"* %43, i64 %42, i32 2
  %49 = load i32* %48, align 4, !tbaa !112
  %50 = icmp eq i32 %47, %49
  br i1 %50, label %51, label %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit

; <label>:51                                      ; preds = %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit5
  %52 = add nsw i32 %47, 1
  tail call void @_ZN7Minisat3vecINS_6Solver7WatcherEE8capacityEi(%"class.Minisat::vec.4"* %44, i32 %52)
  %.pre.i = load i32* %46, align 4, !tbaa !111
  br label %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit

_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit: ; preds = %51, %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit5
  %53 = phi i32 [ %.pre.i, %51 ], [ %47, %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit5 ]
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %46, align 4, !tbaa !111
  %55 = sext i32 %53 to i64
  %56 = getelementptr inbounds %"class.Minisat::vec.4"* %44, i64 0, i32 0
  %57 = load %"struct.Minisat::Solver::Watcher"** %56, align 8, !tbaa !109
  %58 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %57, i64 %55
  %59 = bitcast %"struct.Minisat::Solver::Watcher"* %58 to i64*
  %60 = zext i32 %45 to i64
  %61 = shl nuw i64 %60, 32
  %62 = or i64 %61, %6
  store i64 %62, i64* %59, align 4
  %63 = load i32* %9, align 4
  %64 = and i32 %63, 4
  %65 = icmp eq i32 %64, 0
  %66 = lshr i32 %63, 5
  %67 = zext i32 %66 to i64
  br i1 %65, label %72, label %68

; <label>:68                                      ; preds = %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit
  %69 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 28
  %70 = load i64* %69, align 8, !tbaa !131
  %71 = add i64 %70, %67
  store i64 %71, i64* %69, align 8, !tbaa !131
  br label %76

; <label>:72                                      ; preds = %_ZN7Minisat3vecINS_6Solver7WatcherEE4pushERKS2_.exit
  %73 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 27
  %74 = load i64* %73, align 8, !tbaa !132
  %75 = add i64 %74, %67
  store i64 %75, i64* %73, align 8, !tbaa !132
  br label %76

; <label>:76                                      ; preds = %72, %68
  ret void
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6Solver12detachClauseEjb(%"class.Minisat::Solver"* nocapture %this, i32 %cr, i1 zeroext %strict) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %2 = bitcast i8* %1 to i32*
  %3 = load i32* %2, align 4, !tbaa !128
  %phitmp.i.i = icmp ugt i32 %3, %cr
  br i1 %phitmp.i.i, label %_ZN7Minisat15ClauseAllocatorixEj.exit, label %4, !prof !122

; <label>:4                                       ; preds = %0
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit:            ; preds = %0
  %5 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %6 = zext i32 %cr to i64
  %7 = bitcast %"class.Minisat::ClauseAllocator"* %5 to i32**
  %8 = load i32** %7, align 8, !tbaa !119
  %9 = getelementptr inbounds i32* %8, i64 %6
  %10 = load i32* %9, align 4
  %11 = icmp ult i32 %10, 64
  br i1 %11, label %12, label %13, !prof !123

; <label>:12                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit
  tail call void @__assert_rtn(i8* getelementptr inbounds ([13 x i8]* @__func__._ZN7Minisat6Solver12detachClauseEjb, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 173, i8* getelementptr inbounds ([13 x i8]* @.str3434, i64 0, i64 0)) #16
  unreachable

; <label>:13                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit
  %.sum = add i64 %6, 1
  %14 = getelementptr inbounds i32* %8, i64 %.sum
  %15 = load i32* %14, align 4
  %16 = xor i32 %15, 1
  %17 = sext i32 %16 to i64
  br i1 %strict, label %18, label %90

; <label>:18                                      ; preds = %13
  %19 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 0, i32 0
  %20 = load %"class.Minisat::vec.4"** %19, align 8, !tbaa !107
  %21 = getelementptr inbounds %"class.Minisat::vec.4"* %20, i64 %17
  %.sum32 = add i64 %6, 2
  %22 = getelementptr inbounds i32* %8, i64 %.sum32
  %23 = getelementptr inbounds %"class.Minisat::vec.4"* %20, i64 %17, i32 1
  %24 = load i32* %23, align 4, !tbaa !111
  %25 = icmp sgt i32 %24, 0
  br i1 %25, label %.lr.ph7.i10, label %.critedge.i15

.lr.ph7.i10:                                      ; preds = %18
  %26 = getelementptr inbounds %"class.Minisat::vec.4"* %21, i64 0, i32 0
  %27 = load %"struct.Minisat::Solver::Watcher"** %26, align 8, !tbaa !109
  br label %31

; <label>:28                                      ; preds = %31
  %29 = trunc i64 %indvars.iv.next15.i12 to i32
  %30 = icmp slt i32 %29, %24
  br i1 %30, label %31, label %.critedge.i15

; <label>:31                                      ; preds = %28, %.lr.ph7.i10
  %indvars.iv14.i11 = phi i64 [ 0, %.lr.ph7.i10 ], [ %indvars.iv.next15.i12, %28 ]
  %32 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %27, i64 %indvars.iv14.i11, i32 0
  %33 = load i32* %32, align 4, !tbaa !125
  %34 = icmp eq i32 %33, %cr
  %indvars.iv.next15.i12 = add nuw nsw i64 %indvars.iv14.i11, 1
  br i1 %34, label %.critedgesplit.i13, label %28

.critedgesplit.i13:                               ; preds = %31
  %35 = trunc i64 %indvars.iv14.i11 to i32
  br label %.critedge.i15

.critedge.i15:                                    ; preds = %.critedgesplit.i13, %28, %18
  %j.0.lcssa.i14 = phi i32 [ 0, %18 ], [ %35, %.critedgesplit.i13 ], [ %29, %28 ]
  %36 = icmp slt i32 %j.0.lcssa.i14, %24
  br i1 %36, label %.preheader.i16, label %41, !prof !122

.preheader.i16:                                   ; preds = %.critedge.i15
  %37 = add nsw i32 %24, -1
  %38 = icmp slt i32 %j.0.lcssa.i14, %37
  br i1 %38, label %.lr.ph.i17, label %._crit_edge.i23

.lr.ph.i17:                                       ; preds = %.preheader.i16
  %39 = getelementptr inbounds %"class.Minisat::vec.4"* %21, i64 0, i32 0
  %40 = sext i32 %j.0.lcssa.i14 to i64
  br label %42

; <label>:41                                      ; preds = %.critedge.i15
  tail call void @__assert_rtn(i8* getelementptr inbounds ([7 x i8]* @__func__._ZN7MinisatL6removeINS_3vecINS_6Solver7WatcherEEES3_EEvRT_RKT0_, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str66, i64 0, i64 0), i32 40, i8* getelementptr inbounds ([14 x i8]* @.str67, i64 0, i64 0)) #16
  unreachable

; <label>:42                                      ; preds = %42, %.lr.ph.i17
  %indvars.iv.i18 = phi i64 [ %40, %.lr.ph.i17 ], [ %indvars.iv.next.i19, %42 ]
  %43 = load %"struct.Minisat::Solver::Watcher"** %39, align 8, !tbaa !109
  %44 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %43, i64 %indvars.iv.i18
  %indvars.iv.next.i19 = add nsw i64 %indvars.iv.i18, 1
  %45 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %43, i64 %indvars.iv.next.i19
  %46 = bitcast %"struct.Minisat::Solver::Watcher"* %45 to i64*
  %47 = bitcast %"struct.Minisat::Solver::Watcher"* %44 to i64*
  %48 = load i64* %46, align 4
  store i64 %48, i64* %47, align 4
  %.pr.i20 = load i32* %23, align 4, !tbaa !111
  %49 = add nsw i32 %.pr.i20, -1
  %50 = trunc i64 %indvars.iv.next.i19 to i32
  %51 = icmp slt i32 %50, %49
  br i1 %51, label %42, label %._crit_edge.i23

._crit_edge.i23:                                  ; preds = %42, %.preheader.i16
  %.lcssa1.i21 = phi i32 [ %37, %.preheader.i16 ], [ %49, %42 ]
  %.lcssa.i22 = phi i32 [ %24, %.preheader.i16 ], [ %.pr.i20, %42 ]
  %52 = icmp slt i32 %.lcssa.i22, 1
  br i1 %52, label %53, label %_ZN7MinisatL6removeINS_3vecINS_6Solver7WatcherEEES3_EEvRT_RKT0_.exit24, !prof !123

; <label>:53                                      ; preds = %._crit_edge.i23
  tail call void @__assert_rtn(i8* getelementptr inbounds ([4 x i8]* @__func__._ZN7Minisat3vecINS_3LitEE3popEv, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 76, i8* getelementptr inbounds ([7 x i8]* @.str63, i64 0, i64 0)) #16
  unreachable

_ZN7MinisatL6removeINS_3vecINS_6Solver7WatcherEEES3_EEvRT_RKT0_.exit24: ; preds = %._crit_edge.i23
  store i32 %.lcssa1.i21, i32* %23, align 4, !tbaa !111
  %54 = load i32* %22, align 4
  %55 = xor i32 %54, 1
  %56 = sext i32 %55 to i64
  %57 = load %"class.Minisat::vec.4"** %19, align 8, !tbaa !107
  %58 = getelementptr inbounds %"class.Minisat::vec.4"* %57, i64 %56
  %59 = getelementptr inbounds %"class.Minisat::vec.4"* %57, i64 %56, i32 1
  %60 = load i32* %59, align 4, !tbaa !111
  %61 = icmp sgt i32 %60, 0
  br i1 %61, label %.lr.ph7.i, label %.critedge.i

.lr.ph7.i:                                        ; preds = %_ZN7MinisatL6removeINS_3vecINS_6Solver7WatcherEEES3_EEvRT_RKT0_.exit24
  %62 = getelementptr inbounds %"class.Minisat::vec.4"* %58, i64 0, i32 0
  %63 = load %"struct.Minisat::Solver::Watcher"** %62, align 8, !tbaa !109
  br label %67

; <label>:64                                      ; preds = %67
  %65 = trunc i64 %indvars.iv.next15.i to i32
  %66 = icmp slt i32 %65, %60
  br i1 %66, label %67, label %.critedge.i

; <label>:67                                      ; preds = %64, %.lr.ph7.i
  %indvars.iv14.i = phi i64 [ 0, %.lr.ph7.i ], [ %indvars.iv.next15.i, %64 ]
  %68 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %63, i64 %indvars.iv14.i, i32 0
  %69 = load i32* %68, align 4, !tbaa !125
  %70 = icmp eq i32 %69, %cr
  %indvars.iv.next15.i = add nuw nsw i64 %indvars.iv14.i, 1
  br i1 %70, label %.critedgesplit.i, label %64

.critedgesplit.i:                                 ; preds = %67
  %71 = trunc i64 %indvars.iv14.i to i32
  br label %.critedge.i

.critedge.i:                                      ; preds = %.critedgesplit.i, %64, %_ZN7MinisatL6removeINS_3vecINS_6Solver7WatcherEEES3_EEvRT_RKT0_.exit24
  %j.0.lcssa.i = phi i32 [ 0, %_ZN7MinisatL6removeINS_3vecINS_6Solver7WatcherEEES3_EEvRT_RKT0_.exit24 ], [ %71, %.critedgesplit.i ], [ %65, %64 ]
  %72 = icmp slt i32 %j.0.lcssa.i, %60
  br i1 %72, label %.preheader.i, label %77, !prof !122

.preheader.i:                                     ; preds = %.critedge.i
  %73 = add nsw i32 %60, -1
  %74 = icmp slt i32 %j.0.lcssa.i, %73
  br i1 %74, label %.lr.ph.i, label %._crit_edge.i

.lr.ph.i:                                         ; preds = %.preheader.i
  %75 = getelementptr inbounds %"class.Minisat::vec.4"* %58, i64 0, i32 0
  %76 = sext i32 %j.0.lcssa.i to i64
  br label %78

; <label>:77                                      ; preds = %.critedge.i
  tail call void @__assert_rtn(i8* getelementptr inbounds ([7 x i8]* @__func__._ZN7MinisatL6removeINS_3vecINS_6Solver7WatcherEEES3_EEvRT_RKT0_, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str66, i64 0, i64 0), i32 40, i8* getelementptr inbounds ([14 x i8]* @.str67, i64 0, i64 0)) #16
  unreachable

; <label>:78                                      ; preds = %78, %.lr.ph.i
  %indvars.iv.i = phi i64 [ %76, %.lr.ph.i ], [ %indvars.iv.next.i, %78 ]
  %79 = load %"struct.Minisat::Solver::Watcher"** %75, align 8, !tbaa !109
  %80 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %79, i64 %indvars.iv.i
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, 1
  %81 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %79, i64 %indvars.iv.next.i
  %82 = bitcast %"struct.Minisat::Solver::Watcher"* %81 to i64*
  %83 = bitcast %"struct.Minisat::Solver::Watcher"* %80 to i64*
  %84 = load i64* %82, align 4
  store i64 %84, i64* %83, align 4
  %.pr.i = load i32* %59, align 4, !tbaa !111
  %85 = add nsw i32 %.pr.i, -1
  %86 = trunc i64 %indvars.iv.next.i to i32
  %87 = icmp slt i32 %86, %85
  br i1 %87, label %78, label %._crit_edge.i

._crit_edge.i:                                    ; preds = %78, %.preheader.i
  %.lcssa1.i = phi i32 [ %73, %.preheader.i ], [ %85, %78 ]
  %.lcssa.i = phi i32 [ %60, %.preheader.i ], [ %.pr.i, %78 ]
  %88 = icmp slt i32 %.lcssa.i, 1
  br i1 %88, label %89, label %_ZN7MinisatL6removeINS_3vecINS_6Solver7WatcherEEES3_EEvRT_RKT0_.exit, !prof !123

; <label>:89                                      ; preds = %._crit_edge.i
  tail call void @__assert_rtn(i8* getelementptr inbounds ([4 x i8]* @__func__._ZN7Minisat3vecINS_3LitEE3popEv, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 76, i8* getelementptr inbounds ([7 x i8]* @.str63, i64 0, i64 0)) #16
  unreachable

_ZN7MinisatL6removeINS_3vecINS_6Solver7WatcherEEES3_EEvRT_RKT0_.exit: ; preds = %._crit_edge.i
  store i32 %.lcssa1.i, i32* %59, align 4, !tbaa !111
  br label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE6smudgeERKS1_.exit

; <label>:90                                      ; preds = %13
  %91 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 1, i32 0
  %92 = load i8** %91, align 8, !tbaa !102
  %93 = getelementptr inbounds i8* %92, i64 %17
  %94 = load i8* %93, align 1, !tbaa !59
  %95 = icmp eq i8 %94, 0
  br i1 %95, label %96, label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE6smudgeERKS1_.exit9

; <label>:96                                      ; preds = %90
  store i8 1, i8* %93, align 1, !tbaa !59
  %97 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2
  %98 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2, i32 1
  %99 = load i32* %98, align 4, !tbaa !61
  %100 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2, i32 2
  %101 = load i32* %100, align 4, !tbaa !62
  %102 = icmp eq i32 %99, %101
  br i1 %102, label %103, label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit.i8

; <label>:103                                     ; preds = %96
  %104 = add nsw i32 %99, 1
  tail call void @_ZN7Minisat3vecINS_3LitEE8capacityEi(%"class.Minisat::vec.0"* %97, i32 %104)
  %.pre.i.i7 = load i32* %98, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit.i8

_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit.i8:     ; preds = %103, %96
  %105 = phi i32 [ %.pre.i.i7, %103 ], [ %99, %96 ]
  %106 = add nsw i32 %105, 1
  store i32 %106, i32* %98, align 4, !tbaa !61
  %107 = sext i32 %105 to i64
  %108 = getelementptr inbounds %"class.Minisat::vec.0"* %97, i64 0, i32 0
  %109 = load %"struct.Minisat::Lit"** %108, align 8, !tbaa !60
  %110 = getelementptr inbounds %"struct.Minisat::Lit"* %109, i64 %107, i32 0
  store i32 %16, i32* %110, align 4, !tbaa !36
  %.pre = load i8** %91, align 8, !tbaa !102
  br label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE6smudgeERKS1_.exit9

_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE6smudgeERKS1_.exit9: ; preds = %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit.i8, %90
  %111 = phi i8* [ %92, %90 ], [ %.pre, %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit.i8 ]
  %.sum31 = add i64 %6, 2
  %112 = getelementptr inbounds i32* %8, i64 %.sum31
  %113 = load i32* %112, align 4
  %114 = xor i32 %113, 1
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i8* %111, i64 %115
  %117 = load i8* %116, align 1, !tbaa !59
  %118 = icmp eq i8 %117, 0
  br i1 %118, label %119, label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE6smudgeERKS1_.exit

; <label>:119                                     ; preds = %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE6smudgeERKS1_.exit9
  store i8 1, i8* %116, align 1, !tbaa !59
  %120 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2
  %121 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2, i32 1
  %122 = load i32* %121, align 4, !tbaa !61
  %123 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2, i32 2
  %124 = load i32* %123, align 4, !tbaa !62
  %125 = icmp eq i32 %122, %124
  br i1 %125, label %126, label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit.i

; <label>:126                                     ; preds = %119
  %127 = add nsw i32 %122, 1
  tail call void @_ZN7Minisat3vecINS_3LitEE8capacityEi(%"class.Minisat::vec.0"* %120, i32 %127)
  %.pre.i.i = load i32* %121, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit.i

_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit.i:      ; preds = %126, %119
  %128 = phi i32 [ %.pre.i.i, %126 ], [ %122, %119 ]
  %129 = add nsw i32 %128, 1
  store i32 %129, i32* %121, align 4, !tbaa !61
  %130 = sext i32 %128 to i64
  %131 = getelementptr inbounds %"class.Minisat::vec.0"* %120, i64 0, i32 0
  %132 = load %"struct.Minisat::Lit"** %131, align 8, !tbaa !60
  %133 = getelementptr inbounds %"struct.Minisat::Lit"* %132, i64 %130, i32 0
  store i32 %114, i32* %133, align 4, !tbaa !36
  br label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE6smudgeERKS1_.exit

_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE6smudgeERKS1_.exit: ; preds = %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit.i, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE6smudgeERKS1_.exit9, %_ZN7MinisatL6removeINS_3vecINS_6Solver7WatcherEEES3_EEvRT_RKT0_.exit
  %134 = load i32* %9, align 4
  %135 = and i32 %134, 4
  %136 = icmp eq i32 %135, 0
  %137 = lshr i32 %134, 5
  %138 = zext i32 %137 to i64
  br i1 %136, label %143, label %139

; <label>:139                                     ; preds = %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE6smudgeERKS1_.exit
  %140 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 28
  %141 = load i64* %140, align 8, !tbaa !131
  %142 = sub i64 %141, %138
  store i64 %142, i64* %140, align 8, !tbaa !131
  br label %147

; <label>:143                                     ; preds = %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE6smudgeERKS1_.exit
  %144 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 27
  %145 = load i64* %144, align 8, !tbaa !132
  %146 = sub i64 %145, %138
  store i64 %146, i64* %144, align 8, !tbaa !132
  br label %147

; <label>:147                                     ; preds = %143, %139
  ret void
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6Solver12removeClauseEj(%"class.Minisat::Solver"* nocapture %this, i32 %cr) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %2 = bitcast i8* %1 to i32*
  %3 = load i32* %2, align 4, !tbaa !128
  %phitmp.i.i = icmp ugt i32 %3, %cr
  br i1 %phitmp.i.i, label %_ZN7Minisat15ClauseAllocatorixEj.exit, label %4, !prof !122

; <label>:4                                       ; preds = %0
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit:            ; preds = %0
  %5 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %6 = zext i32 %cr to i64
  %7 = bitcast %"class.Minisat::ClauseAllocator"* %5 to i32**
  %8 = load i32** %7, align 8, !tbaa !119
  %9 = getelementptr inbounds i32* %8, i64 %6
  tail call void @_ZN7Minisat6Solver12detachClauseEjb(%"class.Minisat::Solver"* %this, i32 %cr, i1 zeroext false)
  %.sum = add i64 %6, 1
  %10 = getelementptr inbounds i32* %8, i64 %.sum
  %11 = load i32* %10, align 4
  %12 = ashr i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %15 = load %"class.Minisat::lbool"** %14, align 8, !tbaa !65
  %16 = getelementptr inbounds %"class.Minisat::lbool"* %15, i64 %13, i32 0
  %17 = load i8* %16, align 1, !tbaa !66
  %p.coerce.tr.i.i = trunc i32 %11 to i8
  %18 = and i8 %p.coerce.tr.i.i, 1
  %19 = icmp eq i8 %17, %18
  br i1 %19, label %20, label %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread

; <label>:20                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit
  %21 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 0
  %22 = load %"struct.Minisat::Solver::VarData"** %21, align 8, !tbaa !100
  %23 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %22, i64 %13, i32 0
  %24 = load i32* %23, align 4, !tbaa !133
  %25 = icmp eq i32 %24, -1
  br i1 %25, label %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread, label %26

; <label>:26                                      ; preds = %20
  %27 = load i32* %2, align 4, !tbaa !128
  %phitmp.i.i.i = icmp ugt i32 %27, %24
  br i1 %phitmp.i.i.i, label %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit, label %28, !prof !122

; <label>:28                                      ; preds = %26
  tail call void @__assert_rtn(i8* getelementptr inbounds ([4 x i8]* @__func__._ZN7Minisat15RegionAllocatorIjE3leaEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 67, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit:    ; preds = %26
  %29 = zext i32 %24 to i64
  %30 = load i32** %7, align 8, !tbaa !119
  %31 = getelementptr inbounds i32* %30, i64 %29
  %32 = icmp eq i32* %31, %9
  br i1 %32, label %33, label %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread

; <label>:33                                      ; preds = %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit
  store i32 -1, i32* %23, align 4, !tbaa !133
  br label %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread

_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread: ; preds = %33, %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit, %20, %_ZN7Minisat15ClauseAllocatorixEj.exit
  %34 = load i32* %9, align 4
  %35 = and i32 %34, -4
  %36 = or i32 %35, 1
  store i32 %36, i32* %9, align 4
  %37 = load i32* %2, align 4, !tbaa !128
  %phitmp.i.i.i1 = icmp ugt i32 %37, %cr
  br i1 %phitmp.i.i.i1, label %_ZN7Minisat15ClauseAllocator4freeEj.exit, label %38, !prof !122

; <label>:38                                      ; preds = %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocator4freeEj.exit:         ; preds = %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread
  %39 = load i32** %7, align 8, !tbaa !119
  %40 = getelementptr inbounds i32* %39, i64 %6
  %41 = load i32* %40, align 4
  %42 = lshr i32 %41, 5
  %43 = lshr i32 %41, 3
  %.lobit.i = and i32 %43, 1
  %44 = add nsw i32 %.lobit.i, %42
  %45 = sext i32 %44 to i64
  %46 = shl nuw nsw i64 %45, 2
  %47 = add i64 %46, 4
  %48 = lshr exact i64 %47, 2
  %49 = trunc i64 %48 to i32
  %50 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 16
  %51 = bitcast i8* %50 to i32*
  %52 = load i32* %51, align 4, !tbaa !135
  %53 = add i32 %49, %52
  store i32 %53, i32* %51, align 4, !tbaa !135
  ret void
}

; Function Attrs: nounwind readonly ssp uwtable
define zeroext i1 @_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE(%"class.Minisat::Solver"* nocapture readonly %this, %"class.Minisat::Clause"* nocapture readonly %c) #13 align 2 {
  %1 = bitcast %"class.Minisat::Clause"* %c to i32*
  %2 = load i32* %1, align 4
  %3 = icmp ugt i32 %2, 31
  br i1 %3, label %.lr.ph, label %split3

.lr.ph:                                           ; preds = %0
  %4 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %5 = load %"class.Minisat::lbool"** %4, align 8, !tbaa !65
  %6 = lshr i32 %2, 5
  br label %10

; <label>:7                                       ; preds = %10
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = icmp slt i32 %8, %6
  br i1 %9, label %10, label %split3

; <label>:10                                      ; preds = %7, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %7 ]
  %11 = getelementptr inbounds %"class.Minisat::Clause"* %c, i64 0, i32 1, i64 %indvars.iv, i32 0, i32 0
  %12 = load i32* %11, align 4
  %13 = ashr i32 %12, 1
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %"class.Minisat::lbool"* %5, i64 %14, i32 0
  %16 = load i8* %15, align 1, !tbaa !66
  %p.coerce.tr.i = trunc i32 %12 to i8
  %17 = and i8 %p.coerce.tr.i, 1
  %18 = icmp eq i8 %16, %17
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %18, label %split3, label %7

split3:                                           ; preds = %10, %7, %0
  %.0 = phi i1 [ false, %0 ], [ false, %7 ], [ true, %10 ]
  ret i1 %.0
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6Solver11cancelUntilEi(%"class.Minisat::Solver"* nocapture %this, i32 %level) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 1
  %2 = load i32* %1, align 4, !tbaa !98
  %3 = icmp sgt i32 %2, %level
  br i1 %3, label %4, label %_ZN7Minisat3vecIiE6shrinkEi.exit

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 1
  %6 = load i32* %5, align 4, !tbaa !61
  %7 = sext i32 %level to i64
  %8 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 0
  %9 = load i32** %8, align 8, !tbaa !97
  %10 = getelementptr inbounds i32* %9, i64 %7
  %11 = load i32* %10, align 4, !tbaa !36
  %12 = icmp sgt i32 %6, %11
  br i1 %12, label %.lr.ph, label %_ZN7Minisat6Solver14insertVarOrderEi.exit._crit_edge

.lr.ph:                                           ; preds = %4
  %13 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 0
  %14 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %15 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 10
  %16 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 39, i32 0
  %17 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48
  %18 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 2, i32 1
  %19 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 2, i32 0
  %20 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 40, i32 0
  %21 = sext i32 %6 to i64
  br label %22

; <label>:22                                      ; preds = %_ZN7Minisat6Solver14insertVarOrderEi.exit.backedge, %.lr.ph
  %indvars.iv = phi i64 [ %21, %.lr.ph ], [ %indvars.iv.next, %_ZN7Minisat6Solver14insertVarOrderEi.exit.backedge ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %23 = load %"struct.Minisat::Lit"** %13, align 8, !tbaa !60
  %24 = getelementptr inbounds %"struct.Minisat::Lit"* %23, i64 %indvars.iv.next, i32 0
  %25 = load i32* %24, align 4
  %26 = ashr i32 %25, 1
  %27 = sext i32 %26 to i64
  %28 = load %"class.Minisat::lbool"** %14, align 8, !tbaa !65
  %29 = getelementptr inbounds %"class.Minisat::lbool"* %28, i64 %27, i32 0
  store i8 2, i8* %29, align 1, !tbaa !59
  %30 = load i32* %15, align 4, !tbaa !81
  %31 = icmp sgt i32 %30, 1
  br i1 %31, label %43, label %32

; <label>:32                                      ; preds = %22
  %33 = icmp eq i32 %30, 1
  br i1 %33, label %34, label %50

; <label>:34                                      ; preds = %32
  %35 = load i32* %1, align 4, !tbaa !98
  %36 = add nsw i32 %35, -1
  %37 = sext i32 %36 to i64
  %38 = load i32** %8, align 8, !tbaa !97
  %39 = getelementptr inbounds i32* %38, i64 %37
  %40 = load i32* %39, align 4, !tbaa !36
  %41 = trunc i64 %indvars.iv.next to i32
  %42 = icmp sgt i32 %41, %40
  br i1 %42, label %43, label %50

; <label>:43                                      ; preds = %34, %22
  %44 = load %"struct.Minisat::Lit"** %13, align 8, !tbaa !60
  %45 = getelementptr inbounds %"struct.Minisat::Lit"* %44, i64 %indvars.iv.next, i32 0
  %46 = load i32* %45, align 4
  %.tr = trunc i32 %46 to i8
  %47 = and i8 %.tr, 1
  %48 = load i8** %16, align 8, !tbaa !102
  %49 = getelementptr inbounds i8* %48, i64 %27
  store i8 %47, i8* %49, align 1, !tbaa !59
  br label %50

; <label>:50                                      ; preds = %43, %34, %32
  %51 = load i32* %18, align 4, !tbaa !98
  %52 = icmp sgt i32 %51, %26
  br i1 %52, label %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.i, label %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread.i

_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.i: ; preds = %50
  %53 = load i32** %19, align 8, !tbaa !97
  %54 = getelementptr inbounds i32* %53, i64 %27
  %55 = load i32* %54, align 4, !tbaa !36
  %56 = icmp sgt i32 %55, -1
  br i1 %56, label %_ZN7Minisat6Solver14insertVarOrderEi.exit.backedge, label %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread.i

_ZN7Minisat6Solver14insertVarOrderEi.exit.backedge: ; preds = %66, %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread.i, %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.i
  %57 = load i32** %8, align 8, !tbaa !97
  %58 = getelementptr inbounds i32* %57, i64 %7
  %59 = load i32* %58, align 4, !tbaa !36
  %60 = trunc i64 %indvars.iv.next to i32
  %61 = icmp sgt i32 %60, %59
  br i1 %61, label %22, label %_ZN7Minisat6Solver14insertVarOrderEi.exit._crit_edge

_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread.i: ; preds = %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.i, %50
  %62 = load i8** %20, align 8, !tbaa !102
  %63 = getelementptr inbounds i8* %62, i64 %27
  %64 = load i8* %63, align 1, !tbaa !59
  %65 = icmp eq i8 %64, 0
  br i1 %65, label %_ZN7Minisat6Solver14insertVarOrderEi.exit.backedge, label %66

; <label>:66                                      ; preds = %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread.i
  tail call void @_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE6insertEi(%"class.Minisat::Heap"* %17, i32 %26)
  br label %_ZN7Minisat6Solver14insertVarOrderEi.exit.backedge

_ZN7Minisat6Solver14insertVarOrderEi.exit._crit_edge: ; preds = %_ZN7Minisat6Solver14insertVarOrderEi.exit.backedge, %4
  %67 = phi i32* [ %9, %4 ], [ %57, %_ZN7Minisat6Solver14insertVarOrderEi.exit.backedge ]
  %.lcssa5 = phi i32 [ %11, %4 ], [ %59, %_ZN7Minisat6Solver14insertVarOrderEi.exit.backedge ]
  %68 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 44
  store i32 %.lcssa5, i32* %68, align 4, !tbaa !124
  %69 = getelementptr inbounds i32* %67, i64 %7
  %70 = load i32* %69, align 4, !tbaa !36
  %71 = icmp slt i32 %70, 0
  br i1 %71, label %75, label %.preheader.i2, !prof !123

.preheader.i2:                                    ; preds = %_ZN7Minisat6Solver14insertVarOrderEi.exit._crit_edge
  %72 = load i32* %5, align 4, !tbaa !61
  %73 = sub nsw i32 %72, %70
  %74 = icmp sgt i32 %73, 0
  br i1 %74, label %.lr.ph.i3, label %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit

.lr.ph.i3:                                        ; preds = %.preheader.i2
  store i32 %70, i32* %5, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit

; <label>:75                                      ; preds = %_ZN7Minisat6Solver14insertVarOrderEi.exit._crit_edge
  tail call void @__assert_rtn(i8* getelementptr inbounds ([7 x i8]* @__func__._ZN7Minisat3vecIjE6shrinkEi, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 64, i8* getelementptr inbounds ([13 x i8]* @.str59, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit:          ; preds = %.lr.ph.i3, %.preheader.i2
  %76 = icmp slt i32 %level, 0
  br i1 %76, label %80, label %.preheader.i, !prof !123

.preheader.i:                                     ; preds = %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit
  %77 = load i32* %1, align 4, !tbaa !98
  %78 = sub nsw i32 %77, %level
  %79 = icmp sgt i32 %78, 0
  br i1 %79, label %.lr.ph.i, label %_ZN7Minisat3vecIiE6shrinkEi.exit

.lr.ph.i:                                         ; preds = %.preheader.i
  store i32 %level, i32* %1, align 4, !tbaa !98
  br label %_ZN7Minisat3vecIiE6shrinkEi.exit

; <label>:80                                      ; preds = %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit
  tail call void @__assert_rtn(i8* getelementptr inbounds ([7 x i8]* @__func__._ZN7Minisat3vecIjE6shrinkEi, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 64, i8* getelementptr inbounds ([13 x i8]* @.str59, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat3vecIiE6shrinkEi.exit:                 ; preds = %.lr.ph.i, %.preheader.i, %0
  ret void
}

; Function Attrs: ssp uwtable
define i32 @_ZN7Minisat6Solver13pickBranchLitEv(%"class.Minisat::Solver"* nocapture %this) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 7
  %2 = load double* %1, align 8, !tbaa !72
  %3 = fmul double %2, 1.389796e+06
  %4 = fdiv double %3, 0x41DFFFFFFFC00000
  %5 = fptosi double %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = fmul double %6, 0x41DFFFFFFFC00000
  %8 = fsub double %3, %7
  store double %8, double* %1, align 8, !tbaa !72
  %9 = fdiv double %8, 0x41DFFFFFFFC00000
  %10 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 6
  %11 = load double* %10, align 8, !tbaa !75
  %12 = fcmp olt double %9, %11
  %13 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 1, i32 1
  br i1 %12, label %14, label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE9removeMinEv.exit.preheader

; <label>:14                                      ; preds = %0
  %15 = load i32* %13, align 4, !tbaa !98
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE9removeMinEv.exit.preheader, label %17

; <label>:17                                      ; preds = %14
  %18 = fmul double %8, 1.389796e+06
  %19 = fdiv double %18, 0x41DFFFFFFFC00000
  %20 = fptosi double %19 to i32
  %21 = sitofp i32 %20 to double
  %22 = fmul double %21, 0x41DFFFFFFFC00000
  %23 = fsub double %18, %22
  store double %23, double* %1, align 8, !tbaa !72
  %24 = fdiv double %23, 0x41DFFFFFFFC00000
  %25 = sitofp i32 %15 to double
  %26 = fmul double %25, %24
  %27 = fptosi double %26 to i32
  %28 = icmp sgt i32 %15, %27
  br i1 %28, label %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEEixEi.exit, label %29, !prof !122

; <label>:29                                      ; preds = %17
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([46 x i8]* @.str64, i64 0, i64 0), i32 81, i8* getelementptr inbounds ([20 x i8]* @.str65, i64 0, i64 0)) #16
  unreachable

_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEEixEi.exit: ; preds = %17
  %30 = sext i32 %27 to i64
  %31 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 1, i32 0
  %32 = load i32** %31, align 8, !tbaa !97
  %33 = getelementptr inbounds i32* %32, i64 %30
  %34 = load i32* %33, align 4, !tbaa !36
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %37 = load %"class.Minisat::lbool"** %36, align 8, !tbaa !65
  %38 = getelementptr inbounds %"class.Minisat::lbool"* %37, i64 %35, i32 0
  %39 = load i8* %38, align 1
  %40 = and i8 %39, 2
  %41 = icmp eq i8 %40, 0
  br i1 %41, label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE9removeMinEv.exit.preheader, label %42

; <label>:42                                      ; preds = %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEEixEi.exit
  %43 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 40, i32 0
  %44 = load i8** %43, align 8, !tbaa !102
  %45 = getelementptr inbounds i8* %44, i64 %35
  %46 = load i8* %45, align 1, !tbaa !59
  %47 = icmp eq i8 %46, 0
  br i1 %47, label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE9removeMinEv.exit.preheader, label %48

; <label>:48                                      ; preds = %42
  %49 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 23
  %50 = load i64* %49, align 8, !tbaa !32
  %51 = add i64 %50, 1
  store i64 %51, i64* %49, align 8, !tbaa !32
  br label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE9removeMinEv.exit.preheader

_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE9removeMinEv.exit.preheader: ; preds = %48, %42, %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEEixEi.exit, %14, %0
  %next.0.ph = phi i32 [ %34, %48 ], [ -1, %14 ], [ %34, %42 ], [ %34, %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEEixEi.exit ], [ -1, %0 ]
  %52 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48
  %53 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 1, i32 0
  %54 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 2, i32 0
  %55 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %56 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 40, i32 0
  br label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE9removeMinEv.exit

_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE9removeMinEv.exit: ; preds = %89, %_ZN7Minisat3vecIiE3popEv.exit.i, %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE9removeMinEv.exit.preheader
  %next.0 = phi i32 [ %next.0.ph, %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE9removeMinEv.exit.preheader ], [ %74, %_ZN7Minisat3vecIiE3popEv.exit.i ], [ %74, %89 ]
  %57 = icmp eq i32 %next.0, -1
  br i1 %57, label %.critedge, label %58

; <label>:58                                      ; preds = %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE9removeMinEv.exit
  %59 = sext i32 %next.0 to i64
  %60 = load %"class.Minisat::lbool"** %55, align 8, !tbaa !65
  %61 = getelementptr inbounds %"class.Minisat::lbool"* %60, i64 %59, i32 0
  %62 = load i8* %61, align 1
  %63 = and i8 %62, 2
  %64 = icmp eq i8 %63, 0
  br i1 %64, label %.critedge, label %65

; <label>:65                                      ; preds = %58
  %66 = load i8** %56, align 8, !tbaa !102
  %67 = getelementptr inbounds i8* %66, i64 %59
  %68 = load i8* %67, align 1, !tbaa !59
  %69 = icmp eq i8 %68, 0
  br i1 %69, label %.critedge, label %90

.critedge:                                        ; preds = %65, %58, %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE9removeMinEv.exit
  %70 = load i32* %13, align 4, !tbaa !98
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %.thread, label %72

; <label>:72                                      ; preds = %.critedge
  %73 = load i32** %53, align 8, !tbaa !97
  %74 = load i32* %73, align 4, !tbaa !36
  %75 = add nsw i32 %70, -1
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32* %73, i64 %76
  %78 = load i32* %77, align 4, !tbaa !36
  store i32 %78, i32* %73, align 4, !tbaa !36
  %79 = sext i32 %78 to i64
  %80 = load i32** %54, align 8, !tbaa !97
  %81 = getelementptr inbounds i32* %80, i64 %79
  store i32 0, i32* %81, align 4, !tbaa !36
  %82 = sext i32 %74 to i64
  %83 = getelementptr inbounds i32* %80, i64 %82
  store i32 -1, i32* %83, align 4, !tbaa !36
  %84 = load i32* %13, align 4, !tbaa !98
  %85 = icmp slt i32 %84, 1
  br i1 %85, label %86, label %_ZN7Minisat3vecIiE3popEv.exit.i, !prof !123

; <label>:86                                      ; preds = %72
  tail call void @__assert_rtn(i8* getelementptr inbounds ([4 x i8]* @__func__._ZN7Minisat3vecINS_3LitEE3popEv, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 76, i8* getelementptr inbounds ([7 x i8]* @.str63, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat3vecIiE3popEv.exit.i:                  ; preds = %72
  %87 = add nsw i32 %84, -1
  store i32 %87, i32* %13, align 4, !tbaa !98
  %88 = icmp sgt i32 %87, 1
  br i1 %88, label %89, label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE9removeMinEv.exit

; <label>:89                                      ; preds = %_ZN7Minisat3vecIiE3popEv.exit.i
  tail call void @_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE13percolateDownEi(%"class.Minisat::Heap"* %52, i32 0)
  br label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE9removeMinEv.exit

; <label>:90                                      ; preds = %65
  %91 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 11
  %92 = load i8* %91, align 1, !tbaa !82, !range !78
  %93 = icmp eq i8 %92, 0
  br i1 %93, label %105, label %94

; <label>:94                                      ; preds = %90
  %95 = load double* %1, align 8, !tbaa !72
  %96 = fmul double %95, 1.389796e+06
  %97 = fdiv double %96, 0x41DFFFFFFFC00000
  %98 = fptosi double %97 to i32
  %99 = sitofp i32 %98 to double
  %100 = fmul double %99, 0x41DFFFFFFFC00000
  %101 = fsub double %96, %100
  store double %101, double* %1, align 8, !tbaa !72
  %102 = fdiv double %101, 0x41DFFFFFFFC00000
  %103 = fcmp olt double %102, 5.000000e-01
  %104 = zext i1 %103 to i32
  br label %111

; <label>:105                                     ; preds = %90
  %106 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 39, i32 0
  %107 = load i8** %106, align 8, !tbaa !102
  %108 = getelementptr inbounds i8* %107, i64 %59
  %109 = load i8* %108, align 1, !tbaa !59
  %110 = sext i8 %109 to i32
  br label %111

; <label>:111                                     ; preds = %105, %94
  %112 = phi i32 [ %104, %94 ], [ %110, %105 ]
  %113 = icmp ne i32 %112, 0
  %114 = shl nsw i32 %next.0, 1
  %115 = zext i1 %113 to i32
  %116 = or i32 %115, %114
  br label %.thread

.thread:                                          ; preds = %111, %.critedge
  %.sroa.0.0 = phi i32 [ %116, %111 ], [ -2, %.critedge ]
  ret i32 %.sroa.0.0
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6Solver7analyzeEjRNS_3vecINS_3LitEEERi(%"class.Minisat::Solver"* %this, i32 %confl, %"class.Minisat::vec.0"* %out_learnt, i32* nocapture %out_btlevel) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::vec.0"* %out_learnt, i64 0, i32 1
  %2 = load i32* %1, align 4, !tbaa !61
  %3 = getelementptr inbounds %"class.Minisat::vec.0"* %out_learnt, i64 0, i32 2
  %4 = load i32* %3, align 4, !tbaa !62
  %5 = icmp eq i32 %2, %4
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = add nsw i32 %2, 1
  tail call void @_ZN7Minisat3vecINS_3LitEE8capacityEi(%"class.Minisat::vec.0"* %out_learnt, i32 %7)
  %.pre.i = load i32* %1, align 4, !tbaa !61
  br label %8

; <label>:8                                       ; preds = %6, %0
  %9 = phi i32 [ %.pre.i, %6 ], [ %2, %0 ]
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds %"class.Minisat::vec.0"* %out_learnt, i64 0, i32 0
  %12 = load %"struct.Minisat::Lit"** %11, align 8, !tbaa !60
  %13 = getelementptr inbounds %"struct.Minisat::Lit"* %12, i64 %10
  %14 = icmp eq %"struct.Minisat::Lit"* %13, null
  br i1 %14, label %_ZN7Minisat3vecINS_3LitEE4pushEv.exit, label %15

; <label>:15                                      ; preds = %8
  %16 = getelementptr inbounds %"struct.Minisat::Lit"* %13, i64 0, i32 0
  store i32 0, i32* %16, align 4
  %.pre1.i = load i32* %1, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE4pushEv.exit

_ZN7Minisat3vecINS_3LitEE4pushEv.exit:            ; preds = %15, %8
  %17 = phi i32 [ %.pre1.i, %15 ], [ %9, %8 ]
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %1, align 4, !tbaa !61
  %19 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 1
  %20 = load i32* %19, align 4, !tbaa !61
  %21 = add nsw i32 %20, -1
  %22 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %23 = bitcast i8* %22 to i32*
  %24 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %25 = bitcast %"class.Minisat::ClauseAllocator"* %24 to i32**
  %26 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 0
  %27 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 53, i32 0
  %28 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 0
  %29 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 36
  %30 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 35, i32 0
  %31 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 1
  %32 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 2, i32 1
  %33 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 2, i32 0
  %34 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 1, i32 0
  %35 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48, i32 0, i32 0
  %36 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 1
  %37 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 34
  %38 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33, i32 1
  %39 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33, i32 0
  br label %40

; <label>:40                                      ; preds = %206, %_ZN7Minisat3vecINS_3LitEE4pushEv.exit
  %41 = phi i32 [ -2, %_ZN7Minisat3vecINS_3LitEE4pushEv.exit ], [ %200, %206 ]
  %index.0 = phi i32 [ %21, %_ZN7Minisat3vecINS_3LitEE4pushEv.exit ], [ %207, %206 ]
  %pathC.0 = phi i32 [ 0, %_ZN7Minisat3vecINS_3LitEE4pushEv.exit ], [ %211, %206 ]
  %.0 = phi i32 [ %confl, %_ZN7Minisat3vecINS_3LitEE4pushEv.exit ], [ %210, %206 ]
  %42 = icmp eq i32 %.0, -1
  br i1 %42, label %43, label %44, !prof !123

; <label>:43                                      ; preds = %40
  tail call void @__assert_rtn(i8* getelementptr inbounds ([8 x i8]* @__func__._ZN7Minisat6Solver7analyzeEjRNS_3vecINS_3LitEEERi, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 275, i8* getelementptr inbounds ([20 x i8]* @.str3535, i64 0, i64 0)) #16
  unreachable

; <label>:44                                      ; preds = %40
  %45 = load i32* %23, align 4, !tbaa !128
  %phitmp.i.i = icmp ugt i32 %45, %.0
  br i1 %phitmp.i.i, label %_ZN7Minisat15ClauseAllocatorixEj.exit, label %46, !prof !122

; <label>:46                                      ; preds = %44
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit:            ; preds = %44
  %47 = zext i32 %.0 to i64
  %48 = load i32** %25, align 8, !tbaa !119
  %49 = getelementptr inbounds i32* %48, i64 %47
  %50 = bitcast i32* %49 to %"class.Minisat::Clause"*
  %51 = load i32* %49, align 4
  %52 = and i32 %51, 4
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %_ZN7Minisat6Solver15claBumpActivityERNS_6ClauseE.exit, label %54

; <label>:54                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit
  %.lobit.i.i = and i32 %51, 8
  %55 = icmp eq i32 %.lobit.i.i, 0
  br i1 %55, label %56, label %_ZN7Minisat6Clause8activityEv.exit.i, !prof !123

; <label>:56                                      ; preds = %54
  tail call void @__assert_rtn(i8* getelementptr inbounds ([9 x i8]* @__func__._ZN7Minisat6Clause8activityEv, i64 0, i64 0), i8* getelementptr inbounds ([54 x i8]* @.str68, i64 0, i64 0), i32 181, i8* getelementptr inbounds ([17 x i8]* @.str69, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat6Clause8activityEv.exit.i:             ; preds = %54
  %57 = load double* %37, align 8, !tbaa !92
  %58 = lshr i32 %51, 5
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds %"class.Minisat::Clause"* %50, i64 0, i32 1, i64 %59
  %61 = bitcast %union.anon* %60 to float*
  %62 = load float* %61, align 4, !tbaa !136
  %63 = fpext float %62 to double
  %64 = fadd double %57, %63
  %65 = fptrunc double %64 to float
  store float %65, float* %61, align 4, !tbaa !136
  %66 = fpext float %65 to double
  %67 = fcmp ogt double %66, 1.000000e+20
  br i1 %67, label %.preheader.i29, label %_ZN7Minisat6Solver15claBumpActivityERNS_6ClauseE.exit

.preheader.i29:                                   ; preds = %_ZN7Minisat6Clause8activityEv.exit.i
  %68 = load i32* %38, align 4, !tbaa !64
  %69 = icmp sgt i32 %68, 0
  br i1 %69, label %.lr.ph.i31, label %._crit_edge.i

.lr.ph.i31:                                       ; preds = %.preheader.i29
  %.pre.i30 = load i32** %39, align 8, !tbaa !117
  br label %70

; <label>:70                                      ; preds = %_ZN7Minisat6Clause8activityEv.exit2.i, %.lr.ph.i31
  %indvars.iv.i = phi i64 [ 0, %.lr.ph.i31 ], [ %indvars.iv.next.i, %_ZN7Minisat6Clause8activityEv.exit2.i ]
  %71 = getelementptr inbounds i32* %.pre.i30, i64 %indvars.iv.i
  %72 = load i32* %71, align 4, !tbaa !36
  %phitmp.i.i.i = icmp ugt i32 %45, %72
  br i1 %phitmp.i.i.i, label %_ZN7Minisat15ClauseAllocatorixEj.exit.i, label %73, !prof !122

; <label>:73                                      ; preds = %70
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit.i:          ; preds = %70
  %74 = zext i32 %72 to i64
  %75 = getelementptr inbounds i32* %48, i64 %74
  %76 = load i32* %75, align 4
  %.lobit.i1.i = and i32 %76, 8
  %77 = icmp eq i32 %.lobit.i1.i, 0
  br i1 %77, label %78, label %_ZN7Minisat6Clause8activityEv.exit2.i, !prof !123

; <label>:78                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit.i
  tail call void @__assert_rtn(i8* getelementptr inbounds ([9 x i8]* @__func__._ZN7Minisat6Clause8activityEv, i64 0, i64 0), i8* getelementptr inbounds ([54 x i8]* @.str68, i64 0, i64 0), i32 181, i8* getelementptr inbounds ([17 x i8]* @.str69, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat6Clause8activityEv.exit2.i:            ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit.i
  %79 = bitcast i32* %75 to %"class.Minisat::Clause"*
  %80 = lshr i32 %76, 5
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds %"class.Minisat::Clause"* %79, i64 0, i32 1, i64 %81
  %83 = bitcast %union.anon* %82 to float*
  %84 = load float* %83, align 4, !tbaa !136
  %85 = fpext float %84 to double
  %86 = fmul double %85, 1.000000e-20
  %87 = fptrunc double %86 to float
  store float %87, float* %83, align 4, !tbaa !136
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %88 = trunc i64 %indvars.iv.next.i to i32
  %89 = icmp slt i32 %88, %68
  br i1 %89, label %70, label %._crit_edge.i

._crit_edge.i:                                    ; preds = %_ZN7Minisat6Clause8activityEv.exit2.i, %.preheader.i29
  %90 = fmul double %57, 1.000000e-20
  store double %90, double* %37, align 8, !tbaa !92
  br label %_ZN7Minisat6Solver15claBumpActivityERNS_6ClauseE.exit

_ZN7Minisat6Solver15claBumpActivityERNS_6ClauseE.exit: ; preds = %._crit_edge.i, %_ZN7Minisat6Clause8activityEv.exit.i, %_ZN7Minisat15ClauseAllocatorixEj.exit
  %91 = icmp ne i32 %41, -2
  %92 = zext i1 %91 to i32
  %93 = load i32* %49, align 4
  %94 = lshr i32 %93, 5
  %95 = icmp ult i32 %92, %94
  br i1 %95, label %.lr.ph73, label %.loopexit70

.lr.ph73:                                         ; preds = %_ZN7Minisat6Solver15claBumpActivityERNS_6ClauseE.exit
  %96 = zext i1 %91 to i64
  br label %97

; <label>:97                                      ; preds = %190, %.lr.ph73
  %indvars.iv102 = phi i64 [ %96, %.lr.ph73 ], [ %indvars.iv.next103, %190 ]
  %pathC.172 = phi i32 [ %pathC.0, %.lr.ph73 ], [ %pathC.2, %190 ]
  %j.071 = phi i32 [ %92, %.lr.ph73 ], [ %191, %190 ]
  %98 = getelementptr inbounds %"class.Minisat::Clause"* %50, i64 0, i32 1, i64 %indvars.iv102, i32 0, i32 0
  %99 = load i32* %98, align 4, !tbaa !36
  %100 = ashr i32 %99, 1
  %101 = sext i32 %100 to i64
  %102 = load i8** %27, align 8, !tbaa !102
  %103 = getelementptr inbounds i8* %102, i64 %101
  %104 = load i8* %103, align 1, !tbaa !59
  %105 = icmp eq i8 %104, 0
  br i1 %105, label %106, label %190

; <label>:106                                     ; preds = %97
  %107 = load %"struct.Minisat::Solver::VarData"** %28, align 8, !tbaa !100
  %108 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %107, i64 %101, i32 1
  %109 = load i32* %108, align 4, !tbaa !138
  %110 = icmp sgt i32 %109, 0
  br i1 %110, label %111, label %190

; <label>:111                                     ; preds = %106
  %112 = load double* %29, align 8, !tbaa !93
  %113 = load double** %30, align 8, !tbaa !114
  %114 = getelementptr inbounds double* %113, i64 %101
  %115 = load double* %114, align 8, !tbaa !72
  %116 = fadd double %112, %115
  store double %116, double* %114, align 8, !tbaa !72
  %117 = fcmp ogt double %116, 1.000000e+100
  br i1 %117, label %.preheader.i.i37, label %137

.preheader.i.i37:                                 ; preds = %111
  %118 = load i32* %31, align 4, !tbaa !63
  %119 = icmp sgt i32 %118, 0
  br i1 %119, label %.lr.ph.i.i40.preheader, label %._crit_edge.i.i41

.lr.ph.i.i40.preheader:                           ; preds = %.preheader.i.i37
  %120 = add i32 %118, -1
  %121 = zext i32 %120 to i64
  %122 = add i64 %121, 1
  %end.idx = add i64 %121, 1
  %n.vec = and i64 %122, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %.lr.ph.i.i40.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph.i.i40.preheader ]
  %123 = getelementptr inbounds double* %113, i64 %index
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load = load <2 x double>* %124, align 8
  %.sum127 = or i64 %index, 2
  %125 = getelementptr double* %113, i64 %.sum127
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load124 = load <2 x double>* %126, align 8
  %127 = fmul <2 x double> %wide.load, <double 1.000000e-100, double 1.000000e-100>
  %128 = fmul <2 x double> %wide.load124, <double 1.000000e-100, double 1.000000e-100>
  %129 = bitcast double* %123 to <2 x double>*
  store <2 x double> %127, <2 x double>* %129, align 8
  %130 = bitcast double* %125 to <2 x double>*
  store <2 x double> %128, <2 x double>* %130, align 8
  %index.next = add i64 %index, 4
  %131 = icmp eq i64 %index.next, %n.vec
  br i1 %131, label %middle.block, label %vector.body, !llvm.loop !139

middle.block:                                     ; preds = %vector.body, %.lr.ph.i.i40.preheader
  %resume.val = phi i64 [ 0, %.lr.ph.i.i40.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge.i.i41, label %.lr.ph.i.i40

.lr.ph.i.i40:                                     ; preds = %.lr.ph.i.i40, %middle.block
  %indvars.iv.i.i38 = phi i64 [ %indvars.iv.next.i.i39, %.lr.ph.i.i40 ], [ %resume.val, %middle.block ]
  %132 = getelementptr inbounds double* %113, i64 %indvars.iv.i.i38
  %133 = load double* %132, align 8, !tbaa !72
  %134 = fmul double %133, 1.000000e-100
  store double %134, double* %132, align 8, !tbaa !72
  %indvars.iv.next.i.i39 = add nuw nsw i64 %indvars.iv.i.i38, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i.i39 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %118
  br i1 %exitcond, label %._crit_edge.i.i41, label %.lr.ph.i.i40, !llvm.loop !142

._crit_edge.i.i41:                                ; preds = %.lr.ph.i.i40, %middle.block, %.preheader.i.i37
  %135 = load double* %29, align 8, !tbaa !93
  %136 = fmul double %135, 1.000000e-100
  store double %136, double* %29, align 8, !tbaa !93
  br label %137

; <label>:137                                     ; preds = %._crit_edge.i.i41, %111
  %138 = load i32* %32, align 4, !tbaa !98
  %139 = icmp sgt i32 %138, %100
  br i1 %139, label %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.i.i, label %_ZN7Minisat6Solver15varBumpActivityEi.exit

_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.i.i: ; preds = %137
  %140 = load i32** %33, align 8, !tbaa !97
  %141 = getelementptr inbounds i32* %140, i64 %101
  %142 = load i32* %141, align 4, !tbaa !36
  %143 = icmp sgt i32 %142, -1
  br i1 %143, label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE8decreaseEi.exit.i.i, label %_ZN7Minisat6Solver15varBumpActivityEi.exit

_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE8decreaseEi.exit.i.i: ; preds = %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.i.i
  %144 = sext i32 %142 to i64
  %145 = load i32** %34, align 8, !tbaa !97
  %146 = getelementptr inbounds i32* %145, i64 %144
  %147 = load i32* %146, align 4, !tbaa !36
  %148 = icmp eq i32 %142, 0
  %.pre.i.i.i = sext i32 %147 to i64
  br i1 %148, label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE11percolateUpEi.exit.i.i, label %.lr.ph.i.i.i

.lr.ph.i.i.i:                                     ; preds = %162, %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE8decreaseEi.exit.i.i
  %.in.in.i.i.i = phi i32 [ %149, %162 ], [ %142, %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE8decreaseEi.exit.i.i ]
  %.in.i.i.i = add nsw i32 %.in.in.i.i.i, -1
  %149 = ashr i32 %.in.i.i.i, 1
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i32* %145, i64 %150
  %152 = load i32* %151, align 4, !tbaa !36
  %153 = load %"class.Minisat::vec.2"** %35, align 8, !tbaa !59
  %154 = getelementptr inbounds %"class.Minisat::vec.2"* %153, i64 0, i32 0
  %155 = load double** %154, align 8, !tbaa !114
  %156 = getelementptr inbounds double* %155, i64 %.pre.i.i.i
  %157 = load double* %156, align 8, !tbaa !72
  %158 = sext i32 %152 to i64
  %159 = getelementptr inbounds double* %155, i64 %158
  %160 = load double* %159, align 8, !tbaa !72
  %161 = fcmp ogt double %157, %160
  br i1 %161, label %162, label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE11percolateUpEi.exit.i.i

; <label>:162                                     ; preds = %.lr.ph.i.i.i
  %163 = sext i32 %.in.in.i.i.i to i64
  %164 = getelementptr inbounds i32* %145, i64 %163
  store i32 %152, i32* %164, align 4, !tbaa !36
  %165 = load i32* %151, align 4, !tbaa !36
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i32* %140, i64 %166
  store i32 %.in.in.i.i.i, i32* %167, align 4, !tbaa !36
  %168 = icmp eq i32 %149, 0
  br i1 %168, label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE11percolateUpEi.exit.i.i, label %.lr.ph.i.i.i

_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE11percolateUpEi.exit.i.i: ; preds = %162, %.lr.ph.i.i.i, %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE8decreaseEi.exit.i.i
  %.sink.in.lcssa.i.i.i = phi i32 [ 0, %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE8decreaseEi.exit.i.i ], [ 0, %162 ], [ %.in.in.i.i.i, %.lr.ph.i.i.i ]
  %169 = sext i32 %.sink.in.lcssa.i.i.i to i64
  %170 = getelementptr inbounds i32* %145, i64 %169
  store i32 %147, i32* %170, align 4, !tbaa !36
  %171 = getelementptr inbounds i32* %140, i64 %.pre.i.i.i
  store i32 %.sink.in.lcssa.i.i.i, i32* %171, align 4, !tbaa !36
  br label %_ZN7Minisat6Solver15varBumpActivityEi.exit

_ZN7Minisat6Solver15varBumpActivityEi.exit:       ; preds = %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE11percolateUpEi.exit.i.i, %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.i.i, %137
  store i8 1, i8* %103, align 1, !tbaa !59
  %172 = load %"struct.Minisat::Solver::VarData"** %28, align 8, !tbaa !100
  %173 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %172, i64 %101, i32 1
  %174 = load i32* %173, align 4, !tbaa !138
  %175 = load i32* %36, align 4, !tbaa !98
  %176 = icmp slt i32 %174, %175
  br i1 %176, label %179, label %177

; <label>:177                                     ; preds = %_ZN7Minisat6Solver15varBumpActivityEi.exit
  %178 = add nsw i32 %pathC.172, 1
  br label %190

; <label>:179                                     ; preds = %_ZN7Minisat6Solver15varBumpActivityEi.exit
  %180 = load i32* %1, align 4, !tbaa !61
  %181 = load i32* %3, align 4, !tbaa !62
  %182 = icmp eq i32 %180, %181
  br i1 %182, label %183, label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit

; <label>:183                                     ; preds = %179
  %184 = add nsw i32 %180, 1
  tail call void @_ZN7Minisat3vecINS_3LitEE8capacityEi(%"class.Minisat::vec.0"* %out_learnt, i32 %184)
  %.pre.i36 = load i32* %1, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit

_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit:        ; preds = %183, %179
  %185 = phi i32 [ %.pre.i36, %183 ], [ %180, %179 ]
  %186 = add nsw i32 %185, 1
  store i32 %186, i32* %1, align 4, !tbaa !61
  %187 = sext i32 %185 to i64
  %188 = load %"struct.Minisat::Lit"** %11, align 8, !tbaa !60
  %189 = getelementptr inbounds %"struct.Minisat::Lit"* %188, i64 %187, i32 0
  store i32 %99, i32* %189, align 4, !tbaa !36
  br label %190

; <label>:190                                     ; preds = %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit, %177, %106, %97
  %pathC.2 = phi i32 [ %pathC.172, %97 ], [ %178, %177 ], [ %pathC.172, %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit ], [ %pathC.172, %106 ]
  %191 = add nsw i32 %j.071, 1
  %192 = load i32* %49, align 4
  %193 = lshr i32 %192, 5
  %194 = icmp slt i32 %191, %193
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  br i1 %194, label %97, label %.loopexit70

.loopexit70:                                      ; preds = %190, %_ZN7Minisat6Solver15claBumpActivityERNS_6ClauseE.exit
  %pathC.1.lcssa = phi i32 [ %pathC.0, %_ZN7Minisat6Solver15claBumpActivityERNS_6ClauseE.exit ], [ %pathC.2, %190 ]
  %195 = load %"struct.Minisat::Lit"** %26, align 8, !tbaa !60
  %196 = load i8** %27, align 8, !tbaa !102
  %197 = sext i32 %index.0 to i64
  br label %198

; <label>:198                                     ; preds = %198, %.loopexit70
  %indvars.iv108 = phi i64 [ %197, %.loopexit70 ], [ %indvars.iv.next109, %198 ]
  %indvars.iv.next109 = add nsw i64 %indvars.iv108, -1
  %199 = getelementptr inbounds %"struct.Minisat::Lit"* %195, i64 %indvars.iv108, i32 0
  %200 = load i32* %199, align 4
  %201 = ashr i32 %200, 1
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds i8* %196, i64 %202
  %204 = load i8* %203, align 1, !tbaa !59
  %205 = icmp eq i8 %204, 0
  br i1 %205, label %198, label %206

; <label>:206                                     ; preds = %198
  %207 = trunc i64 %indvars.iv.next109 to i32
  %208 = load %"struct.Minisat::Solver::VarData"** %28, align 8, !tbaa !100
  %209 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %208, i64 %202, i32 0
  %210 = load i32* %209, align 4, !tbaa !133
  store i8 0, i8* %203, align 1, !tbaa !59
  %211 = add nsw i32 %pathC.1.lcssa, -1
  %212 = icmp sgt i32 %211, 0
  br i1 %212, label %40, label %213

; <label>:213                                     ; preds = %206
  %214 = load %"struct.Minisat::Lit"** %11, align 8, !tbaa !60
  %215 = xor i32 %200, 1
  %216 = getelementptr inbounds %"struct.Minisat::Lit"* %214, i64 0, i32 0
  store i32 %215, i32* %216, align 4
  %217 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 55
  %218 = getelementptr inbounds %"class.Minisat::vec.0"* %217, i64 0, i32 0
  %219 = load %"struct.Minisat::Lit"** %218, align 8, !tbaa !60
  %220 = icmp eq %"struct.Minisat::Lit"* %219, null
  %.phi.trans.insert.i = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 55, i32 1
  br i1 %220, label %._ZN7Minisat3vecINS_3LitEE5clearEb.exit_crit_edge.i, label %.preheader.i.i

._ZN7Minisat3vecINS_3LitEE5clearEb.exit_crit_edge.i: ; preds = %213
  %.pre.i32 = load i32* %.phi.trans.insert.i, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE5clearEb.exit.i

.preheader.i.i:                                   ; preds = %213
  store i32 0, i32* %.phi.trans.insert.i, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE5clearEb.exit.i

_ZN7Minisat3vecINS_3LitEE5clearEb.exit.i:         ; preds = %.preheader.i.i, %._ZN7Minisat3vecINS_3LitEE5clearEb.exit_crit_edge.i
  %221 = phi i32 [ %.pre.i32, %._ZN7Minisat3vecINS_3LitEE5clearEb.exit_crit_edge.i ], [ 0, %.preheader.i.i ]
  %222 = load i32* %1, align 4, !tbaa !61
  %223 = icmp slt i32 %221, %222
  br i1 %223, label %224, label %_ZN7Minisat3vecINS_3LitEE6growToEi.exit.preheader.i

; <label>:224                                     ; preds = %_ZN7Minisat3vecINS_3LitEE5clearEb.exit.i
  tail call void @_ZN7Minisat3vecINS_3LitEE8capacityEi(%"class.Minisat::vec.0"* %217, i32 %222)
  %225 = load i32* %.phi.trans.insert.i, align 4, !tbaa !61
  %226 = icmp slt i32 %225, %222
  br i1 %226, label %.lr.ph.i.i, label %._crit_edge.i.i

.lr.ph.i.i:                                       ; preds = %224
  %227 = sext i32 %225 to i64
  br label %228

; <label>:228                                     ; preds = %234, %.lr.ph.i.i
  %indvars.iv.i.i = phi i64 [ %227, %.lr.ph.i.i ], [ %indvars.iv.next.i.i, %234 ]
  %229 = load %"struct.Minisat::Lit"** %218, align 8, !tbaa !60
  %230 = getelementptr inbounds %"struct.Minisat::Lit"* %229, i64 %indvars.iv.i.i
  %231 = icmp eq %"struct.Minisat::Lit"* %230, null
  br i1 %231, label %234, label %232

; <label>:232                                     ; preds = %228
  %233 = getelementptr inbounds %"struct.Minisat::Lit"* %230, i64 0, i32 0
  store i32 0, i32* %233, align 4
  br label %234

; <label>:234                                     ; preds = %232, %228
  %indvars.iv.next.i.i = add nsw i64 %indvars.iv.i.i, 1
  %235 = trunc i64 %indvars.iv.next.i.i to i32
  %236 = icmp slt i32 %235, %222
  br i1 %236, label %228, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %234, %224
  store i32 %222, i32* %.phi.trans.insert.i, align 4, !tbaa !61
  %.pre2.i = load i32* %1, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE6growToEi.exit.preheader.i

_ZN7Minisat3vecINS_3LitEE6growToEi.exit.preheader.i: ; preds = %._crit_edge.i.i, %_ZN7Minisat3vecINS_3LitEE5clearEb.exit.i
  %237 = phi i32 [ %222, %_ZN7Minisat3vecINS_3LitEE5clearEb.exit.i ], [ %.pre2.i, %._crit_edge.i.i ]
  %238 = icmp sgt i32 %237, 0
  br i1 %238, label %.lr.ph.i33, label %_ZNK7Minisat3vecINS_3LitEE6copyToERS2_.exit

.lr.ph.i33:                                       ; preds = %_ZN7Minisat3vecINS_3LitEE6growToEi.exit.preheader.i
  %239 = load %"struct.Minisat::Lit"** %218, align 8, !tbaa !60
  %240 = load %"struct.Minisat::Lit"** %11, align 8, !tbaa !60
  br label %_ZN7Minisat3vecINS_3LitEE6growToEi.exit.i

_ZN7Minisat3vecINS_3LitEE6growToEi.exit.i:        ; preds = %_ZN7Minisat3vecINS_3LitEE6growToEi.exit.i, %.lr.ph.i33
  %indvars.iv.i34 = phi i64 [ 0, %.lr.ph.i33 ], [ %indvars.iv.next.i35, %_ZN7Minisat3vecINS_3LitEE6growToEi.exit.i ]
  %241 = getelementptr inbounds %"struct.Minisat::Lit"* %240, i64 %indvars.iv.i34, i32 0
  %242 = load i32* %241, align 4, !tbaa !36
  %243 = getelementptr inbounds %"struct.Minisat::Lit"* %239, i64 %indvars.iv.i34, i32 0
  store i32 %242, i32* %243, align 4, !tbaa !36
  %indvars.iv.next.i35 = add nuw nsw i64 %indvars.iv.i34, 1
  %244 = load i32* %1, align 4, !tbaa !61
  %245 = trunc i64 %indvars.iv.next.i35 to i32
  %246 = icmp slt i32 %245, %244
  br i1 %246, label %_ZN7Minisat3vecINS_3LitEE6growToEi.exit.i, label %_ZNK7Minisat3vecINS_3LitEE6copyToERS2_.exit

_ZNK7Minisat3vecINS_3LitEE6copyToERS2_.exit:      ; preds = %_ZN7Minisat3vecINS_3LitEE6growToEi.exit.i, %_ZN7Minisat3vecINS_3LitEE6growToEi.exit.preheader.i
  %247 = phi i32 [ %237, %_ZN7Minisat3vecINS_3LitEE6growToEi.exit.preheader.i ], [ %244, %_ZN7Minisat3vecINS_3LitEE6growToEi.exit.i ]
  %248 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 9
  %249 = load i32* %248, align 4, !tbaa !80
  switch i32 %249, label %.loopexit [
    i32 2, label %.preheader53
    i32 1, label %.preheader61
  ]

.preheader61:                                     ; preds = %_ZNK7Minisat3vecINS_3LitEE6copyToERS2_.exit
  %250 = icmp sgt i32 %247, 1
  br i1 %250, label %.lr.ph67, label %.loopexit

.lr.ph67:                                         ; preds = %.preheader61
  %.pre113 = load %"struct.Minisat::Lit"** %11, align 8, !tbaa !60
  br label %287

.preheader53:                                     ; preds = %_ZNK7Minisat3vecINS_3LitEE6copyToERS2_.exit
  %251 = icmp sgt i32 %247, 1
  br i1 %251, label %.lr.ph56, label %.loopexit

.lr.ph56:                                         ; preds = %.preheader53
  %252 = load %"struct.Minisat::Lit"** %11, align 8, !tbaa !60
  %253 = load %"struct.Minisat::Solver::VarData"** %28, align 8, !tbaa !100
  br label %254

.preheader47:                                     ; preds = %254
  br i1 %251, label %.lr.ph50, label %.loopexit

; <label>:254                                     ; preds = %254, %.lr.ph56
  %indvars.iv95 = phi i64 [ 1, %.lr.ph56 ], [ %indvars.iv.next96, %254 ]
  %abstract_level.054 = phi i32 [ 0, %.lr.ph56 ], [ %263, %254 ]
  %255 = getelementptr inbounds %"struct.Minisat::Lit"* %252, i64 %indvars.iv95, i32 0
  %256 = load i32* %255, align 4
  %257 = ashr i32 %256, 1
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %253, i64 %258, i32 1
  %260 = load i32* %259, align 4, !tbaa !138
  %261 = and i32 %260, 31
  %262 = shl i32 1, %261
  %263 = or i32 %262, %abstract_level.054
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %264 = trunc i64 %indvars.iv.next96 to i32
  %265 = icmp slt i32 %264, %247
  br i1 %265, label %254, label %.preheader47

.lr.ph50:                                         ; preds = %283, %.preheader47
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %283 ], [ 1, %.preheader47 ]
  %j1.048 = phi i32 [ %j1.1, %283 ], [ 1, %.preheader47 ]
  %266 = load %"struct.Minisat::Lit"** %11, align 8, !tbaa !60
  %267 = getelementptr inbounds %"struct.Minisat::Lit"* %266, i64 %indvars.iv93, i32 0
  %268 = load i32* %267, align 4
  %269 = ashr i32 %268, 1
  %270 = sext i32 %269 to i64
  %271 = load %"struct.Minisat::Solver::VarData"** %28, align 8, !tbaa !100
  %272 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %271, i64 %270, i32 0
  %273 = load i32* %272, align 4, !tbaa !133
  %274 = icmp eq i32 %273, -1
  br i1 %274, label %277, label %275

; <label>:275                                     ; preds = %.lr.ph50
  %276 = tail call zeroext i1 @_ZN7Minisat6Solver12litRedundantENS_3LitEj(%"class.Minisat::Solver"* %this, i32 %268, i32 %263)
  br i1 %276, label %283, label %._crit_edge110

._crit_edge110:                                   ; preds = %275
  %.pre111 = load %"struct.Minisat::Lit"** %11, align 8, !tbaa !60
  %.phi.trans.insert = getelementptr inbounds %"struct.Minisat::Lit"* %.pre111, i64 %indvars.iv93, i32 0
  %.pre112 = load i32* %.phi.trans.insert, align 4, !tbaa !36
  br label %277

; <label>:277                                     ; preds = %._crit_edge110, %.lr.ph50
  %278 = phi i32 [ %.pre112, %._crit_edge110 ], [ %268, %.lr.ph50 ]
  %279 = phi %"struct.Minisat::Lit"* [ %.pre111, %._crit_edge110 ], [ %266, %.lr.ph50 ]
  %280 = add nsw i32 %j1.048, 1
  %281 = sext i32 %j1.048 to i64
  %282 = getelementptr inbounds %"struct.Minisat::Lit"* %279, i64 %281, i32 0
  store i32 %278, i32* %282, align 4, !tbaa !36
  br label %283

; <label>:283                                     ; preds = %277, %275
  %j1.1 = phi i32 [ %280, %277 ], [ %j1.048, %275 ]
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %284 = load i32* %1, align 4, !tbaa !61
  %285 = trunc i64 %indvars.iv.next94 to i32
  %286 = icmp slt i32 %285, %284
  br i1 %286, label %.lr.ph50, label %.loopexit

; <label>:287                                     ; preds = %.loopexit58, %.lr.ph67
  %indvars.iv100 = phi i64 [ 1, %.lr.ph67 ], [ %indvars.iv.next101, %.loopexit58 ]
  %j1.265 = phi i32 [ 1, %.lr.ph67 ], [ %j1.3, %.loopexit58 ]
  %288 = getelementptr inbounds %"struct.Minisat::Lit"* %.pre113, i64 %indvars.iv100, i32 0
  %289 = load i32* %288, align 4
  %290 = ashr i32 %289, 1
  %291 = sext i32 %290 to i64
  %292 = load %"struct.Minisat::Solver::VarData"** %28, align 8, !tbaa !100
  %293 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %292, i64 %291, i32 0
  %294 = load i32* %293, align 4, !tbaa !133
  %295 = icmp eq i32 %294, -1
  br i1 %295, label %296, label %300

; <label>:296                                     ; preds = %287
  %297 = add nsw i32 %j1.265, 1
  %298 = sext i32 %j1.265 to i64
  %299 = getelementptr inbounds %"struct.Minisat::Lit"* %.pre113, i64 %298, i32 0
  store i32 %289, i32* %299, align 4, !tbaa !36
  br label %.loopexit58

; <label>:300                                     ; preds = %287
  %301 = load i32* %23, align 4, !tbaa !128
  %phitmp.i.i27 = icmp ugt i32 %301, %294
  br i1 %phitmp.i.i27, label %_ZN7Minisat15ClauseAllocatorixEj.exit28, label %302, !prof !122

; <label>:302                                     ; preds = %300
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit28:          ; preds = %300
  %303 = zext i32 %294 to i64
  %304 = load i32** %25, align 8, !tbaa !119
  %305 = getelementptr inbounds i32* %304, i64 %303
  %306 = bitcast i32* %305 to %"class.Minisat::Clause"*
  %307 = load i32* %305, align 4
  %308 = icmp ugt i32 %307, 63
  br i1 %308, label %.lr.ph60, label %.loopexit58

.lr.ph60:                                         ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit28
  %309 = load i8** %27, align 8, !tbaa !102
  br label %310

; <label>:310                                     ; preds = %326, %.lr.ph60
  %indvars.iv97 = phi i64 [ 1, %.lr.ph60 ], [ %indvars.iv.next98, %326 ]
  %311 = getelementptr inbounds %"class.Minisat::Clause"* %306, i64 0, i32 1, i64 %indvars.iv97, i32 0, i32 0
  %312 = load i32* %311, align 4
  %313 = ashr i32 %312, 1
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds i8* %309, i64 %314
  %316 = load i8* %315, align 1, !tbaa !59
  %317 = icmp eq i8 %316, 0
  br i1 %317, label %318, label %326

; <label>:318                                     ; preds = %310
  %319 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %292, i64 %314, i32 1
  %320 = load i32* %319, align 4, !tbaa !138
  %321 = icmp sgt i32 %320, 0
  br i1 %321, label %322, label %326

; <label>:322                                     ; preds = %318
  %323 = add nsw i32 %j1.265, 1
  %324 = sext i32 %j1.265 to i64
  %325 = getelementptr inbounds %"struct.Minisat::Lit"* %.pre113, i64 %324, i32 0
  store i32 %289, i32* %325, align 4, !tbaa !36
  br label %.loopexit58

; <label>:326                                     ; preds = %318, %310
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %327 = lshr i32 %307, 5
  %328 = trunc i64 %indvars.iv.next98 to i32
  %329 = icmp slt i32 %328, %327
  br i1 %329, label %310, label %.loopexit58

.loopexit58:                                      ; preds = %326, %322, %_ZN7Minisat15ClauseAllocatorixEj.exit28, %296
  %j1.3 = phi i32 [ %297, %296 ], [ %323, %322 ], [ %j1.265, %_ZN7Minisat15ClauseAllocatorixEj.exit28 ], [ %j1.265, %326 ]
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %330 = load i32* %1, align 4, !tbaa !61
  %331 = trunc i64 %indvars.iv.next101 to i32
  %332 = icmp slt i32 %331, %330
  br i1 %332, label %287, label %.loopexit

.loopexit:                                        ; preds = %.loopexit58, %283, %.preheader47, %.preheader53, %.preheader61, %_ZNK7Minisat3vecINS_3LitEE6copyToERS2_.exit
  %333 = phi i32 [ %247, %_ZNK7Minisat3vecINS_3LitEE6copyToERS2_.exit ], [ %247, %.preheader47 ], [ %247, %.preheader61 ], [ %247, %.preheader53 ], [ %284, %283 ], [ %330, %.loopexit58 ]
  %j1.4 = phi i32 [ %247, %_ZNK7Minisat3vecINS_3LitEE6copyToERS2_.exit ], [ 1, %.preheader47 ], [ 1, %.preheader61 ], [ 1, %.preheader53 ], [ %j1.1, %283 ], [ %j1.3, %.loopexit58 ]
  %i.3 = phi i32 [ %247, %_ZNK7Minisat3vecINS_3LitEE6copyToERS2_.exit ], [ 1, %.preheader47 ], [ 1, %.preheader61 ], [ 1, %.preheader53 ], [ %285, %283 ], [ %331, %.loopexit58 ]
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 29
  %336 = load i64* %335, align 8, !tbaa !35
  %337 = add i64 %336, %334
  store i64 %337, i64* %335, align 8, !tbaa !35
  %338 = sub nsw i32 %i.3, %j1.4
  %339 = icmp slt i32 %333, %338
  br i1 %339, label %342, label %.preheader.i, !prof !123

.preheader.i:                                     ; preds = %.loopexit
  %340 = icmp sgt i32 %338, 0
  br i1 %340, label %.lr.ph.i, label %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit

.lr.ph.i:                                         ; preds = %.preheader.i
  %341 = sub i32 %333, %338
  store i32 %341, i32* %1, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit

; <label>:342                                     ; preds = %.loopexit
  tail call void @__assert_rtn(i8* getelementptr inbounds ([7 x i8]* @__func__._ZN7Minisat3vecIjE6shrinkEi, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 64, i8* getelementptr inbounds ([13 x i8]* @.str59, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit:          ; preds = %.lr.ph.i, %.preheader.i
  %343 = phi i32 [ %333, %.preheader.i ], [ %341, %.lr.ph.i ]
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 30
  %346 = load i64* %345, align 8, !tbaa !34
  %347 = add i64 %346, %344
  store i64 %347, i64* %345, align 8, !tbaa !34
  %348 = icmp eq i32 %343, 1
  br i1 %348, label %379, label %.preheader

.preheader:                                       ; preds = %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit
  %349 = icmp sgt i32 %343, 2
  %350 = load %"struct.Minisat::Lit"** %11, align 8, !tbaa !60
  br i1 %349, label %.lr.ph45, label %.preheader._crit_edge

.lr.ph45:                                         ; preds = %.preheader
  %351 = load %"struct.Minisat::Solver::VarData"** %28, align 8, !tbaa !100
  br label %352

; <label>:352                                     ; preds = %352, %.lr.ph45
  %indvars.iv91 = phi i64 [ 2, %.lr.ph45 ], [ %indvars.iv.next92, %352 ]
  %max_i.043 = phi i32 [ 1, %.lr.ph45 ], [ %i3.0.max_i.0, %352 ]
  %353 = getelementptr inbounds %"struct.Minisat::Lit"* %350, i64 %indvars.iv91, i32 0
  %354 = load i32* %353, align 4
  %355 = ashr i32 %354, 1
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %351, i64 %356, i32 1
  %358 = load i32* %357, align 4, !tbaa !138
  %359 = sext i32 %max_i.043 to i64
  %360 = getelementptr inbounds %"struct.Minisat::Lit"* %350, i64 %359, i32 0
  %361 = load i32* %360, align 4
  %362 = ashr i32 %361, 1
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %351, i64 %363, i32 1
  %365 = load i32* %364, align 4, !tbaa !138
  %366 = icmp sgt i32 %358, %365
  %367 = trunc i64 %indvars.iv91 to i32
  %i3.0.max_i.0 = select i1 %366, i32 %367, i32 %max_i.043
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %368 = trunc i64 %indvars.iv.next92 to i32
  %369 = icmp slt i32 %368, %343
  br i1 %369, label %352, label %._crit_edge46

._crit_edge46:                                    ; preds = %352
  %phitmp = sext i32 %i3.0.max_i.0 to i64
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %._crit_edge46, %.preheader
  %max_i.0.lcssa = phi i64 [ %phitmp, %._crit_edge46 ], [ 1, %.preheader ]
  %370 = getelementptr inbounds %"struct.Minisat::Lit"* %350, i64 %max_i.0.lcssa, i32 0
  %371 = load i32* %370, align 4
  %372 = getelementptr inbounds %"struct.Minisat::Lit"* %350, i64 1, i32 0
  %373 = load i32* %372, align 4, !tbaa !36
  store i32 %373, i32* %370, align 4, !tbaa !36
  store i32 %371, i32* %372, align 4
  %374 = ashr i32 %371, 1
  %375 = sext i32 %374 to i64
  %376 = load %"struct.Minisat::Solver::VarData"** %28, align 8, !tbaa !100
  %377 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %376, i64 %375, i32 1
  %378 = load i32* %377, align 4, !tbaa !138
  br label %379

; <label>:379                                     ; preds = %.preheader._crit_edge, %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit
  %storemerge = phi i32 [ %378, %.preheader._crit_edge ], [ 0, %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit ]
  store i32 %storemerge, i32* %out_btlevel, align 4, !tbaa !36
  %380 = load i32* %.phi.trans.insert.i, align 4, !tbaa !61
  %381 = icmp sgt i32 %380, 0
  br i1 %381, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph, %379
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %379 ]
  %382 = load %"struct.Minisat::Lit"** %218, align 8, !tbaa !60
  %383 = getelementptr inbounds %"struct.Minisat::Lit"* %382, i64 %indvars.iv, i32 0
  %384 = load i32* %383, align 4
  %385 = ashr i32 %384, 1
  %386 = sext i32 %385 to i64
  %387 = load i8** %27, align 8, !tbaa !102
  %388 = getelementptr inbounds i8* %387, i64 %386
  store i8 0, i8* %388, align 1, !tbaa !59
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %389 = load i32* %.phi.trans.insert.i, align 4, !tbaa !61
  %390 = trunc i64 %indvars.iv.next to i32
  %391 = icmp slt i32 %390, %389
  br i1 %391, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %379
  ret void
}

; Function Attrs: ssp uwtable
define zeroext i1 @_ZN7Minisat6Solver12litRedundantENS_3LitEj(%"class.Minisat::Solver"* nocapture %this, i32 %p.coerce, i32 %abstract_levels) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 54
  %2 = getelementptr inbounds %"class.Minisat::vec.0"* %1, i64 0, i32 0
  %3 = load %"struct.Minisat::Lit"** %2, align 8, !tbaa !60
  %4 = icmp eq %"struct.Minisat::Lit"* %3, null
  %.phi.trans.insert = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 54, i32 1
  br i1 %4, label %._ZN7Minisat3vecINS_3LitEE5clearEb.exit_crit_edge, label %.preheader.i

._ZN7Minisat3vecINS_3LitEE5clearEb.exit_crit_edge: ; preds = %0
  %.pre = load i32* %.phi.trans.insert, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE5clearEb.exit

.preheader.i:                                     ; preds = %0
  store i32 0, i32* %.phi.trans.insert, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE5clearEb.exit

_ZN7Minisat3vecINS_3LitEE5clearEb.exit:           ; preds = %.preheader.i, %._ZN7Minisat3vecINS_3LitEE5clearEb.exit_crit_edge
  %5 = phi i32 [ %.pre, %._ZN7Minisat3vecINS_3LitEE5clearEb.exit_crit_edge ], [ 0, %.preheader.i ]
  %6 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 54, i32 1
  %7 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 54, i32 2
  %8 = load i32* %7, align 4, !tbaa !62
  %9 = icmp eq i32 %5, %8
  br i1 %9, label %10, label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit

; <label>:10                                      ; preds = %_ZN7Minisat3vecINS_3LitEE5clearEb.exit
  %11 = add nsw i32 %5, 1
  tail call void @_ZN7Minisat3vecINS_3LitEE8capacityEi(%"class.Minisat::vec.0"* %1, i32 %11)
  %.pre.i = load i32* %6, align 4, !tbaa !61
  %.pre22 = load %"struct.Minisat::Lit"** %2, align 8, !tbaa !60
  br label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit

_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit:        ; preds = %10, %_ZN7Minisat3vecINS_3LitEE5clearEb.exit
  %12 = phi %"struct.Minisat::Lit"* [ %.pre22, %10 ], [ %3, %_ZN7Minisat3vecINS_3LitEE5clearEb.exit ]
  %13 = phi i32 [ %.pre.i, %10 ], [ %5, %_ZN7Minisat3vecINS_3LitEE5clearEb.exit ]
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %6, align 4, !tbaa !61
  %15 = sext i32 %13 to i64
  %16 = getelementptr inbounds %"struct.Minisat::Lit"* %12, i64 %15, i32 0
  store i32 %p.coerce, i32* %16, align 4, !tbaa !36
  %17 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 55
  %18 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 55, i32 1
  %19 = load i32* %18, align 4, !tbaa !61
  %20 = load i32* %6, align 4, !tbaa !61
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %.lr.ph18, label %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit

.lr.ph18:                                         ; preds = %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit
  %22 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 0
  %23 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %24 = bitcast i8* %23 to i32*
  %25 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %26 = bitcast %"class.Minisat::ClauseAllocator"* %25 to i32**
  %27 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 53, i32 0
  %28 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 55, i32 2
  %29 = getelementptr inbounds %"class.Minisat::vec.0"* %17, i64 0, i32 0
  br label %32

..loopexit_crit_edge:                             ; preds = %119
  %.pre24 = load i32* %6, align 4, !tbaa !61
  br label %.loopexit

.loopexit:                                        ; preds = %_ZN7Minisat3vecINS_3LitEE3popEv.exit, %..loopexit_crit_edge
  %30 = phi i32 [ %.pre24, %..loopexit_crit_edge ], [ %35, %_ZN7Minisat3vecINS_3LitEE3popEv.exit ]
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %.loopexit._crit_edge, label %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit

.loopexit._crit_edge:                             ; preds = %.loopexit
  %.pre23 = load %"struct.Minisat::Lit"** %2, align 8, !tbaa !60
  br label %32

; <label>:32                                      ; preds = %.loopexit._crit_edge, %.lr.ph18
  %33 = phi %"struct.Minisat::Lit"* [ %12, %.lr.ph18 ], [ %.pre23, %.loopexit._crit_edge ]
  %34 = phi i32 [ %20, %.lr.ph18 ], [ %30, %.loopexit._crit_edge ]
  %35 = add nsw i32 %34, -1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds %"struct.Minisat::Lit"* %33, i64 %36, i32 0
  %38 = load i32* %37, align 4
  %39 = ashr i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = load %"struct.Minisat::Solver::VarData"** %22, align 8, !tbaa !100
  %42 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %41, i64 %40, i32 0
  %43 = load i32* %42, align 4, !tbaa !133
  %44 = icmp eq i32 %43, -1
  br i1 %44, label %45, label %46, !prof !123

; <label>:45                                      ; preds = %32
  tail call void @__assert_rtn(i8* getelementptr inbounds ([13 x i8]* @__func__._ZN7Minisat6Solver12litRedundantENS_3LitEj, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 367, i8* getelementptr inbounds ([48 x i8]* @.str3636, i64 0, i64 0)) #16
  unreachable

; <label>:46                                      ; preds = %32
  %47 = load i32* %24, align 4, !tbaa !128
  %phitmp.i.i = icmp ugt i32 %47, %43
  br i1 %phitmp.i.i, label %_ZN7Minisat15ClauseAllocatorixEj.exit, label %48, !prof !122

; <label>:48                                      ; preds = %46
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit:            ; preds = %46
  %49 = zext i32 %43 to i64
  %50 = load i32** %26, align 8, !tbaa !119
  %51 = getelementptr inbounds i32* %50, i64 %49
  %52 = bitcast i32* %51 to %"class.Minisat::Clause"*
  %53 = icmp slt i32 %34, 1
  br i1 %53, label %54, label %_ZN7Minisat3vecINS_3LitEE3popEv.exit, !prof !123

; <label>:54                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit
  tail call void @__assert_rtn(i8* getelementptr inbounds ([4 x i8]* @__func__._ZN7Minisat3vecINS_3LitEE3popEv, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 76, i8* getelementptr inbounds ([7 x i8]* @.str63, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat3vecINS_3LitEE3popEv.exit:             ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit
  store i32 %35, i32* %6, align 4, !tbaa !61
  %55 = load i32* %51, align 4
  %56 = icmp ugt i32 %55, 63
  br i1 %56, label %.lr.ph17, label %.loopexit

.lr.ph17:                                         ; preds = %119, %_ZN7Minisat3vecINS_3LitEE3popEv.exit
  %57 = phi i32 [ %120, %119 ], [ %55, %_ZN7Minisat3vecINS_3LitEE3popEv.exit ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %119 ], [ 1, %_ZN7Minisat3vecINS_3LitEE3popEv.exit ]
  %58 = getelementptr inbounds %"class.Minisat::Clause"* %52, i64 0, i32 1, i64 %indvars.iv20, i32 0, i32 0
  %59 = load i32* %58, align 4, !tbaa !36
  %60 = ashr i32 %59, 1
  %61 = sext i32 %60 to i64
  %62 = load i8** %27, align 8, !tbaa !102
  %63 = getelementptr inbounds i8* %62, i64 %61
  %64 = load i8* %63, align 1, !tbaa !59
  %65 = icmp eq i8 %64, 0
  br i1 %65, label %66, label %119

; <label>:66                                      ; preds = %.lr.ph17
  %67 = load %"struct.Minisat::Solver::VarData"** %22, align 8, !tbaa !100
  %68 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %67, i64 %61, i32 1
  %69 = load i32* %68, align 4, !tbaa !138
  %70 = icmp sgt i32 %69, 0
  br i1 %70, label %71, label %119

; <label>:71                                      ; preds = %66
  %72 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %67, i64 %61, i32 0
  %73 = load i32* %72, align 4, !tbaa !133
  %74 = icmp eq i32 %73, -1
  br i1 %74, label %.preheader, label %78

.preheader:                                       ; preds = %78, %71
  %75 = load i32* %18, align 4, !tbaa !61
  %76 = icmp slt i32 %19, %75
  br i1 %76, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %77 = sext i32 %19 to i64
  br label %104

; <label>:78                                      ; preds = %71
  %79 = and i32 %69, 31
  %80 = shl i32 1, %79
  %81 = and i32 %80, %abstract_levels
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %.preheader, label %83

; <label>:83                                      ; preds = %78
  store i8 1, i8* %63, align 1, !tbaa !59
  %84 = load i32* %6, align 4, !tbaa !61
  %85 = load i32* %7, align 4, !tbaa !62
  %86 = icmp eq i32 %84, %85
  br i1 %86, label %87, label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit13

; <label>:87                                      ; preds = %83
  %88 = add nsw i32 %84, 1
  tail call void @_ZN7Minisat3vecINS_3LitEE8capacityEi(%"class.Minisat::vec.0"* %1, i32 %88)
  %.pre.i12 = load i32* %6, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit13

_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit13:      ; preds = %87, %83
  %89 = phi i32 [ %.pre.i12, %87 ], [ %84, %83 ]
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* %6, align 4, !tbaa !61
  %91 = sext i32 %89 to i64
  %92 = load %"struct.Minisat::Lit"** %2, align 8, !tbaa !60
  %93 = getelementptr inbounds %"struct.Minisat::Lit"* %92, i64 %91, i32 0
  store i32 %59, i32* %93, align 4, !tbaa !36
  %94 = load i32* %18, align 4, !tbaa !61
  %95 = load i32* %28, align 4, !tbaa !62
  %96 = icmp eq i32 %94, %95
  br i1 %96, label %97, label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit11

; <label>:97                                      ; preds = %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit13
  %98 = add nsw i32 %94, 1
  tail call void @_ZN7Minisat3vecINS_3LitEE8capacityEi(%"class.Minisat::vec.0"* %17, i32 %98)
  %.pre.i10 = load i32* %18, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit11

_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit11:      ; preds = %97, %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit13
  %99 = phi i32 [ %.pre.i10, %97 ], [ %94, %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit13 ]
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %18, align 4, !tbaa !61
  %101 = sext i32 %99 to i64
  %102 = load %"struct.Minisat::Lit"** %29, align 8, !tbaa !60
  %103 = getelementptr inbounds %"struct.Minisat::Lit"* %102, i64 %101, i32 0
  store i32 %59, i32* %103, align 4, !tbaa !36
  %.pre27 = load i32* %51, align 4
  br label %119

; <label>:104                                     ; preds = %._crit_edge25, %.lr.ph
  %105 = phi i8* [ %62, %.lr.ph ], [ %.pre26, %._crit_edge25 ]
  %indvars.iv = phi i64 [ %77, %.lr.ph ], [ %indvars.iv.next, %._crit_edge25 ]
  %106 = load %"struct.Minisat::Lit"** %29, align 8, !tbaa !60
  %107 = getelementptr inbounds %"struct.Minisat::Lit"* %106, i64 %indvars.iv, i32 0
  %108 = load i32* %107, align 4
  %109 = ashr i32 %108, 1
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8* %105, i64 %110
  store i8 0, i8* %111, align 1, !tbaa !59
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %112 = load i32* %18, align 4, !tbaa !61
  %113 = trunc i64 %indvars.iv.next to i32
  %114 = icmp slt i32 %113, %112
  br i1 %114, label %._crit_edge25, label %._crit_edge

._crit_edge25:                                    ; preds = %104
  %.pre26 = load i8** %27, align 8, !tbaa !102
  br label %104

._crit_edge:                                      ; preds = %104, %.preheader
  %.lcssa = phi i32 [ %75, %.preheader ], [ %112, %104 ]
  %115 = icmp slt i32 %19, 0
  br i1 %115, label %118, label %.preheader.i9, !prof !123

.preheader.i9:                                    ; preds = %._crit_edge
  %116 = sub nsw i32 %.lcssa, %19
  %117 = icmp sgt i32 %116, 0
  br i1 %117, label %.lr.ph.i, label %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit

.lr.ph.i:                                         ; preds = %.preheader.i9
  store i32 %19, i32* %18, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit

; <label>:118                                     ; preds = %._crit_edge
  tail call void @__assert_rtn(i8* getelementptr inbounds ([7 x i8]* @__func__._ZN7Minisat3vecIjE6shrinkEi, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 64, i8* getelementptr inbounds ([13 x i8]* @.str59, i64 0, i64 0)) #16
  unreachable

; <label>:119                                     ; preds = %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit11, %66, %.lr.ph17
  %120 = phi i32 [ %57, %.lr.ph17 ], [ %57, %66 ], [ %.pre27, %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit11 ]
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %121 = lshr i32 %120, 5
  %122 = trunc i64 %indvars.iv.next21 to i32
  %123 = icmp slt i32 %122, %121
  br i1 %123, label %.lr.ph17, label %..loopexit_crit_edge

_ZN7Minisat3vecINS_3LitEE6shrinkEi.exit:          ; preds = %.lr.ph.i, %.preheader.i9, %.loopexit, %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit
  %.0 = phi i1 [ false, %.preheader.i9 ], [ false, %.lr.ph.i ], [ true, %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit ], [ true, %.loopexit ]
  ret i1 %.0
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6Solver12analyzeFinalENS_3LitERNS_3vecIS1_EE(%"class.Minisat::Solver"* nocapture readonly %this, i32 %p.coerce, %"class.Minisat::vec.0"* nocapture %out_conflict) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::vec.0"* %out_conflict, i64 0, i32 0
  %2 = load %"struct.Minisat::Lit"** %1, align 8, !tbaa !60
  %3 = icmp eq %"struct.Minisat::Lit"* %2, null
  %.phi.trans.insert = getelementptr inbounds %"class.Minisat::vec.0"* %out_conflict, i64 0, i32 1
  br i1 %3, label %._ZN7Minisat3vecINS_3LitEE5clearEb.exit_crit_edge, label %.preheader.i

._ZN7Minisat3vecINS_3LitEE5clearEb.exit_crit_edge: ; preds = %0
  %.pre = load i32* %.phi.trans.insert, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE5clearEb.exit

.preheader.i:                                     ; preds = %0
  store i32 0, i32* %.phi.trans.insert, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE5clearEb.exit

_ZN7Minisat3vecINS_3LitEE5clearEb.exit:           ; preds = %.preheader.i, %._ZN7Minisat3vecINS_3LitEE5clearEb.exit_crit_edge
  %4 = phi i32 [ %.pre, %._ZN7Minisat3vecINS_3LitEE5clearEb.exit_crit_edge ], [ 0, %.preheader.i ]
  %5 = getelementptr inbounds %"class.Minisat::vec.0"* %out_conflict, i64 0, i32 1
  %6 = getelementptr inbounds %"class.Minisat::vec.0"* %out_conflict, i64 0, i32 2
  %7 = load i32* %6, align 4, !tbaa !62
  %8 = icmp eq i32 %4, %7
  br i1 %8, label %9, label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit

; <label>:9                                       ; preds = %_ZN7Minisat3vecINS_3LitEE5clearEb.exit
  %10 = add nsw i32 %4, 1
  tail call void @_ZN7Minisat3vecINS_3LitEE8capacityEi(%"class.Minisat::vec.0"* %out_conflict, i32 %10)
  %.pre.i = load i32* %5, align 4, !tbaa !61
  %.pre14 = load %"struct.Minisat::Lit"** %1, align 8, !tbaa !60
  br label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit

_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit:        ; preds = %9, %_ZN7Minisat3vecINS_3LitEE5clearEb.exit
  %11 = phi %"struct.Minisat::Lit"* [ %.pre14, %9 ], [ %2, %_ZN7Minisat3vecINS_3LitEE5clearEb.exit ]
  %12 = phi i32 [ %.pre.i, %9 ], [ %4, %_ZN7Minisat3vecINS_3LitEE5clearEb.exit ]
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %5, align 4, !tbaa !61
  %14 = sext i32 %12 to i64
  %15 = getelementptr inbounds %"struct.Minisat::Lit"* %11, i64 %14, i32 0
  store i32 %p.coerce, i32* %15, align 4, !tbaa !36
  %16 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 1
  %17 = load i32* %16, align 4, !tbaa !98
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %104, label %19

; <label>:19                                      ; preds = %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit
  %20 = ashr i32 %p.coerce, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 53, i32 0
  %23 = load i8** %22, align 8, !tbaa !102
  %24 = getelementptr inbounds i8* %23, i64 %21
  store i8 1, i8* %24, align 1, !tbaa !59
  %25 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 1
  %26 = load i32* %25, align 4, !tbaa !61
  %27 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 0
  %28 = load i32** %27, align 8, !tbaa !97
  %29 = load i32* %28, align 4, !tbaa !36
  %30 = icmp sgt i32 %26, %29
  br i1 %30, label %.lr.ph11, label %._crit_edge

.lr.ph11:                                         ; preds = %19
  %31 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 0
  %32 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 0
  %33 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %34 = bitcast i8* %33 to i32*
  %35 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %36 = bitcast %"class.Minisat::ClauseAllocator"* %35 to i32**
  %37 = sext i32 %26 to i64
  br label %38

; <label>:38                                      ; preds = %.backedge, %.lr.ph11
  %39 = phi i32 [ %29, %.lr.ph11 ], [ %49, %.backedge ]
  %indvars.iv12 = phi i64 [ %37, %.lr.ph11 ], [ %indvars.iv.next13, %.backedge ]
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, -1
  %40 = load %"struct.Minisat::Lit"** %31, align 8, !tbaa !60
  %41 = getelementptr inbounds %"struct.Minisat::Lit"* %40, i64 %indvars.iv.next13, i32 0
  %42 = load i32* %41, align 4
  %43 = ashr i32 %42, 1
  %44 = sext i32 %43 to i64
  %45 = load i8** %22, align 8, !tbaa !102
  %46 = getelementptr inbounds i8* %45, i64 %44
  %47 = load i8* %46, align 1, !tbaa !59
  %48 = icmp eq i8 %47, 0
  br i1 %48, label %.backedge, label %52

.backedge:                                        ; preds = %.loopexit, %38
  %49 = phi i32 [ %39, %38 ], [ %.pre19, %.loopexit ]
  %50 = trunc i64 %indvars.iv.next13 to i32
  %51 = icmp sgt i32 %50, %49
  br i1 %51, label %38, label %._crit_edge

; <label>:52                                      ; preds = %38
  %53 = load %"struct.Minisat::Solver::VarData"** %32, align 8, !tbaa !100
  %54 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %53, i64 %44, i32 0
  %55 = load i32* %54, align 4, !tbaa !133
  %56 = icmp eq i32 %55, -1
  br i1 %56, label %57, label %74

; <label>:57                                      ; preds = %52
  %58 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %53, i64 %44, i32 1
  %59 = load i32* %58, align 4, !tbaa !138
  %60 = icmp slt i32 %59, 1
  br i1 %60, label %61, label %62, !prof !123

; <label>:61                                      ; preds = %57
  tail call void @__assert_rtn(i8* getelementptr inbounds ([13 x i8]* @__func__._ZN7Minisat6Solver12analyzeFinalENS_3LitERNS_3vecIS1_EE, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 414, i8* getelementptr inbounds ([13 x i8]* @.str3737, i64 0, i64 0)) #16
  unreachable

; <label>:62                                      ; preds = %57
  %63 = xor i32 %42, 1
  %64 = load i32* %5, align 4, !tbaa !61
  %65 = load i32* %6, align 4, !tbaa !62
  %66 = icmp eq i32 %64, %65
  br i1 %66, label %67, label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit7

; <label>:67                                      ; preds = %62
  %68 = add nsw i32 %64, 1
  tail call void @_ZN7Minisat3vecINS_3LitEE8capacityEi(%"class.Minisat::vec.0"* %out_conflict, i32 %68)
  %.pre.i6 = load i32* %5, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit7

_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit7:       ; preds = %67, %62
  %69 = phi i32 [ %.pre.i6, %67 ], [ %64, %62 ]
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %5, align 4, !tbaa !61
  %71 = sext i32 %69 to i64
  %72 = load %"struct.Minisat::Lit"** %1, align 8, !tbaa !60
  %73 = getelementptr inbounds %"struct.Minisat::Lit"* %72, i64 %71, i32 0
  store i32 %63, i32* %73, align 4, !tbaa !36
  br label %.loopexit

; <label>:74                                      ; preds = %52
  %75 = load i32* %34, align 4, !tbaa !128
  %phitmp.i.i = icmp ugt i32 %75, %55
  br i1 %phitmp.i.i, label %_ZN7Minisat15ClauseAllocatorixEj.exit, label %76, !prof !122

; <label>:76                                      ; preds = %74
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit:            ; preds = %74
  %77 = zext i32 %55 to i64
  %78 = load i32** %36, align 8, !tbaa !119
  %79 = getelementptr inbounds i32* %78, i64 %77
  %80 = bitcast i32* %79 to %"class.Minisat::Clause"*
  %81 = load i32* %79, align 4
  %82 = icmp ugt i32 %81, 63
  br i1 %82, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %._crit_edge15, %_ZN7Minisat15ClauseAllocatorixEj.exit
  %83 = phi i32 [ %96, %._crit_edge15 ], [ %81, %_ZN7Minisat15ClauseAllocatorixEj.exit ]
  %84 = phi %"struct.Minisat::Solver::VarData"* [ %.pre16, %._crit_edge15 ], [ %53, %_ZN7Minisat15ClauseAllocatorixEj.exit ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge15 ], [ 1, %_ZN7Minisat15ClauseAllocatorixEj.exit ]
  %85 = getelementptr inbounds %"class.Minisat::Clause"* %80, i64 0, i32 1, i64 %indvars.iv, i32 0, i32 0
  %86 = load i32* %85, align 4
  %87 = ashr i32 %86, 1
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %84, i64 %88, i32 1
  %90 = load i32* %89, align 4, !tbaa !138
  %91 = icmp sgt i32 %90, 0
  br i1 %91, label %92, label %95

; <label>:92                                      ; preds = %.lr.ph
  %93 = load i8** %22, align 8, !tbaa !102
  %94 = getelementptr inbounds i8* %93, i64 %88
  store i8 1, i8* %94, align 1, !tbaa !59
  %.pre17 = load i32* %79, align 4
  br label %95

; <label>:95                                      ; preds = %92, %.lr.ph
  %96 = phi i32 [ %83, %.lr.ph ], [ %.pre17, %92 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %97 = lshr i32 %96, 5
  %98 = trunc i64 %indvars.iv.next to i32
  %99 = icmp slt i32 %98, %97
  br i1 %99, label %._crit_edge15, label %.loopexit

._crit_edge15:                                    ; preds = %95
  %.pre16 = load %"struct.Minisat::Solver::VarData"** %32, align 8, !tbaa !100
  br label %.lr.ph

.loopexit:                                        ; preds = %95, %_ZN7Minisat15ClauseAllocatorixEj.exit, %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit7
  %100 = load i8** %22, align 8, !tbaa !102
  %101 = getelementptr inbounds i8* %100, i64 %44
  store i8 0, i8* %101, align 1, !tbaa !59
  %.pre18 = load i32** %27, align 8, !tbaa !97
  %.pre19 = load i32* %.pre18, align 4, !tbaa !36
  br label %.backedge

._crit_edge:                                      ; preds = %.backedge, %19
  %102 = load i8** %22, align 8, !tbaa !102
  %103 = getelementptr inbounds i8* %102, i64 %21
  store i8 0, i8* %103, align 1, !tbaa !59
  br label %104

; <label>:104                                     ; preds = %._crit_edge, %_ZN7Minisat3vecINS_3LitEE4pushERKS1_.exit
  ret void
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6Solver8reduceDBEv(%"class.Minisat::Solver"* %this) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 34
  %2 = load double* %1, align 8, !tbaa !92
  %3 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33, i32 1
  %4 = load i32* %3, align 4, !tbaa !64
  %5 = sitofp i32 %4 to double
  %6 = fdiv double %2, %5
  %7 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %8 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33, i32 0
  %9 = load i32** %8, align 8, !tbaa !117
  tail call void @_ZN7Minisat4sortIj11reduceDB_ltEEvPT_iT0_(i32* %9, i32 %4, %"class.Minisat::ClauseAllocator"* %7)
  %10 = load i32* %3, align 4, !tbaa !64
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0
  %12 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %13 = bitcast i8* %12 to i32*
  %14 = bitcast %"class.Minisat::ClauseAllocator"* %7 to i32**
  %15 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %16 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 0
  br label %17

; <label>:17                                      ; preds = %66, %.lr.ph
  %18 = phi i32 [ %10, %.lr.ph ], [ %67, %66 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %66 ]
  %j.010 = phi i32 [ 0, %.lr.ph ], [ %j.1, %66 ]
  %19 = load i32** %8, align 8, !tbaa !117
  %20 = getelementptr inbounds i32* %19, i64 %indvars.iv
  %21 = load i32* %20, align 4, !tbaa !36
  %22 = load i32* %13, align 4, !tbaa !128
  %phitmp.i.i = icmp ugt i32 %22, %21
  br i1 %phitmp.i.i, label %_ZN7Minisat15ClauseAllocatorixEj.exit, label %23, !prof !122

; <label>:23                                      ; preds = %17
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit:            ; preds = %17
  %24 = zext i32 %21 to i64
  %25 = load i32** %14, align 8, !tbaa !119
  %26 = getelementptr inbounds i32* %25, i64 %24
  %27 = bitcast i32* %26 to %"class.Minisat::Clause"*
  %28 = load i32* %26, align 4
  %29 = icmp ugt i32 %28, 95
  br i1 %29, label %30, label %62

; <label>:30                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit
  %.sum = add i64 %24, 1
  %31 = getelementptr inbounds i32* %25, i64 %.sum
  %32 = load i32* %31, align 4
  %33 = ashr i32 %32, 1
  %34 = sext i32 %33 to i64
  %35 = load %"class.Minisat::lbool"** %15, align 8, !tbaa !65
  %36 = getelementptr inbounds %"class.Minisat::lbool"* %35, i64 %34, i32 0
  %37 = load i8* %36, align 1, !tbaa !66
  %p.coerce.tr.i.i = trunc i32 %32 to i8
  %38 = and i8 %p.coerce.tr.i.i, 1
  %39 = icmp eq i8 %37, %38
  br i1 %39, label %40, label %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread

; <label>:40                                      ; preds = %30
  %41 = load %"struct.Minisat::Solver::VarData"** %16, align 8, !tbaa !100
  %42 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %41, i64 %34, i32 0
  %43 = load i32* %42, align 4, !tbaa !133
  %44 = icmp eq i32 %43, -1
  br i1 %44, label %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread, label %45

; <label>:45                                      ; preds = %40
  %phitmp.i.i.i = icmp ugt i32 %22, %43
  br i1 %phitmp.i.i.i, label %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit, label %46, !prof !122

; <label>:46                                      ; preds = %45
  tail call void @__assert_rtn(i8* getelementptr inbounds ([4 x i8]* @__func__._ZN7Minisat15RegionAllocatorIjE3leaEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 67, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit:    ; preds = %45
  %47 = icmp eq i32 %43, %21
  br i1 %47, label %62, label %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread

_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread: ; preds = %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit, %40, %30
  %48 = sdiv i32 %18, 2
  %49 = trunc i64 %indvars.iv to i32
  %50 = icmp slt i32 %49, %48
  br i1 %50, label %61, label %51

; <label>:51                                      ; preds = %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread
  %.lobit.i = and i32 %28, 8
  %52 = icmp eq i32 %.lobit.i, 0
  br i1 %52, label %53, label %_ZN7Minisat6Clause8activityEv.exit, !prof !123

; <label>:53                                      ; preds = %51
  tail call void @__assert_rtn(i8* getelementptr inbounds ([9 x i8]* @__func__._ZN7Minisat6Clause8activityEv, i64 0, i64 0), i8* getelementptr inbounds ([54 x i8]* @.str68, i64 0, i64 0), i32 181, i8* getelementptr inbounds ([17 x i8]* @.str69, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat6Clause8activityEv.exit:               ; preds = %51
  %54 = lshr i32 %28, 5
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds %"class.Minisat::Clause"* %27, i64 0, i32 1, i64 %55
  %57 = bitcast %union.anon* %56 to float*
  %58 = load float* %57, align 4, !tbaa !136
  %59 = fpext float %58 to double
  %60 = fcmp olt double %59, %6
  br i1 %60, label %61, label %62

; <label>:61                                      ; preds = %_ZN7Minisat6Clause8activityEv.exit, %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread
  tail call void @_ZN7Minisat6Solver12removeClauseEj(%"class.Minisat::Solver"* %this, i32 %21)
  br label %66

; <label>:62                                      ; preds = %_ZN7Minisat6Clause8activityEv.exit, %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit, %_ZN7Minisat15ClauseAllocatorixEj.exit
  %63 = add nsw i32 %j.010, 1
  %64 = sext i32 %j.010 to i64
  %65 = getelementptr inbounds i32* %19, i64 %64
  store i32 %21, i32* %65, align 4, !tbaa !36
  br label %66

; <label>:66                                      ; preds = %62, %61
  %j.1 = phi i32 [ %63, %62 ], [ %j.010, %61 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %67 = load i32* %3, align 4, !tbaa !64
  %68 = trunc i64 %indvars.iv.next to i32
  %69 = icmp slt i32 %68, %67
  br i1 %69, label %17, label %._crit_edge

._crit_edge:                                      ; preds = %66, %0
  %.lcssa = phi i32 [ %10, %0 ], [ %67, %66 ]
  %i.0.lcssa = phi i32 [ 0, %0 ], [ %68, %66 ]
  %j.0.lcssa = phi i32 [ 0, %0 ], [ %j.1, %66 ]
  %70 = sub nsw i32 %i.0.lcssa, %j.0.lcssa
  %71 = icmp slt i32 %.lcssa, %70
  br i1 %71, label %74, label %.preheader.i, !prof !123

.preheader.i:                                     ; preds = %._crit_edge
  %72 = icmp sgt i32 %70, 0
  br i1 %72, label %.lr.ph.i, label %_ZN7Minisat3vecIjE6shrinkEi.exit

.lr.ph.i:                                         ; preds = %.preheader.i
  %73 = sub i32 %.lcssa, %70
  store i32 %73, i32* %3, align 4, !tbaa !64
  br label %_ZN7Minisat3vecIjE6shrinkEi.exit

; <label>:74                                      ; preds = %._crit_edge
  tail call void @__assert_rtn(i8* getelementptr inbounds ([7 x i8]* @__func__._ZN7Minisat3vecIjE6shrinkEi, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 64, i8* getelementptr inbounds ([13 x i8]* @.str59, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat3vecIjE6shrinkEi.exit:                 ; preds = %.lr.ph.i, %.preheader.i
  %75 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 13
  %76 = load double* %75, align 8, !tbaa !84
  %77 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 16
  %78 = bitcast i8* %77 to i32*
  %79 = load i32* %78, align 4, !tbaa !135
  %80 = uitofp i32 %79 to double
  %81 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %82 = bitcast i8* %81 to i32*
  %83 = load i32* %82, align 4, !tbaa !128
  %84 = uitofp i32 %83 to double
  %85 = fmul double %76, %84
  %86 = fcmp ogt double %80, %85
  br i1 %86, label %87, label %_ZN7Minisat6Solver12checkGarbageEv.exit

; <label>:87                                      ; preds = %_ZN7Minisat3vecIjE6shrinkEi.exit
  %88 = bitcast %"class.Minisat::Solver"* %this to void (%"class.Minisat::Solver"*)***
  %89 = load void (%"class.Minisat::Solver"*)*** %88, align 8, !tbaa !37
  %90 = getelementptr inbounds void (%"class.Minisat::Solver"*)** %89, i64 2
  %91 = load void (%"class.Minisat::Solver"*)** %90, align 8
  tail call void %91(%"class.Minisat::Solver"* %this)
  br label %_ZN7Minisat6Solver12checkGarbageEv.exit

_ZN7Minisat6Solver12checkGarbageEv.exit:          ; preds = %87, %_ZN7Minisat3vecIjE6shrinkEi.exit
  ret void
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6Solver15removeSatisfiedERNS_3vecIjEE(%"class.Minisat::Solver"* nocapture %this, %"class.Minisat::vec.1"* nocapture %cs) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::vec.1"* %cs, i64 0, i32 1
  %2 = load i32* %1, align 4, !tbaa !64
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0
  %4 = getelementptr inbounds %"class.Minisat::vec.1"* %cs, i64 0, i32 0
  %5 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %6 = bitcast i8* %5 to i32*
  %7 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %8 = bitcast %"class.Minisat::ClauseAllocator"* %7 to i32**
  %9 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  br label %10

; <label>:10                                      ; preds = %40, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %40 ]
  %j.07 = phi i32 [ 0, %.lr.ph ], [ %j.1, %40 ]
  %11 = load i32** %4, align 8, !tbaa !117
  %12 = getelementptr inbounds i32* %11, i64 %indvars.iv
  %13 = load i32* %12, align 4, !tbaa !36
  %14 = load i32* %6, align 4, !tbaa !128
  %phitmp.i.i = icmp ugt i32 %14, %13
  br i1 %phitmp.i.i, label %_ZN7Minisat15ClauseAllocatorixEj.exit, label %15, !prof !122

; <label>:15                                      ; preds = %10
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit:            ; preds = %10
  %16 = zext i32 %13 to i64
  %17 = load i32** %8, align 8, !tbaa !119
  %18 = getelementptr inbounds i32* %17, i64 %16
  %19 = bitcast i32* %18 to %"class.Minisat::Clause"*
  %20 = load i32* %18, align 4
  %21 = icmp ugt i32 %20, 31
  br i1 %21, label %.lr.ph.i1, label %.loopexit

.lr.ph.i1:                                        ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit
  %22 = load %"class.Minisat::lbool"** %9, align 8, !tbaa !65
  %23 = lshr i32 %20, 5
  br label %27

; <label>:24                                      ; preds = %27
  %25 = trunc i64 %indvars.iv.next.i to i32
  %26 = icmp slt i32 %25, %23
  br i1 %26, label %27, label %.loopexit

; <label>:27                                      ; preds = %24, %.lr.ph.i1
  %indvars.iv.i = phi i64 [ 0, %.lr.ph.i1 ], [ %indvars.iv.next.i, %24 ]
  %28 = getelementptr inbounds %"class.Minisat::Clause"* %19, i64 0, i32 1, i64 %indvars.iv.i, i32 0, i32 0
  %29 = load i32* %28, align 4
  %30 = ashr i32 %29, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds %"class.Minisat::lbool"* %22, i64 %31, i32 0
  %33 = load i8* %32, align 1, !tbaa !66
  %p.coerce.tr.i.i = trunc i32 %29 to i8
  %34 = and i8 %p.coerce.tr.i.i, 1
  %35 = icmp eq i8 %33, %34
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  br i1 %35, label %36, label %24

; <label>:36                                      ; preds = %27
  tail call void @_ZN7Minisat6Solver12removeClauseEj(%"class.Minisat::Solver"* %this, i32 %13)
  br label %40

.loopexit:                                        ; preds = %24, %_ZN7Minisat15ClauseAllocatorixEj.exit
  %37 = add nsw i32 %j.07, 1
  %38 = sext i32 %j.07 to i64
  %39 = getelementptr inbounds i32* %11, i64 %38
  store i32 %13, i32* %39, align 4, !tbaa !36
  br label %40

; <label>:40                                      ; preds = %.loopexit, %36
  %j.1 = phi i32 [ %j.07, %36 ], [ %37, %.loopexit ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = load i32* %1, align 4, !tbaa !64
  %42 = trunc i64 %indvars.iv.next to i32
  %43 = icmp slt i32 %42, %41
  br i1 %43, label %10, label %._crit_edge

._crit_edge:                                      ; preds = %40, %0
  %.lcssa5 = phi i32 [ %2, %0 ], [ %41, %40 ]
  %i.0.lcssa = phi i32 [ 0, %0 ], [ %42, %40 ]
  %j.0.lcssa = phi i32 [ 0, %0 ], [ %j.1, %40 ]
  %44 = sub nsw i32 %i.0.lcssa, %j.0.lcssa
  %45 = icmp slt i32 %.lcssa5, %44
  br i1 %45, label %48, label %.preheader.i, !prof !123

.preheader.i:                                     ; preds = %._crit_edge
  %46 = icmp sgt i32 %44, 0
  br i1 %46, label %.lr.ph.i, label %_ZN7Minisat3vecIjE6shrinkEi.exit

.lr.ph.i:                                         ; preds = %.preheader.i
  %47 = sub i32 %.lcssa5, %44
  store i32 %47, i32* %1, align 4, !tbaa !64
  br label %_ZN7Minisat3vecIjE6shrinkEi.exit

; <label>:48                                      ; preds = %._crit_edge
  tail call void @__assert_rtn(i8* getelementptr inbounds ([7 x i8]* @__func__._ZN7Minisat3vecIjE6shrinkEi, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 64, i8* getelementptr inbounds ([13 x i8]* @.str59, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat3vecIjE6shrinkEi.exit:                 ; preds = %.lr.ph.i, %.preheader.i
  ret void
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6Solver16rebuildOrderHeapEv(%"class.Minisat::Solver"* nocapture %this) #0 align 2 {
  %vs = alloca %"class.Minisat::vec.6", align 8
  %1 = bitcast %"class.Minisat::vec.6"* %vs to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 16, i32 8, i1 false) #2
  %2 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 1
  %3 = load i32* %2, align 4, !tbaa !63
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0
  %5 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 40, i32 0
  %6 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %7 = getelementptr inbounds %"class.Minisat::vec.6"* %vs, i64 0, i32 1
  %8 = getelementptr inbounds %"class.Minisat::vec.6"* %vs, i64 0, i32 0
  br label %9

; <label>:9                                       ; preds = %47, %.lr.ph
  %10 = phi i32* [ null, %.lr.ph ], [ %48, %47 ]
  %11 = phi i32 [ 0, %.lr.ph ], [ %49, %47 ]
  %12 = phi i32 [ 0, %.lr.ph ], [ %50, %47 ]
  %13 = phi i32 [ %3, %.lr.ph ], [ %51, %47 ]
  %14 = phi i32* [ null, %.lr.ph ], [ %52, %47 ]
  %15 = phi i32* [ null, %.lr.ph ], [ %53, %47 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %47 ]
  %16 = load i8** %5, align 8, !tbaa !102
  %17 = getelementptr inbounds i8* %16, i64 %indvars.iv
  %18 = load i8* %17, align 1, !tbaa !59
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %47, label %20

; <label>:20                                      ; preds = %9
  %21 = load %"class.Minisat::lbool"** %6, align 8, !tbaa !65
  %22 = getelementptr inbounds %"class.Minisat::lbool"* %21, i64 %indvars.iv, i32 0
  %23 = load i8* %22, align 1
  %24 = and i8 %23, 2
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %47, label %26

; <label>:26                                      ; preds = %20
  %27 = icmp eq i32 %12, %11
  br i1 %27, label %28, label %_ZN7Minisat3vecIiE4pushERKi.exit

; <label>:28                                      ; preds = %26
  %29 = add nsw i32 %11, 1
  invoke void @_ZN7Minisat3vecIiE8capacityEi(%"class.Minisat::vec.6"* %vs, i32 %29)
          to label %.noexc unwind label %.loopexit

.noexc:                                           ; preds = %28
  %30 = bitcast i32* %7 to i64*
  %.pre.i = load i64* %30, align 8
  %31 = trunc i64 %.pre.i to i32
  %32 = lshr i64 %.pre.i, 32
  %33 = trunc i64 %32 to i32
  %.pre7 = load i32** %8, align 8, !tbaa !97
  br label %_ZN7Minisat3vecIiE4pushERKi.exit

_ZN7Minisat3vecIiE4pushERKi.exit:                 ; preds = %.noexc, %26
  %34 = phi i32* [ %.pre7, %.noexc ], [ %10, %26 ]
  %35 = phi i32 [ %33, %.noexc ], [ %11, %26 ]
  %36 = phi i32 [ %31, %.noexc ], [ %12, %26 ]
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %7, align 8, !tbaa !98
  %38 = sext i32 %36 to i64
  %39 = getelementptr inbounds i32* %34, i64 %38
  %40 = trunc i64 %indvars.iv to i32
  store i32 %40, i32* %39, align 4, !tbaa !36
  %.pre6 = load i32* %2, align 4, !tbaa !63
  br label %47

.loopexit:                                        ; preds = %28
  %lpad.loopexit = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %.pre = load i32** %8, align 8, !tbaa !97
  br label %41

.nonloopexit:                                     ; preds = %._crit_edge
  %lpad.nonloopexit = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %.pre8 = getelementptr inbounds %"class.Minisat::vec.6"* %vs, i64 0, i32 0
  br label %41

; <label>:41                                      ; preds = %.nonloopexit, %.loopexit
  %.pre-phi = phi i32** [ %.pre8, %.nonloopexit ], [ %8, %.loopexit ]
  %42 = phi i32* [ %57, %.nonloopexit ], [ %.pre, %.loopexit ]
  %lpad.phi = phi { i8*, i32 } [ %lpad.nonloopexit, %.nonloopexit ], [ %lpad.loopexit, %.loopexit ]
  %43 = icmp eq i32* %42, null
  br i1 %43, label %_ZN7Minisat3vecIiED1Ev.exit2, label %.preheader.i.i.i1

.preheader.i.i.i1:                                ; preds = %41
  %44 = getelementptr inbounds %"class.Minisat::vec.6"* %vs, i64 0, i32 1
  store i32 0, i32* %44, align 8, !tbaa !98
  %45 = bitcast i32* %42 to i8*
  tail call void @free(i8* %45) #2
  store i32* null, i32** %.pre-phi, align 8, !tbaa !97
  %46 = getelementptr inbounds %"class.Minisat::vec.6"* %vs, i64 0, i32 2
  store i32 0, i32* %46, align 4, !tbaa !99
  br label %_ZN7Minisat3vecIiED1Ev.exit2

; <label>:47                                      ; preds = %_ZN7Minisat3vecIiE4pushERKi.exit, %20, %9
  %48 = phi i32* [ %10, %20 ], [ %34, %_ZN7Minisat3vecIiE4pushERKi.exit ], [ %10, %9 ]
  %49 = phi i32 [ %11, %20 ], [ %35, %_ZN7Minisat3vecIiE4pushERKi.exit ], [ %11, %9 ]
  %50 = phi i32 [ %12, %20 ], [ %37, %_ZN7Minisat3vecIiE4pushERKi.exit ], [ %12, %9 ]
  %51 = phi i32 [ %13, %20 ], [ %.pre6, %_ZN7Minisat3vecIiE4pushERKi.exit ], [ %13, %9 ]
  %52 = phi i32* [ %14, %20 ], [ %34, %_ZN7Minisat3vecIiE4pushERKi.exit ], [ %14, %9 ]
  %53 = phi i32* [ %15, %20 ], [ %34, %_ZN7Minisat3vecIiE4pushERKi.exit ], [ %15, %9 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %54 = trunc i64 %indvars.iv.next to i32
  %55 = icmp slt i32 %54, %51
  br i1 %55, label %9, label %._crit_edge

._crit_edge:                                      ; preds = %47, %0
  %56 = phi i32* [ null, %0 ], [ %52, %47 ]
  %57 = phi i32* [ null, %0 ], [ %53, %47 ]
  %58 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 48
  invoke void @_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE5buildERNS_3vecIiEE(%"class.Minisat::Heap"* %58, %"class.Minisat::vec.6"* %vs)
          to label %59 unwind label %.nonloopexit

; <label>:59                                      ; preds = %._crit_edge
  %60 = icmp eq i32* %56, null
  br i1 %60, label %_ZN7Minisat3vecIiED1Ev.exit, label %.preheader.i.i.i

.preheader.i.i.i:                                 ; preds = %59
  %61 = getelementptr inbounds %"class.Minisat::vec.6"* %vs, i64 0, i32 0
  %62 = getelementptr inbounds %"class.Minisat::vec.6"* %vs, i64 0, i32 1
  store i32 0, i32* %62, align 8, !tbaa !98
  %63 = bitcast i32* %56 to i8*
  tail call void @free(i8* %63) #2
  store i32* null, i32** %61, align 8, !tbaa !97
  %64 = getelementptr inbounds %"class.Minisat::vec.6"* %vs, i64 0, i32 2
  store i32 0, i32* %64, align 4, !tbaa !99
  br label %_ZN7Minisat3vecIiED1Ev.exit

_ZN7Minisat3vecIiED1Ev.exit:                      ; preds = %.preheader.i.i.i, %59
  ret void

_ZN7Minisat3vecIiED1Ev.exit2:                     ; preds = %.preheader.i.i.i1, %41
  resume { i8*, i32 } %lpad.phi
}

; Function Attrs: ssp uwtable
define zeroext i1 @_ZN7Minisat6Solver8simplifyEv(%"class.Minisat::Solver"* %this) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 1
  %2 = load i32* %1, align 4, !tbaa !98
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %5, label %4, !prof !122

; <label>:4                                       ; preds = %0
  tail call void @__assert_rtn(i8* getelementptr inbounds ([9 x i8]* @__func__._ZN7Minisat6Solver8simplifyEv, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 580, i8* getelementptr inbounds ([21 x i8]* @.str3333, i64 0, i64 0)) #16
  unreachable

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 31
  %7 = load i8* %6, align 1, !tbaa !91, !range !78
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %5
  %10 = tail call i32 @_ZN7Minisat6Solver9propagateEv(%"class.Minisat::Solver"* %this)
  %11 = icmp eq i32 %10, -1
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %9, %5
  store i8 0, i8* %6, align 1, !tbaa !91
  br label %54

; <label>:13                                      ; preds = %9
  %14 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 1
  %15 = load i32* %14, align 4, !tbaa !61
  %16 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 45
  %17 = load i32* %16, align 4, !tbaa !94
  %18 = icmp eq i32 %15, %17
  br i1 %18, label %54, label %19

; <label>:19                                      ; preds = %13
  %20 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 46
  %21 = load i64* %20, align 8, !tbaa !130
  %22 = icmp sgt i64 %21, 0
  br i1 %22, label %54, label %23

; <label>:23                                      ; preds = %19
  %24 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33
  tail call void @_ZN7Minisat6Solver15removeSatisfiedERNS_3vecIjEE(%"class.Minisat::Solver"* %this, %"class.Minisat::vec.1"* %24)
  %25 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 50
  %26 = load i8* %25, align 1, !tbaa !95, !range !78
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %30, label %28

; <label>:28                                      ; preds = %23
  %29 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32
  tail call void @_ZN7Minisat6Solver15removeSatisfiedERNS_3vecIjEE(%"class.Minisat::Solver"* %this, %"class.Minisat::vec.1"* %29)
  br label %30

; <label>:30                                      ; preds = %28, %23
  %31 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 13
  %32 = load double* %31, align 8, !tbaa !84
  %33 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 16
  %34 = bitcast i8* %33 to i32*
  %35 = load i32* %34, align 4, !tbaa !135
  %36 = uitofp i32 %35 to double
  %37 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %38 = bitcast i8* %37 to i32*
  %39 = load i32* %38, align 4, !tbaa !128
  %40 = uitofp i32 %39 to double
  %41 = fmul double %32, %40
  %42 = fcmp ogt double %36, %41
  br i1 %42, label %43, label %_ZN7Minisat6Solver12checkGarbageEv.exit

; <label>:43                                      ; preds = %30
  %44 = bitcast %"class.Minisat::Solver"* %this to void (%"class.Minisat::Solver"*)***
  %45 = load void (%"class.Minisat::Solver"*)*** %44, align 8, !tbaa !37
  %46 = getelementptr inbounds void (%"class.Minisat::Solver"*)** %45, i64 2
  %47 = load void (%"class.Minisat::Solver"*)** %46, align 8
  tail call void %47(%"class.Minisat::Solver"* %this)
  br label %_ZN7Minisat6Solver12checkGarbageEv.exit

_ZN7Minisat6Solver12checkGarbageEv.exit:          ; preds = %43, %30
  tail call void @_ZN7Minisat6Solver16rebuildOrderHeapEv(%"class.Minisat::Solver"* %this)
  %48 = load i32* %14, align 4, !tbaa !61
  store i32 %48, i32* %16, align 4, !tbaa !94
  %49 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 27
  %50 = load i64* %49, align 8, !tbaa !132
  %51 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 28
  %52 = load i64* %51, align 8, !tbaa !131
  %53 = add i64 %52, %50
  store i64 %53, i64* %20, align 8, !tbaa !130
  br label %54

; <label>:54                                      ; preds = %_ZN7Minisat6Solver12checkGarbageEv.exit, %19, %13, %12
  %.0 = phi i1 [ false, %12 ], [ true, %_ZN7Minisat6Solver12checkGarbageEv.exit ], [ true, %19 ], [ true, %13 ]
  ret i1 %.0
}

; Function Attrs: ssp uwtable
define i8 @_ZN7Minisat6Solver6searchEi(%"class.Minisat::Solver"* %this, i32 %nof_conflicts) #0 align 2 {
  %backtrack_level = alloca i32, align 4
  %learnt_clause = alloca %"class.Minisat::vec.0", align 8
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 31
  %2 = load i8* %1, align 1, !tbaa !91, !range !78
  %3 = icmp eq i8 %2, 1
  br i1 %3, label %5, label %4, !prof !122

; <label>:4                                       ; preds = %0
  call void @__assert_rtn(i8* getelementptr inbounds ([7 x i8]* @__func__._ZN7Minisat6Solver6searchEi, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 617, i8* getelementptr inbounds ([3 x i8]* @.str4040, i64 0, i64 0)) #16
  unreachable

; <label>:5                                       ; preds = %0
  %6 = bitcast %"class.Minisat::vec.0"* %learnt_clause to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 16, i32 8, i1 false) #2
  %7 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 21
  %8 = load i64* %7, align 8, !tbaa !11
  %9 = add i64 %8, 1
  store i64 %9, i64* %7, align 8, !tbaa !11
  %10 = icmp slt i32 %nof_conflicts, 0
  %11 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 62
  %12 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 60
  %13 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 61
  %14 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 1
  %15 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33, i32 1
  %16 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 1
  %17 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 57
  %18 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 47, i32 1
  %19 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 22
  %20 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42
  %21 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 2
  %22 = getelementptr inbounds %"class.Minisat::vec.6"* %20, i64 0, i32 0
  %23 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %24 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 0
  %25 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 2
  %26 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 0
  %27 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 47, i32 0
  %28 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 24
  %29 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 25
  %30 = getelementptr inbounds %"class.Minisat::vec.0"* %learnt_clause, i64 0, i32 0
  %31 = getelementptr inbounds %"class.Minisat::vec.0"* %learnt_clause, i64 0, i32 1
  %32 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 4
  %33 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 36
  %34 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 5
  %35 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 34
  %36 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 59
  %37 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 19
  %38 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 58
  %39 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 17
  %40 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 3
  %41 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 26
  %42 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32, i32 1
  %43 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 27
  %44 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 28
  %45 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 1
  %46 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 0
  %47 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %48 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33
  %49 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33, i32 2
  %50 = getelementptr inbounds %"class.Minisat::vec.1"* %48, i64 0, i32 0
  %51 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %52 = bitcast i8* %51 to i32*
  %53 = bitcast %"class.Minisat::ClauseAllocator"* %47 to i32**
  %54 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33, i32 0
  br label %.outer

.outer:                                           ; preds = %.loopexit48, %212, %200, %5
  %conflictC.0.ph = phi i32 [ 0, %5 ], [ %63, %.loopexit48 ], [ %63, %212 ], [ %63, %200 ]
  %55 = icmp slt i32 %conflictC.0.ph, %nof_conflicts
  %or.cond = or i1 %10, %55
  br label %56

; <label>:56                                      ; preds = %_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit, %.outer
  %57 = invoke i32 @_ZN7Minisat6Solver9propagateEv(%"class.Minisat::Solver"* %this)
          to label %58 unwind label %.nonloopexit.loopexit.loopexit

; <label>:58                                      ; preds = %56
  %59 = icmp eq i32 %57, -1
  br i1 %59, label %273, label %60

; <label>:60                                      ; preds = %58
  %61 = load i64* %29, align 8, !tbaa !30
  %62 = add i64 %61, 1
  store i64 %62, i64* %29, align 8, !tbaa !30
  %63 = add nsw i32 %conflictC.0.ph, 1
  %64 = load i32* %14, align 4, !tbaa !98
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %.loopexit60, label %70

.loopexit50:                                      ; preds = %350
  %lpad.loopexit = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  br label %.nonloopexit

.nonloopexit.loopexit.loopexit:                   ; preds = %379, %.thread, %330, %320, %56
  %lpad.loopexit61 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  br label %.nonloopexit

.nonloopexit.loopexit.nonloopexit:                ; preds = %118, %116, %110, %73, %_ZN7Minisat3vecINS_3LitEE5clearEb.exit
  %lpad.nonloopexit = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  br label %.nonloopexit

.nonloopexit.nonloopexit:                         ; preds = %410, %394, %363, %.loopexit, %195, %179, %156, %151, %133, %126, %105, %89
  %lpad.nonloopexit58 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  br label %.nonloopexit

.nonloopexit:                                     ; preds = %.nonloopexit.nonloopexit, %.nonloopexit.loopexit.nonloopexit, %.nonloopexit.loopexit.loopexit, %.loopexit50
  %lpad.phi = phi { i8*, i32 } [ %lpad.loopexit, %.loopexit50 ], [ %lpad.nonloopexit58, %.nonloopexit.nonloopexit ], [ %lpad.loopexit61, %.nonloopexit.loopexit.loopexit ], [ %lpad.nonloopexit, %.nonloopexit.loopexit.nonloopexit ]
  %66 = load %"struct.Minisat::Lit"** %30, align 8, !tbaa !60
  %67 = icmp eq %"struct.Minisat::Lit"* %66, null
  br i1 %67, label %_ZN7Minisat3vecINS_3LitEED1Ev.exit12, label %.preheader.i.i.i11

.preheader.i.i.i11:                               ; preds = %.nonloopexit
  store i32 0, i32* %31, align 8, !tbaa !61
  %68 = bitcast %"struct.Minisat::Lit"* %66 to i8*
  call void @free(i8* %68) #2
  store %"struct.Minisat::Lit"* null, %"struct.Minisat::Lit"** %30, align 8, !tbaa !60
  %69 = getelementptr inbounds %"class.Minisat::vec.0"* %learnt_clause, i64 0, i32 2
  store i32 0, i32* %69, align 4, !tbaa !62
  br label %_ZN7Minisat3vecINS_3LitEED1Ev.exit12

; <label>:70                                      ; preds = %60
  %71 = load %"struct.Minisat::Lit"** %30, align 8, !tbaa !60
  %72 = icmp eq %"struct.Minisat::Lit"* %71, null
  br i1 %72, label %_ZN7Minisat3vecINS_3LitEE5clearEb.exit, label %.preheader.i

.preheader.i:                                     ; preds = %70
  store i32 0, i32* %31, align 8, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE5clearEb.exit

_ZN7Minisat3vecINS_3LitEE5clearEb.exit:           ; preds = %.preheader.i, %70
  invoke void @_ZN7Minisat6Solver7analyzeEjRNS_3vecINS_3LitEEERi(%"class.Minisat::Solver"* %this, i32 %57, %"class.Minisat::vec.0"* %learnt_clause, i32* %backtrack_level)
          to label %73 unwind label %.nonloopexit.loopexit.nonloopexit

; <label>:73                                      ; preds = %_ZN7Minisat3vecINS_3LitEE5clearEb.exit
  %74 = load i32* %backtrack_level, align 4, !tbaa !36
  invoke void @_ZN7Minisat6Solver11cancelUntilEi(%"class.Minisat::Solver"* %this, i32 %74)
          to label %75 unwind label %.nonloopexit.loopexit.nonloopexit

; <label>:75                                      ; preds = %73
  %76 = load i32* %31, align 8, !tbaa !61
  %77 = icmp eq i32 %76, 1
  br i1 %77, label %78, label %110

; <label>:78                                      ; preds = %75
  %79 = load %"struct.Minisat::Lit"** %30, align 8, !tbaa !60
  %80 = getelementptr inbounds %"struct.Minisat::Lit"* %79, i64 0, i32 0
  %81 = load i32* %80, align 4
  %82 = ashr i32 %81, 1
  %83 = sext i32 %82 to i64
  %84 = load %"class.Minisat::lbool"** %23, align 8, !tbaa !65
  %85 = getelementptr inbounds %"class.Minisat::lbool"* %84, i64 %83, i32 0
  %86 = load i8* %85, align 1, !tbaa !66
  %87 = and i8 %86, 2
  %88 = icmp eq i8 %87, 0
  br i1 %88, label %89, label %90, !prof !123

; <label>:89                                      ; preds = %78
  invoke void @__assert_rtn(i8* getelementptr inbounds ([17 x i8]* @__func__._ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 432, i8* getelementptr inbounds ([20 x i8]* @.str3838, i64 0, i64 0)) #16
          to label %.noexc14 unwind label %.nonloopexit.nonloopexit

.noexc14:                                         ; preds = %89
  unreachable

; <label>:90                                      ; preds = %78
  %91 = and i32 %81, 1
  %92 = xor i32 %91, 1
  %93 = trunc i32 %92 to i8
  %94 = xor i8 %93, 1
  store i8 %94, i8* %85, align 1, !tbaa !59
  %95 = load %"struct.Minisat::Solver::VarData"** %24, align 8, !tbaa !100
  %96 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %95, i64 %83
  %97 = load i32* %14, align 4, !tbaa !98
  %98 = zext i32 %97 to i64
  %99 = shl nuw i64 %98, 32
  %100 = or i64 %99, 4294967295
  %101 = bitcast %"struct.Minisat::Solver::VarData"* %96 to i64*
  store i64 %100, i64* %101, align 4
  %102 = load i32* %16, align 4, !tbaa !61
  %103 = load i32* %25, align 4, !tbaa !62
  %104 = icmp slt i32 %102, %103
  br i1 %104, label %_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit16, label %105, !prof !122

; <label>:105                                     ; preds = %90
  invoke void @__assert_rtn(i8* getelementptr inbounds ([6 x i8]* @__func__._ZN7Minisat3vecINS_3LitEE5push_ERKS1_, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 75, i8* getelementptr inbounds ([9 x i8]* @.str62, i64 0, i64 0)) #16
          to label %.noexc15 unwind label %.nonloopexit.nonloopexit

.noexc15:                                         ; preds = %105
  unreachable

_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit16: ; preds = %90
  %106 = add nsw i32 %102, 1
  store i32 %106, i32* %16, align 4, !tbaa !61
  %107 = sext i32 %102 to i64
  %108 = load %"struct.Minisat::Lit"** %26, align 8, !tbaa !60
  %109 = getelementptr inbounds %"struct.Minisat::Lit"* %108, i64 %107, i32 0
  store i32 %81, i32* %109, align 4, !tbaa !36
  br label %200

; <label>:110                                     ; preds = %75
  %111 = invoke i32 @_ZN7Minisat15ClauseAllocator5allocINS_3vecINS_3LitEEEEEjRKT_b(%"class.Minisat::ClauseAllocator"* %47, %"class.Minisat::vec.0"* %learnt_clause, i1 zeroext true)
          to label %112 unwind label %.nonloopexit.loopexit.nonloopexit

; <label>:112                                     ; preds = %110
  %113 = load i32* %15, align 4, !tbaa !64
  %114 = load i32* %49, align 4, !tbaa !118
  %115 = icmp eq i32 %113, %114
  br i1 %115, label %116, label %118

; <label>:116                                     ; preds = %112
  %117 = add nsw i32 %113, 1
  invoke void @_ZN7Minisat3vecIjE8capacityEi(%"class.Minisat::vec.1"* %48, i32 %117)
          to label %.noexc17 unwind label %.nonloopexit.loopexit.nonloopexit

.noexc17:                                         ; preds = %116
  %.pre.i = load i32* %15, align 4, !tbaa !64
  br label %118

; <label>:118                                     ; preds = %.noexc17, %112
  %119 = phi i32 [ %.pre.i, %.noexc17 ], [ %113, %112 ]
  %120 = add nsw i32 %119, 1
  store i32 %120, i32* %15, align 4, !tbaa !64
  %121 = sext i32 %119 to i64
  %122 = load i32** %50, align 8, !tbaa !117
  %123 = getelementptr inbounds i32* %122, i64 %121
  store i32 %111, i32* %123, align 4, !tbaa !36
  invoke void @_ZN7Minisat6Solver12attachClauseEj(%"class.Minisat::Solver"* %this, i32 %111)
          to label %124 unwind label %.nonloopexit.loopexit.nonloopexit

; <label>:124                                     ; preds = %118
  %125 = load i32* %52, align 4, !tbaa !128
  %phitmp.i.i = icmp ugt i32 %125, %111
  br i1 %phitmp.i.i, label %127, label %126, !prof !122

; <label>:126                                     ; preds = %124
  invoke void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
          to label %.noexc18 unwind label %.nonloopexit.nonloopexit

.noexc18:                                         ; preds = %126
  unreachable

; <label>:127                                     ; preds = %124
  %128 = zext i32 %111 to i64
  %129 = load i32** %53, align 8, !tbaa !119
  %130 = getelementptr inbounds i32* %129, i64 %128
  %131 = load i32* %130, align 4
  %.lobit.i.i = and i32 %131, 8
  %132 = icmp eq i32 %.lobit.i.i, 0
  br i1 %132, label %133, label %_ZN7Minisat6Clause8activityEv.exit.i, !prof !123

; <label>:133                                     ; preds = %127
  invoke void @__assert_rtn(i8* getelementptr inbounds ([9 x i8]* @__func__._ZN7Minisat6Clause8activityEv, i64 0, i64 0), i8* getelementptr inbounds ([54 x i8]* @.str68, i64 0, i64 0), i32 181, i8* getelementptr inbounds ([17 x i8]* @.str69, i64 0, i64 0)) #16
          to label %.noexc21 unwind label %.nonloopexit.nonloopexit

.noexc21:                                         ; preds = %133
  unreachable

_ZN7Minisat6Clause8activityEv.exit.i:             ; preds = %127
  %134 = bitcast i32* %130 to %"class.Minisat::Clause"*
  %135 = load double* %35, align 8, !tbaa !92
  %136 = lshr i32 %131, 5
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds %"class.Minisat::Clause"* %134, i64 0, i32 1, i64 %137
  %139 = bitcast %union.anon* %138 to float*
  %140 = load float* %139, align 4, !tbaa !136
  %141 = fpext float %140 to double
  %142 = fadd double %135, %141
  %143 = fptrunc double %142 to float
  store float %143, float* %139, align 4, !tbaa !136
  %144 = fpext float %143 to double
  %145 = fcmp ogt double %144, 1.000000e+20
  br i1 %145, label %.preheader.i19, label %_ZN7Minisat6Solver15claBumpActivityERNS_6ClauseE.exit

.preheader.i19:                                   ; preds = %_ZN7Minisat6Clause8activityEv.exit.i
  %146 = load i32* %15, align 4, !tbaa !64
  %147 = icmp sgt i32 %146, 0
  br i1 %147, label %.lr.ph.i, label %._crit_edge.i

.lr.ph.i:                                         ; preds = %.preheader.i19
  %.pre.i20 = load i32** %54, align 8, !tbaa !117
  br label %148

; <label>:148                                     ; preds = %_ZN7Minisat6Clause8activityEv.exit2.i, %.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %.lr.ph.i ], [ %indvars.iv.next.i, %_ZN7Minisat6Clause8activityEv.exit2.i ]
  %149 = getelementptr inbounds i32* %.pre.i20, i64 %indvars.iv.i
  %150 = load i32* %149, align 4, !tbaa !36
  %phitmp.i.i.i = icmp ugt i32 %125, %150
  br i1 %phitmp.i.i.i, label %_ZN7Minisat15ClauseAllocatorixEj.exit.i, label %151, !prof !122

; <label>:151                                     ; preds = %148
  invoke void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
          to label %.noexc22 unwind label %.nonloopexit.nonloopexit

.noexc22:                                         ; preds = %151
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit.i:          ; preds = %148
  %152 = zext i32 %150 to i64
  %153 = getelementptr inbounds i32* %129, i64 %152
  %154 = load i32* %153, align 4
  %.lobit.i1.i = and i32 %154, 8
  %155 = icmp eq i32 %.lobit.i1.i, 0
  br i1 %155, label %156, label %_ZN7Minisat6Clause8activityEv.exit2.i, !prof !123

; <label>:156                                     ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit.i
  invoke void @__assert_rtn(i8* getelementptr inbounds ([9 x i8]* @__func__._ZN7Minisat6Clause8activityEv, i64 0, i64 0), i8* getelementptr inbounds ([54 x i8]* @.str68, i64 0, i64 0), i32 181, i8* getelementptr inbounds ([17 x i8]* @.str69, i64 0, i64 0)) #16
          to label %.noexc23 unwind label %.nonloopexit.nonloopexit

.noexc23:                                         ; preds = %156
  unreachable

_ZN7Minisat6Clause8activityEv.exit2.i:            ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit.i
  %157 = bitcast i32* %153 to %"class.Minisat::Clause"*
  %158 = lshr i32 %154, 5
  %159 = zext i32 %158 to i64
  %160 = getelementptr inbounds %"class.Minisat::Clause"* %157, i64 0, i32 1, i64 %159
  %161 = bitcast %union.anon* %160 to float*
  %162 = load float* %161, align 4, !tbaa !136
  %163 = fpext float %162 to double
  %164 = fmul double %163, 1.000000e-20
  %165 = fptrunc double %164 to float
  store float %165, float* %161, align 4, !tbaa !136
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %166 = trunc i64 %indvars.iv.next.i to i32
  %167 = icmp slt i32 %166, %146
  br i1 %167, label %148, label %._crit_edge.i

._crit_edge.i:                                    ; preds = %_ZN7Minisat6Clause8activityEv.exit2.i, %.preheader.i19
  %168 = fmul double %135, 1.000000e-20
  store double %168, double* %35, align 8, !tbaa !92
  br label %_ZN7Minisat6Solver15claBumpActivityERNS_6ClauseE.exit

_ZN7Minisat6Solver15claBumpActivityERNS_6ClauseE.exit: ; preds = %._crit_edge.i, %_ZN7Minisat6Clause8activityEv.exit.i
  %169 = load %"struct.Minisat::Lit"** %30, align 8, !tbaa !60
  %170 = getelementptr inbounds %"struct.Minisat::Lit"* %169, i64 0, i32 0
  %171 = load i32* %170, align 4
  %172 = ashr i32 %171, 1
  %173 = sext i32 %172 to i64
  %174 = load %"class.Minisat::lbool"** %23, align 8, !tbaa !65
  %175 = getelementptr inbounds %"class.Minisat::lbool"* %174, i64 %173, i32 0
  %176 = load i8* %175, align 1, !tbaa !66
  %177 = and i8 %176, 2
  %178 = icmp eq i8 %177, 0
  br i1 %178, label %179, label %180, !prof !123

; <label>:179                                     ; preds = %_ZN7Minisat6Solver15claBumpActivityERNS_6ClauseE.exit
  invoke void @__assert_rtn(i8* getelementptr inbounds ([17 x i8]* @__func__._ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 432, i8* getelementptr inbounds ([20 x i8]* @.str3838, i64 0, i64 0)) #16
          to label %.noexc24 unwind label %.nonloopexit.nonloopexit

.noexc24:                                         ; preds = %179
  unreachable

; <label>:180                                     ; preds = %_ZN7Minisat6Solver15claBumpActivityERNS_6ClauseE.exit
  %181 = and i32 %171, 1
  %182 = xor i32 %181, 1
  %183 = trunc i32 %182 to i8
  %184 = xor i8 %183, 1
  store i8 %184, i8* %175, align 1, !tbaa !59
  %185 = load %"struct.Minisat::Solver::VarData"** %24, align 8, !tbaa !100
  %186 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %185, i64 %173
  %187 = load i32* %14, align 4, !tbaa !98
  %188 = zext i32 %187 to i64
  %189 = shl nuw i64 %188, 32
  %190 = or i64 %189, %128
  %191 = bitcast %"struct.Minisat::Solver::VarData"* %186 to i64*
  store i64 %190, i64* %191, align 4
  %192 = load i32* %16, align 4, !tbaa !61
  %193 = load i32* %25, align 4, !tbaa !62
  %194 = icmp slt i32 %192, %193
  br i1 %194, label %_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit26, label %195, !prof !122

; <label>:195                                     ; preds = %180
  invoke void @__assert_rtn(i8* getelementptr inbounds ([6 x i8]* @__func__._ZN7Minisat3vecINS_3LitEE5push_ERKS1_, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 75, i8* getelementptr inbounds ([9 x i8]* @.str62, i64 0, i64 0)) #16
          to label %.noexc25 unwind label %.nonloopexit.nonloopexit

.noexc25:                                         ; preds = %195
  unreachable

_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit26: ; preds = %180
  %196 = add nsw i32 %192, 1
  store i32 %196, i32* %16, align 4, !tbaa !61
  %197 = sext i32 %192 to i64
  %198 = load %"struct.Minisat::Lit"** %26, align 8, !tbaa !60
  %199 = getelementptr inbounds %"struct.Minisat::Lit"* %198, i64 %197, i32 0
  store i32 %171, i32* %199, align 4, !tbaa !36
  br label %200

; <label>:200                                     ; preds = %_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit26, %_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit16
  %201 = load double* %32, align 8, !tbaa !73
  %202 = fdiv double 1.000000e+00, %201
  %203 = load double* %33, align 8, !tbaa !93
  %204 = fmul double %202, %203
  store double %204, double* %33, align 8, !tbaa !93
  %205 = load double* %34, align 8, !tbaa !74
  %206 = fdiv double 1.000000e+00, %205
  %207 = load double* %35, align 8, !tbaa !92
  %208 = fmul double %206, %207
  store double %208, double* %35, align 8, !tbaa !92
  %209 = load i32* %36, align 4, !tbaa !143
  %210 = add nsw i32 %209, -1
  store i32 %210, i32* %36, align 4, !tbaa !143
  %211 = icmp eq i32 %210, 0
  br i1 %211, label %212, label %.outer

; <label>:212                                     ; preds = %200
  %213 = load double* %37, align 8, !tbaa !90
  %214 = load double* %38, align 8, !tbaa !144
  %215 = fmul double %213, %214
  store double %215, double* %38, align 8, !tbaa !144
  %216 = fptosi double %215 to i32
  store i32 %216, i32* %36, align 4, !tbaa !143
  %217 = load double* %39, align 8, !tbaa !88
  %218 = load double* %17, align 8, !tbaa !145
  %219 = fmul double %217, %218
  store double %219, double* %17, align 8, !tbaa !145
  %220 = load i32* %40, align 4, !tbaa !51
  %221 = icmp sgt i32 %220, 0
  br i1 %221, label %222, label %.outer

; <label>:222                                     ; preds = %212
  %223 = load i64* %29, align 8, !tbaa !30
  %224 = trunc i64 %223 to i32
  %225 = load i64* %41, align 8, !tbaa !121
  %226 = trunc i64 %225 to i32
  %227 = load i32* %14, align 4, !tbaa !98
  %228 = icmp eq i32 %227, 0
  br i1 %228, label %231, label %229

; <label>:229                                     ; preds = %222
  %230 = load i32** %46, align 8, !tbaa !97
  br label %231

; <label>:231                                     ; preds = %229, %222
  %.in = phi i32* [ %230, %229 ], [ %16, %222 ]
  %232 = load i32* %.in, align 4
  %233 = load i32* %42, align 4, !tbaa !64
  %234 = load i64* %43, align 8, !tbaa !132
  %235 = load i32* %15, align 4, !tbaa !64
  %236 = load i64* %44, align 8, !tbaa !131
  %237 = load i32* %45, align 4, !tbaa !63
  %238 = sitofp i32 %237 to double
  %239 = fdiv double 1.000000e+00, %238
  %240 = icmp slt i32 %227, 0
  br i1 %240, label %.loopexit48, label %.lr.ph.i35

.lr.ph.i35:                                       ; preds = %231
  %241 = add i32 %227, 1
  br label %242

; <label>:242                                     ; preds = %256, %.lr.ph.i35
  %indvars.iv.i36 = phi i64 [ %indvars.iv.next.i39, %256 ], [ 0, %.lr.ph.i35 ]
  %progress.02.i37 = phi double [ %263, %256 ], [ 0.000000e+00, %.lr.ph.i35 ]
  %243 = trunc i64 %indvars.iv.i36 to i32
  %244 = icmp eq i32 %243, 0
  br i1 %244, label %250, label %245

; <label>:245                                     ; preds = %242
  %246 = add nsw i64 %indvars.iv.i36, -1
  %247 = load i32** %46, align 8, !tbaa !97
  %248 = getelementptr inbounds i32* %247, i64 %246
  %249 = load i32* %248, align 4, !tbaa !36
  br label %250

; <label>:250                                     ; preds = %245, %242
  %251 = phi i32 [ %249, %245 ], [ 0, %242 ]
  %252 = icmp eq i32 %243, %227
  br i1 %252, label %256, label %253

; <label>:253                                     ; preds = %250
  %254 = load i32** %46, align 8, !tbaa !97
  %255 = getelementptr inbounds i32* %254, i64 %indvars.iv.i36
  br label %256

; <label>:256                                     ; preds = %253, %250
  %.in.i38 = phi i32* [ %255, %253 ], [ %16, %250 ]
  %257 = load i32* %.in.i38, align 4
  %258 = sitofp i32 %243 to double
  %259 = call double @llvm.pow.f64(double %239, double %258) #2
  %260 = sub nsw i32 %257, %251
  %261 = sitofp i32 %260 to double
  %262 = fmul double %259, %261
  %263 = fadd double %progress.02.i37, %262
  %indvars.iv.next.i39 = add nuw nsw i64 %indvars.iv.i36, 1
  %lftr.wideiv88 = trunc i64 %indvars.iv.next.i39 to i32
  %exitcond89 = icmp eq i32 %lftr.wideiv88, %241
  br i1 %exitcond89, label %.loopexit48, label %242

.loopexit48:                                      ; preds = %256, %231
  %progress.0.lcssa.i40 = phi double [ 0.000000e+00, %231 ], [ %263, %256 ]
  %264 = fdiv double %progress.0.lcssa.i40, %238
  %265 = sitofp i32 %235 to double
  %266 = uitofp i64 %236 to double
  %267 = fdiv double %266, %265
  %268 = fptosi double %219 to i32
  %269 = trunc i64 %234 to i32
  %270 = sub nsw i32 %226, %232
  %271 = fmul double %264, 1.000000e+02
  %272 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([50 x i8]* @.str4141, i64 0, i64 0), i32 %224, i32 %270, i32 %233, i32 %269, i32 %268, i32 %235, double %267, double %271)
  br label %.outer

; <label>:273                                     ; preds = %58
  br i1 %or.cond, label %274, label %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread

; <label>:274                                     ; preds = %273
  %275 = load i8* %11, align 1, !tbaa !68, !range !78
  %276 = icmp eq i8 %275, 0
  br i1 %276, label %277, label %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread

; <label>:277                                     ; preds = %274
  %278 = load i64* %12, align 8, !tbaa !146
  %279 = icmp slt i64 %278, 0
  br i1 %279, label %283, label %280

; <label>:280                                     ; preds = %277
  %281 = load i64* %29, align 8, !tbaa !30
  %282 = icmp ult i64 %281, %278
  br i1 %282, label %283, label %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread

; <label>:283                                     ; preds = %280, %277
  %284 = load i64* %13, align 8, !tbaa !147
  %285 = icmp slt i64 %284, 0
  br i1 %285, label %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread47, label %_ZNK7Minisat6Solver12withinBudgetEv.exit

_ZNK7Minisat6Solver12withinBudgetEv.exit:         ; preds = %283
  %286 = load i64* %28, align 8, !tbaa !33
  %287 = icmp ult i64 %286, %284
  br i1 %287, label %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread47, label %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread

_ZNK7Minisat6Solver12withinBudgetEv.exit.thread:  ; preds = %_ZNK7Minisat6Solver12withinBudgetEv.exit, %280, %274, %273
  %288 = load i32* %45, align 4, !tbaa !63
  %289 = sitofp i32 %288 to double
  %290 = fdiv double 1.000000e+00, %289
  %291 = load i32* %14, align 4, !tbaa !98
  %292 = icmp slt i32 %291, 0
  br i1 %292, label %.loopexit, label %.lr.ph.i31

.lr.ph.i31:                                       ; preds = %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread
  %293 = add i32 %291, 1
  br label %294

; <label>:294                                     ; preds = %308, %.lr.ph.i31
  %indvars.iv.i32 = phi i64 [ %indvars.iv.next.i33, %308 ], [ 0, %.lr.ph.i31 ]
  %progress.02.i = phi double [ %315, %308 ], [ 0.000000e+00, %.lr.ph.i31 ]
  %295 = trunc i64 %indvars.iv.i32 to i32
  %296 = icmp eq i32 %295, 0
  br i1 %296, label %302, label %297

; <label>:297                                     ; preds = %294
  %298 = add nsw i64 %indvars.iv.i32, -1
  %299 = load i32** %46, align 8, !tbaa !97
  %300 = getelementptr inbounds i32* %299, i64 %298
  %301 = load i32* %300, align 4, !tbaa !36
  br label %302

; <label>:302                                     ; preds = %297, %294
  %303 = phi i32 [ %301, %297 ], [ 0, %294 ]
  %304 = icmp eq i32 %295, %291
  br i1 %304, label %308, label %305

; <label>:305                                     ; preds = %302
  %306 = load i32** %46, align 8, !tbaa !97
  %307 = getelementptr inbounds i32* %306, i64 %indvars.iv.i32
  br label %308

; <label>:308                                     ; preds = %305, %302
  %.in.i = phi i32* [ %307, %305 ], [ %16, %302 ]
  %309 = load i32* %.in.i, align 4
  %310 = sitofp i32 %295 to double
  %311 = call double @llvm.pow.f64(double %290, double %310) #2
  %312 = sub nsw i32 %309, %303
  %313 = sitofp i32 %312 to double
  %314 = fmul double %311, %313
  %315 = fadd double %progress.02.i, %314
  %indvars.iv.next.i33 = add nuw nsw i64 %indvars.iv.i32, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i33 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %293
  br i1 %exitcond, label %.loopexit, label %294

.loopexit:                                        ; preds = %308, %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread
  %progress.0.lcssa.i = phi double [ 0.000000e+00, %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread ], [ %315, %308 ]
  %316 = fdiv double %progress.0.lcssa.i, %289
  %317 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 49
  store double %316, double* %317, align 8, !tbaa !148
  invoke void @_ZN7Minisat6Solver11cancelUntilEi(%"class.Minisat::Solver"* %this, i32 0)
          to label %.loopexit60 unwind label %.nonloopexit.nonloopexit

_ZNK7Minisat6Solver12withinBudgetEv.exit.thread47: ; preds = %_ZNK7Minisat6Solver12withinBudgetEv.exit, %283
  %318 = load i32* %14, align 4, !tbaa !98
  %319 = icmp eq i32 %318, 0
  br i1 %319, label %320, label %323

; <label>:320                                     ; preds = %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread47
  %321 = invoke zeroext i1 @_ZN7Minisat6Solver8simplifyEv(%"class.Minisat::Solver"* %this)
          to label %322 unwind label %.nonloopexit.loopexit.loopexit

; <label>:322                                     ; preds = %320
  br i1 %321, label %323, label %.loopexit60

; <label>:323                                     ; preds = %322, %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread47
  %324 = load i32* %15, align 4, !tbaa !64
  %325 = load i32* %16, align 4, !tbaa !61
  %326 = sub nsw i32 %324, %325
  %327 = sitofp i32 %326 to double
  %328 = load double* %17, align 8, !tbaa !145
  %329 = fcmp ult double %327, %328
  br i1 %329, label %.preheader, label %330

; <label>:330                                     ; preds = %323
  invoke void @_ZN7Minisat6Solver8reduceDBEv(%"class.Minisat::Solver"* %this)
          to label %.preheader unwind label %.nonloopexit.loopexit.loopexit

.preheader:                                       ; preds = %330, %323
  %331 = load i32* %14, align 4, !tbaa !98
  %332 = load i32* %18, align 4, !tbaa !61
  %333 = icmp slt i32 %331, %332
  br i1 %333, label %.lr.ph, label %.thread

.lr.ph:                                           ; preds = %_ZN7Minisat6Solver16newDecisionLevelEv.exit29, %.preheader
  %334 = phi i32 [ %357, %_ZN7Minisat6Solver16newDecisionLevelEv.exit29 ], [ %331, %.preheader ]
  %335 = sext i32 %334 to i64
  %336 = load %"struct.Minisat::Lit"** %27, align 8, !tbaa !60
  %337 = getelementptr inbounds %"struct.Minisat::Lit"* %336, i64 %335, i32 0
  %338 = load i32* %337, align 4
  %339 = ashr i32 %338, 1
  %340 = sext i32 %339 to i64
  %341 = load %"class.Minisat::lbool"** %23, align 8, !tbaa !65
  %342 = getelementptr inbounds %"class.Minisat::lbool"* %341, i64 %340, i32 0
  %343 = load i8* %342, align 1, !tbaa !66
  %p.coerce.tr.i30 = trunc i32 %338 to i8
  %344 = and i8 %p.coerce.tr.i30, 1
  %345 = icmp eq i8 %343, %344
  br i1 %345, label %346, label %360

; <label>:346                                     ; preds = %.lr.ph
  %347 = load i32* %16, align 4, !tbaa !61
  %348 = load i32* %21, align 4, !tbaa !99
  %349 = icmp eq i32 %334, %348
  br i1 %349, label %350, label %_ZN7Minisat6Solver16newDecisionLevelEv.exit29

; <label>:350                                     ; preds = %346
  %351 = add nsw i32 %334, 1
  invoke void @_ZN7Minisat3vecIiE8capacityEi(%"class.Minisat::vec.6"* %20, i32 %351)
          to label %.noexc28 unwind label %.loopexit50

.noexc28:                                         ; preds = %350
  %.pre.i.i27 = load i32* %14, align 4, !tbaa !98
  br label %_ZN7Minisat6Solver16newDecisionLevelEv.exit29

_ZN7Minisat6Solver16newDecisionLevelEv.exit29:    ; preds = %.noexc28, %346
  %352 = phi i32 [ %.pre.i.i27, %.noexc28 ], [ %334, %346 ]
  %353 = add nsw i32 %352, 1
  store i32 %353, i32* %14, align 4, !tbaa !98
  %354 = sext i32 %352 to i64
  %355 = load i32** %22, align 8, !tbaa !97
  %356 = getelementptr inbounds i32* %355, i64 %354
  store i32 %347, i32* %356, align 4, !tbaa !36
  %357 = load i32* %14, align 4, !tbaa !98
  %358 = load i32* %18, align 4, !tbaa !61
  %359 = icmp slt i32 %357, %358
  br i1 %359, label %.lr.ph, label %.thread

; <label>:360                                     ; preds = %.lr.ph
  %361 = xor i8 %343, %344
  %362 = icmp eq i8 %361, 1
  br i1 %362, label %363, label %366

; <label>:363                                     ; preds = %360
  %364 = xor i32 %338, 1
  %365 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 2
  invoke void @_ZN7Minisat6Solver12analyzeFinalENS_3LitERNS_3vecIS1_EE(%"class.Minisat::Solver"* %this, i32 %364, %"class.Minisat::vec.0"* %365)
          to label %.loopexit60 unwind label %.nonloopexit.nonloopexit

; <label>:366                                     ; preds = %360
  %367 = icmp eq i32 %338, -2
  br i1 %367, label %.thread, label %373

.thread:                                          ; preds = %366, %_ZN7Minisat6Solver16newDecisionLevelEv.exit29, %.preheader
  %368 = load i64* %19, align 8, !tbaa !31
  %369 = add i64 %368, 1
  store i64 %369, i64* %19, align 8, !tbaa !31
  %370 = invoke i32 @_ZN7Minisat6Solver13pickBranchLitEv(%"class.Minisat::Solver"* %this)
          to label %371 unwind label %.nonloopexit.loopexit.loopexit

; <label>:371                                     ; preds = %.thread
  %372 = icmp eq i32 %370, -2
  br i1 %372, label %.loopexit60, label %._crit_edge

._crit_edge:                                      ; preds = %371
  %.pre = load i32* %14, align 4, !tbaa !98
  br label %373

; <label>:373                                     ; preds = %._crit_edge, %366
  %374 = phi i32 [ %.pre, %._crit_edge ], [ %334, %366 ]
  %375 = phi i32 [ %370, %._crit_edge ], [ %338, %366 ]
  %376 = load i32* %16, align 4, !tbaa !61
  %377 = load i32* %21, align 4, !tbaa !99
  %378 = icmp eq i32 %374, %377
  br i1 %378, label %379, label %381

; <label>:379                                     ; preds = %373
  %380 = add nsw i32 %374, 1
  invoke void @_ZN7Minisat3vecIiE8capacityEi(%"class.Minisat::vec.6"* %20, i32 %380)
          to label %.noexc13 unwind label %.nonloopexit.loopexit.loopexit

.noexc13:                                         ; preds = %379
  %.pre.i.i = load i32* %14, align 4, !tbaa !98
  br label %381

; <label>:381                                     ; preds = %.noexc13, %373
  %382 = phi i32 [ %.pre.i.i, %.noexc13 ], [ %374, %373 ]
  %383 = add nsw i32 %382, 1
  store i32 %383, i32* %14, align 4, !tbaa !98
  %384 = sext i32 %382 to i64
  %385 = load i32** %22, align 8, !tbaa !97
  %386 = getelementptr inbounds i32* %385, i64 %384
  store i32 %376, i32* %386, align 4, !tbaa !36
  %387 = ashr i32 %375, 1
  %388 = sext i32 %387 to i64
  %389 = load %"class.Minisat::lbool"** %23, align 8, !tbaa !65
  %390 = getelementptr inbounds %"class.Minisat::lbool"* %389, i64 %388, i32 0
  %391 = load i8* %390, align 1, !tbaa !66
  %392 = and i8 %391, 2
  %393 = icmp eq i8 %392, 0
  br i1 %393, label %394, label %395, !prof !123

; <label>:394                                     ; preds = %381
  invoke void @__assert_rtn(i8* getelementptr inbounds ([17 x i8]* @__func__._ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 432, i8* getelementptr inbounds ([20 x i8]* @.str3838, i64 0, i64 0)) #16
          to label %.noexc unwind label %.nonloopexit.nonloopexit

.noexc:                                           ; preds = %394
  unreachable

; <label>:395                                     ; preds = %381
  %396 = and i32 %375, 1
  %397 = xor i32 %396, 1
  %398 = trunc i32 %397 to i8
  %399 = xor i8 %398, 1
  store i8 %399, i8* %390, align 1, !tbaa !59
  %400 = load %"struct.Minisat::Solver::VarData"** %24, align 8, !tbaa !100
  %401 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %400, i64 %388
  %402 = load i32* %14, align 4, !tbaa !98
  %403 = zext i32 %402 to i64
  %404 = shl nuw i64 %403, 32
  %405 = or i64 %404, 4294967295
  %406 = bitcast %"struct.Minisat::Solver::VarData"* %401 to i64*
  store i64 %405, i64* %406, align 4
  %407 = load i32* %16, align 4, !tbaa !61
  %408 = load i32* %25, align 4, !tbaa !62
  %409 = icmp slt i32 %407, %408
  br i1 %409, label %_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit, label %410, !prof !122

; <label>:410                                     ; preds = %395
  invoke void @__assert_rtn(i8* getelementptr inbounds ([6 x i8]* @__func__._ZN7Minisat3vecINS_3LitEE5push_ERKS1_, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 75, i8* getelementptr inbounds ([9 x i8]* @.str62, i64 0, i64 0)) #16
          to label %.noexc10 unwind label %.nonloopexit.nonloopexit

.noexc10:                                         ; preds = %410
  unreachable

_ZN7Minisat6Solver16uncheckedEnqueueENS_3LitEj.exit: ; preds = %395
  %411 = add nsw i32 %407, 1
  store i32 %411, i32* %16, align 4, !tbaa !61
  %412 = sext i32 %407 to i64
  %413 = load %"struct.Minisat::Lit"** %26, align 8, !tbaa !60
  %414 = getelementptr inbounds %"struct.Minisat::Lit"* %413, i64 %412, i32 0
  store i32 %375, i32* %414, align 4, !tbaa !36
  br label %56

.loopexit60:                                      ; preds = %371, %363, %322, %.loopexit, %60
  %415 = phi i8 [ 2, %.loopexit ], [ 1, %363 ], [ 0, %371 ], [ 1, %322 ], [ 1, %60 ]
  %416 = load %"struct.Minisat::Lit"** %30, align 8, !tbaa !60
  %417 = icmp eq %"struct.Minisat::Lit"* %416, null
  br i1 %417, label %_ZN7Minisat3vecINS_3LitEED1Ev.exit, label %.preheader.i.i.i

.preheader.i.i.i:                                 ; preds = %.loopexit60
  store i32 0, i32* %31, align 8, !tbaa !61
  %418 = bitcast %"struct.Minisat::Lit"* %416 to i8*
  call void @free(i8* %418) #2
  store %"struct.Minisat::Lit"* null, %"struct.Minisat::Lit"** %30, align 8, !tbaa !60
  %419 = getelementptr inbounds %"class.Minisat::vec.0"* %learnt_clause, i64 0, i32 2
  store i32 0, i32* %419, align 4, !tbaa !62
  br label %_ZN7Minisat3vecINS_3LitEED1Ev.exit

_ZN7Minisat3vecINS_3LitEED1Ev.exit:               ; preds = %.preheader.i.i.i, %.loopexit60
  ret i8 %415

_ZN7Minisat3vecINS_3LitEED1Ev.exit12:             ; preds = %.preheader.i.i.i11, %.nonloopexit
  resume { i8*, i32 } %lpad.phi
}

; Function Attrs: nounwind readonly ssp uwtable
define double @_ZNK7Minisat6Solver16progressEstimateEv(%"class.Minisat::Solver"* nocapture readonly %this) #13 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 1
  %2 = load i32* %1, align 4, !tbaa !63
  %3 = sitofp i32 %2 to double
  %4 = fdiv double 1.000000e+00, %3
  %5 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 1
  %6 = load i32* %5, align 4, !tbaa !98
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %0
  %8 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 1
  %9 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 42, i32 0
  br label %10

; <label>:10                                      ; preds = %24, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %24 ], [ 0, %.lr.ph ]
  %progress.02 = phi double [ %31, %24 ], [ 0.000000e+00, %.lr.ph ]
  %11 = trunc i64 %indvars.iv to i32
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %18, label %13

; <label>:13                                      ; preds = %10
  %14 = add nsw i64 %indvars.iv, -1
  %15 = load i32** %9, align 8, !tbaa !97
  %16 = getelementptr inbounds i32* %15, i64 %14
  %17 = load i32* %16, align 4, !tbaa !36
  br label %18

; <label>:18                                      ; preds = %13, %10
  %19 = phi i32 [ %17, %13 ], [ 0, %10 ]
  %20 = icmp eq i32 %11, %6
  br i1 %20, label %24, label %21

; <label>:21                                      ; preds = %18
  %22 = load i32** %9, align 8, !tbaa !97
  %23 = getelementptr inbounds i32* %22, i64 %indvars.iv
  br label %24

; <label>:24                                      ; preds = %21, %18
  %.in = phi i32* [ %23, %21 ], [ %8, %18 ]
  %25 = load i32* %.in, align 4
  %26 = sitofp i32 %11 to double
  %27 = tail call double @llvm.pow.f64(double %4, double %26)
  %28 = sub nsw i32 %25, %19
  %29 = sitofp i32 %28 to double
  %30 = fmul double %27, %29
  %31 = fadd double %progress.02, %30
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %32 = icmp slt i32 %11, %6
  br i1 %32, label %10, label %._crit_edge

._crit_edge:                                      ; preds = %24, %0
  %progress.0.lcssa = phi double [ 0.000000e+00, %0 ], [ %31, %24 ]
  %33 = fdiv double %progress.0.lcssa, %3
  ret double %33
}

; Function Attrs: nounwind readnone
declare double @llvm.pow.f64(double, double) #9

; Function Attrs: ssp uwtable
define i8 @_ZN7Minisat6Solver6solve_Ev(%"class.Minisat::Solver"* %this) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 1
  %2 = getelementptr inbounds %"class.Minisat::vec"* %1, i64 0, i32 0
  %3 = load %"class.Minisat::lbool"** %2, align 8, !tbaa !65
  %4 = icmp eq %"class.Minisat::lbool"* %3, null
  br i1 %4, label %_ZN7Minisat3vecINS_5lboolEE5clearEb.exit, label %.preheader.i

.preheader.i:                                     ; preds = %0
  %5 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 1, i32 1
  store i32 0, i32* %5, align 4, !tbaa !105
  br label %_ZN7Minisat3vecINS_5lboolEE5clearEb.exit

_ZN7Minisat3vecINS_5lboolEE5clearEb.exit:         ; preds = %.preheader.i, %0
  %6 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 2, i32 0
  %7 = load %"struct.Minisat::Lit"** %6, align 8, !tbaa !60
  %8 = icmp eq %"struct.Minisat::Lit"* %7, null
  br i1 %8, label %_ZN7Minisat3vecINS_3LitEE5clearEb.exit, label %.preheader.i6

.preheader.i6:                                    ; preds = %_ZN7Minisat3vecINS_5lboolEE5clearEb.exit
  %9 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 2, i32 1
  store i32 0, i32* %9, align 4, !tbaa !61
  br label %_ZN7Minisat3vecINS_3LitEE5clearEb.exit

_ZN7Minisat3vecINS_3LitEE5clearEb.exit:           ; preds = %.preheader.i6, %_ZN7Minisat3vecINS_5lboolEE5clearEb.exit
  %10 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 31
  %11 = load i8* %10, align 1, !tbaa !91, !range !78
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %125, label %13

; <label>:13                                      ; preds = %_ZN7Minisat3vecINS_3LitEE5clearEb.exit
  %14 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 20
  %15 = load i64* %14, align 8, !tbaa !149
  %16 = add i64 %15, 1
  store i64 %16, i64* %14, align 8, !tbaa !149
  %17 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32, i32 1
  %18 = load i32* %17, align 4, !tbaa !64
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 16
  %21 = load double* %20, align 8, !tbaa !87
  %22 = fmul double %19, %21
  %23 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 57
  store double %22, double* %23, align 8, !tbaa !145
  %24 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 18
  %25 = load i32* %24, align 4, !tbaa !89
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 58
  store double %26, double* %27, align 8, !tbaa !144
  %28 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 59
  store i32 %25, i32* %28, align 4, !tbaa !143
  %29 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 3
  %30 = load i32* %29, align 4, !tbaa !51
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %32, label %.preheader

; <label>:32                                      ; preds = %13
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([80 x i8]* @str96, i64 0, i64 0))
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([80 x i8]* @str97, i64 0, i64 0))
  %puts4 = tail call i32 @puts(i8* getelementptr inbounds ([80 x i8]* @str98, i64 0, i64 0))
  %puts5 = tail call i32 @puts(i8* getelementptr inbounds ([80 x i8]* @str99, i64 0, i64 0))
  br label %.preheader

.preheader:                                       ; preds = %32, %13
  %33 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 25
  %34 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 24
  %35 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 8
  %36 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 15
  %37 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 14
  %38 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 62
  %39 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 60
  %40 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 61
  br label %41

; <label>:41                                      ; preds = %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread13, %.preheader
  %curr_restarts.017 = phi i32 [ 0, %.preheader ], [ %84, %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread13 ]
  %42 = load i8* %35, align 1, !tbaa !79, !range !78
  %43 = icmp eq i8 %42, 0
  %44 = load double* %36, align 8, !tbaa !86
  br i1 %43, label %61, label %45

; <label>:45                                      ; preds = %41
  %46 = add nsw i32 %curr_restarts.017, 1
  %47 = icmp sgt i32 %curr_restarts.017, 0
  br i1 %47, label %.lr.ph6.i, label %.preheader.i7

..preheader_crit_edge.i:                          ; preds = %.lr.ph6.i
  %phitmp.i = add i32 %51, -1
  br label %.preheader.i7

.preheader.i7:                                    ; preds = %..preheader_crit_edge.i, %45
  %seq.0.lcssa.i = phi i32 [ %49, %..preheader_crit_edge.i ], [ 0, %45 ]
  %size.0.lcssa.i = phi i32 [ %phitmp.i, %..preheader_crit_edge.i ], [ 0, %45 ]
  %48 = icmp eq i32 %size.0.lcssa.i, %curr_restarts.017
  br i1 %48, label %_ZL4lubydi.exit, label %.lr.ph.i8

.lr.ph6.i:                                        ; preds = %.lr.ph6.i, %45
  %seq.04.i = phi i32 [ %49, %.lr.ph6.i ], [ 0, %45 ]
  %size.03.i = phi i32 [ %51, %.lr.ph6.i ], [ 1, %45 ]
  %49 = add nsw i32 %seq.04.i, 1
  %50 = shl nsw i32 %size.03.i, 1
  %51 = or i32 %50, 1
  %52 = icmp slt i32 %51, %46
  br i1 %52, label %.lr.ph6.i, label %..preheader_crit_edge.i

.lr.ph.i8:                                        ; preds = %.lr.ph.i8, %.preheader.i7
  %53 = phi i32 [ %57, %.lr.ph.i8 ], [ %size.0.lcssa.i, %.preheader.i7 ]
  %seq.12.i = phi i32 [ %55, %.lr.ph.i8 ], [ %seq.0.lcssa.i, %.preheader.i7 ]
  %.01.i = phi i32 [ %56, %.lr.ph.i8 ], [ %curr_restarts.017, %.preheader.i7 ]
  %54 = ashr i32 %53, 1
  %55 = add nsw i32 %seq.12.i, -1
  %56 = srem i32 %.01.i, %54
  %57 = add nsw i32 %54, -1
  %58 = icmp eq i32 %57, %56
  br i1 %58, label %_ZL4lubydi.exit, label %.lr.ph.i8

_ZL4lubydi.exit:                                  ; preds = %.lr.ph.i8, %.preheader.i7
  %seq.1.lcssa.i = phi i32 [ %seq.0.lcssa.i, %.preheader.i7 ], [ %55, %.lr.ph.i8 ]
  %59 = sitofp i32 %seq.1.lcssa.i to double
  %60 = tail call double @llvm.pow.f64(double %44, double %59) #2
  br label %64

; <label>:61                                      ; preds = %41
  %62 = sitofp i32 %curr_restarts.017 to double
  %63 = tail call double @llvm.pow.f64(double %44, double %62)
  br label %64

; <label>:64                                      ; preds = %61, %_ZL4lubydi.exit
  %65 = phi double [ %60, %_ZL4lubydi.exit ], [ %63, %61 ]
  %66 = load i32* %37, align 4, !tbaa !85
  %67 = sitofp i32 %66 to double
  %68 = fmul double %65, %67
  %69 = fptosi double %68 to i32
  %70 = tail call i8 @_ZN7Minisat6Solver6searchEi(%"class.Minisat::Solver"* %this, i32 %69)
  %71 = load i8* %38, align 1, !tbaa !68, !range !78
  %72 = icmp eq i8 %71, 0
  br i1 %72, label %73, label %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread

; <label>:73                                      ; preds = %64
  %74 = load i64* %39, align 8, !tbaa !146
  %75 = icmp slt i64 %74, 0
  br i1 %75, label %79, label %76

; <label>:76                                      ; preds = %73
  %77 = load i64* %33, align 8, !tbaa !30
  %78 = icmp ult i64 %77, %74
  br i1 %78, label %79, label %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread

; <label>:79                                      ; preds = %76, %73
  %80 = load i64* %40, align 8, !tbaa !147
  %81 = icmp slt i64 %80, 0
  br i1 %81, label %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread13, label %_ZNK7Minisat6Solver12withinBudgetEv.exit

_ZNK7Minisat6Solver12withinBudgetEv.exit:         ; preds = %79
  %82 = load i64* %34, align 8, !tbaa !33
  %83 = icmp ult i64 %82, %80
  br i1 %83, label %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread13, label %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread

_ZNK7Minisat6Solver12withinBudgetEv.exit.thread13: ; preds = %_ZNK7Minisat6Solver12withinBudgetEv.exit, %79
  %84 = add nsw i32 %curr_restarts.017, 1
  %85 = and i8 %70, 2
  %86 = icmp eq i8 %85, 0
  br i1 %86, label %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread, label %41

_ZNK7Minisat6Solver12withinBudgetEv.exit.thread:  ; preds = %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread13, %_ZNK7Minisat6Solver12withinBudgetEv.exit, %76, %64
  %87 = load i32* %29, align 4, !tbaa !51
  %88 = icmp sgt i32 %87, 0
  br i1 %88, label %89, label %90

; <label>:89                                      ; preds = %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([80 x i8]* @str99, i64 0, i64 0))
  br label %90

; <label>:90                                      ; preds = %89, %_ZNK7Minisat6Solver12withinBudgetEv.exit.thread
  switch i8 %70, label %.loopexit [
    i8 0, label %91
    i8 1, label %120
  ]

; <label>:91                                      ; preds = %90
  %92 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 1
  %93 = load i32* %92, align 4, !tbaa !63
  %94 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 1, i32 1
  %95 = load i32* %94, align 4, !tbaa !105
  %96 = icmp slt i32 %95, %93
  br i1 %96, label %97, label %_ZN7Minisat3vecINS_5lboolEE6growToEi.exit.preheader

; <label>:97                                      ; preds = %91
  tail call void @_ZN7Minisat3vecINS_5lboolEE8capacityEi(%"class.Minisat::vec"* %1, i32 %93)
  %98 = load i32* %94, align 4, !tbaa !105
  %99 = icmp slt i32 %98, %93
  br i1 %99, label %.lr.ph.i, label %._crit_edge.i

.lr.ph.i:                                         ; preds = %97
  %100 = load %"class.Minisat::lbool"** %2, align 8, !tbaa !65
  %101 = sext i32 %98 to i64
  br label %102

; <label>:102                                     ; preds = %106, %.lr.ph.i
  %indvars.iv.i = phi i64 [ %101, %.lr.ph.i ], [ %indvars.iv.next.i, %106 ]
  %103 = getelementptr inbounds %"class.Minisat::lbool"* %100, i64 %indvars.iv.i, i32 0
  %104 = icmp eq i8* %103, null
  br i1 %104, label %106, label %105

; <label>:105                                     ; preds = %102
  store i8 0, i8* %103, align 1, !tbaa !66
  br label %106

; <label>:106                                     ; preds = %105, %102
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, 1
  %107 = trunc i64 %indvars.iv.next.i to i32
  %108 = icmp slt i32 %107, %93
  br i1 %108, label %102, label %._crit_edge.i

._crit_edge.i:                                    ; preds = %106, %97
  store i32 %93, i32* %94, align 4, !tbaa !105
  %.pre = load i32* %92, align 4, !tbaa !63
  br label %_ZN7Minisat3vecINS_5lboolEE6growToEi.exit.preheader

_ZN7Minisat3vecINS_5lboolEE6growToEi.exit.preheader: ; preds = %._crit_edge.i, %91
  %109 = phi i32 [ %93, %91 ], [ %.pre, %._crit_edge.i ]
  %110 = icmp sgt i32 %109, 0
  br i1 %110, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %_ZN7Minisat3vecINS_5lboolEE6growToEi.exit.preheader
  %111 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  br label %_ZN7Minisat3vecINS_5lboolEE6growToEi.exit

_ZN7Minisat3vecINS_5lboolEE6growToEi.exit:        ; preds = %_ZN7Minisat3vecINS_5lboolEE6growToEi.exit, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %_ZN7Minisat3vecINS_5lboolEE6growToEi.exit ]
  %112 = load %"class.Minisat::lbool"** %2, align 8, !tbaa !65
  %113 = load %"class.Minisat::lbool"** %111, align 8, !tbaa !65
  %114 = getelementptr inbounds %"class.Minisat::lbool"* %113, i64 %indvars.iv, i32 0
  %115 = load i8* %114, align 1
  %116 = getelementptr inbounds %"class.Minisat::lbool"* %112, i64 %indvars.iv, i32 0
  store i8 %115, i8* %116, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %117 = load i32* %92, align 4, !tbaa !63
  %118 = trunc i64 %indvars.iv.next to i32
  %119 = icmp slt i32 %118, %117
  br i1 %119, label %_ZN7Minisat3vecINS_5lboolEE6growToEi.exit, label %.loopexit

; <label>:120                                     ; preds = %90
  %121 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 2, i32 1
  %122 = load i32* %121, align 4, !tbaa !61
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %124, label %.loopexit

; <label>:124                                     ; preds = %120
  store i8 0, i8* %10, align 1, !tbaa !91
  br label %.loopexit

.loopexit:                                        ; preds = %124, %120, %_ZN7Minisat3vecINS_5lboolEE6growToEi.exit, %_ZN7Minisat3vecINS_5lboolEE6growToEi.exit.preheader, %90
  tail call void @_ZN7Minisat6Solver11cancelUntilEi(%"class.Minisat::Solver"* %this, i32 0)
  br label %125

; <label>:125                                     ; preds = %.loopexit, %_ZN7Minisat3vecINS_3LitEE5clearEb.exit
  %126 = phi i8 [ %70, %.loopexit ], [ 1, %_ZN7Minisat3vecINS_3LitEE5clearEb.exit ]
  ret i8 %126
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6Solver8toDimacsEP7__sFILERNS_6ClauseERNS_3vecIiEERi(%"class.Minisat::Solver"* nocapture readonly %this, %struct.__sFILE* nocapture %f, %"class.Minisat::Clause"* nocapture readonly %c, %"class.Minisat::vec.6"* nocapture %map, i32* nocapture %max) #0 align 2 {
  %1 = bitcast %"class.Minisat::Clause"* %c to i32*
  %2 = load i32* %1, align 4
  %3 = icmp ugt i32 %2, 31
  br i1 %3, label %.lr.ph.i, label %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread._crit_edge

.lr.ph.i:                                         ; preds = %0
  %4 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %5 = load %"class.Minisat::lbool"** %4, align 8, !tbaa !65
  %6 = lshr i32 %2, 5
  br label %13

; <label>:7                                       ; preds = %13
  %8 = trunc i64 %indvars.iv.next.i to i32
  %9 = icmp slt i32 %8, %6
  br i1 %9, label %13, label %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread.preheader

_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread.preheader: ; preds = %7
  br i1 %3, label %.lr.ph, label %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread._crit_edge

.lr.ph:                                           ; preds = %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread.preheader
  %10 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %11 = getelementptr inbounds %"class.Minisat::vec.6"* %map, i64 0, i32 1
  %12 = getelementptr inbounds %"class.Minisat::vec.6"* %map, i64 0, i32 0
  br label %22

; <label>:13                                      ; preds = %7, %.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %.lr.ph.i ], [ %indvars.iv.next.i, %7 ]
  %14 = getelementptr inbounds %"class.Minisat::Clause"* %c, i64 0, i32 1, i64 %indvars.iv.i, i32 0, i32 0
  %15 = load i32* %14, align 4
  %16 = ashr i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %"class.Minisat::lbool"* %5, i64 %17, i32 0
  %19 = load i8* %18, align 1, !tbaa !66
  %p.coerce.tr.i.i = trunc i32 %15 to i8
  %20 = and i8 %p.coerce.tr.i.i, 1
  %21 = icmp eq i8 %19, %20
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  br i1 %21, label %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit, label %7

; <label>:22                                      ; preds = %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread, %.lr.ph
  %23 = phi i32 [ %2, %.lr.ph ], [ %64, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread ]
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread ]
  %24 = getelementptr inbounds %"class.Minisat::Clause"* %c, i64 0, i32 1, i64 %indvars.iv, i32 0, i32 0
  %25 = load i32* %24, align 4
  %26 = ashr i32 %25, 1
  %27 = sext i32 %26 to i64
  %28 = load %"class.Minisat::lbool"** %10, align 8, !tbaa !65
  %29 = getelementptr inbounds %"class.Minisat::lbool"* %28, i64 %27, i32 0
  %30 = load i8* %29, align 1, !tbaa !66
  %p.coerce.tr.i = trunc i32 %25 to i8
  %31 = and i8 %p.coerce.tr.i, 1
  %32 = xor i8 %30, %31
  %33 = icmp eq i8 %32, 1
  br i1 %33, label %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread, label %34

; <label>:34                                      ; preds = %22
  %35 = and i32 %25, 1
  %36 = icmp ne i32 %35, 0
  %37 = select i1 %36, i8* getelementptr inbounds ([2 x i8]* @.str4743, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str4844, i64 0, i64 0)
  %38 = load i32* %11, align 4, !tbaa !98
  %39 = icmp sgt i32 %38, %26
  br i1 %39, label %40, label %45

; <label>:40                                      ; preds = %34
  %41 = load i32** %12, align 8, !tbaa !97
  %42 = getelementptr inbounds i32* %41, i64 %27
  %43 = load i32* %42, align 4, !tbaa !36
  %44 = icmp eq i32 %43, -1
  br i1 %44, label %45, label %_ZL6mapVariRN7Minisat3vecIiEERi.exit

; <label>:45                                      ; preds = %40, %34
  %46 = add nsw i32 %26, 1
  %47 = icmp slt i32 %38, %46
  br i1 %47, label %48, label %_ZN7Minisat3vecIiE6growToEiRKi.exit.i

; <label>:48                                      ; preds = %45
  tail call void @_ZN7Minisat3vecIiE8capacityEi(%"class.Minisat::vec.6"* %map, i32 %46)
  %49 = load i32* %11, align 4, !tbaa !98
  %50 = icmp slt i32 %49, %46
  br i1 %50, label %.lr.ph.i.i, label %._crit_edge.i.i

.lr.ph.i.i:                                       ; preds = %48
  %51 = load i32** %12, align 8, !tbaa !97
  %52 = sext i32 %49 to i64
  %scevgep.i = getelementptr i32* %51, i64 %52
  %scevgep1.i = bitcast i32* %scevgep.i to i8*
  %53 = sub i32 %26, %49
  %54 = zext i32 %53 to i64
  %55 = shl nuw nsw i64 %54, 2
  %56 = add i64 %55, 4
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep1.i, i8 -1, i64 %56, i32 4, i1 false)
  br label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %.lr.ph.i.i, %48
  store i32 %46, i32* %11, align 4, !tbaa !98
  br label %_ZN7Minisat3vecIiE6growToEiRKi.exit.i

_ZN7Minisat3vecIiE6growToEiRKi.exit.i:            ; preds = %._crit_edge.i.i, %45
  %57 = load i32* %max, align 4, !tbaa !36
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %max, align 4, !tbaa !36
  %59 = load i32** %12, align 8, !tbaa !97
  %60 = getelementptr inbounds i32* %59, i64 %27
  store i32 %57, i32* %60, align 4, !tbaa !36
  br label %_ZL6mapVariRN7Minisat3vecIiEERi.exit

_ZL6mapVariRN7Minisat3vecIiEERi.exit:             ; preds = %_ZN7Minisat3vecIiE6growToEiRKi.exit.i, %40
  %61 = phi i32 [ %57, %_ZN7Minisat3vecIiE6growToEiRKi.exit.i ], [ %43, %40 ]
  %62 = add nsw i32 %61, 1
  %63 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %f, i8* getelementptr inbounds ([6 x i8]* @.str4642, i64 0, i64 0), i8* %37, i32 %62)
  %.pre = load i32* %1, align 4
  br label %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread

_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread: ; preds = %_ZL6mapVariRN7Minisat3vecIiEERi.exit, %22
  %64 = phi i32 [ %23, %22 ], [ %.pre, %_ZL6mapVariRN7Minisat3vecIiEERi.exit ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %65 = lshr i32 %64, 5
  %66 = trunc i64 %indvars.iv.next to i32
  %67 = icmp slt i32 %66, %65
  br i1 %67, label %22, label %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread._crit_edge

_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread._crit_edge: ; preds = %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread.preheader, %0
  %68 = tail call i64 @fwrite(i8* getelementptr inbounds ([3 x i8]* @.str4945, i64 0, i64 0), i64 2, i64 1, %struct.__sFILE* %f)
  br label %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit

_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit: ; preds = %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit.thread._crit_edge, %13
  ret void
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6Solver8toDimacsEPKcRKNS_3vecINS_3LitEEE(%"class.Minisat::Solver"* nocapture readonly %this, i8* %file, %"class.Minisat::vec.0"* nocapture readnone %assumps) #0 align 2 {
  %1 = tail call %struct.__sFILE* @"\01_fopen"(i8* %file, i8* getelementptr inbounds ([3 x i8]* @.str5046, i64 0, i64 0))
  %2 = icmp eq %struct.__sFILE* %1, null
  br i1 %2, label %3, label %6

; <label>:3                                       ; preds = %0
  %4 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %5 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %4, i8* getelementptr inbounds ([24 x i8]* @.str5147, i64 0, i64 0), i8* %file)
  tail call void @exit(i32 1) #16
  unreachable

; <label>:6                                       ; preds = %0
  tail call void @_ZN7Minisat6Solver8toDimacsEP7__sFILERKNS_3vecINS_3LitEEE(%"class.Minisat::Solver"* %this, %struct.__sFILE* %1, %"class.Minisat::vec.0"* undef)
  %7 = tail call i32 @fclose(%struct.__sFILE* %1)
  ret void
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6Solver8toDimacsEP7__sFILERKNS_3vecINS_3LitEEE(%"class.Minisat::Solver"* nocapture readonly %this, %struct.__sFILE* nocapture %f, %"class.Minisat::vec.0"* nocapture readnone %assumps) #0 align 2 {
  %map = alloca %"class.Minisat::vec.6", align 8
  %max = alloca i32, align 4
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 31
  %2 = load i8* %1, align 1, !tbaa !91, !range !78
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([20 x i8]* @.str5248, i64 0, i64 0), i64 19, i64 1, %struct.__sFILE* %f)
  br label %_ZN7Minisat3vecIiED1Ev.exit

; <label>:6                                       ; preds = %0
  %7 = bitcast %"class.Minisat::vec.6"* %map to i8*
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 16, i32 8, i1 false) #2
  store i32 0, i32* %max, align 4, !tbaa !36
  %8 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32
  %9 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32, i32 1
  %10 = load i32* %9, align 4, !tbaa !64
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph61, label %._crit_edge53

.lr.ph61:                                         ; preds = %6
  %12 = getelementptr inbounds %"class.Minisat::vec.1"* %8, i64 0, i32 0
  %13 = load i32** %12, align 8, !tbaa !117
  %14 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %15 = bitcast i8* %14 to i32*
  %16 = load i32* %15, align 4, !tbaa !128
  %17 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %18 = bitcast %"class.Minisat::ClauseAllocator"* %17 to i32**
  %19 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  br label %28

.preheader50:                                     ; preds = %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit
  br i1 %11, label %.lr.ph52, label %._crit_edge53

.lr.ph52:                                         ; preds = %.preheader50
  %20 = getelementptr inbounds %"class.Minisat::vec.1"* %8, i64 0, i32 0
  %21 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %22 = bitcast i8* %21 to i32*
  %23 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %24 = bitcast %"class.Minisat::ClauseAllocator"* %23 to i32**
  %25 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %26 = getelementptr inbounds %"class.Minisat::vec.6"* %map, i64 0, i32 1
  %27 = getelementptr inbounds %"class.Minisat::vec.6"* %map, i64 0, i32 0
  br label %61

; <label>:28                                      ; preds = %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit, %.lr.ph61
  %indvars.iv70 = phi i64 [ 0, %.lr.ph61 ], [ %indvars.iv.next71, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit ]
  %cnt.059 = phi i32 [ 0, %.lr.ph61 ], [ %cnt.0., %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit ]
  %29 = getelementptr inbounds i32* %13, i64 %indvars.iv70
  %30 = load i32* %29, align 4, !tbaa !36
  %phitmp.i.i8 = icmp ugt i32 %16, %30
  br i1 %phitmp.i.i8, label %32, label %31, !prof !122

; <label>:31                                      ; preds = %28
  invoke void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
          to label %.noexc9 unwind label %.nonloopexit.nonloopexit.nonloopexit

.noexc9:                                          ; preds = %31
  unreachable

; <label>:32                                      ; preds = %28
  %33 = zext i32 %30 to i64
  %34 = load i32** %18, align 8, !tbaa !119
  %35 = getelementptr inbounds i32* %34, i64 %33
  %36 = bitcast i32* %35 to %"class.Minisat::Clause"*
  %37 = load i32* %35, align 4
  %38 = icmp ugt i32 %37, 31
  br i1 %38, label %.lr.ph.i, label %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit

.lr.ph.i:                                         ; preds = %32
  %39 = load %"class.Minisat::lbool"** %19, align 8, !tbaa !65
  %40 = lshr i32 %37, 5
  br label %44

; <label>:41                                      ; preds = %44
  %42 = trunc i64 %indvars.iv.next.i to i32
  %43 = icmp slt i32 %42, %40
  br i1 %43, label %44, label %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit

; <label>:44                                      ; preds = %41, %.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %.lr.ph.i ], [ %indvars.iv.next.i, %41 ]
  %45 = getelementptr inbounds %"class.Minisat::Clause"* %36, i64 0, i32 1, i64 %indvars.iv.i, i32 0, i32 0
  %46 = load i32* %45, align 4
  %47 = ashr i32 %46, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds %"class.Minisat::lbool"* %39, i64 %48, i32 0
  %50 = load i8* %49, align 1, !tbaa !66
  %p.coerce.tr.i.i = trunc i32 %46 to i8
  %51 = and i8 %p.coerce.tr.i.i, 1
  %52 = icmp eq i8 %50, %51
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  br i1 %52, label %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit, label %41

_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit: ; preds = %44, %41, %32
  %.0.i = phi i32 [ 1, %32 ], [ 0, %44 ], [ 1, %41 ]
  %cnt.0. = add nsw i32 %.0.i, %cnt.059
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %53 = trunc i64 %indvars.iv.next71 to i32
  %54 = icmp slt i32 %53, %10
  br i1 %54, label %28, label %.preheader50

.loopexit:                                        ; preds = %234
  %lpad.loopexit = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  br label %.nonloopexit

.nonloopexit.loopexit:                            ; preds = %203
  %lpad.loopexit38 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  br label %.nonloopexit

.nonloopexit.nonloopexit.loopexit:                ; preds = %121
  %lpad.loopexit46 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  br label %.nonloopexit

.nonloopexit.nonloopexit.nonloopexit:             ; preds = %233, %190, %73, %31
  %lpad.nonloopexit = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  br label %.nonloopexit

.nonloopexit:                                     ; preds = %.nonloopexit.nonloopexit.nonloopexit, %.nonloopexit.nonloopexit.loopexit, %.nonloopexit.loopexit, %.loopexit
  %lpad.phi = phi { i8*, i32 } [ %lpad.loopexit, %.loopexit ], [ %lpad.loopexit38, %.nonloopexit.loopexit ], [ %lpad.loopexit46, %.nonloopexit.nonloopexit.loopexit ], [ %lpad.nonloopexit, %.nonloopexit.nonloopexit.nonloopexit ]
  %55 = getelementptr inbounds %"class.Minisat::vec.6"* %map, i64 0, i32 0
  %56 = load i32** %55, align 8, !tbaa !97
  %57 = icmp eq i32* %56, null
  br i1 %57, label %_ZN7Minisat3vecIiED1Ev.exit13, label %.preheader.i.i.i12

.preheader.i.i.i12:                               ; preds = %.nonloopexit
  %58 = getelementptr inbounds %"class.Minisat::vec.6"* %map, i64 0, i32 1
  store i32 0, i32* %58, align 8, !tbaa !98
  %59 = bitcast i32* %56 to i8*
  tail call void @free(i8* %59) #2
  store i32* null, i32** %55, align 8, !tbaa !97
  %60 = getelementptr inbounds %"class.Minisat::vec.6"* %map, i64 0, i32 2
  store i32 0, i32* %60, align 4, !tbaa !99
  br label %_ZN7Minisat3vecIiED1Ev.exit13

; <label>:61                                      ; preds = %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33, %.lr.ph52
  %62 = phi i32* [ null, %.lr.ph52 ], [ %144, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33 ]
  %63 = phi i32* [ null, %.lr.ph52 ], [ %145, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33 ]
  %64 = phi i32 [ %10, %.lr.ph52 ], [ %146, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33 ]
  %65 = phi i32* [ null, %.lr.ph52 ], [ %147, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33 ]
  %66 = phi i32* [ null, %.lr.ph52 ], [ %148, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33 ]
  %67 = phi i32 [ 0, %.lr.ph52 ], [ %149, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33 ]
  %68 = phi i32 [ 0, %.lr.ph52 ], [ %150, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33 ]
  %indvars.iv68 = phi i64 [ 0, %.lr.ph52 ], [ %indvars.iv.next69, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33 ]
  %69 = load i32** %20, align 8, !tbaa !117
  %70 = getelementptr inbounds i32* %69, i64 %indvars.iv68
  %71 = load i32* %70, align 4, !tbaa !36
  %72 = load i32* %22, align 4, !tbaa !128
  %phitmp.i.i25 = icmp ugt i32 %72, %71
  br i1 %phitmp.i.i25, label %74, label %73, !prof !122

; <label>:73                                      ; preds = %61
  invoke void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
          to label %.noexc26 unwind label %.nonloopexit.nonloopexit.nonloopexit

.noexc26:                                         ; preds = %73
  unreachable

; <label>:74                                      ; preds = %61
  %75 = zext i32 %71 to i64
  %76 = load i32** %24, align 8, !tbaa !119
  %77 = getelementptr inbounds i32* %76, i64 %75
  %78 = bitcast i32* %77 to %"class.Minisat::Clause"*
  %79 = load i32* %77, align 4
  %80 = icmp ugt i32 %79, 31
  br i1 %80, label %.lr.ph.i28, label %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33

.lr.ph.i28:                                       ; preds = %74
  %81 = load %"class.Minisat::lbool"** %25, align 8, !tbaa !65
  %82 = lshr i32 %79, 5
  br label %86

; <label>:83                                      ; preds = %86
  %84 = trunc i64 %indvars.iv.next.i31 to i32
  %85 = icmp slt i32 %84, %82
  br i1 %85, label %86, label %_ZN7Minisat15ClauseAllocatorixEj.exit24

; <label>:86                                      ; preds = %83, %.lr.ph.i28
  %indvars.iv.i29 = phi i64 [ 0, %.lr.ph.i28 ], [ %indvars.iv.next.i31, %83 ]
  %87 = getelementptr inbounds %"class.Minisat::Clause"* %78, i64 0, i32 1, i64 %indvars.iv.i29, i32 0, i32 0
  %88 = load i32* %87, align 4
  %89 = ashr i32 %88, 1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds %"class.Minisat::lbool"* %81, i64 %90, i32 0
  %92 = load i8* %91, align 1, !tbaa !66
  %p.coerce.tr.i.i30 = trunc i32 %88 to i8
  %93 = and i8 %p.coerce.tr.i.i30, 1
  %94 = icmp eq i8 %92, %93
  %indvars.iv.next.i31 = add nuw nsw i64 %indvars.iv.i29, 1
  br i1 %94, label %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33, label %83

_ZN7Minisat15ClauseAllocatorixEj.exit24:          ; preds = %83
  br i1 %80, label %.lr.ph49, label %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33

.lr.ph49:                                         ; preds = %_ZL6mapVariRN7Minisat3vecIiEERi.exit20, %_ZN7Minisat15ClauseAllocatorixEj.exit24
  %95 = phi i32* [ %134, %_ZL6mapVariRN7Minisat3vecIiEERi.exit20 ], [ %62, %_ZN7Minisat15ClauseAllocatorixEj.exit24 ]
  %96 = phi i32* [ %135, %_ZL6mapVariRN7Minisat3vecIiEERi.exit20 ], [ %63, %_ZN7Minisat15ClauseAllocatorixEj.exit24 ]
  %97 = phi i32 [ %136, %_ZL6mapVariRN7Minisat3vecIiEERi.exit20 ], [ %79, %_ZN7Minisat15ClauseAllocatorixEj.exit24 ]
  %98 = phi i32* [ %137, %_ZL6mapVariRN7Minisat3vecIiEERi.exit20 ], [ %65, %_ZN7Minisat15ClauseAllocatorixEj.exit24 ]
  %99 = phi i32* [ %138, %_ZL6mapVariRN7Minisat3vecIiEERi.exit20 ], [ %66, %_ZN7Minisat15ClauseAllocatorixEj.exit24 ]
  %100 = phi i32 [ %139, %_ZL6mapVariRN7Minisat3vecIiEERi.exit20 ], [ %67, %_ZN7Minisat15ClauseAllocatorixEj.exit24 ]
  %101 = phi i32 [ %140, %_ZL6mapVariRN7Minisat3vecIiEERi.exit20 ], [ %68, %_ZN7Minisat15ClauseAllocatorixEj.exit24 ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %_ZL6mapVariRN7Minisat3vecIiEERi.exit20 ], [ 0, %_ZN7Minisat15ClauseAllocatorixEj.exit24 ]
  %102 = getelementptr inbounds %"class.Minisat::Clause"* %78, i64 0, i32 1, i64 %indvars.iv66, i32 0, i32 0
  %103 = load i32* %102, align 4
  %104 = ashr i32 %103, 1
  %105 = sext i32 %104 to i64
  %106 = load %"class.Minisat::lbool"** %25, align 8, !tbaa !65
  %107 = getelementptr inbounds %"class.Minisat::lbool"* %106, i64 %105, i32 0
  %108 = load i8* %107, align 1, !tbaa !66
  %p.coerce.tr.i21 = trunc i32 %103 to i8
  %109 = and i8 %p.coerce.tr.i21, 1
  %110 = xor i8 %108, %109
  %111 = icmp eq i8 %110, 1
  br i1 %111, label %_ZL6mapVariRN7Minisat3vecIiEERi.exit20, label %112

; <label>:112                                     ; preds = %.lr.ph49
  %113 = icmp sgt i32 %100, %104
  br i1 %113, label %114, label %118

; <label>:114                                     ; preds = %112
  %115 = getelementptr inbounds i32* %96, i64 %105
  %116 = load i32* %115, align 4, !tbaa !36
  %117 = icmp eq i32 %116, -1
  br i1 %117, label %118, label %_ZL6mapVariRN7Minisat3vecIiEERi.exit20

; <label>:118                                     ; preds = %114, %112
  %119 = add nsw i32 %104, 1
  %120 = icmp slt i32 %100, %119
  br i1 %120, label %121, label %_ZN7Minisat3vecIiE6growToEiRKi.exit.i18

; <label>:121                                     ; preds = %118
  invoke void @_ZN7Minisat3vecIiE8capacityEi(%"class.Minisat::vec.6"* %map, i32 %119)
          to label %.noexc19 unwind label %.nonloopexit.nonloopexit.loopexit

.noexc19:                                         ; preds = %121
  %122 = load i32* %26, align 8, !tbaa !98
  %123 = icmp slt i32 %122, %119
  %124 = load i32** %27, align 8, !tbaa !97
  br i1 %123, label %.lr.ph.i.i16, label %._crit_edge.i.i17

.lr.ph.i.i16:                                     ; preds = %.noexc19
  %125 = sext i32 %122 to i64
  %scevgep.i14 = getelementptr i32* %124, i64 %125
  %scevgep1.i15 = bitcast i32* %scevgep.i14 to i8*
  %126 = sub i32 %104, %122
  %127 = zext i32 %126 to i64
  %128 = shl nuw nsw i64 %127, 2
  %129 = add i64 %128, 4
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep1.i15, i8 -1, i64 %129, i32 4, i1 false)
  br label %._crit_edge.i.i17

._crit_edge.i.i17:                                ; preds = %.lr.ph.i.i16, %.noexc19
  store i32 %119, i32* %26, align 8, !tbaa !98
  br label %_ZN7Minisat3vecIiE6growToEiRKi.exit.i18

_ZN7Minisat3vecIiE6growToEiRKi.exit.i18:          ; preds = %._crit_edge.i.i17, %118
  %130 = phi i32* [ %124, %._crit_edge.i.i17 ], [ %95, %118 ]
  %131 = phi i32 [ %119, %._crit_edge.i.i17 ], [ %100, %118 ]
  %132 = add nsw i32 %101, 1
  store i32 %132, i32* %max, align 4, !tbaa !36
  %133 = getelementptr inbounds i32* %130, i64 %105
  store i32 %101, i32* %133, align 4, !tbaa !36
  %.pre74 = load i32* %77, align 4
  br label %_ZL6mapVariRN7Minisat3vecIiEERi.exit20

_ZL6mapVariRN7Minisat3vecIiEERi.exit20:           ; preds = %_ZN7Minisat3vecIiE6growToEiRKi.exit.i18, %114, %.lr.ph49
  %134 = phi i32* [ %130, %_ZN7Minisat3vecIiE6growToEiRKi.exit.i18 ], [ %95, %114 ], [ %95, %.lr.ph49 ]
  %135 = phi i32* [ %130, %_ZN7Minisat3vecIiE6growToEiRKi.exit.i18 ], [ %96, %114 ], [ %96, %.lr.ph49 ]
  %136 = phi i32 [ %.pre74, %_ZN7Minisat3vecIiE6growToEiRKi.exit.i18 ], [ %97, %114 ], [ %97, %.lr.ph49 ]
  %137 = phi i32* [ %130, %_ZN7Minisat3vecIiE6growToEiRKi.exit.i18 ], [ %96, %114 ], [ %98, %.lr.ph49 ]
  %138 = phi i32* [ %130, %_ZN7Minisat3vecIiE6growToEiRKi.exit.i18 ], [ %96, %114 ], [ %99, %.lr.ph49 ]
  %139 = phi i32 [ %131, %_ZN7Minisat3vecIiE6growToEiRKi.exit.i18 ], [ %100, %114 ], [ %100, %.lr.ph49 ]
  %140 = phi i32 [ %132, %_ZN7Minisat3vecIiE6growToEiRKi.exit.i18 ], [ %101, %114 ], [ %101, %.lr.ph49 ]
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %141 = lshr i32 %136, 5
  %142 = trunc i64 %indvars.iv.next67 to i32
  %143 = icmp slt i32 %142, %141
  br i1 %143, label %.lr.ph49, label %._ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33.loopexit45_crit_edge

._ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33.loopexit45_crit_edge: ; preds = %_ZL6mapVariRN7Minisat3vecIiEERi.exit20
  %.pre72.pre = load i32* %9, align 4, !tbaa !64
  br label %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33

_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33: ; preds = %._ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33.loopexit45_crit_edge, %_ZN7Minisat15ClauseAllocatorixEj.exit24, %86, %74
  %144 = phi i32* [ %134, %._ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33.loopexit45_crit_edge ], [ %62, %_ZN7Minisat15ClauseAllocatorixEj.exit24 ], [ %62, %74 ], [ %62, %86 ]
  %145 = phi i32* [ %135, %._ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33.loopexit45_crit_edge ], [ %63, %_ZN7Minisat15ClauseAllocatorixEj.exit24 ], [ %63, %74 ], [ %63, %86 ]
  %146 = phi i32 [ %.pre72.pre, %._ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33.loopexit45_crit_edge ], [ %64, %_ZN7Minisat15ClauseAllocatorixEj.exit24 ], [ %64, %74 ], [ %64, %86 ]
  %147 = phi i32* [ %137, %._ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33.loopexit45_crit_edge ], [ %65, %_ZN7Minisat15ClauseAllocatorixEj.exit24 ], [ %65, %74 ], [ %65, %86 ]
  %148 = phi i32* [ %138, %._ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33.loopexit45_crit_edge ], [ %66, %_ZN7Minisat15ClauseAllocatorixEj.exit24 ], [ %66, %74 ], [ %66, %86 ]
  %149 = phi i32 [ %139, %._ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33.loopexit45_crit_edge ], [ %67, %_ZN7Minisat15ClauseAllocatorixEj.exit24 ], [ %67, %74 ], [ %67, %86 ]
  %150 = phi i32 [ %140, %._ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33.loopexit45_crit_edge ], [ %68, %_ZN7Minisat15ClauseAllocatorixEj.exit24 ], [ %68, %74 ], [ %68, %86 ]
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %151 = trunc i64 %indvars.iv.next69 to i32
  %152 = icmp slt i32 %151, %146
  br i1 %152, label %61, label %._crit_edge53

._crit_edge53:                                    ; preds = %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33, %.preheader50, %6
  %cnt.0.lcssa78 = phi i32 [ %cnt.0., %.preheader50 ], [ 0, %6 ], [ %cnt.0., %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33 ]
  %153 = phi i32* [ null, %.preheader50 ], [ null, %6 ], [ %147, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33 ]
  %154 = phi i32* [ null, %.preheader50 ], [ null, %6 ], [ %148, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33 ]
  %155 = phi i32 [ 0, %.preheader50 ], [ 0, %6 ], [ %149, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33 ]
  %156 = phi i32 [ 0, %.preheader50 ], [ 0, %6 ], [ %150, %_ZNK7Minisat6Solver9satisfiedERKNS_6ClauseE.exit33 ]
  %157 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 47, i32 1
  %158 = load i32* %157, align 4, !tbaa !61
  %159 = add nsw i32 %158, %cnt.0.lcssa78
  %160 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %f, i8* getelementptr inbounds ([13 x i8]* @.str5349, i64 0, i64 0), i32 %156, i32 %159)
  %161 = load i32* %157, align 4, !tbaa !61
  %162 = icmp sgt i32 %161, 0
  br i1 %162, label %.lr.ph43, label %.preheader

.lr.ph43:                                         ; preds = %._crit_edge53
  %163 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 47, i32 0
  %164 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  %165 = getelementptr inbounds %"class.Minisat::vec.6"* %map, i64 0, i32 1
  %166 = getelementptr inbounds %"class.Minisat::vec.6"* %map, i64 0, i32 0
  br label %174

.preheader:                                       ; preds = %216, %._crit_edge53
  %167 = load i32* %9, align 4, !tbaa !64
  %168 = icmp sgt i32 %167, 0
  br i1 %168, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %169 = getelementptr inbounds %"class.Minisat::vec.1"* %8, i64 0, i32 0
  %170 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %171 = bitcast i8* %170 to i32*
  %172 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %173 = bitcast %"class.Minisat::ClauseAllocator"* %172 to i32**
  br label %228

; <label>:174                                     ; preds = %216, %.lr.ph43
  %175 = phi i32* [ %153, %.lr.ph43 ], [ %218, %216 ]
  %176 = phi i32 [ %156, %.lr.ph43 ], [ %219, %216 ]
  %177 = phi i32* [ %154, %.lr.ph43 ], [ %221, %216 ]
  %178 = phi i32 [ %155, %.lr.ph43 ], [ %220, %216 ]
  %indvars.iv64 = phi i64 [ 0, %.lr.ph43 ], [ %indvars.iv.next65, %216 ]
  %179 = load %"struct.Minisat::Lit"** %163, align 8, !tbaa !60
  %180 = getelementptr inbounds %"struct.Minisat::Lit"* %179, i64 %indvars.iv64, i32 0
  %181 = load i32* %180, align 4
  %182 = ashr i32 %181, 1
  %183 = sext i32 %182 to i64
  %184 = load %"class.Minisat::lbool"** %164, align 8, !tbaa !65
  %185 = getelementptr inbounds %"class.Minisat::lbool"* %184, i64 %183, i32 0
  %186 = load i8* %185, align 1, !tbaa !66
  %p.coerce.tr.i = trunc i32 %181 to i8
  %187 = and i8 %p.coerce.tr.i, 1
  %188 = xor i8 %186, %187
  %189 = icmp eq i8 %188, 1
  br i1 %189, label %190, label %192, !prof !123

; <label>:190                                     ; preds = %174
  invoke void @__assert_rtn(i8* getelementptr inbounds ([9 x i8]* @__func__._ZN7Minisat6Solver8toDimacsEP7__sFILERKNS_3vecINS_3LitEEE, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8]* @.str3232, i64 0, i64 0), i32 862, i8* getelementptr inbounds ([33 x i8]* @.str54, i64 0, i64 0)) #16
          to label %191 unwind label %.nonloopexit.nonloopexit.nonloopexit

; <label>:191                                     ; preds = %190
  unreachable

; <label>:192                                     ; preds = %174
  %193 = and i32 %181, 1
  %194 = icmp ne i32 %193, 0
  %195 = icmp sgt i32 %178, %182
  br i1 %195, label %196, label %200

; <label>:196                                     ; preds = %192
  %197 = getelementptr inbounds i32* %177, i64 %183
  %198 = load i32* %197, align 4, !tbaa !36
  %199 = icmp eq i32 %198, -1
  br i1 %199, label %200, label %216

; <label>:200                                     ; preds = %196, %192
  %201 = add nsw i32 %182, 1
  %202 = icmp slt i32 %178, %201
  br i1 %202, label %203, label %_ZN7Minisat3vecIiE6growToEiRKi.exit.i

; <label>:203                                     ; preds = %200
  invoke void @_ZN7Minisat3vecIiE8capacityEi(%"class.Minisat::vec.6"* %map, i32 %201)
          to label %.noexc11 unwind label %.nonloopexit.loopexit

.noexc11:                                         ; preds = %203
  %204 = load i32* %165, align 8, !tbaa !98
  %205 = icmp slt i32 %204, %201
  %206 = load i32** %166, align 8, !tbaa !97
  br i1 %205, label %.lr.ph.i.i, label %._crit_edge.i.i

.lr.ph.i.i:                                       ; preds = %.noexc11
  %207 = sext i32 %204 to i64
  %scevgep.i = getelementptr i32* %206, i64 %207
  %scevgep1.i = bitcast i32* %scevgep.i to i8*
  %208 = sub i32 %182, %204
  %209 = zext i32 %208 to i64
  %210 = shl nuw nsw i64 %209, 2
  %211 = add i64 %210, 4
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep1.i, i8 -1, i64 %211, i32 4, i1 false)
  br label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %.lr.ph.i.i, %.noexc11
  store i32 %201, i32* %165, align 8, !tbaa !98
  br label %_ZN7Minisat3vecIiE6growToEiRKi.exit.i

_ZN7Minisat3vecIiE6growToEiRKi.exit.i:            ; preds = %._crit_edge.i.i, %200
  %212 = phi i32* [ %206, %._crit_edge.i.i ], [ %175, %200 ]
  %213 = phi i32 [ %201, %._crit_edge.i.i ], [ %178, %200 ]
  %214 = add nsw i32 %176, 1
  store i32 %214, i32* %max, align 4, !tbaa !36
  %215 = getelementptr inbounds i32* %212, i64 %183
  store i32 %176, i32* %215, align 4, !tbaa !36
  br label %216

; <label>:216                                     ; preds = %_ZN7Minisat3vecIiE6growToEiRKi.exit.i, %196
  %217 = phi i32 [ %176, %_ZN7Minisat3vecIiE6growToEiRKi.exit.i ], [ %198, %196 ]
  %218 = phi i32* [ %212, %_ZN7Minisat3vecIiE6growToEiRKi.exit.i ], [ %175, %196 ]
  %219 = phi i32 [ %214, %_ZN7Minisat3vecIiE6growToEiRKi.exit.i ], [ %176, %196 ]
  %220 = phi i32 [ %213, %_ZN7Minisat3vecIiE6growToEiRKi.exit.i ], [ %178, %196 ]
  %221 = phi i32* [ %212, %_ZN7Minisat3vecIiE6growToEiRKi.exit.i ], [ %177, %196 ]
  %222 = select i1 %194, i8* getelementptr inbounds ([2 x i8]* @.str4743, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str4844, i64 0, i64 0)
  %223 = add nsw i32 %217, 1
  %224 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %f, i8* getelementptr inbounds ([8 x i8]* @.str5550, i64 0, i64 0), i8* %222, i32 %223)
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %225 = load i32* %157, align 4, !tbaa !61
  %226 = trunc i64 %indvars.iv.next65 to i32
  %227 = icmp slt i32 %226, %225
  br i1 %227, label %174, label %.preheader

; <label>:228                                     ; preds = %239, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %239 ]
  %229 = load i32** %169, align 8, !tbaa !117
  %230 = getelementptr inbounds i32* %229, i64 %indvars.iv
  %231 = load i32* %230, align 4, !tbaa !36
  %232 = load i32* %171, align 4, !tbaa !128
  %phitmp.i.i = icmp ugt i32 %232, %231
  br i1 %phitmp.i.i, label %234, label %233, !prof !122

; <label>:233                                     ; preds = %228
  invoke void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
          to label %.noexc unwind label %.nonloopexit.nonloopexit.nonloopexit

.noexc:                                           ; preds = %233
  unreachable

; <label>:234                                     ; preds = %228
  %235 = zext i32 %231 to i64
  %236 = load i32** %173, align 8, !tbaa !119
  %237 = getelementptr inbounds i32* %236, i64 %235
  %238 = bitcast i32* %237 to %"class.Minisat::Clause"*
  invoke void @_ZN7Minisat6Solver8toDimacsEP7__sFILERNS_6ClauseERNS_3vecIiEERi(%"class.Minisat::Solver"* %this, %struct.__sFILE* %f, %"class.Minisat::Clause"* %238, %"class.Minisat::vec.6"* %map, i32* %max)
          to label %239 unwind label %.loopexit

; <label>:239                                     ; preds = %234
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %240 = load i32* %9, align 4, !tbaa !64
  %241 = trunc i64 %indvars.iv.next to i32
  %242 = icmp slt i32 %241, %240
  br i1 %242, label %228, label %._crit_edge

._crit_edge:                                      ; preds = %239, %.preheader
  %243 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 3
  %244 = load i32* %243, align 4, !tbaa !51
  %245 = icmp sgt i32 %244, 0
  br i1 %245, label %246, label %249

; <label>:246                                     ; preds = %._crit_edge
  %247 = load i32* %max, align 4, !tbaa !36
  %248 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str5651, i64 0, i64 0), i32 %159, i32 %247)
  br label %249

; <label>:249                                     ; preds = %246, %._crit_edge
  %250 = getelementptr inbounds %"class.Minisat::vec.6"* %map, i64 0, i32 0
  %251 = load i32** %250, align 8, !tbaa !97
  %252 = icmp eq i32* %251, null
  br i1 %252, label %_ZN7Minisat3vecIiED1Ev.exit, label %.preheader.i.i.i

.preheader.i.i.i:                                 ; preds = %249
  %253 = getelementptr inbounds %"class.Minisat::vec.6"* %map, i64 0, i32 1
  store i32 0, i32* %253, align 8, !tbaa !98
  %254 = bitcast i32* %251 to i8*
  tail call void @free(i8* %254) #2
  store i32* null, i32** %250, align 8, !tbaa !97
  %255 = getelementptr inbounds %"class.Minisat::vec.6"* %map, i64 0, i32 2
  store i32 0, i32* %255, align 4, !tbaa !99
  br label %_ZN7Minisat3vecIiED1Ev.exit

_ZN7Minisat3vecIiED1Ev.exit:                      ; preds = %.preheader.i.i.i, %249, %4
  ret void

_ZN7Minisat3vecIiED1Ev.exit13:                    ; preds = %.preheader.i.i.i12, %.nonloopexit
  resume { i8*, i32 } %lpad.phi
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6Solver8relocAllERNS_15ClauseAllocatorE(%"class.Minisat::Solver"* nocapture %this, %"class.Minisat::ClauseAllocator"* nocapture %to) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37
  %2 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2, i32 1
  %3 = load i32* %2, align 4, !tbaa !61
  %4 = icmp sgt i32 %3, 0
  %5 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 2, i32 0
  br i1 %4, label %.lr.ph.i, label %._crit_edge.i

.lr.ph.i:                                         ; preds = %0
  %6 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 37, i32 1, i32 0
  br label %7

; <label>:7                                       ; preds = %19, %.lr.ph.i
  %8 = phi i32 [ %3, %.lr.ph.i ], [ %20, %19 ]
  %indvars.iv.i = phi i64 [ 0, %.lr.ph.i ], [ %indvars.iv.next.i, %19 ]
  %9 = load %"struct.Minisat::Lit"** %5, align 8, !tbaa !60
  %10 = getelementptr inbounds %"struct.Minisat::Lit"* %9, i64 %indvars.iv.i
  %11 = getelementptr inbounds %"struct.Minisat::Lit"* %10, i64 0, i32 0
  %12 = load i32* %11, align 4
  %13 = sext i32 %12 to i64
  %14 = load i8** %6, align 8, !tbaa !102
  %15 = getelementptr inbounds i8* %14, i64 %13
  %16 = load i8* %15, align 1, !tbaa !59
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %19, label %18

; <label>:18                                      ; preds = %7
  tail call void @_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE5cleanERKS1_(%"class.Minisat::OccLists"* %1, %"struct.Minisat::Lit"* %10)
  %.pre.i = load i32* %2, align 4, !tbaa !61
  br label %19

; <label>:19                                      ; preds = %18, %7
  %20 = phi i32 [ %8, %7 ], [ %.pre.i, %18 ]
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %21 = trunc i64 %indvars.iv.next.i to i32
  %22 = icmp slt i32 %21, %20
  br i1 %22, label %7, label %._crit_edge.i

._crit_edge.i:                                    ; preds = %19, %0
  %23 = load %"struct.Minisat::Lit"** %5, align 8, !tbaa !60
  %24 = icmp eq %"struct.Minisat::Lit"* %23, null
  br i1 %24, label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.preheader, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %._crit_edge.i
  store i32 0, i32* %2, align 4, !tbaa !61
  br label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.preheader

_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.preheader: ; preds = %.preheader.i.i, %._crit_edge.i
  %25 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 1
  %26 = load i32* %25, align 4, !tbaa !63
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %.preheader17.lr.ph, label %.preheader10

.preheader17.lr.ph:                               ; preds = %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.preheader
  %28 = getelementptr inbounds %"class.Minisat::OccLists"* %1, i64 0, i32 0, i32 0
  %29 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  br label %.preheader17

.preheader17:                                     ; preds = %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit26, %.preheader17.lr.ph
  %indvars.iv27 = phi i64 [ 0, %.preheader17.lr.ph ], [ %indvars.iv.next28, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit26 ]
  %30 = trunc i64 %indvars.iv27 to i32
  %31 = shl nsw i32 %30, 1
  %32 = sext i32 %31 to i64
  %33 = load %"class.Minisat::vec.4"** %28, align 8, !tbaa !107
  %34 = getelementptr inbounds %"class.Minisat::vec.4"* %33, i64 %32, i32 1
  %35 = load i32* %34, align 4, !tbaa !111
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %.lr.ph15, label %54

.preheader10:                                     ; preds = %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit26, %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit.preheader
  %37 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 1
  %38 = load i32* %37, align 4, !tbaa !61
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %.lr.ph12, label %.preheader7

.lr.ph12:                                         ; preds = %.preheader10
  %40 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 41, i32 0
  %41 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 43, i32 0
  %42 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %43 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %44 = bitcast i8* %43 to i32*
  %45 = bitcast %"class.Minisat::ClauseAllocator"* %42 to i32**
  %46 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 38, i32 0
  br label %66

.lr.ph15:                                         ; preds = %.preheader17
  %47 = getelementptr inbounds %"class.Minisat::vec.4"* %33, i64 %32, i32 0
  br label %48

; <label>:48                                      ; preds = %48, %.lr.ph15
  %indvars.iv24 = phi i64 [ 0, %.lr.ph15 ], [ %indvars.iv.next25, %48 ]
  %49 = load %"struct.Minisat::Solver::Watcher"** %47, align 8, !tbaa !109
  %50 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %49, i64 %indvars.iv24, i32 0
  tail call void @_ZN7Minisat15ClauseAllocator5relocERjRS0_(%"class.Minisat::ClauseAllocator"* %29, i32* %50, %"class.Minisat::ClauseAllocator"* %to)
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %51 = load i32* %34, align 4, !tbaa !111
  %52 = trunc i64 %indvars.iv.next25 to i32
  %53 = icmp slt i32 %52, %51
  br i1 %53, label %48, label %._crit_edge16

._crit_edge16:                                    ; preds = %48
  %.pre = load %"class.Minisat::vec.4"** %28, align 8, !tbaa !107
  br label %54

; <label>:54                                      ; preds = %._crit_edge16, %.preheader17
  %55 = phi %"class.Minisat::vec.4"* [ %.pre, %._crit_edge16 ], [ %33, %.preheader17 ]
  %56 = or i32 %31, 1
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds %"class.Minisat::vec.4"* %55, i64 %57, i32 1
  %59 = load i32* %58, align 4, !tbaa !111
  %60 = icmp sgt i32 %59, 0
  br i1 %60, label %.lr.ph15.1, label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit26

.preheader7:                                      ; preds = %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread, %.preheader10
  %61 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33, i32 1
  %62 = load i32* %61, align 4, !tbaa !64
  %63 = icmp sgt i32 %62, 0
  br i1 %63, label %.lr.ph9, label %.preheader

.lr.ph9:                                          ; preds = %.preheader7
  %64 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %65 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 33, i32 0
  br label %111

; <label>:66                                      ; preds = %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread, %.lr.ph12
  %67 = phi i32 [ %38, %.lr.ph12 ], [ %103, %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread ]
  %indvars.iv22 = phi i64 [ 0, %.lr.ph12 ], [ %indvars.iv.next23, %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread ]
  %68 = load %"struct.Minisat::Lit"** %40, align 8, !tbaa !60
  %69 = getelementptr inbounds %"struct.Minisat::Lit"* %68, i64 %indvars.iv22, i32 0
  %70 = load i32* %69, align 4
  %71 = ashr i32 %70, 1
  %72 = sext i32 %71 to i64
  %73 = load %"struct.Minisat::Solver::VarData"** %41, align 8, !tbaa !100
  %74 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %73, i64 %72, i32 0
  %75 = load i32* %74, align 4, !tbaa !133
  %76 = icmp eq i32 %75, -1
  br i1 %76, label %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread, label %77

; <label>:77                                      ; preds = %66
  %78 = load i32* %44, align 4, !tbaa !128
  %phitmp.i.i4 = icmp ugt i32 %78, %75
  br i1 %phitmp.i.i4, label %_ZN7Minisat15ClauseAllocatorixEj.exit5, label %79, !prof !122

; <label>:79                                      ; preds = %77
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit5:           ; preds = %77
  %80 = zext i32 %75 to i64
  %81 = load i32** %45, align 8, !tbaa !119
  %82 = getelementptr inbounds i32* %81, i64 %80
  %83 = load i32* %82, align 4
  %84 = and i32 %83, 16
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %_ZN7Minisat15ClauseAllocatorixEj.exit, label %102

_ZN7Minisat15ClauseAllocatorixEj.exit:            ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit5
  %.sum = add i64 %80, 1
  %86 = getelementptr inbounds i32* %81, i64 %.sum
  %87 = load i32* %86, align 4
  %88 = ashr i32 %87, 1
  %89 = sext i32 %88 to i64
  %90 = load %"class.Minisat::lbool"** %46, align 8, !tbaa !65
  %91 = getelementptr inbounds %"class.Minisat::lbool"* %90, i64 %89, i32 0
  %92 = load i8* %91, align 1, !tbaa !66
  %p.coerce.tr.i.i = trunc i32 %87 to i8
  %93 = and i8 %p.coerce.tr.i.i, 1
  %94 = icmp eq i8 %92, %93
  br i1 %94, label %95, label %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread

; <label>:95                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit
  %96 = getelementptr inbounds %"struct.Minisat::Solver::VarData"* %73, i64 %89, i32 0
  %97 = load i32* %96, align 4, !tbaa !133
  %98 = icmp eq i32 %97, -1
  br i1 %98, label %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread, label %99

; <label>:99                                      ; preds = %95
  %phitmp.i.i.i = icmp ugt i32 %78, %97
  br i1 %phitmp.i.i.i, label %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit, label %100, !prof !122

; <label>:100                                     ; preds = %99
  tail call void @__assert_rtn(i8* getelementptr inbounds ([4 x i8]* @__func__._ZN7Minisat15RegionAllocatorIjE3leaEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 67, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit:    ; preds = %99
  %101 = icmp eq i32 %97, %75
  br i1 %101, label %102, label %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread

; <label>:102                                     ; preds = %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit, %_ZN7Minisat15ClauseAllocatorixEj.exit5
  tail call void @_ZN7Minisat15ClauseAllocator5relocERjRS0_(%"class.Minisat::ClauseAllocator"* %42, i32* %74, %"class.Minisat::ClauseAllocator"* %to)
  %.pre29 = load i32* %37, align 4, !tbaa !61
  br label %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread

_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit.thread: ; preds = %102, %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit, %95, %_ZN7Minisat15ClauseAllocatorixEj.exit, %66
  %103 = phi i32 [ %67, %_ZN7Minisat15ClauseAllocatorixEj.exit ], [ %67, %95 ], [ %67, %66 ], [ %67, %_ZNK7Minisat6Solver6lockedERKNS_6ClauseE.exit ], [ %.pre29, %102 ]
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %104 = trunc i64 %indvars.iv.next23 to i32
  %105 = icmp slt i32 %104, %103
  br i1 %105, label %66, label %.preheader7

.preheader:                                       ; preds = %111, %.preheader7
  %106 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32, i32 1
  %107 = load i32* %106, align 4, !tbaa !64
  %108 = icmp sgt i32 %107, 0
  br i1 %108, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %109 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %110 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 32, i32 0
  br label %117

; <label>:111                                     ; preds = %111, %.lr.ph9
  %indvars.iv20 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next21, %111 ]
  %112 = load i32** %65, align 8, !tbaa !117
  %113 = getelementptr inbounds i32* %112, i64 %indvars.iv20
  tail call void @_ZN7Minisat15ClauseAllocator5relocERjRS0_(%"class.Minisat::ClauseAllocator"* %64, i32* %113, %"class.Minisat::ClauseAllocator"* %to)
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %114 = load i32* %61, align 4, !tbaa !64
  %115 = trunc i64 %indvars.iv.next21 to i32
  %116 = icmp slt i32 %115, %114
  br i1 %116, label %111, label %.preheader

; <label>:117                                     ; preds = %117, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %117 ]
  %118 = load i32** %110, align 8, !tbaa !117
  %119 = getelementptr inbounds i32* %118, i64 %indvars.iv
  tail call void @_ZN7Minisat15ClauseAllocator5relocERjRS0_(%"class.Minisat::ClauseAllocator"* %109, i32* %119, %"class.Minisat::ClauseAllocator"* %to)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %120 = load i32* %106, align 4, !tbaa !64
  %121 = trunc i64 %indvars.iv.next to i32
  %122 = icmp slt i32 %121, %120
  br i1 %122, label %117, label %._crit_edge

._crit_edge:                                      ; preds = %117, %.preheader
  ret void

.lr.ph15.1:                                       ; preds = %54
  %123 = getelementptr inbounds %"class.Minisat::vec.4"* %55, i64 %57, i32 0
  br label %124

; <label>:124                                     ; preds = %124, %.lr.ph15.1
  %indvars.iv24.1 = phi i64 [ 0, %.lr.ph15.1 ], [ %indvars.iv.next25.1, %124 ]
  %125 = load %"struct.Minisat::Solver::Watcher"** %123, align 8, !tbaa !109
  %126 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %125, i64 %indvars.iv24.1, i32 0
  tail call void @_ZN7Minisat15ClauseAllocator5relocERjRS0_(%"class.Minisat::ClauseAllocator"* %29, i32* %126, %"class.Minisat::ClauseAllocator"* %to)
  %indvars.iv.next25.1 = add nuw nsw i64 %indvars.iv24.1, 1
  %127 = load i32* %58, align 4, !tbaa !111
  %128 = trunc i64 %indvars.iv.next25.1 to i32
  %129 = icmp slt i32 %128, %127
  br i1 %129, label %124, label %_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit26

_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE8cleanAllEv.exit26: ; preds = %124, %54
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %130 = load i32* %25, align 4, !tbaa !63
  %131 = trunc i64 %indvars.iv.next28 to i32
  %132 = icmp slt i32 %131, %130
  br i1 %132, label %.preheader17, label %.preheader10
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat6Solver14garbageCollectEv(%"class.Minisat::Solver"* nocapture %this) unnamed_addr #0 align 2 {
  %to = alloca %"class.Minisat::RegionAllocator", align 8
  %tmpcast = bitcast %"class.Minisat::RegionAllocator"* %to to %"class.Minisat::ClauseAllocator"*
  %1 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52
  %2 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 8
  %3 = bitcast i8* %2 to i32*
  %4 = load i32* %3, align 4, !tbaa !128
  %5 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 16
  %6 = bitcast i8* %5 to i32*
  %7 = load i32* %6, align 4, !tbaa !135
  %8 = sub i32 %4, %7
  %9 = bitcast %"class.Minisat::RegionAllocator"* %to to i8*
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 20, i32 8, i1 false)
  call void @_ZN7Minisat15RegionAllocatorIjE8capacityEj(%"class.Minisat::RegionAllocator"* %to, i32 %8)
  %10 = getelementptr inbounds %"class.Minisat::ClauseAllocator"* %tmpcast, i64 0, i32 1
  store i8 0, i8* %10, align 4, !tbaa !96
  invoke void @_ZN7Minisat6Solver8relocAllERNS_15ClauseAllocatorE(%"class.Minisat::Solver"* %this, %"class.Minisat::ClauseAllocator"* %tmpcast)
          to label %11 unwind label %22

; <label>:11                                      ; preds = %0
  %12 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 3
  %13 = load i32* %12, align 4, !tbaa !51
  %14 = icmp sgt i32 %13, 1
  br i1 %14, label %15, label %29

; <label>:15                                      ; preds = %11
  %16 = load i32* %3, align 4, !tbaa !128
  %17 = shl i32 %16, 2
  %18 = getelementptr inbounds %"class.Minisat::RegionAllocator"* %to, i64 0, i32 1
  %19 = load i32* %18, align 8, !tbaa !128
  %20 = shl i32 %19, 2
  %21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([65 x i8]* @.str57, i64 0, i64 0), i32 %17, i32 %20)
  br label %29

; <label>:22                                      ; preds = %0
  %23 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %24 = getelementptr inbounds %"class.Minisat::RegionAllocator"* %to, i64 0, i32 0
  %25 = load i32** %24, align 8, !tbaa !119
  %26 = icmp eq i32* %25, null
  br i1 %26, label %_ZN7Minisat15ClauseAllocatorD1Ev.exit1, label %27

; <label>:27                                      ; preds = %22
  %28 = bitcast i32* %25 to i8*
  tail call void @free(i8* %28) #2
  br label %_ZN7Minisat15ClauseAllocatorD1Ev.exit1

; <label>:29                                      ; preds = %15, %11
  %30 = load i8* %10, align 4, !tbaa !96, !range !78
  %31 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 1
  store i8 %30, i8* %31, align 1, !tbaa !96
  %32 = bitcast %"class.Minisat::ClauseAllocator"* %1 to i32**
  %33 = load i32** %32, align 8, !tbaa !119
  %34 = icmp eq i32* %33, null
  br i1 %34, label %_ZN7Minisat15ClauseAllocatorD1Ev.exit, label %35

; <label>:35                                      ; preds = %29
  %36 = bitcast i32* %33 to i8*
  tail call void @free(i8* %36) #2
  br label %_ZN7Minisat15ClauseAllocatorD1Ev.exit

_ZN7Minisat15ClauseAllocatorD1Ev.exit:            ; preds = %35, %29
  %37 = getelementptr inbounds %"class.Minisat::RegionAllocator"* %to, i64 0, i32 0
  %38 = load i32** %37, align 8, !tbaa !119
  store i32* %38, i32** %32, align 8, !tbaa !119
  %39 = getelementptr inbounds %"class.Minisat::RegionAllocator"* %to, i64 0, i32 1
  %40 = bitcast i32* %39 to i64*
  %41 = load i64* %40, align 8
  %42 = trunc i64 %41 to i32
  store i32 %42, i32* %3, align 4, !tbaa !128
  %43 = lshr i64 %41, 32
  %44 = trunc i64 %43 to i32
  %45 = getelementptr inbounds %"class.Minisat::Solver"* %this, i64 0, i32 52, i32 0, i64 12
  %46 = bitcast i8* %45 to i32*
  store i32 %44, i32* %46, align 4, !tbaa !150
  %47 = getelementptr inbounds %"class.Minisat::RegionAllocator"* %to, i64 0, i32 3
  %48 = load i32* %47, align 8, !tbaa !135
  store i32 %48, i32* %6, align 4, !tbaa !135
  ret void

_ZN7Minisat15ClauseAllocatorD1Ev.exit1:           ; preds = %27, %22
  resume { i8*, i32 } %23
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) #14

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #14

declare double @"\01_strtod"(i8*, i8**) #3

; Function Attrs: nounwind readnone
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #9

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat15RegionAllocatorIjE8capacityEj(%"class.Minisat::RegionAllocator"* nocapture %this, i32 %min_cap) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::RegionAllocator"* %this, i64 0, i32 2
  %2 = load i32* %1, align 4, !tbaa !150
  %3 = icmp ult i32 %2, %min_cap
  br i1 %3, label %.preheader, label %34

.preheader:                                       ; preds = %6, %0
  %4 = phi i32 [ %12, %6 ], [ %2, %0 ]
  %5 = icmp ult i32 %4, %min_cap
  br i1 %5, label %6, label %16

; <label>:6                                       ; preds = %.preheader
  %7 = lshr i32 %4, 1
  %8 = lshr i32 %4, 3
  %9 = add i32 %8, 2
  %10 = add i32 %9, %7
  %11 = and i32 %10, -2
  %12 = add i32 %11, %4
  store i32 %12, i32* %1, align 4, !tbaa !150
  %13 = icmp ugt i32 %12, %2
  br i1 %13, label %.preheader, label %14

; <label>:14                                      ; preds = %6
  %15 = tail call i8* @__cxa_allocate_exception(i64 1) #2
  tail call void @__cxa_throw(i8* %15, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*), i8* null) #16
  unreachable

; <label>:16                                      ; preds = %.preheader
  %17 = icmp eq i32 %4, 0
  br i1 %17, label %18, label %19, !prof !123

; <label>:18                                      ; preds = %16
  tail call void @__assert_rtn(i8* getelementptr inbounds ([9 x i8]* @__func__._ZN7Minisat15RegionAllocatorIjE8capacityEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 104, i8* getelementptr inbounds ([8 x i8]* @.str71, i64 0, i64 0)) #16
  unreachable

; <label>:19                                      ; preds = %16
  %20 = getelementptr inbounds %"class.Minisat::RegionAllocator"* %this, i64 0, i32 0
  %21 = load i32** %20, align 8, !tbaa !119
  %22 = bitcast i32* %21 to i8*
  %23 = zext i32 %4 to i64
  %24 = shl nuw nsw i64 %23, 2
  %25 = tail call i8* @realloc(i8* %22, i64 %24)
  %26 = icmp eq i8* %25, null
  br i1 %26, label %27, label %_ZN7MinisatL8xreallocEPvm.exit

; <label>:27                                      ; preds = %19
  %28 = tail call i32* @__error()
  %29 = load i32* %28, align 4, !tbaa !36
  %30 = icmp eq i32 %29, 12
  br i1 %30, label %31, label %_ZN7MinisatL8xreallocEPvm.exit

; <label>:31                                      ; preds = %27
  %32 = tail call i8* @__cxa_allocate_exception(i64 1) #2
  tail call void @__cxa_throw(i8* %32, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*), i8* null) #16
  unreachable

_ZN7MinisatL8xreallocEPvm.exit:                   ; preds = %27, %19
  %33 = bitcast i8* %25 to i32*
  store i32* %33, i32** %20, align 8, !tbaa !119
  br label %34

; <label>:34                                      ; preds = %_ZN7MinisatL8xreallocEPvm.exit, %0
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat3vecINS0_INS_6Solver7WatcherEEEE8capacityEi(%"class.Minisat::vec.3"* nocapture %this, i32 %min_cap) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::vec.3"* %this, i64 0, i32 2
  %2 = load i32* %1, align 4, !tbaa !113
  %3 = icmp slt i32 %2, %min_cap
  br i1 %3, label %4, label %35

; <label>:4                                       ; preds = %0
  %5 = add i32 %min_cap, 1
  %6 = sub i32 %5, %2
  %7 = and i32 %6, -2
  %8 = ashr i32 %2, 1
  %9 = add nsw i32 %8, 2
  %10 = and i32 %9, -2
  %11 = sub nsw i32 %10, %7
  %12 = ashr i32 %11, 31
  %13 = and i32 %12, %7
  %14 = xor i32 %12, -1
  %15 = and i32 %10, %14
  %16 = add nsw i32 %13, %15
  %17 = sub nsw i32 2147483647, %2
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %33, label %19

; <label>:19                                      ; preds = %4
  %20 = getelementptr inbounds %"class.Minisat::vec.3"* %this, i64 0, i32 0
  %21 = load %"class.Minisat::vec.4"** %20, align 8, !tbaa !107
  %22 = bitcast %"class.Minisat::vec.4"* %21 to i8*
  %23 = add nsw i32 %16, %2
  store i32 %23, i32* %1, align 4, !tbaa !113
  %24 = sext i32 %23 to i64
  %25 = shl nsw i64 %24, 4
  %26 = tail call i8* @realloc(i8* %22, i64 %25)
  %27 = bitcast i8* %26 to %"class.Minisat::vec.4"*
  store %"class.Minisat::vec.4"* %27, %"class.Minisat::vec.4"** %20, align 8, !tbaa !107
  %28 = icmp eq i8* %26, null
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %19
  %30 = tail call i32* @__error()
  %31 = load i32* %30, align 4, !tbaa !36
  %32 = icmp eq i32 %31, 12
  br i1 %32, label %33, label %35

; <label>:33                                      ; preds = %29, %4
  %34 = tail call i8* @__cxa_allocate_exception(i64 1) #2
  tail call void @__cxa_throw(i8* %34, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*), i8* null) #16
  unreachable

; <label>:35                                      ; preds = %29, %19, %0
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat3vecIcE8capacityEi(%"class.Minisat::vec.5"* nocapture %this, i32 %min_cap) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::vec.5"* %this, i64 0, i32 2
  %2 = load i32* %1, align 4, !tbaa !104
  %3 = icmp slt i32 %2, %min_cap
  br i1 %3, label %4, label %32

; <label>:4                                       ; preds = %0
  %5 = add i32 %min_cap, 1
  %6 = sub i32 %5, %2
  %7 = and i32 %6, -2
  %8 = ashr i32 %2, 1
  %9 = add nsw i32 %8, 2
  %10 = and i32 %9, -2
  %11 = sub nsw i32 %10, %7
  %12 = ashr i32 %11, 31
  %13 = and i32 %12, %7
  %14 = xor i32 %12, -1
  %15 = and i32 %10, %14
  %16 = add nsw i32 %13, %15
  %17 = sub nsw i32 2147483647, %2
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %30, label %19

; <label>:19                                      ; preds = %4
  %20 = getelementptr inbounds %"class.Minisat::vec.5"* %this, i64 0, i32 0
  %21 = load i8** %20, align 8, !tbaa !102
  %22 = add nsw i32 %16, %2
  store i32 %22, i32* %1, align 4, !tbaa !104
  %23 = sext i32 %22 to i64
  %24 = tail call i8* @realloc(i8* %21, i64 %23)
  store i8* %24, i8** %20, align 8, !tbaa !102
  %25 = icmp eq i8* %24, null
  br i1 %25, label %26, label %32

; <label>:26                                      ; preds = %19
  %27 = tail call i32* @__error()
  %28 = load i32* %27, align 4, !tbaa !36
  %29 = icmp eq i32 %28, 12
  br i1 %29, label %30, label %32

; <label>:30                                      ; preds = %26, %4
  %31 = tail call i8* @__cxa_allocate_exception(i64 1) #2
  tail call void @__cxa_throw(i8* %31, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*), i8* null) #16
  unreachable

; <label>:32                                      ; preds = %26, %19, %0
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat3vecINS_5lboolEE8capacityEi(%"class.Minisat::vec"* nocapture %this, i32 %min_cap) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::vec"* %this, i64 0, i32 2
  %2 = load i32* %1, align 4, !tbaa !106
  %3 = icmp slt i32 %2, %min_cap
  br i1 %3, label %4, label %34

; <label>:4                                       ; preds = %0
  %5 = add i32 %min_cap, 1
  %6 = sub i32 %5, %2
  %7 = and i32 %6, -2
  %8 = ashr i32 %2, 1
  %9 = add nsw i32 %8, 2
  %10 = and i32 %9, -2
  %11 = sub nsw i32 %10, %7
  %12 = ashr i32 %11, 31
  %13 = and i32 %12, %7
  %14 = xor i32 %12, -1
  %15 = and i32 %10, %14
  %16 = add nsw i32 %13, %15
  %17 = sub nsw i32 2147483647, %2
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %32, label %19

; <label>:19                                      ; preds = %4
  %20 = getelementptr inbounds %"class.Minisat::vec"* %this, i64 0, i32 0
  %21 = load %"class.Minisat::lbool"** %20, align 8, !tbaa !65
  %22 = getelementptr inbounds %"class.Minisat::lbool"* %21, i64 0, i32 0
  %23 = add nsw i32 %16, %2
  store i32 %23, i32* %1, align 4, !tbaa !106
  %24 = sext i32 %23 to i64
  %25 = tail call i8* @realloc(i8* %22, i64 %24)
  %26 = bitcast i8* %25 to %"class.Minisat::lbool"*
  store %"class.Minisat::lbool"* %26, %"class.Minisat::lbool"** %20, align 8, !tbaa !65
  %27 = icmp eq i8* %25, null
  br i1 %27, label %28, label %34

; <label>:28                                      ; preds = %19
  %29 = tail call i32* @__error()
  %30 = load i32* %29, align 4, !tbaa !36
  %31 = icmp eq i32 %30, 12
  br i1 %31, label %32, label %34

; <label>:32                                      ; preds = %28, %4
  %33 = tail call i8* @__cxa_allocate_exception(i64 1) #2
  tail call void @__cxa_throw(i8* %33, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*), i8* null) #16
  unreachable

; <label>:34                                      ; preds = %28, %19, %0
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat3vecINS_6Solver7VarDataEE8capacityEi(%"class.Minisat::vec.7"* nocapture %this, i32 %min_cap) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::vec.7"* %this, i64 0, i32 2
  %2 = load i32* %1, align 4, !tbaa !101
  %3 = icmp slt i32 %2, %min_cap
  br i1 %3, label %4, label %35

; <label>:4                                       ; preds = %0
  %5 = add i32 %min_cap, 1
  %6 = sub i32 %5, %2
  %7 = and i32 %6, -2
  %8 = ashr i32 %2, 1
  %9 = add nsw i32 %8, 2
  %10 = and i32 %9, -2
  %11 = sub nsw i32 %10, %7
  %12 = ashr i32 %11, 31
  %13 = and i32 %12, %7
  %14 = xor i32 %12, -1
  %15 = and i32 %10, %14
  %16 = add nsw i32 %13, %15
  %17 = sub nsw i32 2147483647, %2
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %33, label %19

; <label>:19                                      ; preds = %4
  %20 = getelementptr inbounds %"class.Minisat::vec.7"* %this, i64 0, i32 0
  %21 = load %"struct.Minisat::Solver::VarData"** %20, align 8, !tbaa !100
  %22 = bitcast %"struct.Minisat::Solver::VarData"* %21 to i8*
  %23 = add nsw i32 %16, %2
  store i32 %23, i32* %1, align 4, !tbaa !101
  %24 = sext i32 %23 to i64
  %25 = shl nsw i64 %24, 3
  %26 = tail call i8* @realloc(i8* %22, i64 %25)
  %27 = bitcast i8* %26 to %"struct.Minisat::Solver::VarData"*
  store %"struct.Minisat::Solver::VarData"* %27, %"struct.Minisat::Solver::VarData"** %20, align 8, !tbaa !100
  %28 = icmp eq i8* %26, null
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %19
  %30 = tail call i32* @__error()
  %31 = load i32* %30, align 4, !tbaa !36
  %32 = icmp eq i32 %31, 12
  br i1 %32, label %33, label %35

; <label>:33                                      ; preds = %29, %4
  %34 = tail call i8* @__cxa_allocate_exception(i64 1) #2
  tail call void @__cxa_throw(i8* %34, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*), i8* null) #16
  unreachable

; <label>:35                                      ; preds = %29, %19, %0
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat3vecIdE8capacityEi(%"class.Minisat::vec.2"* nocapture %this, i32 %min_cap) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::vec.2"* %this, i64 0, i32 2
  %2 = load i32* %1, align 4, !tbaa !116
  %3 = icmp slt i32 %2, %min_cap
  br i1 %3, label %4, label %35

; <label>:4                                       ; preds = %0
  %5 = add i32 %min_cap, 1
  %6 = sub i32 %5, %2
  %7 = and i32 %6, -2
  %8 = ashr i32 %2, 1
  %9 = add nsw i32 %8, 2
  %10 = and i32 %9, -2
  %11 = sub nsw i32 %10, %7
  %12 = ashr i32 %11, 31
  %13 = and i32 %12, %7
  %14 = xor i32 %12, -1
  %15 = and i32 %10, %14
  %16 = add nsw i32 %13, %15
  %17 = sub nsw i32 2147483647, %2
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %33, label %19

; <label>:19                                      ; preds = %4
  %20 = getelementptr inbounds %"class.Minisat::vec.2"* %this, i64 0, i32 0
  %21 = load double** %20, align 8, !tbaa !114
  %22 = bitcast double* %21 to i8*
  %23 = add nsw i32 %16, %2
  store i32 %23, i32* %1, align 4, !tbaa !116
  %24 = sext i32 %23 to i64
  %25 = shl nsw i64 %24, 3
  %26 = tail call i8* @realloc(i8* %22, i64 %25)
  %27 = bitcast i8* %26 to double*
  store double* %27, double** %20, align 8, !tbaa !114
  %28 = icmp eq i8* %26, null
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %19
  %30 = tail call i32* @__error()
  %31 = load i32* %30, align 4, !tbaa !36
  %32 = icmp eq i32 %31, 12
  br i1 %32, label %33, label %35

; <label>:33                                      ; preds = %29, %4
  %34 = tail call i8* @__cxa_allocate_exception(i64 1) #2
  tail call void @__cxa_throw(i8* %34, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*), i8* null) #16
  unreachable

; <label>:35                                      ; preds = %29, %19, %0
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE6insertEi(%"class.Minisat::Heap"* nocapture %this, i32 %n) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 2
  %2 = add nsw i32 %n, 1
  %3 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 2, i32 1
  %4 = load i32* %3, align 4, !tbaa !98
  %5 = icmp slt i32 %4, %2
  br i1 %5, label %6, label %_ZN7Minisat3vecIiE6growToEiRKi.exit

; <label>:6                                       ; preds = %0
  tail call void @_ZN7Minisat3vecIiE8capacityEi(%"class.Minisat::vec.6"* %1, i32 %2)
  %7 = load i32* %3, align 4, !tbaa !98
  %8 = icmp slt i32 %7, %2
  br i1 %8, label %.lr.ph.i, label %_ZN7Minisat3vecIiE6growToEiRKi.exit.thread

.lr.ph.i:                                         ; preds = %6
  %9 = getelementptr inbounds %"class.Minisat::vec.6"* %1, i64 0, i32 0
  %10 = load i32** %9, align 8, !tbaa !97
  %11 = sext i32 %7 to i64
  %scevgep = getelementptr i32* %10, i64 %11
  %scevgep3 = bitcast i32* %scevgep to i8*
  %12 = sub i32 %n, %7
  %13 = zext i32 %12 to i64
  %14 = shl nuw nsw i64 %13, 2
  %15 = add i64 %14, 4
  call void @llvm.memset.p0i8.i64(i8* %scevgep3, i8 -1, i64 %15, i32 4, i1 false)
  br label %_ZN7Minisat3vecIiE6growToEiRKi.exit.thread

_ZN7Minisat3vecIiE6growToEiRKi.exit.thread:       ; preds = %.lr.ph.i, %6
  store i32 %2, i32* %3, align 4, !tbaa !98
  br label %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit

_ZN7Minisat3vecIiE6growToEiRKi.exit:              ; preds = %0
  %16 = icmp sgt i32 %4, %n
  br i1 %16, label %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit, label %_ZN7Minisat3vecIiE6growToEiRKi.exit._ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread_crit_edge

_ZN7Minisat3vecIiE6growToEiRKi.exit._ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread_crit_edge: ; preds = %_ZN7Minisat3vecIiE6growToEiRKi.exit
  %.phi.trans.insert = getelementptr inbounds %"class.Minisat::vec.6"* %1, i64 0, i32 0
  %.pre = load i32** %.phi.trans.insert, align 8, !tbaa !97
  %.pre6 = sext i32 %n to i64
  br label %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread

_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit: ; preds = %_ZN7Minisat3vecIiE6growToEiRKi.exit, %_ZN7Minisat3vecIiE6growToEiRKi.exit.thread
  %17 = sext i32 %n to i64
  %18 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 2, i32 0
  %19 = load i32** %18, align 8, !tbaa !97
  %20 = getelementptr inbounds i32* %19, i64 %17
  %21 = load i32* %20, align 4, !tbaa !36
  %22 = icmp sgt i32 %21, -1
  br i1 %22, label %23, label %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit._ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread_crit_edge, !prof !123

_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit._ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread_crit_edge: ; preds = %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit
  %.pre7 = getelementptr inbounds %"class.Minisat::vec.6"* %1, i64 0, i32 0
  br label %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread

; <label>:23                                      ; preds = %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit
  tail call void @__assert_rtn(i8* getelementptr inbounds ([7 x i8]* @__func__._ZN7Minisat4HeapINS_6Solver10VarOrderLtEE6insertEi, i64 0, i64 0), i8* getelementptr inbounds ([46 x i8]* @.str64, i64 0, i64 0), i32 102, i8* getelementptr inbounds ([11 x i8]* @.str73, i64 0, i64 0)) #16
  unreachable

_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread: ; preds = %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit._ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread_crit_edge, %_ZN7Minisat3vecIiE6growToEiRKi.exit._ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread_crit_edge
  %.pre-phi8 = phi i32** [ %.pre7, %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit._ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread_crit_edge ], [ %.phi.trans.insert, %_ZN7Minisat3vecIiE6growToEiRKi.exit._ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread_crit_edge ]
  %.pre-phi = phi i64 [ %17, %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit._ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread_crit_edge ], [ %.pre6, %_ZN7Minisat3vecIiE6growToEiRKi.exit._ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread_crit_edge ]
  %24 = phi i32* [ %19, %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit._ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread_crit_edge ], [ %.pre, %_ZN7Minisat3vecIiE6growToEiRKi.exit._ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread_crit_edge ]
  %25 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 1
  %26 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 1, i32 1
  %27 = load i32* %26, align 4, !tbaa !98
  %28 = getelementptr inbounds i32* %24, i64 %.pre-phi
  store i32 %27, i32* %28, align 4, !tbaa !36
  %29 = load i32* %26, align 4, !tbaa !98
  %30 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 1, i32 2
  %31 = load i32* %30, align 4, !tbaa !99
  %32 = icmp eq i32 %29, %31
  br i1 %32, label %33, label %_ZN7Minisat3vecIiE4pushERKi.exit

; <label>:33                                      ; preds = %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread
  %34 = add nsw i32 %29, 1
  tail call void @_ZN7Minisat3vecIiE8capacityEi(%"class.Minisat::vec.6"* %25, i32 %34)
  %.pre.i2 = load i32* %26, align 4, !tbaa !98
  %.pre4 = load i32** %.pre-phi8, align 8, !tbaa !97
  br label %_ZN7Minisat3vecIiE4pushERKi.exit

_ZN7Minisat3vecIiE4pushERKi.exit:                 ; preds = %33, %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread
  %.pre5 = phi i32* [ %.pre4, %33 ], [ %24, %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread ]
  %35 = phi i32 [ %.pre.i2, %33 ], [ %29, %_ZNK7Minisat4HeapINS_6Solver10VarOrderLtEE6inHeapEi.exit.thread ]
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %26, align 4, !tbaa !98
  %37 = sext i32 %35 to i64
  %38 = getelementptr inbounds %"class.Minisat::vec.6"* %25, i64 0, i32 0
  %39 = load i32** %38, align 8, !tbaa !97
  %40 = getelementptr inbounds i32* %39, i64 %37
  store i32 %n, i32* %40, align 4, !tbaa !36
  %41 = getelementptr inbounds i32* %.pre5, i64 %.pre-phi
  %42 = load i32* %41, align 4, !tbaa !36
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32* %39, i64 %43
  %45 = load i32* %44, align 4, !tbaa !36
  %46 = icmp eq i32 %42, 0
  br i1 %46, label %..critedge_crit_edge5.i, label %.lr.ph.i1

..critedge_crit_edge5.i:                          ; preds = %_ZN7Minisat3vecIiE4pushERKi.exit
  %.pre.i = sext i32 %45 to i64
  br label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE11percolateUpEi.exit

.lr.ph.i1:                                        ; preds = %_ZN7Minisat3vecIiE4pushERKi.exit
  %47 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 0, i32 0
  %48 = sext i32 %45 to i64
  br label %49

; <label>:49                                      ; preds = %63, %.lr.ph.i1
  %.in.in.i = phi i32 [ %42, %.lr.ph.i1 ], [ %50, %63 ]
  %.in.i = add nsw i32 %.in.in.i, -1
  %50 = ashr i32 %.in.i, 1
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32* %39, i64 %51
  %53 = load i32* %52, align 4, !tbaa !36
  %54 = load %"class.Minisat::vec.2"** %47, align 8, !tbaa !59
  %55 = getelementptr inbounds %"class.Minisat::vec.2"* %54, i64 0, i32 0
  %56 = load double** %55, align 8, !tbaa !114
  %57 = getelementptr inbounds double* %56, i64 %48
  %58 = load double* %57, align 8, !tbaa !72
  %59 = sext i32 %53 to i64
  %60 = getelementptr inbounds double* %56, i64 %59
  %61 = load double* %60, align 8, !tbaa !72
  %62 = fcmp ogt double %58, %61
  br i1 %62, label %63, label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE11percolateUpEi.exit

; <label>:63                                      ; preds = %49
  %64 = sext i32 %.in.in.i to i64
  %65 = getelementptr inbounds i32* %39, i64 %64
  store i32 %53, i32* %65, align 4, !tbaa !36
  %66 = load i32* %52, align 4, !tbaa !36
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32* %.pre5, i64 %67
  store i32 %.in.in.i, i32* %68, align 4, !tbaa !36
  %69 = icmp eq i32 %50, 0
  br i1 %69, label %_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE11percolateUpEi.exit, label %49

_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE11percolateUpEi.exit: ; preds = %63, %49, %..critedge_crit_edge5.i
  %.pre-phi.i = phi i64 [ %.pre.i, %..critedge_crit_edge5.i ], [ %48, %63 ], [ %48, %49 ]
  %.sink.in.lcssa.i = phi i32 [ 0, %..critedge_crit_edge5.i ], [ %.in.in.i, %49 ], [ 0, %63 ]
  %70 = sext i32 %.sink.in.lcssa.i to i64
  %71 = getelementptr inbounds i32* %39, i64 %70
  store i32 %45, i32* %71, align 4, !tbaa !36
  %72 = getelementptr inbounds i32* %.pre5, i64 %.pre-phi.i
  store i32 %.sink.in.lcssa.i, i32* %72, align 4, !tbaa !36
  ret void
}

; Function Attrs: nounwind ssp uwtable
define linkonce_odr void @_ZN7Minisat4sortINS_3LitENS_16LessThan_defaultIS1_EEEEvPT_iT0_(%"struct.Minisat::Lit"* %array, i32 %size) #6 {
  %1 = icmp slt i32 %size, 16
  br i1 %1, label %tailrecurse._crit_edge, label %.lr.ph

tailrecurse._crit_edge:                           ; preds = %tailrecurse, %0
  %size.tr.lcssa = phi i32 [ %size, %0 ], [ %38, %tailrecurse ]
  %array.tr.lcssa = phi %"struct.Minisat::Lit"* [ %array, %0 ], [ %24, %tailrecurse ]
  %2 = add i32 %size.tr.lcssa, -1
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %.lr.ph6.i, label %_ZN7Minisat13selectionSortINS_3LitENS_16LessThan_defaultIS1_EEEEvPT_iT0_.exit

.lr.ph6.i:                                        ; preds = %._crit_edge.i, %tailrecurse._crit_edge
  %indvars.iv10.i = phi i64 [ %indvars.iv.next11.i, %._crit_edge.i ], [ 0, %tailrecurse._crit_edge ]
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %._crit_edge.i ], [ 1, %tailrecurse._crit_edge ]
  %indvars.iv.next11.i = add nuw nsw i64 %indvars.iv10.i, 1
  %4 = trunc i64 %indvars.iv.next11.i to i32
  %5 = icmp slt i32 %4, %size.tr.lcssa
  %6 = trunc i64 %indvars.iv10.i to i32
  br i1 %5, label %.lr.ph.i, label %._crit_edge.i

.lr.ph.i:                                         ; preds = %.lr.ph.i, %.lr.ph6.i
  %indvars.iv8.i = phi i64 [ %indvars.iv.next9.i, %.lr.ph.i ], [ %indvars.iv.i, %.lr.ph6.i ]
  %best_i.02.i = phi i32 [ %j.0.best_i.0.i, %.lr.ph.i ], [ %6, %.lr.ph6.i ]
  %7 = getelementptr inbounds %"struct.Minisat::Lit"* %array.tr.lcssa, i64 %indvars.iv8.i, i32 0
  %8 = load i32* %7, align 4
  %9 = sext i32 %best_i.02.i to i64
  %10 = getelementptr inbounds %"struct.Minisat::Lit"* %array.tr.lcssa, i64 %9, i32 0
  %11 = load i32* %10, align 4
  %12 = icmp slt i32 %8, %11
  %13 = trunc i64 %indvars.iv8.i to i32
  %j.0.best_i.0.i = select i1 %12, i32 %13, i32 %best_i.02.i
  %indvars.iv.next9.i = add nuw nsw i64 %indvars.iv8.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next9.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %size.tr.lcssa
  br i1 %exitcond, label %._crit_edge.i, label %.lr.ph.i

._crit_edge.i:                                    ; preds = %.lr.ph.i, %.lr.ph6.i
  %best_i.0.lcssa.i = phi i32 [ %6, %.lr.ph6.i ], [ %j.0.best_i.0.i, %.lr.ph.i ]
  %14 = getelementptr inbounds %"struct.Minisat::Lit"* %array.tr.lcssa, i64 %indvars.iv10.i, i32 0
  %15 = load i32* %14, align 4
  %16 = sext i32 %best_i.0.lcssa.i to i64
  %17 = getelementptr inbounds %"struct.Minisat::Lit"* %array.tr.lcssa, i64 %16, i32 0
  %18 = load i32* %17, align 4, !tbaa !36
  store i32 %18, i32* %14, align 4, !tbaa !36
  store i32 %15, i32* %17, align 4
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond13 = icmp eq i32 %4, %2
  br i1 %exitcond13, label %_ZN7Minisat13selectionSortINS_3LitENS_16LessThan_defaultIS1_EEEEvPT_iT0_.exit, label %.lr.ph6.i

.lr.ph:                                           ; preds = %tailrecurse, %0
  %size.tr10 = phi i32 [ %38, %tailrecurse ], [ %size, %0 ]
  %array.tr9 = phi %"struct.Minisat::Lit"* [ %24, %tailrecurse ], [ %array, %0 ]
  %19 = sdiv i32 %size.tr10, 2
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %"struct.Minisat::Lit"* %array.tr9, i64 %20, i32 0
  %22 = load i32* %21, align 4
  br label %.outer

.outer:                                           ; preds = %37, %.lr.ph
  %j.0.ph = phi i32 [ %size.tr10, %.lr.ph ], [ %35, %37 ]
  %i.0.ph = phi i64 [ -1, %.lr.ph ], [ %phitmp, %37 ]
  br label %23

; <label>:23                                      ; preds = %23, %.outer
  %indvars.iv = phi i64 [ %i.0.ph, %.outer ], [ %indvars.iv.next, %23 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %24 = getelementptr inbounds %"struct.Minisat::Lit"* %array.tr9, i64 %indvars.iv.next
  %25 = getelementptr inbounds %"struct.Minisat::Lit"* %24, i64 0, i32 0
  %26 = load i32* %25, align 4
  %27 = icmp slt i32 %26, %22
  br i1 %27, label %23, label %.preheader

.preheader:                                       ; preds = %23
  %28 = sext i32 %j.0.ph to i64
  br label %29

; <label>:29                                      ; preds = %29, %.preheader
  %indvars.iv18 = phi i64 [ %28, %.preheader ], [ %indvars.iv.next19, %29 ]
  %indvars.iv.next19 = add nsw i64 %indvars.iv18, -1
  %30 = getelementptr inbounds %"struct.Minisat::Lit"* %array.tr9, i64 %indvars.iv.next19, i32 0
  %31 = load i32* %30, align 4
  %32 = icmp slt i32 %22, %31
  br i1 %32, label %29, label %33

; <label>:33                                      ; preds = %29
  %34 = trunc i64 %indvars.iv.next to i32
  %35 = trunc i64 %indvars.iv.next19 to i32
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %tailrecurse

; <label>:37                                      ; preds = %33
  store i32 %31, i32* %25, align 4, !tbaa !36
  store i32 %26, i32* %30, align 4
  %sext = shl i64 %indvars.iv.next, 32
  %phitmp = ashr exact i64 %sext, 32
  br label %.outer

tailrecurse:                                      ; preds = %33
  tail call void @_ZN7Minisat4sortINS_3LitENS_16LessThan_defaultIS1_EEEEvPT_iT0_(%"struct.Minisat::Lit"* %array.tr9, i32 %34)
  %38 = sub nsw i32 %size.tr10, %34
  %39 = icmp slt i32 %38, 16
  br i1 %39, label %tailrecurse._crit_edge, label %.lr.ph

_ZN7Minisat13selectionSortINS_3LitENS_16LessThan_defaultIS1_EEEEvPT_iT0_.exit: ; preds = %._crit_edge.i, %tailrecurse._crit_edge
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr i32 @_ZN7Minisat15ClauseAllocator5allocINS_3vecINS_3LitEEEEEjRKT_b(%"class.Minisat::ClauseAllocator"* nocapture %this, %"class.Minisat::vec.0"* nocapture readonly %ps, i1 zeroext %learnt) #0 align 2 {
  %1 = zext i1 %learnt to i32
  %2 = getelementptr inbounds %"class.Minisat::ClauseAllocator"* %this, i64 0, i32 1
  %3 = load i8* %2, align 1, !tbaa !96, !range !78
  %4 = zext i8 %3 to i32
  %5 = or i32 %4, %1
  %6 = getelementptr inbounds %"class.Minisat::vec.0"* %ps, i64 0, i32 1
  %7 = load i32* %6, align 4, !tbaa !61
  %8 = add nsw i32 %5, %7
  %9 = sext i32 %8 to i64
  %10 = shl nsw i64 %9, 2
  %11 = add i64 %10, 4
  %12 = lshr exact i64 %11, 2
  %13 = trunc i64 %12 to i32
  %14 = icmp slt i32 %13, 1
  br i1 %14, label %15, label %16, !prof !123

; <label>:15                                      ; preds = %0
  tail call void @__assert_rtn(i8* getelementptr inbounds ([6 x i8]* @__func__._ZN7Minisat15RegionAllocatorIjE5allocEi, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 114, i8* getelementptr inbounds ([9 x i8]* @.str70, i64 0, i64 0)) #16
  unreachable

; <label>:16                                      ; preds = %0
  %17 = bitcast %"class.Minisat::ClauseAllocator"* %this to %"class.Minisat::RegionAllocator"*
  %18 = getelementptr inbounds %"class.Minisat::ClauseAllocator"* %this, i64 0, i32 0, i64 8
  %19 = bitcast i8* %18 to i32*
  %20 = load i32* %19, align 4, !tbaa !128
  %21 = add i32 %20, %13
  tail call void @_ZN7Minisat15RegionAllocatorIjE8capacityEj(%"class.Minisat::RegionAllocator"* %17, i32 %21)
  %22 = load i32* %19, align 4, !tbaa !128
  %uadd.i = tail call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %22, i32 %13)
  %23 = extractvalue { i32, i1 } %uadd.i, 0
  store i32 %23, i32* %19, align 4, !tbaa !128
  %24 = extractvalue { i32, i1 } %uadd.i, 1
  br i1 %24, label %25, label %_ZN7Minisat15RegionAllocatorIjE5allocEi.exit

; <label>:25                                      ; preds = %16
  %26 = tail call i8* @__cxa_allocate_exception(i64 1) #2
  tail call void @__cxa_throw(i8* %26, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*), i8* null) #16
  unreachable

_ZN7Minisat15RegionAllocatorIjE5allocEi.exit:     ; preds = %16
  %phitmp.i.i = icmp ugt i32 %23, %22
  br i1 %phitmp.i.i, label %_ZN7Minisat15ClauseAllocator3leaEj.exit, label %27, !prof !122

; <label>:27                                      ; preds = %_ZN7Minisat15RegionAllocatorIjE5allocEi.exit
  tail call void @__assert_rtn(i8* getelementptr inbounds ([4 x i8]* @__func__._ZN7Minisat15RegionAllocatorIjE3leaEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 66, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocator3leaEj.exit:          ; preds = %_ZN7Minisat15RegionAllocatorIjE5allocEi.exit
  %28 = zext i32 %22 to i64
  %29 = bitcast %"class.Minisat::ClauseAllocator"* %this to i32**
  %30 = load i32** %29, align 8, !tbaa !119
  %31 = getelementptr inbounds i32* %30, i64 %28
  %32 = bitcast i32* %31 to %"class.Minisat::Clause"*
  %33 = icmp eq i32* %31, null
  br i1 %33, label %_ZN7Minisat6ClauseC1INS_3vecINS_3LitEEEEERKT_bb.exit, label %34

; <label>:34                                      ; preds = %_ZN7Minisat15ClauseAllocator3leaEj.exit
  %35 = load i32* %31, align 4
  %36 = shl nuw nsw i32 %1, 2
  %37 = and i32 %35, -32
  %38 = shl nuw nsw i32 %5, 3
  %39 = or i32 %38, %36
  %40 = or i32 %37, %39
  store i32 %40, i32* %31, align 4
  %41 = load i32* %6, align 4, !tbaa !61
  %42 = shl i32 %41, 5
  %43 = or i32 %42, %39
  store i32 %43, i32* %31, align 4
  %44 = load i32* %6, align 4, !tbaa !61
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %.lr.ph.i.i, label %55

.lr.ph.i.i:                                       ; preds = %34
  %46 = getelementptr inbounds %"class.Minisat::vec.0"* %ps, i64 0, i32 0
  %47 = load %"struct.Minisat::Lit"** %46, align 8, !tbaa !60
  br label %48

; <label>:48                                      ; preds = %48, %.lr.ph.i.i
  %indvars.iv.i.i = phi i64 [ 0, %.lr.ph.i.i ], [ %indvars.iv.next.i.i, %48 ]
  %49 = getelementptr inbounds %"struct.Minisat::Lit"* %47, i64 %indvars.iv.i.i, i32 0
  %50 = load i32* %49, align 4, !tbaa !36
  %51 = getelementptr inbounds %"class.Minisat::Clause"* %32, i64 0, i32 1, i64 %indvars.iv.i.i, i32 0, i32 0
  store i32 %50, i32* %51, align 4, !tbaa !36
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %52 = load i32* %6, align 4, !tbaa !61
  %53 = trunc i64 %indvars.iv.next.i.i to i32
  %54 = icmp slt i32 %53, %52
  br i1 %54, label %48, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %48
  %.pre.i.i = load i32* %31, align 4
  br label %55

; <label>:55                                      ; preds = %._crit_edge.i.i, %34
  %56 = phi i32 [ %.pre.i.i, %._crit_edge.i.i ], [ %43, %34 ]
  %57 = and i32 %56, 8
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %_ZN7Minisat6ClauseC1INS_3vecINS_3LitEEEEERKT_bb.exit, label %59

; <label>:59                                      ; preds = %55
  %60 = and i32 %56, 4
  %61 = icmp eq i32 %60, 0
  %62 = lshr i32 %56, 5
  br i1 %61, label %.preheader.i.i.i, label %63

; <label>:63                                      ; preds = %59
  %64 = zext i32 %62 to i64
  %65 = getelementptr inbounds %"class.Minisat::Clause"* %32, i64 0, i32 1, i64 %64
  %66 = bitcast %union.anon* %65 to float*
  store float 0.000000e+00, float* %66, align 4, !tbaa !136
  br label %_ZN7Minisat6ClauseC1INS_3vecINS_3LitEEEEERKT_bb.exit

.preheader.i.i.i:                                 ; preds = %59
  %67 = icmp eq i32 %62, 0
  br i1 %67, label %_ZN7Minisat6Clause15calcAbstractionEv.exit.i.i, label %.lr.ph.i.i.i.preheader

.lr.ph.i.i.i.preheader:                           ; preds = %.preheader.i.i.i
  %68 = lshr i32 %56, 5
  %69 = icmp ugt i32 %56, 63
  %.op = add i32 %68, -1
  %70 = zext i32 %.op to i64
  %.op10 = add i64 %70, 1
  %71 = select i1 %69, i64 %.op10, i64 1
  %n.vec = and i64 %71, -8
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %.lr.ph.i.i.i.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph.i.i.i.preheader ]
  %vec.phi = phi <4 x i32> [ %82, %vector.body ], [ zeroinitializer, %.lr.ph.i.i.i.preheader ]
  %vec.phi2 = phi <4 x i32> [ %83, %vector.body ], [ zeroinitializer, %.lr.ph.i.i.i.preheader ]
  %72 = getelementptr inbounds %"class.Minisat::Clause"* %32, i64 0, i32 1, i64 %index, i32 0, i32 0
  %73 = bitcast i32* %72 to <4 x i32>*
  %wide.load = load <4 x i32>* %73, align 4
  %74 = getelementptr i32* %72, i64 4
  %75 = bitcast i32* %74 to <4 x i32>*
  %wide.load3 = load <4 x i32>* %75, align 4
  %76 = lshr <4 x i32> %wide.load, <i32 1, i32 1, i32 1, i32 1>
  %77 = lshr <4 x i32> %wide.load3, <i32 1, i32 1, i32 1, i32 1>
  %78 = and <4 x i32> %76, <i32 31, i32 31, i32 31, i32 31>
  %79 = and <4 x i32> %77, <i32 31, i32 31, i32 31, i32 31>
  %80 = shl <4 x i32> <i32 1, i32 1, i32 1, i32 1>, %78
  %81 = shl <4 x i32> <i32 1, i32 1, i32 1, i32 1>, %79
  %82 = or <4 x i32> %80, %vec.phi
  %83 = or <4 x i32> %81, %vec.phi2
  %index.next = add i64 %index, 8
  %84 = icmp eq i64 %index.next, %n.vec
  br i1 %84, label %middle.block, label %vector.body, !llvm.loop !151

middle.block:                                     ; preds = %vector.body, %.lr.ph.i.i.i.preheader
  %resume.val = phi i64 [ 0, %.lr.ph.i.i.i.preheader ], [ %n.vec, %vector.body ]
  %rdx.vec.exit.phi = phi <4 x i32> [ zeroinitializer, %.lr.ph.i.i.i.preheader ], [ %82, %vector.body ]
  %rdx.vec.exit.phi6 = phi <4 x i32> [ zeroinitializer, %.lr.ph.i.i.i.preheader ], [ %83, %vector.body ]
  %bin.rdx = or <4 x i32> %rdx.vec.exit.phi6, %rdx.vec.exit.phi
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx7 = or <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf8 = shufflevector <4 x i32> %bin.rdx7, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx9 = or <4 x i32> %bin.rdx7, %rdx.shuf8
  %85 = extractelement <4 x i32> %bin.rdx9, i32 0
  %cmp.n = icmp eq i64 %71, %resume.val
  br i1 %cmp.n, label %._crit_edge.i.i.i, label %.lr.ph.i.i.i

.lr.ph.i.i.i:                                     ; preds = %.lr.ph.i.i.i, %middle.block
  %indvars.iv.i.i.i = phi i64 [ %indvars.iv.next.i.i.i, %.lr.ph.i.i.i ], [ %resume.val, %middle.block ]
  %abstraction.02.i.i.i = phi i32 [ %91, %.lr.ph.i.i.i ], [ %85, %middle.block ]
  %86 = getelementptr inbounds %"class.Minisat::Clause"* %32, i64 0, i32 1, i64 %indvars.iv.i.i.i, i32 0, i32 0
  %87 = load i32* %86, align 4
  %88 = lshr i32 %87, 1
  %89 = and i32 %88, 31
  %90 = shl i32 1, %89
  %91 = or i32 %90, %abstraction.02.i.i.i
  %indvars.iv.next.i.i.i = add nuw nsw i64 %indvars.iv.i.i.i, 1
  %92 = trunc i64 %indvars.iv.next.i.i.i to i32
  %93 = icmp slt i32 %92, %62
  br i1 %93, label %.lr.ph.i.i.i, label %._crit_edge.i.i.i, !llvm.loop !152

._crit_edge.i.i.i:                                ; preds = %.lr.ph.i.i.i, %middle.block
  %.lcssa = phi i32 [ %91, %.lr.ph.i.i.i ], [ %85, %middle.block ]
  %phitmp.i.i.i = zext i32 %62 to i64
  br label %_ZN7Minisat6Clause15calcAbstractionEv.exit.i.i

_ZN7Minisat6Clause15calcAbstractionEv.exit.i.i:   ; preds = %._crit_edge.i.i.i, %.preheader.i.i.i
  %.lcssa.i.i.i = phi i64 [ %phitmp.i.i.i, %._crit_edge.i.i.i ], [ 0, %.preheader.i.i.i ]
  %abstraction.0.lcssa.i.i.i = phi i32 [ %.lcssa, %._crit_edge.i.i.i ], [ 0, %.preheader.i.i.i ]
  %94 = getelementptr inbounds %"class.Minisat::Clause"* %32, i64 0, i32 1, i64 %.lcssa.i.i.i, i32 0, i32 0
  store i32 %abstraction.0.lcssa.i.i.i, i32* %94, align 4, !tbaa !36
  br label %_ZN7Minisat6ClauseC1INS_3vecINS_3LitEEEEERKT_bb.exit

_ZN7Minisat6ClauseC1INS_3vecINS_3LitEEEEERKT_bb.exit: ; preds = %_ZN7Minisat6Clause15calcAbstractionEv.exit.i.i, %63, %55, %_ZN7Minisat15ClauseAllocator3leaEj.exit
  ret i32 %22
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat3vecIjE8capacityEi(%"class.Minisat::vec.1"* nocapture %this, i32 %min_cap) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::vec.1"* %this, i64 0, i32 2
  %2 = load i32* %1, align 4, !tbaa !118
  %3 = icmp slt i32 %2, %min_cap
  br i1 %3, label %4, label %35

; <label>:4                                       ; preds = %0
  %5 = add i32 %min_cap, 1
  %6 = sub i32 %5, %2
  %7 = and i32 %6, -2
  %8 = ashr i32 %2, 1
  %9 = add nsw i32 %8, 2
  %10 = and i32 %9, -2
  %11 = sub nsw i32 %10, %7
  %12 = ashr i32 %11, 31
  %13 = and i32 %12, %7
  %14 = xor i32 %12, -1
  %15 = and i32 %10, %14
  %16 = add nsw i32 %13, %15
  %17 = sub nsw i32 2147483647, %2
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %33, label %19

; <label>:19                                      ; preds = %4
  %20 = getelementptr inbounds %"class.Minisat::vec.1"* %this, i64 0, i32 0
  %21 = load i32** %20, align 8, !tbaa !117
  %22 = bitcast i32* %21 to i8*
  %23 = add nsw i32 %16, %2
  store i32 %23, i32* %1, align 4, !tbaa !118
  %24 = sext i32 %23 to i64
  %25 = shl nsw i64 %24, 2
  %26 = tail call i8* @realloc(i8* %22, i64 %25)
  %27 = bitcast i8* %26 to i32*
  store i32* %27, i32** %20, align 8, !tbaa !117
  %28 = icmp eq i8* %26, null
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %19
  %30 = tail call i32* @__error()
  %31 = load i32* %30, align 4, !tbaa !36
  %32 = icmp eq i32 %31, 12
  br i1 %32, label %33, label %35

; <label>:33                                      ; preds = %29, %4
  %34 = tail call i8* @__cxa_allocate_exception(i64 1) #2
  tail call void @__cxa_throw(i8* %34, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*), i8* null) #16
  unreachable

; <label>:35                                      ; preds = %29, %19, %0
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEE5cleanERKS1_(%"class.Minisat::OccLists"* nocapture readonly %this, %"struct.Minisat::Lit"* nocapture readonly %idx) #0 align 2 {
  %1 = getelementptr inbounds %"struct.Minisat::Lit"* %idx, i64 0, i32 0
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds %"class.Minisat::OccLists"* %this, i64 0, i32 0, i32 0
  %5 = load %"class.Minisat::vec.4"** %4, align 8, !tbaa !107
  %6 = getelementptr inbounds %"class.Minisat::vec.4"* %5, i64 %3, i32 1
  %7 = load i32* %6, align 4, !tbaa !111
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0
  %9 = getelementptr inbounds %"class.Minisat::vec.4"* %5, i64 %3, i32 0
  %10 = getelementptr inbounds %"class.Minisat::OccLists"* %this, i64 0, i32 3, i32 0
  br label %11

; <label>:11                                      ; preds = %36, %.lr.ph
  %12 = phi i32 [ %7, %.lr.ph ], [ %37, %36 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %36 ]
  %j.07 = phi i32 [ 0, %.lr.ph ], [ %j.1, %36 ]
  %13 = load %"struct.Minisat::Solver::Watcher"** %9, align 8, !tbaa !109
  %14 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %13, i64 %indvars.iv
  %15 = load %"class.Minisat::ClauseAllocator"** %10, align 8, !tbaa !59
  %16 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %14, i64 0, i32 0
  %17 = load i32* %16, align 4, !tbaa !125
  %18 = getelementptr inbounds %"class.Minisat::ClauseAllocator"* %15, i64 0, i32 0, i64 8
  %19 = bitcast i8* %18 to i32*
  %20 = load i32* %19, align 4, !tbaa !128
  %phitmp.i.i.i = icmp ugt i32 %20, %17
  br i1 %phitmp.i.i.i, label %_ZNK7Minisat6Solver14WatcherDeletedclERKNS0_7WatcherE.exit, label %21, !prof !122

; <label>:21                                      ; preds = %11
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 64, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZNK7Minisat6Solver14WatcherDeletedclERKNS0_7WatcherE.exit: ; preds = %11
  %22 = zext i32 %17 to i64
  %23 = bitcast %"class.Minisat::ClauseAllocator"* %15 to i32**
  %24 = load i32** %23, align 8, !tbaa !119
  %25 = getelementptr inbounds i32* %24, i64 %22
  %26 = load i32* %25, align 4
  %27 = and i32 %26, 3
  %28 = icmp eq i32 %27, 1
  br i1 %28, label %36, label %29

; <label>:29                                      ; preds = %_ZNK7Minisat6Solver14WatcherDeletedclERKNS0_7WatcherE.exit
  %30 = add nsw i32 %j.07, 1
  %31 = sext i32 %j.07 to i64
  %32 = getelementptr inbounds %"struct.Minisat::Solver::Watcher"* %13, i64 %31
  %33 = bitcast %"struct.Minisat::Solver::Watcher"* %14 to i64*
  %34 = bitcast %"struct.Minisat::Solver::Watcher"* %32 to i64*
  %35 = load i64* %33, align 4
  store i64 %35, i64* %34, align 4
  %.pre = load i32* %6, align 4, !tbaa !111
  br label %36

; <label>:36                                      ; preds = %29, %_ZNK7Minisat6Solver14WatcherDeletedclERKNS0_7WatcherE.exit
  %37 = phi i32 [ %12, %_ZNK7Minisat6Solver14WatcherDeletedclERKNS0_7WatcherE.exit ], [ %.pre, %29 ]
  %j.1 = phi i32 [ %j.07, %_ZNK7Minisat6Solver14WatcherDeletedclERKNS0_7WatcherE.exit ], [ %30, %29 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %38 = trunc i64 %indvars.iv.next to i32
  %39 = icmp slt i32 %38, %37
  br i1 %39, label %11, label %._crit_edge

._crit_edge:                                      ; preds = %36, %0
  %.lcssa5 = phi i32 [ %7, %0 ], [ %37, %36 ]
  %i.0.lcssa = phi i32 [ 0, %0 ], [ %38, %36 ]
  %j.0.lcssa = phi i32 [ 0, %0 ], [ %j.1, %36 ]
  %40 = sub nsw i32 %i.0.lcssa, %j.0.lcssa
  %41 = icmp slt i32 %.lcssa5, %40
  br i1 %41, label %44, label %.preheader.i, !prof !123

.preheader.i:                                     ; preds = %._crit_edge
  %42 = icmp sgt i32 %40, 0
  br i1 %42, label %.lr.ph.i, label %_ZN7Minisat3vecINS_6Solver7WatcherEE6shrinkEi.exit

.lr.ph.i:                                         ; preds = %.preheader.i
  %43 = sub i32 %.lcssa5, %40
  store i32 %43, i32* %6, align 4, !tbaa !111
  br label %_ZN7Minisat3vecINS_6Solver7WatcherEE6shrinkEi.exit

; <label>:44                                      ; preds = %._crit_edge
  tail call void @__assert_rtn(i8* getelementptr inbounds ([7 x i8]* @__func__._ZN7Minisat3vecIjE6shrinkEi, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8]* @.str58, i64 0, i64 0), i32 64, i8* getelementptr inbounds ([13 x i8]* @.str59, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat3vecINS_6Solver7WatcherEE6shrinkEi.exit: ; preds = %.lr.ph.i, %.preheader.i
  %45 = load i32* %1, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds %"class.Minisat::OccLists"* %this, i64 0, i32 1, i32 0
  %48 = load i8** %47, align 8, !tbaa !102
  %49 = getelementptr inbounds i8* %48, i64 %46
  store i8 0, i8* %49, align 1, !tbaa !59
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat3vecINS_6Solver7WatcherEE8capacityEi(%"class.Minisat::vec.4"* nocapture %this, i32 %min_cap) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::vec.4"* %this, i64 0, i32 2
  %2 = load i32* %1, align 4, !tbaa !112
  %3 = icmp slt i32 %2, %min_cap
  br i1 %3, label %4, label %35

; <label>:4                                       ; preds = %0
  %5 = add i32 %min_cap, 1
  %6 = sub i32 %5, %2
  %7 = and i32 %6, -2
  %8 = ashr i32 %2, 1
  %9 = add nsw i32 %8, 2
  %10 = and i32 %9, -2
  %11 = sub nsw i32 %10, %7
  %12 = ashr i32 %11, 31
  %13 = and i32 %12, %7
  %14 = xor i32 %12, -1
  %15 = and i32 %10, %14
  %16 = add nsw i32 %13, %15
  %17 = sub nsw i32 2147483647, %2
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %33, label %19

; <label>:19                                      ; preds = %4
  %20 = getelementptr inbounds %"class.Minisat::vec.4"* %this, i64 0, i32 0
  %21 = load %"struct.Minisat::Solver::Watcher"** %20, align 8, !tbaa !109
  %22 = bitcast %"struct.Minisat::Solver::Watcher"* %21 to i8*
  %23 = add nsw i32 %16, %2
  store i32 %23, i32* %1, align 4, !tbaa !112
  %24 = sext i32 %23 to i64
  %25 = shl nsw i64 %24, 3
  %26 = tail call i8* @realloc(i8* %22, i64 %25)
  %27 = bitcast i8* %26 to %"struct.Minisat::Solver::Watcher"*
  store %"struct.Minisat::Solver::Watcher"* %27, %"struct.Minisat::Solver::Watcher"** %20, align 8, !tbaa !109
  %28 = icmp eq i8* %26, null
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %19
  %30 = tail call i32* @__error()
  %31 = load i32* %30, align 4, !tbaa !36
  %32 = icmp eq i32 %31, 12
  br i1 %32, label %33, label %35

; <label>:33                                      ; preds = %29, %4
  %34 = tail call i8* @__cxa_allocate_exception(i64 1) #2
  tail call void @__cxa_throw(i8* %34, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*), i8* null) #16
  unreachable

; <label>:35                                      ; preds = %29, %19, %0
  ret void
}

; Function Attrs: nounwind ssp uwtable
define linkonce_odr void @_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE13percolateDownEi(%"class.Minisat::Heap"* nocapture readonly %this, i32 %i) #6 align 2 {
  %1 = sext i32 %i to i64
  %2 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 1, i32 0
  %3 = load i32** %2, align 8, !tbaa !97
  %4 = getelementptr inbounds i32* %3, i64 %1
  %5 = load i32* %4, align 4, !tbaa !36
  %6 = shl nsw i32 %i, 1
  %7 = or i32 %6, 1
  %8 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 1, i32 1
  %9 = load i32* %8, align 4, !tbaa !98
  %10 = icmp slt i32 %7, %9
  br i1 %10, label %.lr.ph, label %._crit_edge17

._crit_edge17:                                    ; preds = %0
  %.pre18 = sext i32 %5 to i64
  %.pre19 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 2, i32 0
  br label %split2

.lr.ph:                                           ; preds = %0
  %11 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 0, i32 0
  %12 = sext i32 %5 to i64
  %13 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 2, i32 0
  br label %14

; <label>:14                                      ; preds = %46, %.lr.ph
  %15 = phi i32 [ %9, %.lr.ph ], [ %54, %46 ]
  %16 = phi i32 [ %7, %.lr.ph ], [ %53, %46 ]
  %.01 = phi i32 [ %i, %.lr.ph ], [ %42, %46 ]
  %17 = shl i32 %.01, 1
  %18 = add i32 %17, 2
  %19 = icmp slt i32 %18, %15
  br i1 %19, label %20, label %._crit_edge6

._crit_edge6:                                     ; preds = %14
  %.pre.pre = load %"class.Minisat::vec.2"** %11, align 8, !tbaa !59
  %.phi.trans.insert.phi.trans.insert = getelementptr inbounds %"class.Minisat::vec.2"* %.pre.pre, i64 0, i32 0
  %.pre5.pre = load double** %.phi.trans.insert.phi.trans.insert, align 8, !tbaa !114
  %.phi.trans.insert9.phi.trans.insert = sext i32 %16 to i64
  %.phi.trans.insert10.phi.trans.insert = getelementptr inbounds i32* %3, i64 %.phi.trans.insert9.phi.trans.insert
  %.pre11.pre = load i32* %.phi.trans.insert10.phi.trans.insert, align 4, !tbaa !36
  %.phi.trans.insert12.phi.trans.insert = sext i32 %.pre11.pre to i64
  %.phi.trans.insert13.phi.trans.insert = getelementptr inbounds double* %.pre5.pre, i64 %.phi.trans.insert12.phi.trans.insert
  %.pre14.pre = load double* %.phi.trans.insert13.phi.trans.insert, align 8, !tbaa !72
  br label %37

; <label>:20                                      ; preds = %14
  %21 = sext i32 %18 to i64
  %22 = getelementptr inbounds i32* %3, i64 %21
  %23 = load i32* %22, align 4, !tbaa !36
  %24 = sext i32 %16 to i64
  %25 = getelementptr inbounds i32* %3, i64 %24
  %26 = load i32* %25, align 4, !tbaa !36
  %27 = load %"class.Minisat::vec.2"** %11, align 8, !tbaa !59
  %28 = sext i32 %23 to i64
  %29 = getelementptr inbounds %"class.Minisat::vec.2"* %27, i64 0, i32 0
  %30 = load double** %29, align 8, !tbaa !114
  %31 = getelementptr inbounds double* %30, i64 %28
  %32 = load double* %31, align 8, !tbaa !72
  %33 = sext i32 %26 to i64
  %34 = getelementptr inbounds double* %30, i64 %33
  %35 = load double* %34, align 8, !tbaa !72
  %36 = fcmp ogt double %32, %35
  br i1 %36, label %38, label %37

; <label>:37                                      ; preds = %20, %._crit_edge6
  %.pre14 = phi double [ %.pre14.pre, %._crit_edge6 ], [ %35, %20 ]
  %.pre11 = phi i32 [ %.pre11.pre, %._crit_edge6 ], [ %26, %20 ]
  %.pre5 = phi double* [ %.pre5.pre, %._crit_edge6 ], [ %30, %20 ]
  br label %38

; <label>:38                                      ; preds = %37, %20
  %39 = phi double [ %.pre14, %37 ], [ %32, %20 ]
  %40 = phi i32 [ %.pre11, %37 ], [ %23, %20 ]
  %41 = phi double* [ %.pre5, %37 ], [ %30, %20 ]
  %42 = phi i32 [ %16, %37 ], [ %18, %20 ]
  %43 = getelementptr inbounds double* %41, i64 %12
  %44 = load double* %43, align 8, !tbaa !72
  %45 = fcmp ogt double %39, %44
  br i1 %45, label %46, label %split2

; <label>:46                                      ; preds = %38
  %47 = sext i32 %40 to i64
  %48 = sext i32 %.01 to i64
  %49 = getelementptr inbounds i32* %3, i64 %48
  store i32 %40, i32* %49, align 4, !tbaa !36
  %50 = load i32** %13, align 8, !tbaa !97
  %51 = getelementptr inbounds i32* %50, i64 %47
  store i32 %.01, i32* %51, align 4, !tbaa !36
  %52 = shl nsw i32 %42, 1
  %53 = or i32 %52, 1
  %54 = load i32* %8, align 4, !tbaa !98
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %14, label %split2

split2:                                           ; preds = %46, %38, %._crit_edge17
  %.pre-phi20 = phi i32** [ %.pre19, %._crit_edge17 ], [ %13, %38 ], [ %13, %46 ]
  %.pre-phi = phi i64 [ %.pre18, %._crit_edge17 ], [ %12, %38 ], [ %12, %46 ]
  %.0.lcssa = phi i32 [ %i, %._crit_edge17 ], [ %42, %46 ], [ %.01, %38 ]
  %56 = sext i32 %.0.lcssa to i64
  %57 = getelementptr inbounds i32* %3, i64 %56
  store i32 %5, i32* %57, align 4, !tbaa !36
  %58 = load i32** %.pre-phi20, align 8, !tbaa !97
  %59 = getelementptr inbounds i32* %58, i64 %.pre-phi
  store i32 %.0.lcssa, i32* %59, align 4, !tbaa !36
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat4sortIj11reduceDB_ltEEvPT_iT0_(i32* %array, i32 %size, %"class.Minisat::ClauseAllocator"* %lt.coerce) #0 {
  %lt.i = alloca %struct.reduceDB_lt, align 8
  %lt = alloca %struct.reduceDB_lt, align 8
  %1 = getelementptr %struct.reduceDB_lt* %lt, i64 0, i32 0
  store %"class.Minisat::ClauseAllocator"* %lt.coerce, %"class.Minisat::ClauseAllocator"** %1, align 8
  %2 = icmp slt i32 %size, 16
  br i1 %2, label %3, label %23

; <label>:3                                       ; preds = %0
  %4 = bitcast %struct.reduceDB_lt* %lt.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %4)
  %5 = getelementptr %struct.reduceDB_lt* %lt.i, i64 0, i32 0
  store %"class.Minisat::ClauseAllocator"* %lt.coerce, %"class.Minisat::ClauseAllocator"** %5, align 8
  %6 = add i32 %size, -1
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %.lr.ph5.i, label %_ZN7Minisat13selectionSortIj11reduceDB_ltEEvPT_iT0_.exit

.lr.ph5.i:                                        ; preds = %._crit_edge.i, %3
  %indvars.iv9.i = phi i64 [ %indvars.iv.next10.i, %._crit_edge.i ], [ 0, %3 ]
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %._crit_edge.i ], [ 1, %3 ]
  %indvars.iv.next10.i = add nuw nsw i64 %indvars.iv9.i, 1
  %8 = trunc i64 %indvars.iv.next10.i to i32
  %9 = icmp slt i32 %8, %size
  %10 = trunc i64 %indvars.iv9.i to i32
  br i1 %9, label %.lr.ph.i, label %._crit_edge.i

.lr.ph.i:                                         ; preds = %.lr.ph.i, %.lr.ph5.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %.lr.ph.i ], [ %indvars.iv.i, %.lr.ph5.i ]
  %best_i.02.i = phi i32 [ %j.0.best_i.0.i, %.lr.ph.i ], [ %10, %.lr.ph5.i ]
  %11 = getelementptr inbounds i32* %array, i64 %indvars.iv7.i
  %12 = load i32* %11, align 4, !tbaa !36
  %13 = sext i32 %best_i.02.i to i64
  %14 = getelementptr inbounds i32* %array, i64 %13
  %15 = load i32* %14, align 4, !tbaa !36
  %16 = call zeroext i1 @_ZN11reduceDB_ltclEjj(%struct.reduceDB_lt* %lt.i, i32 %12, i32 %15)
  %17 = trunc i64 %indvars.iv7.i to i32
  %j.0.best_i.0.i = select i1 %16, i32 %17, i32 %best_i.02.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next8.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %size
  br i1 %exitcond, label %._crit_edge.i, label %.lr.ph.i

._crit_edge.i:                                    ; preds = %.lr.ph.i, %.lr.ph5.i
  %best_i.0.lcssa.i = phi i32 [ %10, %.lr.ph5.i ], [ %j.0.best_i.0.i, %.lr.ph.i ]
  %18 = getelementptr inbounds i32* %array, i64 %indvars.iv9.i
  %19 = load i32* %18, align 4, !tbaa !36
  %20 = sext i32 %best_i.0.lcssa.i to i64
  %21 = getelementptr inbounds i32* %array, i64 %20
  %22 = load i32* %21, align 4, !tbaa !36
  store i32 %22, i32* %18, align 4, !tbaa !36
  store i32 %19, i32* %21, align 4, !tbaa !36
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond7 = icmp eq i32 %8, %6
  br i1 %exitcond7, label %_ZN7Minisat13selectionSortIj11reduceDB_ltEEvPT_iT0_.exit, label %.lr.ph5.i

; <label>:23                                      ; preds = %0
  %24 = sdiv i32 %size, 2
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32* %array, i64 %25
  %27 = load i32* %26, align 4, !tbaa !36
  br label %.outer

.outer:                                           ; preds = %41, %23
  %j.0.ph = phi i32 [ %size, %23 ], [ %39, %41 ]
  %i.0.ph = phi i64 [ -1, %23 ], [ %phitmp, %41 ]
  br label %28

; <label>:28                                      ; preds = %28, %.outer
  %indvars.iv = phi i64 [ %i.0.ph, %.outer ], [ %indvars.iv.next, %28 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds i32* %array, i64 %indvars.iv.next
  %30 = load i32* %29, align 4, !tbaa !36
  %31 = call zeroext i1 @_ZN11reduceDB_ltclEjj(%struct.reduceDB_lt* %lt, i32 %30, i32 %27)
  br i1 %31, label %28, label %.preheader

.preheader:                                       ; preds = %28
  %32 = sext i32 %j.0.ph to i64
  br label %33

; <label>:33                                      ; preds = %33, %.preheader
  %indvars.iv10 = phi i64 [ %32, %.preheader ], [ %indvars.iv.next11, %33 ]
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, -1
  %34 = getelementptr inbounds i32* %array, i64 %indvars.iv.next11
  %35 = load i32* %34, align 4, !tbaa !36
  %36 = call zeroext i1 @_ZN11reduceDB_ltclEjj(%struct.reduceDB_lt* %lt, i32 %27, i32 %35)
  br i1 %36, label %33, label %37

; <label>:37                                      ; preds = %33
  %38 = trunc i64 %indvars.iv.next to i32
  %39 = trunc i64 %indvars.iv.next11 to i32
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %44

; <label>:41                                      ; preds = %37
  %42 = load i32* %29, align 4, !tbaa !36
  %43 = load i32* %34, align 4, !tbaa !36
  store i32 %43, i32* %29, align 4, !tbaa !36
  store i32 %42, i32* %34, align 4, !tbaa !36
  %sext = shl i64 %indvars.iv.next, 32
  %phitmp = ashr exact i64 %sext, 32
  br label %.outer

; <label>:44                                      ; preds = %37
  tail call void @_ZN7Minisat4sortIj11reduceDB_ltEEvPT_iT0_(i32* %array, i32 %38, %"class.Minisat::ClauseAllocator"* %lt.coerce)
  %45 = sub nsw i32 %size, %38
  tail call void @_ZN7Minisat4sortIj11reduceDB_ltEEvPT_iT0_(i32* %29, i32 %45, %"class.Minisat::ClauseAllocator"* %lt.coerce)
  br label %_ZN7Minisat13selectionSortIj11reduceDB_ltEEvPT_iT0_.exit

_ZN7Minisat13selectionSortIj11reduceDB_ltEEvPT_iT0_.exit: ; preds = %44, %._crit_edge.i, %3
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat3vecIiE8capacityEi(%"class.Minisat::vec.6"* nocapture %this, i32 %min_cap) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::vec.6"* %this, i64 0, i32 2
  %2 = load i32* %1, align 4, !tbaa !99
  %3 = icmp slt i32 %2, %min_cap
  br i1 %3, label %4, label %35

; <label>:4                                       ; preds = %0
  %5 = add i32 %min_cap, 1
  %6 = sub i32 %5, %2
  %7 = and i32 %6, -2
  %8 = ashr i32 %2, 1
  %9 = add nsw i32 %8, 2
  %10 = and i32 %9, -2
  %11 = sub nsw i32 %10, %7
  %12 = ashr i32 %11, 31
  %13 = and i32 %12, %7
  %14 = xor i32 %12, -1
  %15 = and i32 %10, %14
  %16 = add nsw i32 %13, %15
  %17 = sub nsw i32 2147483647, %2
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %33, label %19

; <label>:19                                      ; preds = %4
  %20 = getelementptr inbounds %"class.Minisat::vec.6"* %this, i64 0, i32 0
  %21 = load i32** %20, align 8, !tbaa !97
  %22 = bitcast i32* %21 to i8*
  %23 = add nsw i32 %16, %2
  store i32 %23, i32* %1, align 4, !tbaa !99
  %24 = sext i32 %23 to i64
  %25 = shl nsw i64 %24, 2
  %26 = tail call i8* @realloc(i8* %22, i64 %25)
  %27 = bitcast i8* %26 to i32*
  store i32* %27, i32** %20, align 8, !tbaa !97
  %28 = icmp eq i8* %26, null
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %19
  %30 = tail call i32* @__error()
  %31 = load i32* %30, align 4, !tbaa !36
  %32 = icmp eq i32 %31, 12
  br i1 %32, label %33, label %35

; <label>:33                                      ; preds = %29, %4
  %34 = tail call i8* @__cxa_allocate_exception(i64 1) #2
  tail call void @__cxa_throw(i8* %34, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*), i8* null) #16
  unreachable

; <label>:35                                      ; preds = %29, %19, %0
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE5buildERNS_3vecIiEE(%"class.Minisat::Heap"* nocapture %this, %"class.Minisat::vec.6"* nocapture readonly %ns) #0 align 2 {
  %1 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 1
  %2 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 1, i32 1
  %3 = load i32* %2, align 4, !tbaa !98
  %4 = icmp sgt i32 %3, 0
  %5 = getelementptr inbounds %"class.Minisat::vec.6"* %1, i64 0, i32 0
  %6 = load i32** %5, align 8, !tbaa !97
  br i1 %4, label %.lr.ph10, label %._crit_edge11

.lr.ph10:                                         ; preds = %0
  %7 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 2, i32 0
  %8 = load i32** %7, align 8, !tbaa !97
  br label %9

; <label>:9                                       ; preds = %9, %.lr.ph10
  %indvars.iv13 = phi i64 [ 0, %.lr.ph10 ], [ %indvars.iv.next14, %9 ]
  %10 = getelementptr inbounds i32* %6, i64 %indvars.iv13
  %11 = load i32* %10, align 4, !tbaa !36
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32* %8, i64 %12
  store i32 -1, i32* %13, align 4, !tbaa !36
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %14 = load i32* %2, align 4, !tbaa !98
  %15 = trunc i64 %indvars.iv.next14 to i32
  %16 = icmp slt i32 %15, %14
  br i1 %16, label %9, label %._crit_edge11

._crit_edge11:                                    ; preds = %9, %0
  %17 = phi i32 [ %3, %0 ], [ %14, %9 ]
  %18 = getelementptr inbounds %"class.Minisat::vec.6"* %1, i64 0, i32 0
  %19 = icmp eq i32* %6, null
  br i1 %19, label %_ZN7Minisat3vecIiE5clearEb.exit.preheader, label %.preheader.i

.preheader.i:                                     ; preds = %._crit_edge11
  store i32 0, i32* %2, align 4, !tbaa !98
  br label %_ZN7Minisat3vecIiE5clearEb.exit.preheader

_ZN7Minisat3vecIiE5clearEb.exit.preheader:        ; preds = %.preheader.i, %._crit_edge11
  %20 = phi i32 [ %17, %._crit_edge11 ], [ 0, %.preheader.i ]
  %21 = getelementptr inbounds %"class.Minisat::vec.6"* %ns, i64 0, i32 1
  %22 = load i32* %21, align 4, !tbaa !98
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %.lr.ph6, label %50

.lr.ph6:                                          ; preds = %_ZN7Minisat3vecIiE5clearEb.exit.preheader
  %24 = getelementptr inbounds %"class.Minisat::vec.6"* %ns, i64 0, i32 0
  %25 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 2, i32 0
  %26 = getelementptr inbounds %"class.Minisat::Heap"* %this, i64 0, i32 1, i32 2
  br label %27

; <label>:27                                      ; preds = %_ZN7Minisat3vecIiE4pushERKi.exit, %.lr.ph6
  %28 = phi i32* [ %6, %.lr.ph6 ], [ %41, %_ZN7Minisat3vecIiE4pushERKi.exit ]
  %indvars.iv = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next, %_ZN7Minisat3vecIiE4pushERKi.exit ]
  %29 = load i32** %24, align 8, !tbaa !97
  %30 = getelementptr inbounds i32* %29, i64 %indvars.iv
  %31 = load i32* %30, align 4, !tbaa !36
  %32 = sext i32 %31 to i64
  %33 = load i32** %25, align 8, !tbaa !97
  %34 = getelementptr inbounds i32* %33, i64 %32
  %35 = trunc i64 %indvars.iv to i32
  store i32 %35, i32* %34, align 4, !tbaa !36
  %36 = load i32* %2, align 4, !tbaa !98
  %37 = load i32* %26, align 4, !tbaa !99
  %38 = icmp eq i32 %36, %37
  br i1 %38, label %39, label %_ZN7Minisat3vecIiE4pushERKi.exit

; <label>:39                                      ; preds = %27
  %40 = add nsw i32 %36, 1
  tail call void @_ZN7Minisat3vecIiE8capacityEi(%"class.Minisat::vec.6"* %1, i32 %40)
  %.pre.i = load i32* %2, align 4, !tbaa !98
  %.pre17 = load i32** %18, align 8, !tbaa !97
  br label %_ZN7Minisat3vecIiE4pushERKi.exit

_ZN7Minisat3vecIiE4pushERKi.exit:                 ; preds = %39, %27
  %41 = phi i32* [ %.pre17, %39 ], [ %28, %27 ]
  %42 = phi i32 [ %.pre.i, %39 ], [ %36, %27 ]
  %43 = load i32* %30, align 4, !tbaa !36
  %44 = add nsw i32 %42, 1
  store i32 %44, i32* %2, align 4, !tbaa !98
  %45 = sext i32 %42 to i64
  %46 = getelementptr inbounds i32* %41, i64 %45
  store i32 %43, i32* %46, align 4, !tbaa !36
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %47 = load i32* %21, align 4, !tbaa !98
  %48 = trunc i64 %indvars.iv.next to i32
  %49 = icmp slt i32 %48, %47
  br i1 %49, label %27, label %_ZN7Minisat3vecIiE5clearEb.exit._crit_edge

_ZN7Minisat3vecIiE5clearEb.exit._crit_edge:       ; preds = %_ZN7Minisat3vecIiE4pushERKi.exit
  %.pre16 = load i32* %2, align 4, !tbaa !98
  br label %50

; <label>:50                                      ; preds = %_ZN7Minisat3vecIiE5clearEb.exit._crit_edge, %_ZN7Minisat3vecIiE5clearEb.exit.preheader
  %51 = phi i32 [ %.pre16, %_ZN7Minisat3vecIiE5clearEb.exit._crit_edge ], [ %20, %_ZN7Minisat3vecIiE5clearEb.exit.preheader ]
  %52 = icmp sgt i32 %51, 1
  br i1 %52, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %50
  %53 = sdiv i32 %51, 2
  br label %54

; <label>:54                                      ; preds = %54, %.lr.ph
  %i2.04.in = phi i32 [ %53, %.lr.ph ], [ %i2.04, %54 ]
  %i2.04 = add nsw i32 %i2.04.in, -1
  tail call void @_ZN7Minisat4HeapINS_6Solver10VarOrderLtEE13percolateDownEi(%"class.Minisat::Heap"* %this, i32 %i2.04)
  %55 = icmp sgt i32 %i2.04, 0
  br i1 %55, label %54, label %._crit_edge

._crit_edge:                                      ; preds = %54, %50
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN7Minisat15ClauseAllocator5relocERjRS0_(%"class.Minisat::ClauseAllocator"* nocapture readonly %this, i32* nocapture %cr, %"class.Minisat::ClauseAllocator"* nocapture %to) #0 align 2 {
  %1 = load i32* %cr, align 4, !tbaa !36
  %2 = getelementptr inbounds %"class.Minisat::ClauseAllocator"* %this, i64 0, i32 0, i64 8
  %3 = bitcast i8* %2 to i32*
  %4 = load i32* %3, align 4, !tbaa !128
  %phitmp.i.i = icmp ugt i32 %4, %1
  br i1 %phitmp.i.i, label %_ZN7Minisat15ClauseAllocatorixEj.exit, label %5, !prof !122

; <label>:5                                       ; preds = %0
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit:            ; preds = %0
  %6 = zext i32 %1 to i64
  %7 = bitcast %"class.Minisat::ClauseAllocator"* %this to i32**
  %8 = load i32** %7, align 8, !tbaa !119
  %9 = getelementptr inbounds i32* %8, i64 %6
  %10 = bitcast i32* %9 to %"class.Minisat::Clause"*
  %11 = load i32* %9, align 4
  %12 = and i32 %11, 16
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %17, label %14

; <label>:14                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit
  %.sum14 = add i64 %6, 1
  %15 = getelementptr inbounds i32* %8, i64 %.sum14
  %16 = load i32* %15, align 4, !tbaa !36
  store i32 %16, i32* %cr, align 4, !tbaa !36
  br label %93

; <label>:17                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit
  %18 = and i32 %11, 4
  %19 = icmp ne i32 %18, 0
  %20 = tail call i32 @_ZN7Minisat15ClauseAllocator5allocINS_6ClauseEEEjRKT_b(%"class.Minisat::ClauseAllocator"* %to, %"class.Minisat::Clause"* %10, i1 zeroext %19)
  store i32 %20, i32* %cr, align 4, !tbaa !36
  %21 = load i32* %9, align 4
  %22 = or i32 %21, 16
  store i32 %22, i32* %9, align 4
  %.sum = add i64 %6, 1
  %23 = getelementptr inbounds i32* %8, i64 %.sum
  store i32 %20, i32* %23, align 4, !tbaa !36
  %24 = load i32* %cr, align 4, !tbaa !36
  %25 = getelementptr inbounds %"class.Minisat::ClauseAllocator"* %to, i64 0, i32 0, i64 8
  %26 = bitcast i8* %25 to i32*
  %27 = load i32* %26, align 4, !tbaa !128
  %phitmp.i.i6 = icmp ugt i32 %27, %24
  br i1 %phitmp.i.i6, label %_ZN7Minisat15ClauseAllocatorixEj.exit7, label %28, !prof !122

; <label>:28                                      ; preds = %17
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit7:           ; preds = %17
  %29 = zext i32 %24 to i64
  %30 = bitcast %"class.Minisat::ClauseAllocator"* %to to i32**
  %31 = load i32** %30, align 8, !tbaa !119
  %32 = getelementptr inbounds i32* %31, i64 %29
  %33 = and i32 %21, 3
  %34 = load i32* %32, align 4
  %35 = and i32 %34, -4
  %36 = or i32 %35, %33
  store i32 %36, i32* %32, align 4
  %37 = load i32* %cr, align 4, !tbaa !36
  %38 = load i32* %26, align 4, !tbaa !128
  %phitmp.i.i12 = icmp ugt i32 %38, %37
  br i1 %phitmp.i.i12, label %_ZN7Minisat15ClauseAllocatorixEj.exit13, label %39, !prof !122

; <label>:39                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit7
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit13:          ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit7
  %40 = zext i32 %37 to i64
  %41 = load i32** %30, align 8, !tbaa !119
  %42 = getelementptr inbounds i32* %41, i64 %40
  %43 = bitcast i32* %42 to %"class.Minisat::Clause"*
  %44 = load i32* %42, align 4
  %45 = and i32 %44, 4
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %_ZN7Minisat15ClauseAllocatorixEj.exit4, label %47

; <label>:47                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit13
  %48 = load i32* %9, align 4
  %.lobit.i10 = and i32 %48, 8
  %49 = icmp eq i32 %.lobit.i10, 0
  br i1 %49, label %50, label %_ZN7Minisat15ClauseAllocatorixEj.exit9, !prof !123

; <label>:50                                      ; preds = %47
  tail call void @__assert_rtn(i8* getelementptr inbounds ([9 x i8]* @__func__._ZN7Minisat6Clause8activityEv, i64 0, i64 0), i8* getelementptr inbounds ([54 x i8]* @.str68, i64 0, i64 0), i32 181, i8* getelementptr inbounds ([17 x i8]* @.str69, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit9:           ; preds = %47
  %.lobit.i5 = and i32 %44, 8
  %51 = icmp eq i32 %.lobit.i5, 0
  br i1 %51, label %52, label %_ZN7Minisat6Clause8activityEv.exit, !prof !123

; <label>:52                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit9
  tail call void @__assert_rtn(i8* getelementptr inbounds ([9 x i8]* @__func__._ZN7Minisat6Clause8activityEv, i64 0, i64 0), i8* getelementptr inbounds ([54 x i8]* @.str68, i64 0, i64 0), i32 181, i8* getelementptr inbounds ([17 x i8]* @.str69, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat6Clause8activityEv.exit:               ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit9
  %53 = lshr i32 %48, 5
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds %"class.Minisat::Clause"* %10, i64 0, i32 1, i64 %54
  %56 = bitcast %union.anon* %55 to float*
  %57 = load float* %56, align 4, !tbaa !136
  %58 = lshr i32 %44, 5
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds %"class.Minisat::Clause"* %43, i64 0, i32 1, i64 %59
  %61 = bitcast %union.anon* %60 to float*
  store float %57, float* %61, align 4, !tbaa !136
  br label %93

_ZN7Minisat15ClauseAllocatorixEj.exit4:           ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit13
  %62 = and i32 %44, 8
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %93, label %.preheader.i

.preheader.i:                                     ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit4
  %64 = lshr i32 %44, 5
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %_ZN7Minisat6Clause15calcAbstractionEv.exit, label %.lr.ph.i.preheader

.lr.ph.i.preheader:                               ; preds = %.preheader.i
  %66 = lshr i32 %44, 5
  %67 = icmp ugt i32 %44, 63
  %.op = add i32 %66, -1
  %68 = zext i32 %.op to i64
  %.op24 = add i64 %68, 1
  %69 = select i1 %67, i64 %.op24, i64 1
  %n.vec = and i64 %69, -8
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %.lr.ph.i.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph.i.preheader ]
  %vec.phi = phi <4 x i32> [ %80, %vector.body ], [ zeroinitializer, %.lr.ph.i.preheader ]
  %vec.phi16 = phi <4 x i32> [ %81, %vector.body ], [ zeroinitializer, %.lr.ph.i.preheader ]
  %70 = getelementptr inbounds %"class.Minisat::Clause"* %43, i64 0, i32 1, i64 %index, i32 0, i32 0
  %71 = bitcast i32* %70 to <4 x i32>*
  %wide.load = load <4 x i32>* %71, align 4
  %72 = getelementptr i32* %70, i64 4
  %73 = bitcast i32* %72 to <4 x i32>*
  %wide.load17 = load <4 x i32>* %73, align 4
  %74 = lshr <4 x i32> %wide.load, <i32 1, i32 1, i32 1, i32 1>
  %75 = lshr <4 x i32> %wide.load17, <i32 1, i32 1, i32 1, i32 1>
  %76 = and <4 x i32> %74, <i32 31, i32 31, i32 31, i32 31>
  %77 = and <4 x i32> %75, <i32 31, i32 31, i32 31, i32 31>
  %78 = shl <4 x i32> <i32 1, i32 1, i32 1, i32 1>, %76
  %79 = shl <4 x i32> <i32 1, i32 1, i32 1, i32 1>, %77
  %80 = or <4 x i32> %78, %vec.phi
  %81 = or <4 x i32> %79, %vec.phi16
  %index.next = add i64 %index, 8
  %82 = icmp eq i64 %index.next, %n.vec
  br i1 %82, label %middle.block, label %vector.body, !llvm.loop !153

middle.block:                                     ; preds = %vector.body, %.lr.ph.i.preheader
  %resume.val = phi i64 [ 0, %.lr.ph.i.preheader ], [ %n.vec, %vector.body ]
  %rdx.vec.exit.phi = phi <4 x i32> [ zeroinitializer, %.lr.ph.i.preheader ], [ %80, %vector.body ]
  %rdx.vec.exit.phi20 = phi <4 x i32> [ zeroinitializer, %.lr.ph.i.preheader ], [ %81, %vector.body ]
  %bin.rdx = or <4 x i32> %rdx.vec.exit.phi20, %rdx.vec.exit.phi
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx21 = or <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf22 = shufflevector <4 x i32> %bin.rdx21, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx23 = or <4 x i32> %bin.rdx21, %rdx.shuf22
  %83 = extractelement <4 x i32> %bin.rdx23, i32 0
  %cmp.n = icmp eq i64 %69, %resume.val
  br i1 %cmp.n, label %._crit_edge.i, label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i, %middle.block
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.lr.ph.i ], [ %resume.val, %middle.block ]
  %abstraction.02.i = phi i32 [ %89, %.lr.ph.i ], [ %83, %middle.block ]
  %84 = getelementptr inbounds %"class.Minisat::Clause"* %43, i64 0, i32 1, i64 %indvars.iv.i, i32 0, i32 0
  %85 = load i32* %84, align 4
  %86 = lshr i32 %85, 1
  %87 = and i32 %86, 31
  %88 = shl i32 1, %87
  %89 = or i32 %88, %abstraction.02.i
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %90 = trunc i64 %indvars.iv.next.i to i32
  %91 = icmp slt i32 %90, %64
  br i1 %91, label %.lr.ph.i, label %._crit_edge.i, !llvm.loop !154

._crit_edge.i:                                    ; preds = %.lr.ph.i, %middle.block
  %.lcssa = phi i32 [ %89, %.lr.ph.i ], [ %83, %middle.block ]
  %phitmp.i = zext i32 %64 to i64
  br label %_ZN7Minisat6Clause15calcAbstractionEv.exit

_ZN7Minisat6Clause15calcAbstractionEv.exit:       ; preds = %._crit_edge.i, %.preheader.i
  %.lcssa.i = phi i64 [ %phitmp.i, %._crit_edge.i ], [ 0, %.preheader.i ]
  %abstraction.0.lcssa.i = phi i32 [ %.lcssa, %._crit_edge.i ], [ 0, %.preheader.i ]
  %92 = getelementptr inbounds %"class.Minisat::Clause"* %43, i64 0, i32 1, i64 %.lcssa.i, i32 0, i32 0
  store i32 %abstraction.0.lcssa.i, i32* %92, align 4, !tbaa !36
  br label %93

; <label>:93                                      ; preds = %_ZN7Minisat6Clause15calcAbstractionEv.exit, %_ZN7Minisat15ClauseAllocatorixEj.exit4, %_ZN7Minisat6Clause8activityEv.exit, %14
  ret void
}

; Function Attrs: inlinehint nounwind readnone ssp uwtable
define linkonce_odr void @_ZN7Minisat10BoolOptionD1Ev(%"class.Minisat::BoolOption"* nocapture %this) unnamed_addr #8 align 2 {
  ret void
}

; Function Attrs: inlinehint nounwind ssp uwtable
define linkonce_odr void @_ZN7Minisat10BoolOptionD0Ev(%"class.Minisat::BoolOption"* %this) unnamed_addr #10 align 2 {
  %1 = bitcast %"class.Minisat::BoolOption"* %this to i8*
  tail call void @_ZdlPv(i8* %1) #18
  ret void
}

; Function Attrs: nounwind ssp uwtable
define linkonce_odr zeroext i1 @_ZN7Minisat10BoolOption5parseEPKc(%"class.Minisat::BoolOption"* nocapture %this, i8* %str) unnamed_addr #6 align 2 {
.lr.ph.i:
  %0 = load i8* %str, align 1, !tbaa !59
  %1 = icmp eq i8 %0, 45
  br i1 %1, label %.lr.ph.i3.preheader, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit

.lr.ph.i3.preheader:                              ; preds = %.lr.ph.i
  %2 = getelementptr inbounds i8* %str, i64 1
  br label %.lr.ph.i3

; <label>:3                                       ; preds = %.lr.ph.i3
  %4 = getelementptr inbounds [4 x i8]* @.str82, i64 0, i64 %indvars.iv.next.i2
  %5 = load i8* %4, align 1, !tbaa !59
  %6 = icmp eq i64 %indvars.iv.next.i2, 3
  %.sum = add i64 %indvars.iv.i1, 2
  %7 = getelementptr inbounds i8* %str, i64 %.sum
  br i1 %6, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit6, label %.lr.ph.i3

.lr.ph.i3:                                        ; preds = %3, %.lr.ph.i3.preheader
  %indvars.iv.i1 = phi i64 [ %indvars.iv.next.i2, %3 ], [ 0, %.lr.ph.i3.preheader ]
  %8 = phi i8* [ %7, %3 ], [ %2, %.lr.ph.i3.preheader ]
  %9 = phi i8 [ %5, %3 ], [ 110, %.lr.ph.i3.preheader ]
  %10 = load i8* %8, align 1, !tbaa !59
  %11 = icmp eq i8 %10, %9
  %indvars.iv.next.i2 = add nuw nsw i64 %indvars.iv.i1, 1
  br i1 %11, label %3, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit6

_ZN7MinisatL5matchIPKcEEbRT_S2_.exit6:            ; preds = %.lr.ph.i3, %3
  %str7 = phi i8* [ %2, %.lr.ph.i3 ], [ %7, %3 ]
  %.0.i5 = phi i8 [ 1, %.lr.ph.i3 ], [ 0, %3 ]
  %12 = getelementptr inbounds %"class.Minisat::BoolOption"* %this, i64 0, i32 0, i32 1
  %13 = load i8** %12, align 8, !tbaa !39
  %14 = tail call i32 @strcmp(i8* %str7, i8* %13)
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit

; <label>:16                                      ; preds = %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit6
  %17 = getelementptr inbounds %"class.Minisat::BoolOption"* %this, i64 0, i32 1
  store i8 %.0.i5, i8* %17, align 1, !tbaa !155
  br label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit

_ZN7MinisatL5matchIPKcEEbRT_S2_.exit:             ; preds = %16, %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit6, %.lr.ph.i
  %.0 = phi i1 [ true, %16 ], [ false, %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit6 ], [ false, %.lr.ph.i ]
  ret i1 %.0
}

; Function Attrs: nounwind ssp uwtable
define linkonce_odr void @_ZN7Minisat10BoolOption4helpEb(%"class.Minisat::BoolOption"* nocapture readonly %this, i1 zeroext %verbose) unnamed_addr #6 align 2 {
  %1 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %2 = getelementptr inbounds %"class.Minisat::BoolOption"* %this, i64 0, i32 0, i32 1
  %3 = load i8** %2, align 8, !tbaa !39
  %4 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([14 x i8]* @.str75, i64 0, i64 0), i8* %3, i8* %3)
  br label %5

; <label>:5                                       ; preds = %5, %0
  %i.0 = phi i32 [ 0, %0 ], [ %13, %5 ]
  %6 = zext i32 %i.0 to i64
  %7 = load i8** %2, align 8, !tbaa !39
  %8 = tail call i64 @strlen(i8* %7)
  %9 = shl i64 %8, 1
  %10 = sub i64 32, %9
  %11 = icmp ult i64 %6, %10
  %12 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %fputc = tail call i32 @fputc(i32 32, %struct.__sFILE* %12)
  %13 = add i32 %i.0, 1
  br i1 %11, label %5, label %14

; <label>:14                                      ; preds = %5
  %15 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %16 = getelementptr inbounds %"class.Minisat::BoolOption"* %this, i64 0, i32 1
  %17 = load i8* %16, align 1, !tbaa !155, !range !78
  %18 = icmp ne i8 %17, 0
  %19 = select i1 %18, i8* getelementptr inbounds ([3 x i8]* @.str78, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str79, i64 0, i64 0)
  %20 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %15, i8* getelementptr inbounds ([15 x i8]* @.str77, i64 0, i64 0), i8* %19)
  br i1 %verbose, label %21, label %27

; <label>:21                                      ; preds = %14
  %22 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %23 = getelementptr inbounds %"class.Minisat::BoolOption"* %this, i64 0, i32 0, i32 2
  %24 = load i8** %23, align 8, !tbaa !41
  %25 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %22, i8* getelementptr inbounds ([13 x i8]* @.str80, i64 0, i64 0), i8* %24)
  %26 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %fputc3 = tail call i32 @fputc(i32 10, %struct.__sFILE* %26)
  br label %27

; <label>:27                                      ; preds = %21, %14
  ret void
}

; Function Attrs: inlinehint nounwind readnone ssp uwtable
define linkonce_odr void @_ZN7Minisat12DoubleOptionD1Ev(%"class.Minisat::DoubleOption"* nocapture %this) unnamed_addr #8 align 2 {
  ret void
}

; Function Attrs: inlinehint nounwind ssp uwtable
define linkonce_odr void @_ZN7Minisat12DoubleOptionD0Ev(%"class.Minisat::DoubleOption"* %this) unnamed_addr #10 align 2 {
  %1 = bitcast %"class.Minisat::DoubleOption"* %this to i8*
  tail call void @_ZdlPv(i8* %1) #18
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr zeroext i1 @_ZN7Minisat12DoubleOption5parseEPKc(%"class.Minisat::DoubleOption"* nocapture %this, i8* %str) unnamed_addr #0 align 2 {
.lr.ph.i:
  %end = alloca i8*, align 8
  %0 = load i8* %str, align 1, !tbaa !59
  %1 = icmp eq i8 %0, 45
  br i1 %1, label %2, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit

; <label>:2                                       ; preds = %.lr.ph.i
  %3 = getelementptr inbounds i8* %str, i64 1
  %4 = getelementptr inbounds %"class.Minisat::DoubleOption"* %this, i64 0, i32 0, i32 1
  %5 = load i8** %4, align 8, !tbaa !39
  %6 = load i8* %5, align 1, !tbaa !59
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %.lr.ph.i4, label %.lr.ph.i10

; <label>:8                                       ; preds = %.lr.ph.i10
  %9 = getelementptr inbounds i8* %5, i64 %indvars.iv.next.i9
  %10 = load i8* %9, align 1, !tbaa !59
  %11 = icmp eq i8 %10, 0
  %.sum = add i64 %indvars.iv.i8, 2
  %12 = getelementptr inbounds i8* %str, i64 %.sum
  br i1 %11, label %.lr.ph.i4, label %.lr.ph.i10

.lr.ph.i10:                                       ; preds = %8, %2
  %indvars.iv.i8 = phi i64 [ %indvars.iv.next.i9, %8 ], [ 0, %2 ]
  %13 = phi i8* [ %12, %8 ], [ %3, %2 ]
  %14 = phi i8 [ %10, %8 ], [ %6, %2 ]
  %15 = load i8* %13, align 1, !tbaa !59
  %16 = icmp eq i8 %15, %14
  %indvars.iv.next.i9 = add nuw nsw i64 %indvars.iv.i8, 1
  br i1 %16, label %8, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit

.lr.ph.i4:                                        ; preds = %8, %2
  %str15.ph = phi i8* [ %3, %2 ], [ %12, %8 ]
  %17 = load i8* %str15.ph, align 1, !tbaa !59
  %18 = icmp eq i8 %17, 61
  br i1 %18, label %19, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit

; <label>:19                                      ; preds = %.lr.ph.i4
  %20 = getelementptr inbounds i8* %str15.ph, i64 1
  %21 = call double @"\01_strtod"(i8* %20, i8** %end)
  %22 = load i8** %end, align 8, !tbaa !47
  %23 = icmp eq i8* %22, null
  br i1 %23, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit, label %24

; <label>:24                                      ; preds = %19
  %25 = getelementptr inbounds %"class.Minisat::DoubleOption"* %this, i64 0, i32 1, i32 1
  %26 = load double* %25, align 8, !tbaa !157
  %27 = fcmp ult double %21, %26
  br i1 %27, label %37, label %28

; <label>:28                                      ; preds = %24
  %29 = getelementptr inbounds %"class.Minisat::DoubleOption"* %this, i64 0, i32 1, i32 3
  %30 = load i8* %29, align 1, !tbaa !160, !range !78
  %31 = icmp eq i8 %30, 0
  %32 = fcmp une double %21, %26
  %or.cond = or i1 %31, %32
  br i1 %or.cond, label %33, label %37

; <label>:33                                      ; preds = %28
  %34 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %35 = load i8** %4, align 8, !tbaa !39
  %36 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %34, i8* getelementptr inbounds ([49 x i8]* @.str91, i64 0, i64 0), i8* %20, i8* %35)
  call void @exit(i32 1) #16
  unreachable

; <label>:37                                      ; preds = %28, %24
  %38 = getelementptr inbounds %"class.Minisat::DoubleOption"* %this, i64 0, i32 1, i32 0
  %39 = load double* %38, align 8, !tbaa !161
  %40 = fcmp ugt double %21, %39
  br i1 %40, label %50, label %41

; <label>:41                                      ; preds = %37
  %42 = getelementptr inbounds %"class.Minisat::DoubleOption"* %this, i64 0, i32 1, i32 2
  %43 = load i8* %42, align 1, !tbaa !162, !range !78
  %44 = icmp eq i8 %43, 0
  %45 = fcmp une double %21, %39
  %or.cond1 = or i1 %44, %45
  br i1 %or.cond1, label %46, label %50

; <label>:46                                      ; preds = %41
  %47 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %48 = load i8** %4, align 8, !tbaa !39
  %49 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %47, i8* getelementptr inbounds ([49 x i8]* @.str92, i64 0, i64 0), i8* %20, i8* %48)
  call void @exit(i32 1) #16
  unreachable

; <label>:50                                      ; preds = %41, %37
  %51 = getelementptr inbounds %"class.Minisat::DoubleOption"* %this, i64 0, i32 2
  store double %21, double* %51, align 8, !tbaa !163
  br label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit

_ZN7MinisatL5matchIPKcEEbRT_S2_.exit:             ; preds = %50, %19, %.lr.ph.i4, %.lr.ph.i10, %.lr.ph.i
  %.0 = phi i1 [ true, %50 ], [ false, %19 ], [ false, %.lr.ph.i4 ], [ false, %.lr.ph.i ], [ false, %.lr.ph.i10 ]
  ret i1 %.0
}

; Function Attrs: nounwind ssp uwtable
define linkonce_odr void @_ZN7Minisat12DoubleOption4helpEb(%"class.Minisat::DoubleOption"* nocapture readonly %this, i1 zeroext %verbose) unnamed_addr #6 align 2 {
  %1 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %2 = getelementptr inbounds %"class.Minisat::DoubleOption"* %this, i64 0, i32 0, i32 1
  %3 = load i8** %2, align 8, !tbaa !39
  %4 = getelementptr inbounds %"class.Minisat::DoubleOption"* %this, i64 0, i32 0, i32 4
  %5 = load i8** %4, align 8, !tbaa !43
  %6 = getelementptr inbounds %"class.Minisat::DoubleOption"* %this, i64 0, i32 1, i32 2
  %7 = load i8* %6, align 1, !tbaa !162, !range !78
  %8 = icmp ne i8 %7, 0
  %9 = select i1 %8, i32 91, i32 40
  %10 = getelementptr inbounds %"class.Minisat::DoubleOption"* %this, i64 0, i32 1, i32 0
  %11 = load double* %10, align 8, !tbaa !161
  %12 = getelementptr inbounds %"class.Minisat::DoubleOption"* %this, i64 0, i32 1, i32 1
  %13 = load double* %12, align 8, !tbaa !157
  %14 = getelementptr inbounds %"class.Minisat::DoubleOption"* %this, i64 0, i32 1, i32 3
  %15 = load i8* %14, align 1, !tbaa !160, !range !78
  %16 = icmp ne i8 %15, 0
  %17 = select i1 %16, i32 93, i32 41
  %18 = getelementptr inbounds %"class.Minisat::DoubleOption"* %this, i64 0, i32 2
  %19 = load double* %18, align 8, !tbaa !163
  %20 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([50 x i8]* @.str94, i64 0, i64 0), i8* %3, i8* %5, i32 %9, double %11, double %13, i32 %17, double %19)
  br i1 %verbose, label %21, label %27

; <label>:21                                      ; preds = %0
  %22 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %23 = getelementptr inbounds %"class.Minisat::DoubleOption"* %this, i64 0, i32 0, i32 2
  %24 = load i8** %23, align 8, !tbaa !41
  %25 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %22, i8* getelementptr inbounds ([13 x i8]* @.str80, i64 0, i64 0), i8* %24)
  %26 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %fputc = tail call i32 @fputc(i32 10, %struct.__sFILE* %26)
  br label %27

; <label>:27                                      ; preds = %21, %0
  ret void
}

; Function Attrs: ssp
define internal void @_GLOBAL__I_a() #15 section "__TEXT,__StaticInit,regular,pure_instructions" {
  %r1.i.sroa.7.i = alloca [6 x i8], align 2
  %.sroa.5.i = alloca [6 x i8], align 2
  %1 = getelementptr inbounds [6 x i8]* %.sroa.5.i, i64 0, i64 0
  call void @llvm.lifetime.start(i64 6, i8* %1)
  %2 = getelementptr inbounds [6 x i8]* %r1.i.sroa.7.i, i64 0, i64 0
  call void @llvm.lifetime.start(i64 6, i8* %2)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %1, i64 6, i32 2, i1 false)
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat6OptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL13opt_var_decay, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i8* getelementptr inbounds ([10 x i8]* @.str15, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL13opt_var_decay, i64 0, i32 0, i32 1), align 8, !tbaa !39
  store i8* getelementptr inbounds ([35 x i8]* @.str116, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL13opt_var_decay, i64 0, i32 0, i32 2), align 8, !tbaa !41
  store i8* getelementptr inbounds ([5 x i8]* @.str95, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL13opt_var_decay, i64 0, i32 0, i32 3), align 8, !tbaa !42
  store i8* getelementptr inbounds ([9 x i8]* @.str93, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL13opt_var_decay, i64 0, i32 0, i32 4), align 8, !tbaa !43
  %3 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %5, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i

; <label>:5                                       ; preds = %0
  %6 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i, label %8

; <label>:8                                       ; preds = %5
  call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %9 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i

_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i: ; preds = %8, %5, %0
  %10 = load i64* bitcast (i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1) to i64*), align 8
  %11 = trunc i64 %10 to i32
  %12 = lshr i64 %10, 32
  %13 = trunc i64 %12 to i32
  %14 = icmp eq i32 %11, %13
  br i1 %14, label %15, label %__cxx_global_var_init.exit

; <label>:15                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i
  %16 = add nsw i32 %11, 1
  call void @_ZN7Minisat3vecIPNS_6OptionEE8capacityEi(%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i32 %16)
  %.pre.i.i.i.i.i = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  br label %__cxx_global_var_init.exit

__cxx_global_var_init.exit:                       ; preds = %15, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i
  %17 = phi i32 [ %.pre.i.i.i.i.i, %15 ], [ %11, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i ]
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %19 = sext i32 %17 to i64
  %20 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %21 = getelementptr inbounds %"class.Minisat::Option"** %20, i64 %19
  store %"class.Minisat::Option"* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL13opt_var_decay, i64 0, i32 0), %"class.Minisat::Option"** %21, align 8, !tbaa !47
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat12DoubleOptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL13opt_var_decay, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store double 0.000000e+00, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL13opt_var_decay, i64 0, i32 1, i32 0), align 8
  store double 1.000000e+00, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL13opt_var_decay, i64 0, i32 1, i32 1), align 8
  store i8 0, i8* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL13opt_var_decay, i64 0, i32 1, i32 2), align 8
  store i8 0, i8* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL13opt_var_decay, i64 0, i32 1, i32 3), align 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr (i8* bitcast (%"class.Minisat::DoubleOption"* @_ZL13opt_var_decay to i8*), i64 58), i8* %2, i64 6, i32 2, i1 false)
  store double 9.500000e-01, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL13opt_var_decay, i64 0, i32 2), align 8, !tbaa !163
  call void @llvm.lifetime.end(i64 6, i8* %2)
  call void @llvm.lifetime.end(i64 6, i8* %1)
  call void @llvm.lifetime.start(i64 6, i8* %1)
  call void @llvm.lifetime.start(i64 6, i8* %2)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %1, i64 6, i32 2, i1 false)
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat6OptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_clause_decay, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i8* getelementptr inbounds ([10 x i8]* @.str317, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_clause_decay, i64 0, i32 0, i32 1), align 8, !tbaa !39
  store i8* getelementptr inbounds ([33 x i8]* @.str418, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_clause_decay, i64 0, i32 0, i32 2), align 8, !tbaa !41
  store i8* getelementptr inbounds ([5 x i8]* @.str95, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_clause_decay, i64 0, i32 0, i32 3), align 8, !tbaa !42
  store i8* getelementptr inbounds ([9 x i8]* @.str93, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_clause_decay, i64 0, i32 0, i32 4), align 8, !tbaa !43
  %22 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %24, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i3

; <label>:24                                      ; preds = %__cxx_global_var_init.exit
  %25 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i3, label %27

; <label>:27                                      ; preds = %24
  call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %28 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i3

_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i3: ; preds = %27, %24, %__cxx_global_var_init.exit
  %29 = load i64* bitcast (i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1) to i64*), align 8
  %30 = trunc i64 %29 to i32
  %31 = lshr i64 %29, 32
  %32 = trunc i64 %31 to i32
  %33 = icmp eq i32 %30, %32
  br i1 %33, label %34, label %__cxx_global_var_init2.exit

; <label>:34                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i3
  %35 = add nsw i32 %30, 1
  call void @_ZN7Minisat3vecIPNS_6OptionEE8capacityEi(%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i32 %35)
  %.pre.i.i.i.i.i4 = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  br label %__cxx_global_var_init2.exit

__cxx_global_var_init2.exit:                      ; preds = %34, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i3
  %36 = phi i32 [ %.pre.i.i.i.i.i4, %34 ], [ %30, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i3 ]
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %38 = sext i32 %36 to i64
  %39 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %40 = getelementptr inbounds %"class.Minisat::Option"** %39, i64 %38
  store %"class.Minisat::Option"* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_clause_decay, i64 0, i32 0), %"class.Minisat::Option"** %40, align 8, !tbaa !47
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat12DoubleOptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_clause_decay, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store double 0.000000e+00, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_clause_decay, i64 0, i32 1, i32 0), align 8
  store double 1.000000e+00, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_clause_decay, i64 0, i32 1, i32 1), align 8
  store i8 0, i8* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_clause_decay, i64 0, i32 1, i32 2), align 8
  store i8 0, i8* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_clause_decay, i64 0, i32 1, i32 3), align 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr (i8* bitcast (%"class.Minisat::DoubleOption"* @_ZL16opt_clause_decay to i8*), i64 58), i8* %2, i64 6, i32 2, i1 false)
  store double 9.990000e-01, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_clause_decay, i64 0, i32 2), align 8, !tbaa !163
  call void @llvm.lifetime.end(i64 6, i8* %2)
  call void @llvm.lifetime.end(i64 6, i8* %1)
  call void @llvm.lifetime.start(i64 6, i8* %1)
  call void @llvm.lifetime.start(i64 6, i8* %2)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %1, i64 6, i32 2, i1 false)
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat6OptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL19opt_random_var_freq, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i8* getelementptr inbounds ([9 x i8]* @.str619, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL19opt_random_var_freq, i64 0, i32 0, i32 1), align 8, !tbaa !39
  store i8* getelementptr inbounds ([82 x i8]* @.str720, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL19opt_random_var_freq, i64 0, i32 0, i32 2), align 8, !tbaa !41
  store i8* getelementptr inbounds ([5 x i8]* @.str95, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL19opt_random_var_freq, i64 0, i32 0, i32 3), align 8, !tbaa !42
  store i8* getelementptr inbounds ([9 x i8]* @.str93, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL19opt_random_var_freq, i64 0, i32 0, i32 4), align 8, !tbaa !43
  %41 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %42 = icmp eq i8 %41, 0
  br i1 %42, label %43, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i7

; <label>:43                                      ; preds = %__cxx_global_var_init2.exit
  %44 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i7, label %46

; <label>:46                                      ; preds = %43
  call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %47 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i7

_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i7: ; preds = %46, %43, %__cxx_global_var_init2.exit
  %48 = load i64* bitcast (i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1) to i64*), align 8
  %49 = trunc i64 %48 to i32
  %50 = lshr i64 %48, 32
  %51 = trunc i64 %50 to i32
  %52 = icmp eq i32 %49, %51
  br i1 %52, label %53, label %__cxx_global_var_init5.exit

; <label>:53                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i7
  %54 = add nsw i32 %49, 1
  call void @_ZN7Minisat3vecIPNS_6OptionEE8capacityEi(%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i32 %54)
  %.pre.i.i.i.i.i8 = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  br label %__cxx_global_var_init5.exit

__cxx_global_var_init5.exit:                      ; preds = %53, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i7
  %55 = phi i32 [ %.pre.i.i.i.i.i8, %53 ], [ %49, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i7 ]
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %57 = sext i32 %55 to i64
  %58 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %59 = getelementptr inbounds %"class.Minisat::Option"** %58, i64 %57
  store %"class.Minisat::Option"* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL19opt_random_var_freq, i64 0, i32 0), %"class.Minisat::Option"** %59, align 8, !tbaa !47
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat12DoubleOptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL19opt_random_var_freq, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store double 0.000000e+00, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL19opt_random_var_freq, i64 0, i32 1, i32 0), align 8
  store double 1.000000e+00, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL19opt_random_var_freq, i64 0, i32 1, i32 1), align 8
  store i8 1, i8* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL19opt_random_var_freq, i64 0, i32 1, i32 2), align 8
  store i8 1, i8* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL19opt_random_var_freq, i64 0, i32 1, i32 3), align 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr (i8* bitcast (%"class.Minisat::DoubleOption"* @_ZL19opt_random_var_freq to i8*), i64 58), i8* %2, i64 6, i32 2, i1 false)
  store double 0.000000e+00, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL19opt_random_var_freq, i64 0, i32 2), align 8, !tbaa !163
  call void @llvm.lifetime.end(i64 6, i8* %2)
  call void @llvm.lifetime.end(i64 6, i8* %1)
  call void @llvm.lifetime.start(i64 6, i8* %1)
  call void @llvm.lifetime.start(i64 6, i8* %2)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %1, i64 6, i32 2, i1 false)
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat6OptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_random_seed, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i8* getelementptr inbounds ([9 x i8]* @.str921, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_random_seed, i64 0, i32 0, i32 1), align 8, !tbaa !39
  store i8* getelementptr inbounds ([38 x i8]* @.str1022, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_random_seed, i64 0, i32 0, i32 2), align 8, !tbaa !41
  store i8* getelementptr inbounds ([5 x i8]* @.str95, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_random_seed, i64 0, i32 0, i32 3), align 8, !tbaa !42
  store i8* getelementptr inbounds ([9 x i8]* @.str93, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_random_seed, i64 0, i32 0, i32 4), align 8, !tbaa !43
  %60 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %61 = icmp eq i8 %60, 0
  br i1 %61, label %62, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i11

; <label>:62                                      ; preds = %__cxx_global_var_init5.exit
  %63 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i11, label %65

; <label>:65                                      ; preds = %62
  call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %66 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i11

_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i11: ; preds = %65, %62, %__cxx_global_var_init5.exit
  %67 = load i64* bitcast (i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1) to i64*), align 8
  %68 = trunc i64 %67 to i32
  %69 = lshr i64 %67, 32
  %70 = trunc i64 %69 to i32
  %71 = icmp eq i32 %68, %70
  br i1 %71, label %72, label %__cxx_global_var_init8.exit

; <label>:72                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i11
  %73 = add nsw i32 %68, 1
  call void @_ZN7Minisat3vecIPNS_6OptionEE8capacityEi(%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i32 %73)
  %.pre.i.i.i.i.i12 = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  br label %__cxx_global_var_init8.exit

__cxx_global_var_init8.exit:                      ; preds = %72, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i11
  %74 = phi i32 [ %.pre.i.i.i.i.i12, %72 ], [ %68, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i11 ]
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %76 = sext i32 %74 to i64
  %77 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %78 = getelementptr inbounds %"class.Minisat::Option"** %77, i64 %76
  store %"class.Minisat::Option"* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_random_seed, i64 0, i32 0), %"class.Minisat::Option"** %78, align 8, !tbaa !47
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat12DoubleOptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_random_seed, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store double 0.000000e+00, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_random_seed, i64 0, i32 1, i32 0), align 8
  store double 0x7FF0000000000000, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_random_seed, i64 0, i32 1, i32 1), align 8
  store i8 0, i8* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_random_seed, i64 0, i32 1, i32 2), align 8
  store i8 0, i8* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_random_seed, i64 0, i32 1, i32 3), align 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr (i8* bitcast (%"class.Minisat::DoubleOption"* @_ZL15opt_random_seed to i8*), i64 58), i8* %2, i64 6, i32 2, i1 false)
  store double 0x4195D9C3F4000000, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_random_seed, i64 0, i32 2), align 8, !tbaa !163
  call void @llvm.lifetime.end(i64 6, i8* %2)
  call void @llvm.lifetime.end(i64 6, i8* %1)
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat6OptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL14opt_ccmin_mode, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i8* getelementptr inbounds ([11 x i8]* @.str1223, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL14opt_ccmin_mode, i64 0, i32 0, i32 1), align 8, !tbaa !39
  store i8* getelementptr inbounds ([64 x i8]* @.str1324, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL14opt_ccmin_mode, i64 0, i32 0, i32 2), align 8, !tbaa !41
  store i8* getelementptr inbounds ([5 x i8]* @.str95, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL14opt_ccmin_mode, i64 0, i32 0, i32 3), align 8, !tbaa !42
  store i8* getelementptr inbounds ([8 x i8]* @.str83, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL14opt_ccmin_mode, i64 0, i32 0, i32 4), align 8, !tbaa !43
  %79 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %80 = icmp eq i8 %79, 0
  br i1 %80, label %81, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i13

; <label>:81                                      ; preds = %__cxx_global_var_init8.exit
  %82 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i13, label %84

; <label>:84                                      ; preds = %81
  call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %85 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i13

_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i13: ; preds = %84, %81, %__cxx_global_var_init8.exit
  %86 = load i64* bitcast (i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1) to i64*), align 8
  %87 = trunc i64 %86 to i32
  %88 = lshr i64 %86, 32
  %89 = trunc i64 %88 to i32
  %90 = icmp eq i32 %87, %89
  br i1 %90, label %91, label %__cxx_global_var_init11.exit

; <label>:91                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i13
  %92 = add nsw i32 %87, 1
  call void @_ZN7Minisat3vecIPNS_6OptionEE8capacityEi(%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i32 %92)
  %.pre.i.i.i.i.i14 = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  br label %__cxx_global_var_init11.exit

__cxx_global_var_init11.exit:                     ; preds = %91, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i13
  %93 = phi i32 [ %.pre.i.i.i.i.i14, %91 ], [ %87, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i13 ]
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %95 = sext i32 %93 to i64
  %96 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %97 = getelementptr inbounds %"class.Minisat::Option"** %96, i64 %95
  store %"class.Minisat::Option"* getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL14opt_ccmin_mode, i64 0, i32 0), %"class.Minisat::Option"** %97, align 8, !tbaa !47
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat9IntOptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL14opt_ccmin_mode, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i64 8589934592, i64* bitcast (%"struct.Minisat::IntRange"* getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL14opt_ccmin_mode, i64 0, i32 1) to i64*), align 8
  store i32 2, i32* getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL14opt_ccmin_mode, i64 0, i32 2), align 8, !tbaa !48
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat6OptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL16opt_phase_saving, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i8* getelementptr inbounds ([13 x i8]* @.str1525, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL16opt_phase_saving, i64 0, i32 0, i32 1), align 8, !tbaa !39
  store i8* getelementptr inbounds ([63 x i8]* @.str16, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL16opt_phase_saving, i64 0, i32 0, i32 2), align 8, !tbaa !41
  store i8* getelementptr inbounds ([5 x i8]* @.str95, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL16opt_phase_saving, i64 0, i32 0, i32 3), align 8, !tbaa !42
  store i8* getelementptr inbounds ([8 x i8]* @.str83, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL16opt_phase_saving, i64 0, i32 0, i32 4), align 8, !tbaa !43
  %98 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %99 = icmp eq i8 %98, 0
  br i1 %99, label %100, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i15

; <label>:100                                     ; preds = %__cxx_global_var_init11.exit
  %101 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i15, label %103

; <label>:103                                     ; preds = %100
  call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %104 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i15

_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i15: ; preds = %103, %100, %__cxx_global_var_init11.exit
  %105 = load i64* bitcast (i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1) to i64*), align 8
  %106 = trunc i64 %105 to i32
  %107 = lshr i64 %105, 32
  %108 = trunc i64 %107 to i32
  %109 = icmp eq i32 %106, %108
  br i1 %109, label %110, label %__cxx_global_var_init14.exit

; <label>:110                                     ; preds = %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i15
  %111 = add nsw i32 %106, 1
  call void @_ZN7Minisat3vecIPNS_6OptionEE8capacityEi(%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i32 %111)
  %.pre.i.i.i.i.i16 = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  br label %__cxx_global_var_init14.exit

__cxx_global_var_init14.exit:                     ; preds = %110, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i15
  %112 = phi i32 [ %.pre.i.i.i.i.i16, %110 ], [ %106, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i15 ]
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %114 = sext i32 %112 to i64
  %115 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %116 = getelementptr inbounds %"class.Minisat::Option"** %115, i64 %114
  store %"class.Minisat::Option"* getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL16opt_phase_saving, i64 0, i32 0), %"class.Minisat::Option"** %116, align 8, !tbaa !47
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat9IntOptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL16opt_phase_saving, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i64 8589934592, i64* bitcast (%"struct.Minisat::IntRange"* getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL16opt_phase_saving, i64 0, i32 1) to i64*), align 8
  store i32 2, i32* getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL16opt_phase_saving, i64 0, i32 2), align 8, !tbaa !48
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat6OptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_rnd_init_act, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i8* getelementptr inbounds ([9 x i8]* @.str1826, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_rnd_init_act, i64 0, i32 0, i32 1), align 8, !tbaa !39
  store i8* getelementptr inbounds ([31 x i8]* @.str1927, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_rnd_init_act, i64 0, i32 0, i32 2), align 8, !tbaa !41
  store i8* getelementptr inbounds ([5 x i8]* @.str95, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_rnd_init_act, i64 0, i32 0, i32 3), align 8, !tbaa !42
  store i8* getelementptr inbounds ([7 x i8]* @.str74, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_rnd_init_act, i64 0, i32 0, i32 4), align 8, !tbaa !43
  %117 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %118 = icmp eq i8 %117, 0
  br i1 %118, label %119, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i17

; <label>:119                                     ; preds = %__cxx_global_var_init14.exit
  %120 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i17, label %122

; <label>:122                                     ; preds = %119
  call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %123 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i17

_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i17: ; preds = %122, %119, %__cxx_global_var_init14.exit
  %124 = load i64* bitcast (i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1) to i64*), align 8
  %125 = trunc i64 %124 to i32
  %126 = lshr i64 %124, 32
  %127 = trunc i64 %126 to i32
  %128 = icmp eq i32 %125, %127
  br i1 %128, label %129, label %__cxx_global_var_init17.exit

; <label>:129                                     ; preds = %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i17
  %130 = add nsw i32 %125, 1
  call void @_ZN7Minisat3vecIPNS_6OptionEE8capacityEi(%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i32 %130)
  %.pre.i.i.i.i.i18 = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  br label %__cxx_global_var_init17.exit

__cxx_global_var_init17.exit:                     ; preds = %129, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i17
  %131 = phi i32 [ %.pre.i.i.i.i.i18, %129 ], [ %125, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i17 ]
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %133 = sext i32 %131 to i64
  %134 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %135 = getelementptr inbounds %"class.Minisat::Option"** %134, i64 %133
  store %"class.Minisat::Option"* getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_rnd_init_act, i64 0, i32 0), %"class.Minisat::Option"** %135, align 8, !tbaa !47
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat10BoolOptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_rnd_init_act, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i8 0, i8* getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_rnd_init_act, i64 0, i32 1), align 8, !tbaa !155
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat6OptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_luby_restart, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i8* getelementptr inbounds ([5 x i8]* @.str21, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_luby_restart, i64 0, i32 0, i32 1), align 8, !tbaa !39
  store i8* getelementptr inbounds ([30 x i8]* @.str22, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_luby_restart, i64 0, i32 0, i32 2), align 8, !tbaa !41
  store i8* getelementptr inbounds ([5 x i8]* @.str95, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_luby_restart, i64 0, i32 0, i32 3), align 8, !tbaa !42
  store i8* getelementptr inbounds ([7 x i8]* @.str74, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_luby_restart, i64 0, i32 0, i32 4), align 8, !tbaa !43
  %136 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %137 = icmp eq i8 %136, 0
  br i1 %137, label %138, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i19

; <label>:138                                     ; preds = %__cxx_global_var_init17.exit
  %139 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i19, label %141

; <label>:141                                     ; preds = %138
  call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %142 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i19

_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i19: ; preds = %141, %138, %__cxx_global_var_init17.exit
  %143 = load i64* bitcast (i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1) to i64*), align 8
  %144 = trunc i64 %143 to i32
  %145 = lshr i64 %143, 32
  %146 = trunc i64 %145 to i32
  %147 = icmp eq i32 %144, %146
  br i1 %147, label %148, label %__cxx_global_var_init20.exit

; <label>:148                                     ; preds = %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i19
  %149 = add nsw i32 %144, 1
  call void @_ZN7Minisat3vecIPNS_6OptionEE8capacityEi(%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i32 %149)
  %.pre.i.i.i.i.i20 = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  br label %__cxx_global_var_init20.exit

__cxx_global_var_init20.exit:                     ; preds = %148, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i19
  %150 = phi i32 [ %.pre.i.i.i.i.i20, %148 ], [ %144, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i19 ]
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %152 = sext i32 %150 to i64
  %153 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %154 = getelementptr inbounds %"class.Minisat::Option"** %153, i64 %152
  store %"class.Minisat::Option"* getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_luby_restart, i64 0, i32 0), %"class.Minisat::Option"** %154, align 8, !tbaa !47
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat10BoolOptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_luby_restart, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i8 1, i8* getelementptr inbounds (%"class.Minisat::BoolOption"* @_ZL16opt_luby_restart, i64 0, i32 1), align 8, !tbaa !155
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat6OptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL17opt_restart_first, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i8* getelementptr inbounds ([7 x i8]* @.str2428, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL17opt_restart_first, i64 0, i32 0, i32 1), align 8, !tbaa !39
  store i8* getelementptr inbounds ([26 x i8]* @.str2529, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL17opt_restart_first, i64 0, i32 0, i32 2), align 8, !tbaa !41
  store i8* getelementptr inbounds ([5 x i8]* @.str95, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL17opt_restart_first, i64 0, i32 0, i32 3), align 8, !tbaa !42
  store i8* getelementptr inbounds ([8 x i8]* @.str83, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL17opt_restart_first, i64 0, i32 0, i32 4), align 8, !tbaa !43
  %155 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %156 = icmp eq i8 %155, 0
  br i1 %156, label %157, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i21

; <label>:157                                     ; preds = %__cxx_global_var_init20.exit
  %158 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %159 = icmp eq i32 %158, 0
  br i1 %159, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i21, label %160

; <label>:160                                     ; preds = %157
  call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %161 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i21

_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i21: ; preds = %160, %157, %__cxx_global_var_init20.exit
  %162 = load i64* bitcast (i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1) to i64*), align 8
  %163 = trunc i64 %162 to i32
  %164 = lshr i64 %162, 32
  %165 = trunc i64 %164 to i32
  %166 = icmp eq i32 %163, %165
  br i1 %166, label %167, label %__cxx_global_var_init23.exit

; <label>:167                                     ; preds = %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i21
  %168 = add nsw i32 %163, 1
  call void @_ZN7Minisat3vecIPNS_6OptionEE8capacityEi(%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i32 %168)
  %.pre.i.i.i.i.i22 = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  br label %__cxx_global_var_init23.exit

__cxx_global_var_init23.exit:                     ; preds = %167, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i21
  %169 = phi i32 [ %.pre.i.i.i.i.i22, %167 ], [ %163, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i21 ]
  %170 = add nsw i32 %169, 1
  store i32 %170, i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %171 = sext i32 %169 to i64
  %172 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %173 = getelementptr inbounds %"class.Minisat::Option"** %172, i64 %171
  store %"class.Minisat::Option"* getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL17opt_restart_first, i64 0, i32 0), %"class.Minisat::Option"** %173, align 8, !tbaa !47
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat9IntOptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL17opt_restart_first, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i64 9223372032559808513, i64* bitcast (%"struct.Minisat::IntRange"* getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL17opt_restart_first, i64 0, i32 1) to i64*), align 8
  store i32 100, i32* getelementptr inbounds (%"class.Minisat::IntOption"* @_ZL17opt_restart_first, i64 0, i32 2), align 8, !tbaa !48
  call void @llvm.lifetime.start(i64 6, i8* %1)
  call void @llvm.lifetime.start(i64 6, i8* %2)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %1, i64 6, i32 2, i1 false)
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat6OptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_restart_inc, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i8* getelementptr inbounds ([5 x i8]* @.str2730, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_restart_inc, i64 0, i32 0, i32 1), align 8, !tbaa !39
  store i8* getelementptr inbounds ([33 x i8]* @.str28, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_restart_inc, i64 0, i32 0, i32 2), align 8, !tbaa !41
  store i8* getelementptr inbounds ([5 x i8]* @.str95, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_restart_inc, i64 0, i32 0, i32 3), align 8, !tbaa !42
  store i8* getelementptr inbounds ([9 x i8]* @.str93, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_restart_inc, i64 0, i32 0, i32 4), align 8, !tbaa !43
  %174 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %175 = icmp eq i8 %174, 0
  br i1 %175, label %176, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i25

; <label>:176                                     ; preds = %__cxx_global_var_init23.exit
  %177 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %178 = icmp eq i32 %177, 0
  br i1 %178, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i25, label %179

; <label>:179                                     ; preds = %176
  call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %180 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i25

_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i25: ; preds = %179, %176, %__cxx_global_var_init23.exit
  %181 = load i64* bitcast (i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1) to i64*), align 8
  %182 = trunc i64 %181 to i32
  %183 = lshr i64 %181, 32
  %184 = trunc i64 %183 to i32
  %185 = icmp eq i32 %182, %184
  br i1 %185, label %186, label %__cxx_global_var_init26.exit

; <label>:186                                     ; preds = %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i25
  %187 = add nsw i32 %182, 1
  call void @_ZN7Minisat3vecIPNS_6OptionEE8capacityEi(%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i32 %187)
  %.pre.i.i.i.i.i26 = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  br label %__cxx_global_var_init26.exit

__cxx_global_var_init26.exit:                     ; preds = %186, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i25
  %188 = phi i32 [ %.pre.i.i.i.i.i26, %186 ], [ %182, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i25 ]
  %189 = add nsw i32 %188, 1
  store i32 %189, i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %190 = sext i32 %188 to i64
  %191 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %192 = getelementptr inbounds %"class.Minisat::Option"** %191, i64 %190
  store %"class.Minisat::Option"* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_restart_inc, i64 0, i32 0), %"class.Minisat::Option"** %192, align 8, !tbaa !47
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat12DoubleOptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_restart_inc, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store double 1.000000e+00, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_restart_inc, i64 0, i32 1, i32 0), align 8
  store double 0x7FF0000000000000, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_restart_inc, i64 0, i32 1, i32 1), align 8
  store i8 0, i8* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_restart_inc, i64 0, i32 1, i32 2), align 8
  store i8 0, i8* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_restart_inc, i64 0, i32 1, i32 3), align 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr (i8* bitcast (%"class.Minisat::DoubleOption"* @_ZL15opt_restart_inc to i8*), i64 58), i8* %2, i64 6, i32 2, i1 false)
  store double 2.000000e+00, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL15opt_restart_inc, i64 0, i32 2), align 8, !tbaa !163
  call void @llvm.lifetime.end(i64 6, i8* %2)
  call void @llvm.lifetime.end(i64 6, i8* %1)
  call void @llvm.lifetime.start(i64 6, i8* %1)
  call void @llvm.lifetime.start(i64 6, i8* %2)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %1, i64 6, i32 2, i1 false)
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat6OptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_garbage_frac, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store i8* getelementptr inbounds ([8 x i8]* @.str30, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_garbage_frac, i64 0, i32 0, i32 1), align 8, !tbaa !39
  store i8* getelementptr inbounds ([79 x i8]* @.str3131, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_garbage_frac, i64 0, i32 0, i32 2), align 8, !tbaa !41
  store i8* getelementptr inbounds ([5 x i8]* @.str95, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_garbage_frac, i64 0, i32 0, i32 3), align 8, !tbaa !42
  store i8* getelementptr inbounds ([9 x i8]* @.str93, i64 0, i64 0), i8** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_garbage_frac, i64 0, i32 0, i32 4), align 8, !tbaa !43
  %193 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %194 = icmp eq i8 %193, 0
  br i1 %194, label %195, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i29

; <label>:195                                     ; preds = %__cxx_global_var_init26.exit
  %196 = call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %197 = icmp eq i32 %196, 0
  br i1 %197, label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i29, label %198

; <label>:198                                     ; preds = %195
  call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %199 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i29

_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i29: ; preds = %198, %195, %__cxx_global_var_init26.exit
  %200 = load i64* bitcast (i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1) to i64*), align 8
  %201 = trunc i64 %200 to i32
  %202 = lshr i64 %200, 32
  %203 = trunc i64 %202 to i32
  %204 = icmp eq i32 %201, %203
  br i1 %204, label %205, label %__cxx_global_var_init29.exit

; <label>:205                                     ; preds = %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i29
  %206 = add nsw i32 %201, 1
  call void @_ZN7Minisat3vecIPNS_6OptionEE8capacityEi(%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i32 %206)
  %.pre.i.i.i.i.i30 = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  br label %__cxx_global_var_init29.exit

__cxx_global_var_init29.exit:                     ; preds = %205, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i29
  %207 = phi i32 [ %.pre.i.i.i.i.i30, %205 ], [ %201, %_ZN7Minisat6Option13getOptionListEv.exit.i.i.i.i29 ]
  %208 = add nsw i32 %207, 1
  store i32 %208, i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %209 = sext i32 %207 to i64
  %210 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %211 = getelementptr inbounds %"class.Minisat::Option"** %210, i64 %209
  store %"class.Minisat::Option"* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_garbage_frac, i64 0, i32 0), %"class.Minisat::Option"** %211, align 8, !tbaa !47
  store i32 (...)** bitcast (i8** getelementptr inbounds ([6 x i8*]* @_ZTVN7Minisat12DoubleOptionE, i64 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_garbage_frac, i64 0, i32 0, i32 0), align 8, !tbaa !37
  store double 0.000000e+00, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_garbage_frac, i64 0, i32 1, i32 0), align 8
  store double 0x7FF0000000000000, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_garbage_frac, i64 0, i32 1, i32 1), align 8
  store i8 0, i8* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_garbage_frac, i64 0, i32 1, i32 2), align 8
  store i8 0, i8* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_garbage_frac, i64 0, i32 1, i32 3), align 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr (i8* bitcast (%"class.Minisat::DoubleOption"* @_ZL16opt_garbage_frac to i8*), i64 58), i8* %2, i64 6, i32 2, i1 false)
  store double 2.000000e-01, double* getelementptr inbounds (%"class.Minisat::DoubleOption"* @_ZL16opt_garbage_frac, i64 0, i32 2), align 8, !tbaa !163
  call void @llvm.lifetime.end(i64 6, i8* %2)
  call void @llvm.lifetime.end(i64 6, i8* %1)
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr zeroext i1 @_ZN11reduceDB_ltclEjj(%struct.reduceDB_lt* nocapture readonly %this, i32 %x, i32 %y) #0 align 2 {
  %1 = getelementptr inbounds %struct.reduceDB_lt* %this, i64 0, i32 0
  %2 = load %"class.Minisat::ClauseAllocator"** %1, align 8, !tbaa !59
  %3 = getelementptr inbounds %"class.Minisat::ClauseAllocator"* %2, i64 0, i32 0, i64 8
  %4 = bitcast i8* %3 to i32*
  %5 = load i32* %4, align 4, !tbaa !128
  %phitmp.i.i = icmp ugt i32 %5, %x
  br i1 %phitmp.i.i, label %_ZN7Minisat15ClauseAllocatorixEj.exit, label %6, !prof !122

; <label>:6                                       ; preds = %0
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit:            ; preds = %0
  %7 = zext i32 %x to i64
  %8 = bitcast %"class.Minisat::ClauseAllocator"* %2 to i32**
  %9 = load i32** %8, align 8, !tbaa !119
  %10 = getelementptr inbounds i32* %9, i64 %7
  %11 = bitcast i32* %10 to %"class.Minisat::Clause"*
  %12 = load i32* %10, align 4
  %13 = lshr i32 %12, 5
  %14 = icmp ugt i32 %12, 95
  br i1 %14, label %15, label %36

; <label>:15                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit
  %phitmp.i.i1 = icmp ugt i32 %5, %y
  br i1 %phitmp.i.i1, label %_ZN7Minisat15ClauseAllocatorixEj.exit2, label %16, !prof !122

; <label>:16                                      ; preds = %15
  tail call void @__assert_rtn(i8* getelementptr inbounds ([11 x i8]* @__func__._ZNK7Minisat15RegionAllocatorIjEixEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 63, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit2:           ; preds = %15
  %17 = zext i32 %y to i64
  %18 = getelementptr inbounds i32* %9, i64 %17
  %19 = bitcast i32* %18 to %"class.Minisat::Clause"*
  %20 = load i32* %18, align 4
  %21 = lshr i32 %20, 5
  %22 = icmp eq i32 %21, 2
  br i1 %22, label %36, label %_ZN7Minisat15ClauseAllocatorixEj.exit6

_ZN7Minisat15ClauseAllocatorixEj.exit6:           ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit2
  %.lobit.i7 = and i32 %12, 8
  %23 = icmp eq i32 %.lobit.i7, 0
  br i1 %23, label %24, label %_ZN7Minisat15ClauseAllocatorixEj.exit4, !prof !123

; <label>:24                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit6
  tail call void @__assert_rtn(i8* getelementptr inbounds ([9 x i8]* @__func__._ZN7Minisat6Clause8activityEv, i64 0, i64 0), i8* getelementptr inbounds ([54 x i8]* @.str68, i64 0, i64 0), i32 181, i8* getelementptr inbounds ([17 x i8]* @.str69, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocatorixEj.exit4:           ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit6
  %.lobit.i = and i32 %20, 8
  %25 = icmp eq i32 %.lobit.i, 0
  br i1 %25, label %26, label %_ZN7Minisat6Clause8activityEv.exit, !prof !123

; <label>:26                                      ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit4
  tail call void @__assert_rtn(i8* getelementptr inbounds ([9 x i8]* @__func__._ZN7Minisat6Clause8activityEv, i64 0, i64 0), i8* getelementptr inbounds ([54 x i8]* @.str68, i64 0, i64 0), i32 181, i8* getelementptr inbounds ([17 x i8]* @.str69, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat6Clause8activityEv.exit:               ; preds = %_ZN7Minisat15ClauseAllocatorixEj.exit4
  %27 = zext i32 %13 to i64
  %28 = getelementptr inbounds %"class.Minisat::Clause"* %11, i64 0, i32 1, i64 %27
  %29 = bitcast %union.anon* %28 to float*
  %30 = load float* %29, align 4, !tbaa !136
  %31 = zext i32 %21 to i64
  %32 = getelementptr inbounds %"class.Minisat::Clause"* %19, i64 0, i32 1, i64 %31
  %33 = bitcast %union.anon* %32 to float*
  %34 = load float* %33, align 4, !tbaa !136
  %35 = fcmp olt float %30, %34
  br label %36

; <label>:36                                      ; preds = %_ZN7Minisat6Clause8activityEv.exit, %_ZN7Minisat15ClauseAllocatorixEj.exit2, %_ZN7Minisat15ClauseAllocatorixEj.exit
  %37 = phi i1 [ false, %_ZN7Minisat15ClauseAllocatorixEj.exit ], [ true, %_ZN7Minisat15ClauseAllocatorixEj.exit2 ], [ %35, %_ZN7Minisat6Clause8activityEv.exit ]
  ret i1 %37
}

; Function Attrs: ssp uwtable
define linkonce_odr i32 @_ZN7Minisat15ClauseAllocator5allocINS_6ClauseEEEjRKT_b(%"class.Minisat::ClauseAllocator"* nocapture %this, %"class.Minisat::Clause"* nocapture readonly %ps, i1 zeroext %learnt) #0 align 2 {
  %1 = zext i1 %learnt to i32
  %2 = getelementptr inbounds %"class.Minisat::ClauseAllocator"* %this, i64 0, i32 1
  %3 = load i8* %2, align 1, !tbaa !96, !range !78
  %4 = zext i8 %3 to i32
  %5 = or i32 %4, %1
  %6 = bitcast %"class.Minisat::Clause"* %ps to i32*
  %7 = load i32* %6, align 4
  %8 = lshr i32 %7, 5
  %9 = add nsw i32 %5, %8
  %10 = sext i32 %9 to i64
  %11 = shl nuw nsw i64 %10, 2
  %12 = add i64 %11, 4
  %13 = lshr exact i64 %12, 2
  %14 = trunc i64 %13 to i32
  %15 = icmp slt i32 %14, 1
  br i1 %15, label %16, label %17, !prof !123

; <label>:16                                      ; preds = %0
  tail call void @__assert_rtn(i8* getelementptr inbounds ([6 x i8]* @__func__._ZN7Minisat15RegionAllocatorIjE5allocEi, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 114, i8* getelementptr inbounds ([9 x i8]* @.str70, i64 0, i64 0)) #16
  unreachable

; <label>:17                                      ; preds = %0
  %18 = bitcast %"class.Minisat::ClauseAllocator"* %this to %"class.Minisat::RegionAllocator"*
  %19 = getelementptr inbounds %"class.Minisat::ClauseAllocator"* %this, i64 0, i32 0, i64 8
  %20 = bitcast i8* %19 to i32*
  %21 = load i32* %20, align 4, !tbaa !128
  %22 = add i32 %21, %14
  tail call void @_ZN7Minisat15RegionAllocatorIjE8capacityEj(%"class.Minisat::RegionAllocator"* %18, i32 %22)
  %23 = load i32* %20, align 4, !tbaa !128
  %uadd.i = tail call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %23, i32 %14)
  %24 = extractvalue { i32, i1 } %uadd.i, 0
  store i32 %24, i32* %20, align 4, !tbaa !128
  %25 = extractvalue { i32, i1 } %uadd.i, 1
  br i1 %25, label %26, label %_ZN7Minisat15RegionAllocatorIjE5allocEi.exit

; <label>:26                                      ; preds = %17
  %27 = tail call i8* @__cxa_allocate_exception(i64 1) #2
  tail call void @__cxa_throw(i8* %27, i8* bitcast ({ i8*, i8* }* @_ZTIN7Minisat20OutOfMemoryExceptionE to i8*), i8* null) #16
  unreachable

_ZN7Minisat15RegionAllocatorIjE5allocEi.exit:     ; preds = %17
  %phitmp.i.i = icmp ugt i32 %24, %23
  br i1 %phitmp.i.i, label %_ZN7Minisat15ClauseAllocator3leaEj.exit, label %28, !prof !122

; <label>:28                                      ; preds = %_ZN7Minisat15RegionAllocatorIjE5allocEi.exit
  tail call void @__assert_rtn(i8* getelementptr inbounds ([4 x i8]* @__func__._ZN7Minisat15RegionAllocatorIjE3leaEj, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8]* @.str60, i64 0, i64 0), i32 66, i8* getelementptr inbounds ([17 x i8]* @.str61, i64 0, i64 0)) #16
  unreachable

_ZN7Minisat15ClauseAllocator3leaEj.exit:          ; preds = %_ZN7Minisat15RegionAllocatorIjE5allocEi.exit
  %29 = zext i32 %23 to i64
  %30 = bitcast %"class.Minisat::ClauseAllocator"* %this to i32**
  %31 = load i32** %30, align 8, !tbaa !119
  %32 = getelementptr inbounds i32* %31, i64 %29
  %33 = bitcast i32* %32 to %"class.Minisat::Clause"*
  %34 = icmp eq i32* %32, null
  br i1 %34, label %_ZN7Minisat6ClauseC1IS0_EERKT_bb.exit, label %35

; <label>:35                                      ; preds = %_ZN7Minisat15ClauseAllocator3leaEj.exit
  %36 = load i32* %32, align 4
  %37 = shl nuw nsw i32 %1, 2
  %38 = and i32 %36, -32
  %39 = shl nuw nsw i32 %5, 3
  %40 = or i32 %39, %37
  %41 = or i32 %38, %40
  store i32 %41, i32* %32, align 4
  %42 = load i32* %6, align 4
  %43 = and i32 %42, -32
  %44 = or i32 %43, %40
  store i32 %44, i32* %32, align 4
  %45 = load i32* %6, align 4
  %46 = icmp ugt i32 %45, 31
  br i1 %46, label %.lr.ph.i.i, label %54

.lr.ph.i.i:                                       ; preds = %.lr.ph.i.i, %35
  %indvars.iv.i.i = phi i64 [ %indvars.iv.next.i.i, %.lr.ph.i.i ], [ 0, %35 ]
  %47 = getelementptr inbounds %"class.Minisat::Clause"* %ps, i64 0, i32 1, i64 %indvars.iv.i.i, i32 0, i32 0
  %48 = load i32* %47, align 4
  %49 = getelementptr inbounds %"class.Minisat::Clause"* %33, i64 0, i32 1, i64 %indvars.iv.i.i, i32 0, i32 0
  store i32 %48, i32* %49, align 4
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %50 = load i32* %6, align 4
  %51 = lshr i32 %50, 5
  %52 = trunc i64 %indvars.iv.next.i.i to i32
  %53 = icmp slt i32 %52, %51
  br i1 %53, label %.lr.ph.i.i, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %.lr.ph.i.i
  %.pre.i.i = load i32* %32, align 4
  br label %54

; <label>:54                                      ; preds = %._crit_edge.i.i, %35
  %55 = phi i32 [ %.pre.i.i, %._crit_edge.i.i ], [ %44, %35 ]
  %56 = and i32 %55, 8
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %_ZN7Minisat6ClauseC1IS0_EERKT_bb.exit, label %58

; <label>:58                                      ; preds = %54
  %59 = and i32 %55, 4
  %60 = icmp eq i32 %59, 0
  %61 = lshr i32 %55, 5
  br i1 %60, label %.preheader.i.i.i, label %62

; <label>:62                                      ; preds = %58
  %63 = zext i32 %61 to i64
  %64 = getelementptr inbounds %"class.Minisat::Clause"* %33, i64 0, i32 1, i64 %63
  %65 = bitcast %union.anon* %64 to float*
  store float 0.000000e+00, float* %65, align 4, !tbaa !136
  br label %_ZN7Minisat6ClauseC1IS0_EERKT_bb.exit

.preheader.i.i.i:                                 ; preds = %58
  %66 = icmp eq i32 %61, 0
  br i1 %66, label %_ZN7Minisat6Clause15calcAbstractionEv.exit.i.i, label %.lr.ph.i.i.i.preheader

.lr.ph.i.i.i.preheader:                           ; preds = %.preheader.i.i.i
  %67 = lshr i32 %55, 5
  %68 = icmp ugt i32 %55, 63
  %.op = add i32 %67, -1
  %69 = zext i32 %.op to i64
  %.op10 = add i64 %69, 1
  %70 = select i1 %68, i64 %.op10, i64 1
  %n.vec = and i64 %70, -8
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %.lr.ph.i.i.i.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph.i.i.i.preheader ]
  %vec.phi = phi <4 x i32> [ %81, %vector.body ], [ zeroinitializer, %.lr.ph.i.i.i.preheader ]
  %vec.phi2 = phi <4 x i32> [ %82, %vector.body ], [ zeroinitializer, %.lr.ph.i.i.i.preheader ]
  %71 = getelementptr inbounds %"class.Minisat::Clause"* %33, i64 0, i32 1, i64 %index, i32 0, i32 0
  %72 = bitcast i32* %71 to <4 x i32>*
  %wide.load = load <4 x i32>* %72, align 4
  %73 = getelementptr i32* %71, i64 4
  %74 = bitcast i32* %73 to <4 x i32>*
  %wide.load3 = load <4 x i32>* %74, align 4
  %75 = lshr <4 x i32> %wide.load, <i32 1, i32 1, i32 1, i32 1>
  %76 = lshr <4 x i32> %wide.load3, <i32 1, i32 1, i32 1, i32 1>
  %77 = and <4 x i32> %75, <i32 31, i32 31, i32 31, i32 31>
  %78 = and <4 x i32> %76, <i32 31, i32 31, i32 31, i32 31>
  %79 = shl <4 x i32> <i32 1, i32 1, i32 1, i32 1>, %77
  %80 = shl <4 x i32> <i32 1, i32 1, i32 1, i32 1>, %78
  %81 = or <4 x i32> %79, %vec.phi
  %82 = or <4 x i32> %80, %vec.phi2
  %index.next = add i64 %index, 8
  %83 = icmp eq i64 %index.next, %n.vec
  br i1 %83, label %middle.block, label %vector.body, !llvm.loop !164

middle.block:                                     ; preds = %vector.body, %.lr.ph.i.i.i.preheader
  %resume.val = phi i64 [ 0, %.lr.ph.i.i.i.preheader ], [ %n.vec, %vector.body ]
  %rdx.vec.exit.phi = phi <4 x i32> [ zeroinitializer, %.lr.ph.i.i.i.preheader ], [ %81, %vector.body ]
  %rdx.vec.exit.phi6 = phi <4 x i32> [ zeroinitializer, %.lr.ph.i.i.i.preheader ], [ %82, %vector.body ]
  %bin.rdx = or <4 x i32> %rdx.vec.exit.phi6, %rdx.vec.exit.phi
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx7 = or <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf8 = shufflevector <4 x i32> %bin.rdx7, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx9 = or <4 x i32> %bin.rdx7, %rdx.shuf8
  %84 = extractelement <4 x i32> %bin.rdx9, i32 0
  %cmp.n = icmp eq i64 %70, %resume.val
  br i1 %cmp.n, label %._crit_edge.i.i.i, label %.lr.ph.i.i.i

.lr.ph.i.i.i:                                     ; preds = %.lr.ph.i.i.i, %middle.block
  %indvars.iv.i.i.i = phi i64 [ %indvars.iv.next.i.i.i, %.lr.ph.i.i.i ], [ %resume.val, %middle.block ]
  %abstraction.02.i.i.i = phi i32 [ %90, %.lr.ph.i.i.i ], [ %84, %middle.block ]
  %85 = getelementptr inbounds %"class.Minisat::Clause"* %33, i64 0, i32 1, i64 %indvars.iv.i.i.i, i32 0, i32 0
  %86 = load i32* %85, align 4
  %87 = lshr i32 %86, 1
  %88 = and i32 %87, 31
  %89 = shl i32 1, %88
  %90 = or i32 %89, %abstraction.02.i.i.i
  %indvars.iv.next.i.i.i = add nuw nsw i64 %indvars.iv.i.i.i, 1
  %91 = trunc i64 %indvars.iv.next.i.i.i to i32
  %92 = icmp slt i32 %91, %61
  br i1 %92, label %.lr.ph.i.i.i, label %._crit_edge.i.i.i, !llvm.loop !165

._crit_edge.i.i.i:                                ; preds = %.lr.ph.i.i.i, %middle.block
  %.lcssa = phi i32 [ %90, %.lr.ph.i.i.i ], [ %84, %middle.block ]
  %phitmp.i.i.i = zext i32 %61 to i64
  br label %_ZN7Minisat6Clause15calcAbstractionEv.exit.i.i

_ZN7Minisat6Clause15calcAbstractionEv.exit.i.i:   ; preds = %._crit_edge.i.i.i, %.preheader.i.i.i
  %.lcssa.i.i.i = phi i64 [ %phitmp.i.i.i, %._crit_edge.i.i.i ], [ 0, %.preheader.i.i.i ]
  %abstraction.0.lcssa.i.i.i = phi i32 [ %.lcssa, %._crit_edge.i.i.i ], [ 0, %.preheader.i.i.i ]
  %93 = getelementptr inbounds %"class.Minisat::Clause"* %33, i64 0, i32 1, i64 %.lcssa.i.i.i, i32 0, i32 0
  store i32 %abstraction.0.lcssa.i.i.i, i32* %93, align 4, !tbaa !36
  br label %_ZN7Minisat6ClauseC1IS0_EERKT_bb.exit

_ZN7Minisat6ClauseC1IS0_EERKT_bb.exit:            ; preds = %_ZN7Minisat6Clause15calcAbstractionEv.exit.i.i, %62, %54, %_ZN7Minisat15ClauseAllocator3leaEj.exit
  ret i32 %23
}

; Function Attrs: ssp uwtable
define void @_ZN7Minisat12parseOptionsERiPPcb(i32* nocapture %argc, i8** nocapture %argv, i1 zeroext %strict) #0 {
  %1 = load i32* %argc, align 4, !tbaa !36
  %2 = icmp sgt i32 %1, 1
  br i1 %2, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.critedge1, %0
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %.critedge1 ], [ 1, %0 ]
  %j.050 = phi i32 [ %j.1, %.critedge1 ], [ 1, %0 ]
  %3 = getelementptr inbounds i8** %argv, i64 %indvars.iv66
  %4 = load i8** %3, align 8, !tbaa !47
  br label %.lr.ph.i

; <label>:5                                       ; preds = %.lr.ph.i
  %6 = getelementptr inbounds [3 x i8]* @.str72, i64 0, i64 %indvars.iv.next.i
  %7 = load i8* %6, align 1, !tbaa !59
  %8 = icmp eq i64 %indvars.iv.next.i, 2
  %9 = getelementptr inbounds i8* %4, i64 %indvars.iv.next.i
  br i1 %8, label %14, label %.lr.ph.i

.lr.ph.i:                                         ; preds = %5, %.lr.ph
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %5 ], [ 0, %.lr.ph ]
  %10 = phi i8* [ %9, %5 ], [ %4, %.lr.ph ]
  %11 = phi i8 [ %7, %5 ], [ 45, %.lr.ph ]
  %12 = load i8* %10, align 1, !tbaa !59
  %13 = icmp eq i8 %12, %11
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  br i1 %13, label %5, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit.preheader

; <label>:14                                      ; preds = %5
  %15 = load i8** @_ZZN7Minisat6Option19getHelpPrefixStringEvE15help_prefix_str, align 8, !tbaa !47
  %16 = load i8* %15, align 1, !tbaa !59
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %.loopexit, label %.lr.ph.i5

; <label>:18                                      ; preds = %.lr.ph.i5
  %19 = getelementptr inbounds i8* %15, i64 %indvars.iv.next.i4
  %20 = load i8* %19, align 1, !tbaa !59
  %21 = icmp eq i8 %20, 0
  %.sum = add i64 %indvars.iv.i3, 3
  %22 = getelementptr inbounds i8* %4, i64 %.sum
  br i1 %21, label %.loopexit, label %.lr.ph.i5

.lr.ph.i5:                                        ; preds = %18, %14
  %indvars.iv.i3 = phi i64 [ %indvars.iv.next.i4, %18 ], [ 0, %14 ]
  %23 = phi i8* [ %22, %18 ], [ %9, %14 ]
  %24 = phi i8 [ %20, %18 ], [ %16, %14 ]
  %25 = load i8* %23, align 1, !tbaa !59
  %26 = icmp eq i8 %25, %24
  %indvars.iv.next.i4 = add nuw nsw i64 %indvars.iv.i3, 1
  br i1 %26, label %18, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit.preheader

.loopexit:                                        ; preds = %18, %14
  %.ph = phi i8* [ %9, %14 ], [ %22, %18 ]
  br label %.lr.ph.i11

; <label>:27                                      ; preds = %.lr.ph.i11
  %28 = getelementptr inbounds [5 x i8]* @.str173, i64 0, i64 %indvars.iv.next.i10
  %29 = load i8* %28, align 1, !tbaa !59
  %30 = icmp eq i64 %indvars.iv.next.i10, 4
  %31 = getelementptr inbounds i8* %.ph, i64 %indvars.iv.next.i10
  br i1 %30, label %36, label %.lr.ph.i11

.lr.ph.i11:                                       ; preds = %27, %.loopexit
  %indvars.iv.i9 = phi i64 [ %indvars.iv.next.i10, %27 ], [ 0, %.loopexit ]
  %32 = phi i8* [ %31, %27 ], [ %.ph, %.loopexit ]
  %33 = phi i8 [ %29, %27 ], [ 104, %.loopexit ]
  %34 = load i8* %32, align 1, !tbaa !59
  %35 = icmp eq i8 %34, %33
  %indvars.iv.next.i10 = add nuw nsw i64 %indvars.iv.i9, 1
  br i1 %35, label %27, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit.preheader

; <label>:36                                      ; preds = %27
  %37 = load i8* %31, align 1, !tbaa !59
  %38 = icmp eq i8 %37, 0
  br i1 %38, label %39, label %.lr.ph.i18

; <label>:39                                      ; preds = %36
  tail call void @_ZN7Minisat17printUsageAndExitEiPPcb(i32 undef, i8** %argv, i1 zeroext false)
  unreachable

; <label>:40                                      ; preds = %.lr.ph.i18
  %41 = icmp eq i64 %indvars.iv.i16, 5
  br i1 %41, label %48, label %..lr.ph.i18_crit_edge

..lr.ph.i18_crit_edge:                            ; preds = %40
  %.sum24 = add i64 %indvars.iv.i16, 4
  %42 = getelementptr inbounds [6 x i8]* @.str274, i64 0, i64 %indvars.iv.i16
  %43 = getelementptr inbounds i8* %.ph, i64 %.sum24
  %44 = load i8* %42, align 1, !tbaa !59
  %.pre = load i8* %43, align 1, !tbaa !59
  %phitmp = add i64 %indvars.iv.i16, 1
  br label %.lr.ph.i18

.lr.ph.i18:                                       ; preds = %..lr.ph.i18_crit_edge, %36
  %45 = phi i8 [ %.pre, %..lr.ph.i18_crit_edge ], [ %37, %36 ]
  %indvars.iv.i16 = phi i64 [ %phitmp, %..lr.ph.i18_crit_edge ], [ 1, %36 ]
  %46 = phi i8 [ %44, %..lr.ph.i18_crit_edge ], [ 45, %36 ]
  %47 = icmp eq i8 %45, %46
  br i1 %47, label %40, label %.critedge1

; <label>:48                                      ; preds = %40
  tail call void @_ZN7Minisat17printUsageAndExitEiPPcb(i32 undef, i8** %argv, i1 zeroext true)
  unreachable

_ZN7MinisatL5matchIPKcEEbRT_S2_.exit.preheader:   ; preds = %_ZN7Minisat6Option13getOptionListEv.exit, %.lr.ph.i11, %.lr.ph.i5, %.lr.ph.i
  %indvars.iv = phi i64 [ %indvars.iv.next, %_ZN7Minisat6Option13getOptionListEv.exit ], [ 0, %.lr.ph.i11 ], [ 0, %.lr.ph.i5 ], [ 0, %.lr.ph.i ]
  %49 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %50 = icmp eq i8 %49, 0
  br i1 %50, label %51, label %_ZN7Minisat6Option13getOptionListEv.exit23

; <label>:51                                      ; preds = %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit.preheader
  %52 = tail call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %_ZN7Minisat6Option13getOptionListEv.exit23, label %54

; <label>:54                                      ; preds = %51
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %55 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  tail call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit23

_ZN7Minisat6Option13getOptionListEv.exit23:       ; preds = %54, %51, %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit.preheader
  %56 = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %57 = trunc i64 %indvars.iv to i32
  %58 = icmp slt i32 %57, %56
  br i1 %58, label %59, label %.critedge

; <label>:59                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit23
  %60 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %61 = icmp eq i8 %60, 0
  br i1 %61, label %62, label %_ZN7Minisat6Option13getOptionListEv.exit

; <label>:62                                      ; preds = %59
  %63 = tail call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %_ZN7Minisat6Option13getOptionListEv.exit, label %65

; <label>:65                                      ; preds = %62
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %66 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  tail call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit

_ZN7Minisat6Option13getOptionListEv.exit:         ; preds = %65, %62, %59
  %67 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %68 = getelementptr inbounds %"class.Minisat::Option"** %67, i64 %indvars.iv
  %69 = load %"class.Minisat::Option"** %68, align 8, !tbaa !47
  %70 = bitcast %"class.Minisat::Option"* %69 to i1 (%"class.Minisat::Option"*, i8*)***
  %71 = load i1 (%"class.Minisat::Option"*, i8*)*** %70, align 8, !tbaa !37
  %72 = getelementptr inbounds i1 (%"class.Minisat::Option"*, i8*)** %71, i64 2
  %73 = load i1 (%"class.Minisat::Option"*, i8*)** %72, align 8
  %74 = load i8** %3, align 8, !tbaa !47
  %75 = tail call zeroext i1 %73(%"class.Minisat::Option"* %69, i8* %74)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %75, label %.critedge1, label %_ZN7MinisatL5matchIPKcEEbRT_S2_.exit.preheader

.critedge:                                        ; preds = %_ZN7Minisat6Option13getOptionListEv.exit23
  %76 = load i8** %3, align 8, !tbaa !47
  br i1 %strict, label %77, label %_ZN7MinisatL5matchIPcEEbRT_PKc.exit

; <label>:77                                      ; preds = %.critedge
  %.pre.i = load i8* %76, align 1, !tbaa !59
  %phitmp.i = icmp eq i8 %.pre.i, 45
  br i1 %phitmp.i, label %78, label %_ZN7MinisatL5matchIPcEEbRT_PKc.exit

; <label>:78                                      ; preds = %77
  %79 = getelementptr inbounds i8* %76, i64 1
  store i8* %79, i8** %3, align 8, !tbaa !47
  %80 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %81 = load i8** @_ZZN7Minisat6Option19getHelpPrefixStringEvE15help_prefix_str, align 8, !tbaa !47
  %82 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %80, i8* getelementptr inbounds ([52 x i8]* @.str475, i64 0, i64 0), i8* %79, i8* %81)
  tail call void @exit(i32 1) #16
  unreachable

_ZN7MinisatL5matchIPcEEbRT_PKc.exit:              ; preds = %77, %.critedge
  %83 = add nsw i32 %j.050, 1
  %84 = sext i32 %j.050 to i64
  %85 = getelementptr inbounds i8** %argv, i64 %84
  store i8* %76, i8** %85, align 8, !tbaa !47
  br label %.critedge1

.critedge1:                                       ; preds = %_ZN7MinisatL5matchIPcEEbRT_PKc.exit, %_ZN7Minisat6Option13getOptionListEv.exit, %.lr.ph.i18
  %j.1 = phi i32 [ %83, %_ZN7MinisatL5matchIPcEEbRT_PKc.exit ], [ %j.050, %_ZN7Minisat6Option13getOptionListEv.exit ], [ %j.050, %.lr.ph.i18 ]
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %86 = load i32* %argc, align 4, !tbaa !36
  %87 = trunc i64 %indvars.iv.next67 to i32
  %88 = icmp slt i32 %87, %86
  br i1 %88, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.critedge1, %0
  %.lcssa41 = phi i32 [ %1, %0 ], [ %86, %.critedge1 ]
  %j.0.lcssa = phi i32 [ 1, %0 ], [ %j.1, %.critedge1 ]
  %i.0.lcssa = phi i32 [ 1, %0 ], [ %87, %.critedge1 ]
  %89 = sub i32 %j.0.lcssa, %i.0.lcssa
  %90 = add i32 %89, %.lcssa41
  store i32 %90, i32* %argc, align 4, !tbaa !36
  ret void
}

; Function Attrs: noreturn ssp uwtable
define void @_ZN7Minisat17printUsageAndExitEiPPcb(i32 %argc, i8** nocapture readonly %argv, i1 zeroext %verbose) #4 {
  %1 = load i8** @_ZZN7Minisat6Option14getUsageStringEvE9usage_str, align 8, !tbaa !47
  %2 = icmp eq i8* %1, null
  br i1 %2, label %7, label %3

; <label>:3                                       ; preds = %0
  %4 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %5 = load i8** %argv, align 8, !tbaa !47
  %6 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %4, i8* %1, i8* %5)
  br label %7

; <label>:7                                       ; preds = %3, %0
  %8 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %_ZN7Minisat6Option13getOptionListEv.exit4

; <label>:10                                      ; preds = %7
  %11 = tail call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %_ZN7Minisat6Option13getOptionListEv.exit4, label %13

; <label>:13                                      ; preds = %10
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %14 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  tail call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit4

_ZN7Minisat6Option13getOptionListEv.exit4:        ; preds = %13, %10, %7
  %15 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %16 = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  tail call void @_ZN7Minisat4sortIPNS_6OptionENS1_8OptionLtEEEvPT_iT0_(%"class.Minisat::Option"** %15, i32 %16) #2
  br label %17

; <label>:17                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit, %_ZN7Minisat6Option13getOptionListEv.exit4
  %indvars.iv = phi i64 [ %indvars.iv.next, %_ZN7Minisat6Option13getOptionListEv.exit ], [ 0, %_ZN7Minisat6Option13getOptionListEv.exit4 ]
  %prev_type.0 = phi i8* [ %99, %_ZN7Minisat6Option13getOptionListEv.exit ], [ null, %_ZN7Minisat6Option13getOptionListEv.exit4 ]
  %prev_cat.0 = phi i8* [ %87, %_ZN7Minisat6Option13getOptionListEv.exit ], [ null, %_ZN7Minisat6Option13getOptionListEv.exit4 ]
  %18 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %20, label %_ZN7Minisat6Option13getOptionListEv.exit5

; <label>:20                                      ; preds = %17
  %21 = tail call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %_ZN7Minisat6Option13getOptionListEv.exit5, label %23

; <label>:23                                      ; preds = %20
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %24 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  tail call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit5

_ZN7Minisat6Option13getOptionListEv.exit5:        ; preds = %23, %20, %17
  %25 = load i32* getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 1), align 8, !tbaa !44
  %26 = trunc i64 %indvars.iv to i32
  %27 = icmp slt i32 %26, %25
  br i1 %27, label %28, label %100

; <label>:28                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit5
  %29 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %31, label %_ZN7Minisat6Option13getOptionListEv.exit6

; <label>:31                                      ; preds = %28
  %32 = tail call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %_ZN7Minisat6Option13getOptionListEv.exit6, label %34

; <label>:34                                      ; preds = %31
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %35 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  tail call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit6

_ZN7Minisat6Option13getOptionListEv.exit6:        ; preds = %34, %31, %28
  %36 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %37 = getelementptr inbounds %"class.Minisat::Option"** %36, i64 %indvars.iv
  %38 = load %"class.Minisat::Option"** %37, align 8, !tbaa !47
  %39 = getelementptr inbounds %"class.Minisat::Option"* %38, i64 0, i32 3
  %40 = load i8** %39, align 8, !tbaa !42
  %41 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %42 = icmp eq i8 %41, 0
  br i1 %42, label %43, label %_ZN7Minisat6Option13getOptionListEv.exit7

; <label>:43                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit6
  %44 = tail call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %_ZN7Minisat6Option13getOptionListEv.exit7, label %46

; <label>:46                                      ; preds = %43
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %47 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  tail call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit7

_ZN7Minisat6Option13getOptionListEv.exit7:        ; preds = %46, %43, %_ZN7Minisat6Option13getOptionListEv.exit6
  %48 = icmp eq i8* %40, %prev_cat.0
  br i1 %48, label %52, label %49

; <label>:49                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit7
  %50 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %51 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %50, i8* getelementptr inbounds ([15 x i8]* @.str576, i64 0, i64 0), i8* %40)
  br label %61

; <label>:52                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit7
  %53 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %54 = getelementptr inbounds %"class.Minisat::Option"** %53, i64 %indvars.iv
  %55 = load %"class.Minisat::Option"** %54, align 8, !tbaa !47
  %56 = getelementptr inbounds %"class.Minisat::Option"* %55, i64 0, i32 4
  %57 = load i8** %56, align 8, !tbaa !43
  %58 = icmp eq i8* %57, %prev_type.0
  br i1 %58, label %61, label %59

; <label>:59                                      ; preds = %52
  %60 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %fputc3 = tail call i32 @fputc(i32 10, %struct.__sFILE* %60)
  br label %61

; <label>:61                                      ; preds = %59, %52, %49
  %62 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %63 = icmp eq i8 %62, 0
  br i1 %63, label %64, label %_ZN7Minisat6Option13getOptionListEv.exit8

; <label>:64                                      ; preds = %61
  %65 = tail call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %_ZN7Minisat6Option13getOptionListEv.exit8, label %67

; <label>:67                                      ; preds = %64
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %68 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  tail call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit8

_ZN7Minisat6Option13getOptionListEv.exit8:        ; preds = %67, %64, %61
  %69 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %70 = getelementptr inbounds %"class.Minisat::Option"** %69, i64 %indvars.iv
  %71 = load %"class.Minisat::Option"** %70, align 8, !tbaa !47
  %72 = bitcast %"class.Minisat::Option"* %71 to void (%"class.Minisat::Option"*, i1)***
  %73 = load void (%"class.Minisat::Option"*, i1)*** %72, align 8, !tbaa !37
  %74 = getelementptr inbounds void (%"class.Minisat::Option"*, i1)** %73, i64 3
  %75 = load void (%"class.Minisat::Option"*, i1)** %74, align 8
  tail call void %75(%"class.Minisat::Option"* %71, i1 zeroext %verbose)
  %76 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %77 = icmp eq i8 %76, 0
  br i1 %77, label %78, label %_ZN7Minisat6Option13getOptionListEv.exit9

; <label>:78                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit8
  %79 = tail call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %_ZN7Minisat6Option13getOptionListEv.exit9, label %81

; <label>:81                                      ; preds = %78
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %82 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  tail call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit9

_ZN7Minisat6Option13getOptionListEv.exit9:        ; preds = %81, %78, %_ZN7Minisat6Option13getOptionListEv.exit8
  %83 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %84 = getelementptr inbounds %"class.Minisat::Option"** %83, i64 %indvars.iv
  %85 = load %"class.Minisat::Option"** %84, align 8, !tbaa !47
  %86 = getelementptr inbounds %"class.Minisat::Option"* %85, i64 0, i32 3
  %87 = load i8** %86, align 8, !tbaa !42
  %88 = load atomic i8* bitcast (i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options to i8*) acquire, align 8
  %89 = icmp eq i8 %88, 0
  br i1 %89, label %90, label %_ZN7Minisat6Option13getOptionListEv.exit

; <label>:90                                      ; preds = %_ZN7Minisat6Option13getOptionListEv.exit9
  %91 = tail call i32 @__cxa_guard_acquire(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %_ZN7Minisat6Option13getOptionListEv.exit, label %93

; <label>:93                                      ; preds = %90
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8 0, i64 16, i32 8, i1 false) #2
  %94 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.Minisat::vec.8"*)* @_ZN7Minisat3vecIPNS_6OptionEED1Ev to void (i8*)*), i8* bitcast (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options to i8*), i8* @__dso_handle) #2
  tail call void @__cxa_guard_release(i64* @_ZGVZN7Minisat6Option13getOptionListEvE7options) #2
  br label %_ZN7Minisat6Option13getOptionListEv.exit

_ZN7Minisat6Option13getOptionListEv.exit:         ; preds = %93, %90, %_ZN7Minisat6Option13getOptionListEv.exit9
  %95 = load %"class.Minisat::Option"*** getelementptr inbounds (%"class.Minisat::vec.8"* @_ZZN7Minisat6Option13getOptionListEvE7options, i64 0, i32 0), align 8, !tbaa !46
  %96 = getelementptr inbounds %"class.Minisat::Option"** %95, i64 %indvars.iv
  %97 = load %"class.Minisat::Option"** %96, align 8, !tbaa !47
  %98 = getelementptr inbounds %"class.Minisat::Option"* %97, i64 0, i32 4
  %99 = load i8** %98, align 8, !tbaa !43
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %17

; <label>:100                                     ; preds = %_ZN7Minisat6Option13getOptionListEv.exit5
  %101 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %102 = tail call i64 @fwrite(i8* getelementptr inbounds ([17 x i8]* @.str777, i64 0, i64 0), i64 16, i64 1, %struct.__sFILE* %101)
  %103 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %104 = load i8** @_ZZN7Minisat6Option19getHelpPrefixStringEvE15help_prefix_str, align 8, !tbaa !47
  %105 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %103, i8* getelementptr inbounds ([39 x i8]* @.str878, i64 0, i64 0), i8* %104)
  %106 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %107 = load i8** @_ZZN7Minisat6Option19getHelpPrefixStringEvE15help_prefix_str, align 8, !tbaa !47
  %108 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %106, i8* getelementptr inbounds ([47 x i8]* @.str979, i64 0, i64 0), i8* %107)
  %109 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !47
  %fputc = tail call i32 @fputc(i32 10, %struct.__sFILE* %109)
  tail call void @exit(i32 0) #16
  unreachable
}

; Function Attrs: nounwind ssp uwtable
define void @_ZN7Minisat12setUsageHelpEPKc(i8* %str) #6 {
  store i8* %str, i8** @_ZZN7Minisat6Option14getUsageStringEvE9usage_str, align 8, !tbaa !47
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @_ZN7Minisat16setHelpPrefixStrEPKc(i8* %str) #6 {
  store i8* %str, i8** @_ZZN7Minisat6Option19getHelpPrefixStringEvE15help_prefix_str, align 8, !tbaa !47
  ret void
}

; Function Attrs: nounwind ssp uwtable
define linkonce_odr void @_ZN7Minisat4sortIPNS_6OptionENS1_8OptionLtEEEvPT_iT0_(%"class.Minisat::Option"** %array, i32 %size) #6 {
  %1 = icmp slt i32 %size, 16
  br i1 %1, label %tailrecurse._crit_edge, label %.lr.ph

tailrecurse._crit_edge:                           ; preds = %tailrecurse, %0
  %size.tr.lcssa = phi i32 [ %size, %0 ], [ %72, %tailrecurse ]
  %array.tr.lcssa = phi %"class.Minisat::Option"** [ %array, %0 ], [ %41, %tailrecurse ]
  %2 = add i32 %size.tr.lcssa, -1
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %.lr.ph5.i, label %_ZN7Minisat13selectionSortIPNS_6OptionENS1_8OptionLtEEEvPT_iT0_.exit

.lr.ph5.i:                                        ; preds = %._crit_edge.i, %tailrecurse._crit_edge
  %indvars.iv9.i = phi i64 [ %indvars.iv.next10.i, %._crit_edge.i ], [ 0, %tailrecurse._crit_edge ]
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %._crit_edge.i ], [ 1, %tailrecurse._crit_edge ]
  %indvars.iv.next10.i = add nuw nsw i64 %indvars.iv9.i, 1
  %4 = trunc i64 %indvars.iv.next10.i to i32
  %5 = icmp slt i32 %4, %size.tr.lcssa
  %6 = trunc i64 %indvars.iv9.i to i32
  br i1 %5, label %.lr.ph.i, label %._crit_edge.i

.lr.ph.i:                                         ; preds = %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.i, %.lr.ph5.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.i ], [ %indvars.iv.i, %.lr.ph5.i ]
  %best_i.02.i = phi i32 [ %28, %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.i ], [ %6, %.lr.ph5.i ]
  %7 = getelementptr inbounds %"class.Minisat::Option"** %array.tr.lcssa, i64 %indvars.iv7.i
  %8 = load %"class.Minisat::Option"** %7, align 8, !tbaa !47
  %9 = sext i32 %best_i.02.i to i64
  %10 = getelementptr inbounds %"class.Minisat::Option"** %array.tr.lcssa, i64 %9
  %11 = load %"class.Minisat::Option"** %10, align 8, !tbaa !47
  %12 = getelementptr inbounds %"class.Minisat::Option"* %8, i64 0, i32 3
  %13 = load i8** %12, align 8, !tbaa !42
  %14 = getelementptr inbounds %"class.Minisat::Option"* %11, i64 0, i32 3
  %15 = load i8** %14, align 8, !tbaa !42
  %16 = tail call i32 @strcmp(i8* %13, i8* %15) #2
  %17 = icmp slt i32 %16, 0
  %18 = trunc i64 %indvars.iv7.i to i32
  br i1 %17, label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.i, label %19

; <label>:19                                      ; preds = %.lr.ph.i
  %20 = icmp eq i32 %16, 0
  br i1 %20, label %21, label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.i

; <label>:21                                      ; preds = %19
  %22 = getelementptr inbounds %"class.Minisat::Option"* %8, i64 0, i32 4
  %23 = load i8** %22, align 8, !tbaa !43
  %24 = getelementptr inbounds %"class.Minisat::Option"* %11, i64 0, i32 4
  %25 = load i8** %24, align 8, !tbaa !43
  %26 = tail call i32 @strcmp(i8* %23, i8* %25) #2
  %27 = icmp slt i32 %26, 0
  %phitmp.i = select i1 %27, i32 %18, i32 %best_i.02.i
  br label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.i

_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.i:    ; preds = %21, %19, %.lr.ph.i
  %28 = phi i32 [ %18, %.lr.ph.i ], [ %best_i.02.i, %19 ], [ %phitmp.i, %21 ]
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next8.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %size.tr.lcssa
  br i1 %exitcond, label %._crit_edge.i, label %.lr.ph.i

._crit_edge.i:                                    ; preds = %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.i, %.lr.ph5.i
  %best_i.0.lcssa.i = phi i32 [ %6, %.lr.ph5.i ], [ %28, %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.i ]
  %29 = getelementptr inbounds %"class.Minisat::Option"** %array.tr.lcssa, i64 %indvars.iv9.i
  %30 = load %"class.Minisat::Option"** %29, align 8, !tbaa !47
  %31 = sext i32 %best_i.0.lcssa.i to i64
  %32 = getelementptr inbounds %"class.Minisat::Option"** %array.tr.lcssa, i64 %31
  %33 = load %"class.Minisat::Option"** %32, align 8, !tbaa !47
  store %"class.Minisat::Option"* %33, %"class.Minisat::Option"** %29, align 8, !tbaa !47
  store %"class.Minisat::Option"* %30, %"class.Minisat::Option"** %32, align 8, !tbaa !47
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond13 = icmp eq i32 %4, %2
  br i1 %exitcond13, label %_ZN7Minisat13selectionSortIPNS_6OptionENS1_8OptionLtEEEvPT_iT0_.exit, label %.lr.ph5.i

.lr.ph:                                           ; preds = %tailrecurse, %0
  %size.tr10 = phi i32 [ %72, %tailrecurse ], [ %size, %0 ]
  %array.tr9 = phi %"class.Minisat::Option"** [ %41, %tailrecurse ], [ %array, %0 ]
  %34 = sdiv i32 %size.tr10, 2
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds %"class.Minisat::Option"** %array.tr9, i64 %35
  %37 = load %"class.Minisat::Option"** %36, align 8, !tbaa !47
  %38 = getelementptr inbounds %"class.Minisat::Option"* %37, i64 0, i32 3
  %39 = getelementptr inbounds %"class.Minisat::Option"* %37, i64 0, i32 4
  br label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread.outer

_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread.outer: ; preds = %71, %.lr.ph
  %i.0.ph = phi i64 [ -1, %.lr.ph ], [ %phitmp, %71 ]
  %j.0.ph = phi i32 [ %size.tr10, %.lr.ph ], [ %64, %71 ]
  %40 = load i8** %38, align 8, !tbaa !42
  br label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread

_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread: ; preds = %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit, %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread, %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread.outer
  %indvars.iv = phi i64 [ %i.0.ph, %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread.outer ], [ %indvars.iv.next, %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit ], [ %indvars.iv.next, %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %41 = getelementptr inbounds %"class.Minisat::Option"** %array.tr9, i64 %indvars.iv.next
  %42 = load %"class.Minisat::Option"** %41, align 8, !tbaa !47
  %43 = getelementptr inbounds %"class.Minisat::Option"* %42, i64 0, i32 3
  %44 = load i8** %43, align 8, !tbaa !42
  %45 = tail call i32 @strcmp(i8* %44, i8* %40) #2
  %46 = icmp slt i32 %45, 0
  br i1 %46, label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread, label %47

; <label>:47                                      ; preds = %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread
  %48 = icmp eq i32 %45, 0
  %49 = trunc i64 %indvars.iv.next to i32
  br i1 %48, label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit, label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread2.preheader

_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit:      ; preds = %47
  %50 = getelementptr inbounds %"class.Minisat::Option"* %42, i64 0, i32 4
  %51 = load i8** %50, align 8, !tbaa !43
  %52 = load i8** %39, align 8, !tbaa !43
  %53 = tail call i32 @strcmp(i8* %51, i8* %52) #2
  %54 = icmp slt i32 %53, 0
  br i1 %54, label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread, label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread2.preheader

_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread2.preheader: ; preds = %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit, %47
  %55 = sext i32 %j.0.ph to i64
  br label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread2

_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread2: ; preds = %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit1, %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread2, %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread2.preheader
  %indvars.iv18 = phi i64 [ %55, %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread2.preheader ], [ %indvars.iv.next19, %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit1 ], [ %indvars.iv.next19, %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread2 ]
  %indvars.iv.next19 = add nsw i64 %indvars.iv18, -1
  %56 = getelementptr inbounds %"class.Minisat::Option"** %array.tr9, i64 %indvars.iv.next19
  %57 = load %"class.Minisat::Option"** %56, align 8, !tbaa !47
  %58 = getelementptr inbounds %"class.Minisat::Option"* %57, i64 0, i32 3
  %59 = load i8** %58, align 8, !tbaa !42
  %60 = tail call i32 @strcmp(i8* %40, i8* %59) #2
  %61 = icmp slt i32 %60, 0
  br i1 %61, label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread2, label %62

; <label>:62                                      ; preds = %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread2
  %63 = icmp eq i32 %60, 0
  %64 = trunc i64 %indvars.iv.next19 to i32
  br i1 %63, label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit1, label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit1.thread3

_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit1:     ; preds = %62
  %65 = load i8** %39, align 8, !tbaa !43
  %66 = getelementptr inbounds %"class.Minisat::Option"* %57, i64 0, i32 4
  %67 = load i8** %66, align 8, !tbaa !43
  %68 = tail call i32 @strcmp(i8* %65, i8* %67) #2
  %69 = icmp slt i32 %68, 0
  br i1 %69, label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread2, label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit1.thread3

_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit1.thread3: ; preds = %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit1, %62
  %70 = icmp slt i32 %49, %64
  br i1 %70, label %71, label %tailrecurse

; <label>:71                                      ; preds = %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit1.thread3
  store %"class.Minisat::Option"* %57, %"class.Minisat::Option"** %41, align 8, !tbaa !47
  store %"class.Minisat::Option"* %42, %"class.Minisat::Option"** %56, align 8, !tbaa !47
  %sext = shl i64 %indvars.iv.next, 32
  %phitmp = ashr exact i64 %sext, 32
  br label %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit.thread.outer

tailrecurse:                                      ; preds = %_ZN7Minisat6Option8OptionLtclEPKS0_S3_.exit1.thread3
  tail call void @_ZN7Minisat4sortIPNS_6OptionENS1_8OptionLtEEEvPT_iT0_(%"class.Minisat::Option"** %array.tr9, i32 %49)
  %72 = sub nsw i32 %size.tr10, %49
  %73 = icmp slt i32 %72, 16
  br i1 %73, label %tailrecurse._crit_edge, label %.lr.ph

_ZN7Minisat13selectionSortIPNS_6OptionENS1_8OptionLtEEEvPT_iT0_.exit: ; preds = %._crit_edge.i, %tailrecurse._crit_edge
  ret void
}

; Function Attrs: ssp uwtable
define double @_ZN7Minisat7memUsedEv() #0 {
  %t = alloca %struct.malloc_statistics_t, align 8
  call void @malloc_zone_statistics(%struct._malloc_zone_t* null, %struct.malloc_statistics_t* %t)
  %1 = getelementptr inbounds %struct.malloc_statistics_t* %t, i64 0, i32 2
  %2 = load i64* %1, align 8, !tbaa !166
  %3 = uitofp i64 %2 to double
  %4 = fmul double %3, 0x3EB0000000000000
  ret double %4
}

declare void @malloc_zone_statistics(%struct._malloc_zone_t*, %struct.malloc_statistics_t*) #3

; Function Attrs: ssp uwtable
define double @_ZN7Minisat11memUsedPeakEv() #0 {
  %t.i = alloca %struct.malloc_statistics_t, align 8
  %1 = bitcast %struct.malloc_statistics_t* %t.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %1)
  call void @malloc_zone_statistics(%struct._malloc_zone_t* null, %struct.malloc_statistics_t* %t.i)
  %2 = getelementptr inbounds %struct.malloc_statistics_t* %t.i, i64 0, i32 2
  %3 = load i64* %2, align 8, !tbaa !166
  %4 = uitofp i64 %3 to double
  %5 = fmul double %4, 0x3EB0000000000000
  call void @llvm.lifetime.end(i64 32, i8* %1)
  ret double %5
}

attributes #0 = { ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline noreturn nounwind }
attributes #8 = { inlinehint nounwind readnone ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind readnone }
attributes #10 = { inlinehint nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nounwind readnone ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nounwind readonly ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { ssp }
attributes #16 = { noreturn }
attributes #17 = { noreturn nounwind }
attributes #18 = { builtin nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2, !2, !2, !2}

!0 = metadata !{i32 2, metadata !"Dwarf Version", i32 2}
!1 = metadata !{i32 2, metadata !"Debug Info Version", i32 600056001}
!2 = metadata !{metadata !"Apple LLVM version 6.0 (clang-600.0.56) (based on LLVM 3.5svn)"}
!3 = metadata !{metadata !4, metadata !6, i64 0}
!4 = metadata !{metadata !"_ZTS6rusage", metadata !5, i64 0, metadata !5, i64 16, metadata !6, i64 32, metadata !6, i64 40, metadata !6, i64 48, metadata !6, i64 56, metadata !6, i64 64, metadata !6, i64 72, metadata !6, i64 80, metadata !6, i64 88, metadata !6, i64 96, metadata !6, i64 104, metadata !6, i64 112, metadata !6, i64 120, metadata !6, i64 128, metadata !6, i64 136}
!5 = metadata !{metadata !"_ZTS7timeval", metadata !6, i64 0, metadata !9, i64 8}
!6 = metadata !{metadata !"long", metadata !7, i64 0}
!7 = metadata !{metadata !"omnipotent char", metadata !8, i64 0}
!8 = metadata !{metadata !"Simple C/C++ TBAA"}
!9 = metadata !{metadata !"int", metadata !7, i64 0}
!10 = metadata !{metadata !4, metadata !9, i64 8}
!11 = metadata !{metadata !12, metadata !18, i64 160}
!12 = metadata !{metadata !"_ZTSN7Minisat6SolverE", metadata !13, i64 8, metadata !15, i64 24, metadata !9, i64 40, metadata !16, i64 48, metadata !16, i64 56, metadata !16, i64 64, metadata !16, i64 72, metadata !17, i64 80, metadata !9, i64 84, metadata !9, i64 88, metadata !17, i64 92, metadata !17, i64 93, metadata !16, i64 96, metadata !9, i64 104, metadata !16, i64 112, metadata !16, i64 120, metadata !16, i64 128, metadata !9, i64 136, metadata !16, i64 144, metadata !18, i64 152, metadata !18, i64 160, metadata !18, i64 168, metadata !18, i64 176, metadata !18, i64 184, metadata !18, i64 192, metadata !18, i64 200, metadata !18, i64 208, metadata !18, i64 216, metadata !18, i64 224, metadata !18, i64 232, metadata !17, i64 240, metadata !19, i64 248, metadata !19, i64 264, metadata !16, i64 280, metadata !20, i64 288, metadata !16, i64 304, metadata !21, i64 312, metadata !13, i64 368, metadata !23, i64 384, metadata !23, i64 400, metadata !15, i64 416, metadata !25, i64 432, metadata !26, i64 448, metadata !9, i64 464, metadata !9, i64 468, metadata !18, i64 472, metadata !15, i64 480, metadata !27, i64 496, metadata !16, i64 536, metadata !17, i64 544, metadata !29, i64 552, metadata !23, i64 576, metadata !15, i64 592, metadata !15, i64 608, metadata !15, i64 624, metadata !16, i64 640, metadata !16, i64 648, metadata !9, i64 656, metadata !18, i64 664, metadata !18, i64 672, metadata !17, i64 680}
!13 = metadata !{metadata !"_ZTSN7Minisat3vecINS_5lboolEEE", metadata !14, i64 0, metadata !9, i64 8, metadata !9, i64 12}
!14 = metadata !{metadata !"any pointer", metadata !7, i64 0}
!15 = metadata !{metadata !"_ZTSN7Minisat3vecINS_3LitEEE", metadata !14, i64 0, metadata !9, i64 8, metadata !9, i64 12}
!16 = metadata !{metadata !"double", metadata !7, i64 0}
!17 = metadata !{metadata !"bool", metadata !7, i64 0}
!18 = metadata !{metadata !"long long", metadata !7, i64 0}
!19 = metadata !{metadata !"_ZTSN7Minisat3vecIjEE", metadata !14, i64 0, metadata !9, i64 8, metadata !9, i64 12}
!20 = metadata !{metadata !"_ZTSN7Minisat3vecIdEE", metadata !14, i64 0, metadata !9, i64 8, metadata !9, i64 12}
!21 = metadata !{metadata !"_ZTSN7Minisat8OccListsINS_3LitENS_3vecINS_6Solver7WatcherEEENS3_14WatcherDeletedEEE", metadata !22, i64 0, metadata !23, i64 16, metadata !15, i64 32, metadata !24, i64 48}
!22 = metadata !{metadata !"_ZTSN7Minisat3vecINS0_INS_6Solver7WatcherEEEEE", metadata !14, i64 0, metadata !9, i64 8, metadata !9, i64 12}
!23 = metadata !{metadata !"_ZTSN7Minisat3vecIcEE", metadata !14, i64 0, metadata !9, i64 8, metadata !9, i64 12}
!24 = metadata !{metadata !"_ZTSN7Minisat6Solver14WatcherDeletedE", metadata !7, i64 0}
!25 = metadata !{metadata !"_ZTSN7Minisat3vecIiEE", metadata !14, i64 0, metadata !9, i64 8, metadata !9, i64 12}
!26 = metadata !{metadata !"_ZTSN7Minisat3vecINS_6Solver7VarDataEEE", metadata !14, i64 0, metadata !9, i64 8, metadata !9, i64 12}
!27 = metadata !{metadata !"_ZTSN7Minisat4HeapINS_6Solver10VarOrderLtEEE", metadata !28, i64 0, metadata !25, i64 8, metadata !25, i64 24}
!28 = metadata !{metadata !"_ZTSN7Minisat6Solver10VarOrderLtE", metadata !7, i64 0}
!29 = metadata !{metadata !"_ZTSN7Minisat15ClauseAllocatorE", metadata !17, i64 20}
!30 = metadata !{metadata !12, metadata !18, i64 192}
!31 = metadata !{metadata !12, metadata !18, i64 168}
!32 = metadata !{metadata !12, metadata !18, i64 176}
!33 = metadata !{metadata !12, metadata !18, i64 184}
!34 = metadata !{metadata !12, metadata !18, i64 232}
!35 = metadata !{metadata !12, metadata !18, i64 224}
!36 = metadata !{metadata !9, metadata !9, i64 0}
!37 = metadata !{metadata !38, metadata !38, i64 0}
!38 = metadata !{metadata !"vtable pointer", metadata !8, i64 0}
!39 = metadata !{metadata !40, metadata !14, i64 8}
!40 = metadata !{metadata !"_ZTSN7Minisat6OptionE", metadata !14, i64 8, metadata !14, i64 16, metadata !14, i64 24, metadata !14, i64 32}
!41 = metadata !{metadata !40, metadata !14, i64 16}
!42 = metadata !{metadata !40, metadata !14, i64 24}
!43 = metadata !{metadata !40, metadata !14, i64 32}
!44 = metadata !{metadata !45, metadata !9, i64 8}
!45 = metadata !{metadata !"_ZTSN7Minisat3vecIPNS_6OptionEEE", metadata !14, i64 0, metadata !9, i64 8, metadata !9, i64 12}
!46 = metadata !{metadata !45, metadata !14, i64 0}
!47 = metadata !{metadata !14, metadata !14, i64 0}
!48 = metadata !{metadata !49, metadata !9, i64 48}
!49 = metadata !{metadata !"_ZTSN7Minisat9IntOptionE", metadata !50, i64 40, metadata !9, i64 48}
!50 = metadata !{metadata !"_ZTSN7Minisat8IntRangeE", metadata !9, i64 0, metadata !9, i64 4}
!51 = metadata !{metadata !12, metadata !9, i64 40}
!52 = metadata !{metadata !53, metadata !18, i64 8}
!53 = metadata !{metadata !"_ZTS6rlimit", metadata !18, i64 0, metadata !18, i64 8}
!54 = metadata !{metadata !53, metadata !18, i64 0}
!55 = metadata !{metadata !56, metadata !14, i64 0}
!56 = metadata !{metadata !"_ZTSN7Minisat12StreamBufferE", metadata !14, i64 0, metadata !7, i64 8, metadata !9, i64 1048584, metadata !9, i64 1048588}
!57 = metadata !{metadata !56, metadata !9, i64 1048588}
!58 = metadata !{metadata !56, metadata !9, i64 1048584}
!59 = metadata !{metadata !7, metadata !7, i64 0}
!60 = metadata !{metadata !15, metadata !14, i64 0}
!61 = metadata !{metadata !15, metadata !9, i64 8}
!62 = metadata !{metadata !15, metadata !9, i64 12}
!63 = metadata !{metadata !26, metadata !9, i64 8}
!64 = metadata !{metadata !19, metadata !9, i64 8}
!65 = metadata !{metadata !13, metadata !14, i64 0}
!66 = metadata !{metadata !67, metadata !7, i64 0}
!67 = metadata !{metadata !"_ZTSN7Minisat5lboolE", metadata !7, i64 0}
!68 = metadata !{metadata !12, metadata !17, i64 680}
!69 = metadata !{metadata !49, metadata !9, i64 44}
!70 = metadata !{metadata !49, metadata !9, i64 40}
!71 = metadata !{metadata !45, metadata !9, i64 12}
!72 = metadata !{metadata !16, metadata !16, i64 0}
!73 = metadata !{metadata !12, metadata !16, i64 48}
!74 = metadata !{metadata !12, metadata !16, i64 56}
!75 = metadata !{metadata !12, metadata !16, i64 64}
!76 = metadata !{metadata !12, metadata !16, i64 72}
!77 = metadata !{metadata !17, metadata !17, i64 0}
!78 = metadata !{i8 0, i8 2}
!79 = metadata !{metadata !12, metadata !17, i64 80}
!80 = metadata !{metadata !12, metadata !9, i64 84}
!81 = metadata !{metadata !12, metadata !9, i64 88}
!82 = metadata !{metadata !12, metadata !17, i64 92}
!83 = metadata !{metadata !12, metadata !17, i64 93}
!84 = metadata !{metadata !12, metadata !16, i64 96}
!85 = metadata !{metadata !12, metadata !9, i64 104}
!86 = metadata !{metadata !12, metadata !16, i64 112}
!87 = metadata !{metadata !12, metadata !16, i64 120}
!88 = metadata !{metadata !12, metadata !16, i64 128}
!89 = metadata !{metadata !12, metadata !9, i64 136}
!90 = metadata !{metadata !12, metadata !16, i64 144}
!91 = metadata !{metadata !12, metadata !17, i64 240}
!92 = metadata !{metadata !12, metadata !16, i64 280}
!93 = metadata !{metadata !12, metadata !16, i64 304}
!94 = metadata !{metadata !12, metadata !9, i64 468}
!95 = metadata !{metadata !12, metadata !17, i64 544}
!96 = metadata !{metadata !29, metadata !17, i64 20}
!97 = metadata !{metadata !25, metadata !14, i64 0}
!98 = metadata !{metadata !25, metadata !9, i64 8}
!99 = metadata !{metadata !25, metadata !9, i64 12}
!100 = metadata !{metadata !26, metadata !14, i64 0}
!101 = metadata !{metadata !26, metadata !9, i64 12}
!102 = metadata !{metadata !23, metadata !14, i64 0}
!103 = metadata !{metadata !23, metadata !9, i64 8}
!104 = metadata !{metadata !23, metadata !9, i64 12}
!105 = metadata !{metadata !13, metadata !9, i64 8}
!106 = metadata !{metadata !13, metadata !9, i64 12}
!107 = metadata !{metadata !22, metadata !14, i64 0}
!108 = metadata !{metadata !22, metadata !9, i64 8}
!109 = metadata !{metadata !110, metadata !14, i64 0}
!110 = metadata !{metadata !"_ZTSN7Minisat3vecINS_6Solver7WatcherEEE", metadata !14, i64 0, metadata !9, i64 8, metadata !9, i64 12}
!111 = metadata !{metadata !110, metadata !9, i64 8}
!112 = metadata !{metadata !110, metadata !9, i64 12}
!113 = metadata !{metadata !22, metadata !9, i64 12}
!114 = metadata !{metadata !20, metadata !14, i64 0}
!115 = metadata !{metadata !20, metadata !9, i64 8}
!116 = metadata !{metadata !20, metadata !9, i64 12}
!117 = metadata !{metadata !19, metadata !14, i64 0}
!118 = metadata !{metadata !19, metadata !9, i64 12}
!119 = metadata !{metadata !120, metadata !14, i64 0}
!120 = metadata !{metadata !"_ZTSN7Minisat15RegionAllocatorIjEE", metadata !14, i64 0, metadata !9, i64 8, metadata !9, i64 12, metadata !9, i64 16}
!121 = metadata !{metadata !12, metadata !18, i64 200}
!122 = metadata !{metadata !"branch_weights", i32 64, i32 4}
!123 = metadata !{metadata !"branch_weights", i32 4, i32 64}
!124 = metadata !{metadata !12, metadata !9, i64 464}
!125 = metadata !{metadata !126, metadata !9, i64 0}
!126 = metadata !{metadata !"_ZTSN7Minisat6Solver7WatcherE", metadata !9, i64 0, metadata !127, i64 4}
!127 = metadata !{metadata !"_ZTSN7Minisat3LitE", metadata !9, i64 0}
!128 = metadata !{metadata !120, metadata !9, i64 8}
!129 = metadata !{metadata !127, metadata !9, i64 0}
!130 = metadata !{metadata !12, metadata !18, i64 472}
!131 = metadata !{metadata !12, metadata !18, i64 216}
!132 = metadata !{metadata !12, metadata !18, i64 208}
!133 = metadata !{metadata !134, metadata !9, i64 0}
!134 = metadata !{metadata !"_ZTSN7Minisat6Solver7VarDataE", metadata !9, i64 0, metadata !9, i64 4}
!135 = metadata !{metadata !120, metadata !9, i64 16}
!136 = metadata !{metadata !137, metadata !137, i64 0}
!137 = metadata !{metadata !"float", metadata !7, i64 0}
!138 = metadata !{metadata !134, metadata !9, i64 4}
!139 = metadata !{metadata !139, metadata !140, metadata !141}
!140 = metadata !{metadata !"llvm.loop.vectorize.width", i32 1}
!141 = metadata !{metadata !"llvm.loop.interleave.count", i32 1}
!142 = metadata !{metadata !142, metadata !140, metadata !141}
!143 = metadata !{metadata !12, metadata !9, i64 656}
!144 = metadata !{metadata !12, metadata !16, i64 648}
!145 = metadata !{metadata !12, metadata !16, i64 640}
!146 = metadata !{metadata !12, metadata !18, i64 664}
!147 = metadata !{metadata !12, metadata !18, i64 672}
!148 = metadata !{metadata !12, metadata !16, i64 536}
!149 = metadata !{metadata !12, metadata !18, i64 152}
!150 = metadata !{metadata !120, metadata !9, i64 12}
!151 = metadata !{metadata !151, metadata !140, metadata !141}
!152 = metadata !{metadata !152, metadata !140, metadata !141}
!153 = metadata !{metadata !153, metadata !140, metadata !141}
!154 = metadata !{metadata !154, metadata !140, metadata !141}
!155 = metadata !{metadata !156, metadata !17, i64 40}
!156 = metadata !{metadata !"_ZTSN7Minisat10BoolOptionE", metadata !17, i64 40}
!157 = metadata !{metadata !158, metadata !16, i64 48}
!158 = metadata !{metadata !"_ZTSN7Minisat12DoubleOptionE", metadata !159, i64 40, metadata !16, i64 64}
!159 = metadata !{metadata !"_ZTSN7Minisat11DoubleRangeE", metadata !16, i64 0, metadata !16, i64 8, metadata !17, i64 16, metadata !17, i64 17}
!160 = metadata !{metadata !158, metadata !17, i64 57}
!161 = metadata !{metadata !158, metadata !16, i64 40}
!162 = metadata !{metadata !158, metadata !17, i64 56}
!163 = metadata !{metadata !158, metadata !16, i64 64}
!164 = metadata !{metadata !164, metadata !140, metadata !141}
!165 = metadata !{metadata !165, metadata !140, metadata !141}
!166 = metadata !{metadata !167, metadata !6, i64 16}
!167 = metadata !{metadata !"_ZTS19malloc_statistics_t", metadata !9, i64 0, metadata !6, i64 8, metadata !6, i64 16, metadata !6, i64 24}

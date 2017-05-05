; ModuleID = 'structs.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%struct.s0 = type { i8 }
%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }
%struct.s1 = type { i8, i8, i16, i64 }
%struct.s2 = type { i8, i16 }
%struct.s3 = type { i8, double, i16 }
%struct.s4 = type { i8, double }
%struct.s5 = type { i8, i64 }
%struct.s6 = type { i8, float }
%union.s7 = type { i32 }

@main.foo = private unnamed_addr constant %struct.s0 { i8 107 }, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [34 x i8] c"sizeof(%s) = %d offset of c = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"s0\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [36 x i8] c"sizeof(%s) = %d offset of c   = %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"s1\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"sizeof(%s) = %d offset of d   = %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"sizeof(%s) = %d offset of s   = %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"sizeof(%s) = %d offset of n   = %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"s2\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"s3\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"s4\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"s5\00", align 1
@.str.12 = private unnamed_addr constant [36 x i8] c"sizeof(%s) = %d offset of i64 = %d\0A\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"s6\00", align 1
@.str.14 = private unnamed_addr constant [36 x i8] c"sizeof(%s) = %d offset of f   = %d\0A\00", align 1
@.str.15 = private unnamed_addr constant [36 x i8] c"sizeof(%s) = %d offset of j   = %d\0A\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"%c\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define %struct.s0* @make_s0(i8 signext %c) #0 {
entry:
  %c.addr = alloca i8, align 1
  %retval1 = alloca %struct.s0*, align 8
  store i8 %c, i8* %c.addr, align 1
  %call = call i8* @malloc(i64 1)
  %0 = bitcast i8* %call to %struct.s0*
  store %struct.s0* %0, %struct.s0** %retval1, align 8
  %1 = load i8, i8* %c.addr, align 1
  %2 = load %struct.s0*, %struct.s0** %retval1, align 8
  %c2 = getelementptr inbounds %struct.s0, %struct.s0* %2, i32 0, i32 0
  store i8 %1, i8* %c2, align 1
  %3 = load %struct.s0*, %struct.s0** %retval1, align 8
  ret %struct.s0* %3
}

declare i8* @malloc(i64) #1

; Function Attrs: nounwind ssp uwtable
define %struct.s1* @make_s1(i8 signext %c, i8 signext %d, i16 signext %s, i64 %n) #0 {
entry:
  %c.addr = alloca i8, align 1
  %d.addr = alloca i8, align 1
  %s.addr = alloca i16, align 2
  %n.addr = alloca i64, align 8
  %retval1 = alloca %struct.s1*, align 8
  store i8 %c, i8* %c.addr, align 1
  store i8 %d, i8* %d.addr, align 1
  store i16 %s, i16* %s.addr, align 2
  store i64 %n, i64* %n.addr, align 8
  %call = call i8* @malloc(i64 16)
  %0 = bitcast i8* %call to %struct.s1*
  store %struct.s1* %0, %struct.s1** %retval1, align 8
  %1 = load i8, i8* %c.addr, align 1
  %2 = load %struct.s1*, %struct.s1** %retval1, align 8
  %c2 = getelementptr inbounds %struct.s1, %struct.s1* %2, i32 0, i32 0
  store i8 %1, i8* %c2, align 8
  %3 = load i8, i8* %d.addr, align 1
  %4 = load %struct.s1*, %struct.s1** %retval1, align 8
  %d3 = getelementptr inbounds %struct.s1, %struct.s1* %4, i32 0, i32 1
  store i8 %3, i8* %d3, align 1
  %5 = load i16, i16* %s.addr, align 2
  %6 = load %struct.s1*, %struct.s1** %retval1, align 8
  %s4 = getelementptr inbounds %struct.s1, %struct.s1* %6, i32 0, i32 2
  store i16 %5, i16* %s4, align 2
  %7 = load i64, i64* %n.addr, align 8
  %8 = load %struct.s1*, %struct.s1** %retval1, align 8
  %n5 = getelementptr inbounds %struct.s1, %struct.s1* %8, i32 0, i32 3
  store i64 %7, i64* %n5, align 8
  %9 = load %struct.s1*, %struct.s1** %retval1, align 8
  ret %struct.s1* %9
}

; Function Attrs: nounwind ssp uwtable
define %struct.s2* @make_s2(i8 signext %c, i16 signext %s) #0 {
entry:
  %c.addr = alloca i8, align 1
  %s.addr = alloca i16, align 2
  %retval1 = alloca %struct.s2*, align 8
  store i8 %c, i8* %c.addr, align 1
  store i16 %s, i16* %s.addr, align 2
  %call = call i8* @malloc(i64 4)
  %0 = bitcast i8* %call to %struct.s2*
  store %struct.s2* %0, %struct.s2** %retval1, align 8
  %1 = load i8, i8* %c.addr, align 1
  %2 = load %struct.s2*, %struct.s2** %retval1, align 8
  %c2 = getelementptr inbounds %struct.s2, %struct.s2* %2, i32 0, i32 0
  store i8 %1, i8* %c2, align 2
  %3 = load i16, i16* %s.addr, align 2
  %4 = load %struct.s2*, %struct.s2** %retval1, align 8
  %s3 = getelementptr inbounds %struct.s2, %struct.s2* %4, i32 0, i32 1
  store i16 %3, i16* %s3, align 2
  %5 = load %struct.s2*, %struct.s2** %retval1, align 8
  ret %struct.s2* %5
}

; Function Attrs: nounwind ssp uwtable
define %struct.s3* @make_s3(i8 signext %c, double %d, i16 signext %s) #0 {
entry:
  %c.addr = alloca i8, align 1
  %d.addr = alloca double, align 8
  %s.addr = alloca i16, align 2
  %retval1 = alloca %struct.s3*, align 8
  store i8 %c, i8* %c.addr, align 1
  store double %d, double* %d.addr, align 8
  store i16 %s, i16* %s.addr, align 2
  %call = call i8* @malloc(i64 24)
  %0 = bitcast i8* %call to %struct.s3*
  store %struct.s3* %0, %struct.s3** %retval1, align 8
  %1 = load i8, i8* %c.addr, align 1
  %2 = load %struct.s3*, %struct.s3** %retval1, align 8
  %c2 = getelementptr inbounds %struct.s3, %struct.s3* %2, i32 0, i32 0
  store i8 %1, i8* %c2, align 8
  %3 = load double, double* %d.addr, align 8
  %4 = load %struct.s3*, %struct.s3** %retval1, align 8
  %d3 = getelementptr inbounds %struct.s3, %struct.s3* %4, i32 0, i32 1
  store double %3, double* %d3, align 8
  %5 = load i16, i16* %s.addr, align 2
  %6 = load %struct.s3*, %struct.s3** %retval1, align 8
  %s4 = getelementptr inbounds %struct.s3, %struct.s3* %6, i32 0, i32 2
  store i16 %5, i16* %s4, align 8
  %7 = load %struct.s3*, %struct.s3** %retval1, align 8
  ret %struct.s3* %7
}

; Function Attrs: nounwind ssp uwtable
define %struct.s4* @make_s4(i8 signext %c, double %d) #0 {
entry:
  %c.addr = alloca i8, align 1
  %d.addr = alloca double, align 8
  %retval1 = alloca %struct.s4*, align 8
  store i8 %c, i8* %c.addr, align 1
  store double %d, double* %d.addr, align 8
  %call = call i8* @malloc(i64 16)
  %0 = bitcast i8* %call to %struct.s4*
  store %struct.s4* %0, %struct.s4** %retval1, align 8
  %1 = load i8, i8* %c.addr, align 1
  %2 = load %struct.s4*, %struct.s4** %retval1, align 8
  %c2 = getelementptr inbounds %struct.s4, %struct.s4* %2, i32 0, i32 0
  store i8 %1, i8* %c2, align 8
  %3 = load double, double* %d.addr, align 8
  %4 = load %struct.s4*, %struct.s4** %retval1, align 8
  %d3 = getelementptr inbounds %struct.s4, %struct.s4* %4, i32 0, i32 1
  store double %3, double* %d3, align 8
  %5 = load %struct.s4*, %struct.s4** %retval1, align 8
  ret %struct.s4* %5
}

; Function Attrs: nounwind ssp uwtable
define %struct.s5* @make_s5(i8 signext %c, i64 %i64) #0 {
entry:
  %c.addr = alloca i8, align 1
  %i64.addr = alloca i64, align 8
  %retval1 = alloca %struct.s5*, align 8
  store i8 %c, i8* %c.addr, align 1
  store i64 %i64, i64* %i64.addr, align 8
  %call = call i8* @malloc(i64 16)
  %0 = bitcast i8* %call to %struct.s5*
  store %struct.s5* %0, %struct.s5** %retval1, align 8
  %1 = load i8, i8* %c.addr, align 1
  %2 = load %struct.s5*, %struct.s5** %retval1, align 8
  %c2 = getelementptr inbounds %struct.s5, %struct.s5* %2, i32 0, i32 0
  store i8 %1, i8* %c2, align 8
  %3 = load i64, i64* %i64.addr, align 8
  %4 = load %struct.s5*, %struct.s5** %retval1, align 8
  %i643 = getelementptr inbounds %struct.s5, %struct.s5* %4, i32 0, i32 1
  store i64 %3, i64* %i643, align 8
  %5 = load %struct.s5*, %struct.s5** %retval1, align 8
  ret %struct.s5* %5
}

; Function Attrs: nounwind ssp uwtable
define %struct.s6* @make_s6(i8 signext %c, float %f) #0 {
entry:
  %c.addr = alloca i8, align 1
  %f.addr = alloca float, align 4
  %retval1 = alloca %struct.s6*, align 8
  store i8 %c, i8* %c.addr, align 1
  store float %f, float* %f.addr, align 4
  %call = call i8* @malloc(i64 8)
  %0 = bitcast i8* %call to %struct.s6*
  store %struct.s6* %0, %struct.s6** %retval1, align 8
  %1 = load i8, i8* %c.addr, align 1
  %2 = load %struct.s6*, %struct.s6** %retval1, align 8
  %c2 = getelementptr inbounds %struct.s6, %struct.s6* %2, i32 0, i32 0
  store i8 %1, i8* %c2, align 4
  %3 = load float, float* %f.addr, align 4
  %4 = load %struct.s6*, %struct.s6** %retval1, align 8
  %f3 = getelementptr inbounds %struct.s6, %struct.s6* %4, i32 0, i32 1
  store float %3, float* %f3, align 4
  %5 = load %struct.s6*, %struct.s6** %retval1, align 8
  ret %struct.s6* %5
}

; Function Attrs: nounwind ssp uwtable
define %union.s7* @make_s7(i8 signext %c, i16 signext %s, i32 %j) #0 {
entry:
  %c.addr = alloca i8, align 1
  %s.addr = alloca i16, align 2
  %j.addr = alloca i32, align 4
  %retval1 = alloca %union.s7*, align 8
  store i8 %c, i8* %c.addr, align 1
  store i16 %s, i16* %s.addr, align 2
  store i32 %j, i32* %j.addr, align 4
  %call = call i8* @malloc(i64 4)
  %0 = bitcast i8* %call to %union.s7*
  store %union.s7* %0, %union.s7** %retval1, align 8
  %1 = load i8, i8* %c.addr, align 1
  %2 = load %union.s7*, %union.s7** %retval1, align 8
  %c2 = bitcast %union.s7* %2 to i8*
  store i8 %1, i8* %c2, align 4
  %3 = load i16, i16* %s.addr, align 2
  %4 = load %union.s7*, %union.s7** %retval1, align 8
  %s3 = bitcast %union.s7* %4 to i16*
  store i16 %3, i16* %s3, align 4
  %5 = load i32, i32* %j.addr, align 4
  %6 = load %union.s7*, %union.s7** %retval1, align 8
  %j4 = bitcast %union.s7* %6 to i32*
  store i32 %5, i32* %j4, align 4
  %7 = load %union.s7*, %union.s7** %retval1, align 8
  ret %union.s7* %7
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %foo = alloca %struct.s0, align 1
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = bitcast %struct.s0* %foo to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds (%struct.s0, %struct.s0* @main.foo, i32 0, i32 0), i64 1, i32 1, i1 false)
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32 1, i32 0)
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %3 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call2 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %3, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32 16, i32 0)
  %4 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call3 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %4, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32 16, i32 1)
  %5 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call4 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %5, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32 16, i32 2)
  %6 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call5 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %6, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32 16, i32 8)
  %7 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call6 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %8 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call7 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %8, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), i32 4, i32 0)
  %9 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call8 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %9, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), i32 4, i32 2)
  %10 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call9 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %11 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call10 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %11, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i32 24, i32 0)
  %12 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call11 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %12, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i32 24, i32 8)
  %13 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call12 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %13, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i32 24, i32 16)
  %14 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call13 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %14, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %15 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call14 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %15, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i32 16, i32 0)
  %16 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call15 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %16, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i32 16, i32 8)
  %17 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call16 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %17, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %18 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call17 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %18, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i32 16, i32 0)
  %19 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call18 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %19, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i32 16, i32 8)
  %20 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call19 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %20, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %21 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call20 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %21, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0), i32 8, i32 0)
  %22 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call21 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %22, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0), i32 8, i32 4)
  %23 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call22 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %23, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %24 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call23 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %24, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0), i32 4, i32 0)
  %25 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call24 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %25, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0), i32 4, i32 0)
  %26 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call25 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %26, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0), i32 4, i32 0)
  %27 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call26 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %27, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %28 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %c = getelementptr inbounds %struct.s0, %struct.s0* %foo, i32 0, i32 0
  %29 = load i8, i8* %c, align 1
  %conv = sext i8 %29 to i32
  %call27 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %28, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0), i32 %conv)
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

declare i32 @fprintf(%struct.__sFILE*, i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.8.1 (tags/RELEASE_381/final)"}

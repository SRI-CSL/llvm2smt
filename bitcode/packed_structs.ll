; ModuleID = 'structs.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

%struct.__sFILE = type <{ i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }>
%struct.__sFILEX = type opaque
%struct.__sbuf = type <{ i8*, i32 }>
%struct.s0 = type { i8 }
%struct.s1 = type <{ i8, i8, i16, i64 }>
%struct.s2 = type <{ i8, i16 }>
%struct.s3 = type <{ i8, double, i16 }>
%struct.s4 = type <{ i8, double }>
%struct.s5 = type <{ i8, i64 }>
%struct.s6 = type <{ i8, float }>
%union.s7 = type <{ i32 }>

@__stderrp = external global %struct.__sFILE*
@.str = private unnamed_addr constant [34 x i8] c"sizeof(%s) = %d offset of d = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"s0\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"s1\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"s2\00", align 1
@.str5 = private unnamed_addr constant [3 x i8] c"s3\00", align 1
@.str6 = private unnamed_addr constant [3 x i8] c"s4\00", align 1
@.str7 = private unnamed_addr constant [3 x i8] c"s5\00", align 1
@.str8 = private unnamed_addr constant [3 x i8] c"s6\00", align 1

; Function Attrs: nounwind ssp uwtable
define %struct.s0* @make_s0(i8 signext %c) #0 {
  %1 = alloca i8, align 1
  %retval = alloca %struct.s0*, align 8
  store i8 %c, i8* %1, align 1
  %2 = call i8* @malloc(i64 1)
  %3 = bitcast i8* %2 to %struct.s0*
  store %struct.s0* %3, %struct.s0** %retval, align 8
  %4 = load i8* %1, align 1
  %5 = load %struct.s0** %retval, align 8
  %6 = getelementptr inbounds %struct.s0* %5, i32 0, i32 0
  store i8 %4, i8* %6, align 1
  %7 = load %struct.s0** %retval, align 8
  ret %struct.s0* %7
}

declare i8* @malloc(i64) #1

; Function Attrs: nounwind ssp uwtable
define %struct.s1* @make_s1(i8 signext %c, i8 signext %d, i16 signext %s, i64 %n) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %3 = alloca i16, align 2
  %4 = alloca i64, align 8
  %retval = alloca %struct.s1*, align 8
  store i8 %c, i8* %1, align 1
  store i8 %d, i8* %2, align 1
  store i16 %s, i16* %3, align 2
  store i64 %n, i64* %4, align 8
  %5 = call i8* @malloc(i64 12)
  %6 = bitcast i8* %5 to %struct.s1*
  store %struct.s1* %6, %struct.s1** %retval, align 8
  %7 = load i8* %1, align 1
  %8 = load %struct.s1** %retval, align 8
  %9 = getelementptr inbounds %struct.s1* %8, i32 0, i32 0
  store i8 %7, i8* %9, align 1
  %10 = load i8* %2, align 1
  %11 = load %struct.s1** %retval, align 8
  %12 = getelementptr inbounds %struct.s1* %11, i32 0, i32 1
  store i8 %10, i8* %12, align 1
  %13 = load i16* %3, align 2
  %14 = load %struct.s1** %retval, align 8
  %15 = getelementptr inbounds %struct.s1* %14, i32 0, i32 2
  store i16 %13, i16* %15, align 1
  %16 = load i64* %4, align 8
  %17 = load %struct.s1** %retval, align 8
  %18 = getelementptr inbounds %struct.s1* %17, i32 0, i32 3
  store i64 %16, i64* %18, align 1
  %19 = load %struct.s1** %retval, align 8
  ret %struct.s1* %19
}

; Function Attrs: nounwind ssp uwtable
define %struct.s2* @make_s2(i8 signext %c, i16 signext %s) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i16, align 2
  %retval = alloca %struct.s2*, align 8
  store i8 %c, i8* %1, align 1
  store i16 %s, i16* %2, align 2
  %3 = call i8* @malloc(i64 3)
  %4 = bitcast i8* %3 to %struct.s2*
  store %struct.s2* %4, %struct.s2** %retval, align 8
  %5 = load i8* %1, align 1
  %6 = load %struct.s2** %retval, align 8
  %7 = getelementptr inbounds %struct.s2* %6, i32 0, i32 0
  store i8 %5, i8* %7, align 1
  %8 = load i16* %2, align 2
  %9 = load %struct.s2** %retval, align 8
  %10 = getelementptr inbounds %struct.s2* %9, i32 0, i32 1
  store i16 %8, i16* %10, align 1
  %11 = load %struct.s2** %retval, align 8
  ret %struct.s2* %11
}

; Function Attrs: nounwind ssp uwtable
define %struct.s3* @make_s3(i8 signext %c, double %d, i16 signext %s) #0 {
  %1 = alloca i8, align 1
  %2 = alloca double, align 8
  %3 = alloca i16, align 2
  %retval = alloca %struct.s3*, align 8
  store i8 %c, i8* %1, align 1
  store double %d, double* %2, align 8
  store i16 %s, i16* %3, align 2
  %4 = call i8* @malloc(i64 11)
  %5 = bitcast i8* %4 to %struct.s3*
  store %struct.s3* %5, %struct.s3** %retval, align 8
  %6 = load i8* %1, align 1
  %7 = load %struct.s3** %retval, align 8
  %8 = getelementptr inbounds %struct.s3* %7, i32 0, i32 0
  store i8 %6, i8* %8, align 1
  %9 = load double* %2, align 8
  %10 = load %struct.s3** %retval, align 8
  %11 = getelementptr inbounds %struct.s3* %10, i32 0, i32 1
  store double %9, double* %11, align 1
  %12 = load i16* %3, align 2
  %13 = load %struct.s3** %retval, align 8
  %14 = getelementptr inbounds %struct.s3* %13, i32 0, i32 2
  store i16 %12, i16* %14, align 1
  %15 = load %struct.s3** %retval, align 8
  ret %struct.s3* %15
}

; Function Attrs: nounwind ssp uwtable
define %struct.s4* @make_s4(i8 signext %c, double %d) #0 {
  %1 = alloca i8, align 1
  %2 = alloca double, align 8
  %retval = alloca %struct.s4*, align 8
  store i8 %c, i8* %1, align 1
  store double %d, double* %2, align 8
  %3 = call i8* @malloc(i64 9)
  %4 = bitcast i8* %3 to %struct.s4*
  store %struct.s4* %4, %struct.s4** %retval, align 8
  %5 = load i8* %1, align 1
  %6 = load %struct.s4** %retval, align 8
  %7 = getelementptr inbounds %struct.s4* %6, i32 0, i32 0
  store i8 %5, i8* %7, align 1
  %8 = load double* %2, align 8
  %9 = load %struct.s4** %retval, align 8
  %10 = getelementptr inbounds %struct.s4* %9, i32 0, i32 1
  store double %8, double* %10, align 1
  %11 = load %struct.s4** %retval, align 8
  ret %struct.s4* %11
}

; Function Attrs: nounwind ssp uwtable
define %struct.s5* @make_s5(i8 signext %c, i64 %i64) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i64, align 8
  %retval = alloca %struct.s5*, align 8
  store i8 %c, i8* %1, align 1
  store i64 %i64, i64* %2, align 8
  %3 = call i8* @malloc(i64 9)
  %4 = bitcast i8* %3 to %struct.s5*
  store %struct.s5* %4, %struct.s5** %retval, align 8
  %5 = load i8* %1, align 1
  %6 = load %struct.s5** %retval, align 8
  %7 = getelementptr inbounds %struct.s5* %6, i32 0, i32 0
  store i8 %5, i8* %7, align 1
  %8 = load i64* %2, align 8
  %9 = load %struct.s5** %retval, align 8
  %10 = getelementptr inbounds %struct.s5* %9, i32 0, i32 1
  store i64 %8, i64* %10, align 1
  %11 = load %struct.s5** %retval, align 8
  ret %struct.s5* %11
}

; Function Attrs: nounwind ssp uwtable
define %struct.s6* @make_s6(i8 signext %c, float %f) #0 {
  %1 = alloca i8, align 1
  %2 = alloca float, align 4
  %retval = alloca %struct.s6*, align 8
  store i8 %c, i8* %1, align 1
  store float %f, float* %2, align 4
  %3 = call i8* @malloc(i64 5)
  %4 = bitcast i8* %3 to %struct.s6*
  store %struct.s6* %4, %struct.s6** %retval, align 8
  %5 = load i8* %1, align 1
  %6 = load %struct.s6** %retval, align 8
  %7 = getelementptr inbounds %struct.s6* %6, i32 0, i32 0
  store i8 %5, i8* %7, align 1
  %8 = load float* %2, align 4
  %9 = load %struct.s6** %retval, align 8
  %10 = getelementptr inbounds %struct.s6* %9, i32 0, i32 1
  store float %8, float* %10, align 1
  %11 = load %struct.s6** %retval, align 8
  ret %struct.s6* %11
}

; Function Attrs: nounwind ssp uwtable
define %union.s7* @make_s7(i8 signext %c, i16 signext %s, i32 %j) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i16, align 2
  %3 = alloca i32, align 4
  %retval = alloca %union.s7*, align 8
  store i8 %c, i8* %1, align 1
  store i16 %s, i16* %2, align 2
  store i32 %j, i32* %3, align 4
  %4 = call i8* @malloc(i64 4)
  %5 = bitcast i8* %4 to %union.s7*
  store %union.s7* %5, %union.s7** %retval, align 8
  %6 = load i8* %1, align 1
  %7 = load %union.s7** %retval, align 8
  %8 = bitcast %union.s7* %7 to i8*
  store i8 %6, i8* %8, align 1
  %9 = load i16* %2, align 2
  %10 = load %union.s7** %retval, align 8
  %11 = bitcast %union.s7* %10 to i16*
  store i16 %9, i16* %11, align 1
  %12 = load i32* %3, align 4
  %13 = load %union.s7** %retval, align 8
  %14 = bitcast %union.s7* %13 to i32*
  store i32 %12, i32* %14, align 1
  %15 = load %union.s7** %retval, align 8
  ret %union.s7* %15
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load %struct.__sFILE** @__stderrp, align 8
  %5 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %4, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 1, i32 0)
  %6 = load %struct.__sFILE** @__stderrp, align 8
  %7 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %6, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  %8 = load %struct.__sFILE** @__stderrp, align 8
  %9 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %8, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32 12, i32 0)
  %10 = load %struct.__sFILE** @__stderrp, align 8
  %11 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %10, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32 12, i32 1)
  %12 = load %struct.__sFILE** @__stderrp, align 8
  %13 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %12, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32 12, i32 2)
  %14 = load %struct.__sFILE** @__stderrp, align 8
  %15 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %14, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32 12, i32 4)
  %16 = load %struct.__sFILE** @__stderrp, align 8
  %17 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %16, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  %18 = load %struct.__sFILE** @__stderrp, align 8
  %19 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %18, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32 3, i32 0)
  %20 = load %struct.__sFILE** @__stderrp, align 8
  %21 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %20, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32 3, i32 1)
  %22 = load %struct.__sFILE** @__stderrp, align 8
  %23 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %22, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  %24 = load %struct.__sFILE** @__stderrp, align 8
  %25 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %24, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0), i32 11, i32 0)
  %26 = load %struct.__sFILE** @__stderrp, align 8
  %27 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %26, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32 11, i32 1)
  %28 = load %struct.__sFILE** @__stderrp, align 8
  %29 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %28, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32 11, i32 9)
  %30 = load %struct.__sFILE** @__stderrp, align 8
  %31 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %30, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  %32 = load %struct.__sFILE** @__stderrp, align 8
  %33 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %32, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0), i32 9, i32 1)
  %34 = load %struct.__sFILE** @__stderrp, align 8
  %35 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %34, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0), i32 9, i32 1)
  %36 = load %struct.__sFILE** @__stderrp, align 8
  %37 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %36, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  %38 = load %struct.__sFILE** @__stderrp, align 8
  %39 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %38, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str7, i32 0, i32 0), i32 9, i32 0)
  %40 = load %struct.__sFILE** @__stderrp, align 8
  %41 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %40, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str7, i32 0, i32 0), i32 9, i32 1)
  %42 = load %struct.__sFILE** @__stderrp, align 8
  %43 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %42, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  %44 = load %struct.__sFILE** @__stderrp, align 8
  %45 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %44, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str8, i32 0, i32 0), i32 5, i32 0)
  %46 = load %struct.__sFILE** @__stderrp, align 8
  %47 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %46, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str8, i32 0, i32 0), i32 5, i32 1)
  %48 = load %struct.__sFILE** @__stderrp, align 8
  %49 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %48, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  %50 = load %struct.__sFILE** @__stderrp, align 8
  %51 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %50, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str8, i32 0, i32 0), i32 4, i32 0)
  %52 = load %struct.__sFILE** @__stderrp, align 8
  %53 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %52, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str8, i32 0, i32 0), i32 4, i32 0)
  %54 = load %struct.__sFILE** @__stderrp, align 8
  %55 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %54, i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str8, i32 0, i32 0), i32 4, i32 0)
  %56 = load %struct.__sFILE** @__stderrp, align 8
  %57 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %56, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  ret i32 0
}

declare i32 @fprintf(%struct.__sFILE*, i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Apple LLVM version 6.0 (clang-600.0.57) (based on LLVM 3.5svn)"}

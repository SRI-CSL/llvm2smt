; ModuleID = 'structs.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

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

@main.x0 = private unnamed_addr constant %struct.s0 { i8 48 }, align 1
@__stderrp = external global %struct.__sFILE*
@.str = private unnamed_addr constant [28 x i8] c"sizeof(%s) = %d, x0.c = %c\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"x0\00", align 1
@.str2 = private unnamed_addr constant [17 x i8] c"sizeof(%s) = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str5 = private unnamed_addr constant [3 x i8] c"x3\00", align 1
@.str6 = private unnamed_addr constant [34 x i8] c"sizeof(%s) = %d offset of d = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [3 x i8] c"x4\00", align 1
@.str8 = private unnamed_addr constant [3 x i8] c"x5\00", align 1
@.str9 = private unnamed_addr constant [3 x i8] c"x6\00", align 1
@.str10 = private unnamed_addr constant [3 x i8] c"s7\00", align 1

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
  %5 = call i8* @malloc(i64 16)
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
  store i16 %13, i16* %15, align 2
  %16 = load i64* %4, align 8
  %17 = load %struct.s1** %retval, align 8
  %18 = getelementptr inbounds %struct.s1* %17, i32 0, i32 3
  store i64 %16, i64* %18, align 8
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
  %3 = call i8* @malloc(i64 4)
  %4 = bitcast i8* %3 to %struct.s2*
  store %struct.s2* %4, %struct.s2** %retval, align 8
  %5 = load i8* %1, align 1
  %6 = load %struct.s2** %retval, align 8
  %7 = getelementptr inbounds %struct.s2* %6, i32 0, i32 0
  store i8 %5, i8* %7, align 1
  %8 = load i16* %2, align 2
  %9 = load %struct.s2** %retval, align 8
  %10 = getelementptr inbounds %struct.s2* %9, i32 0, i32 1
  store i16 %8, i16* %10, align 2
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
  %4 = call i8* @malloc(i64 24)
  %5 = bitcast i8* %4 to %struct.s3*
  store %struct.s3* %5, %struct.s3** %retval, align 8
  %6 = load i8* %1, align 1
  %7 = load %struct.s3** %retval, align 8
  %8 = getelementptr inbounds %struct.s3* %7, i32 0, i32 0
  store i8 %6, i8* %8, align 1
  %9 = load double* %2, align 8
  %10 = load %struct.s3** %retval, align 8
  %11 = getelementptr inbounds %struct.s3* %10, i32 0, i32 1
  store double %9, double* %11, align 8
  %12 = load i16* %3, align 2
  %13 = load %struct.s3** %retval, align 8
  %14 = getelementptr inbounds %struct.s3* %13, i32 0, i32 2
  store i16 %12, i16* %14, align 2
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
  %3 = call i8* @malloc(i64 16)
  %4 = bitcast i8* %3 to %struct.s4*
  store %struct.s4* %4, %struct.s4** %retval, align 8
  %5 = load i8* %1, align 1
  %6 = load %struct.s4** %retval, align 8
  %7 = getelementptr inbounds %struct.s4* %6, i32 0, i32 0
  store i8 %5, i8* %7, align 1
  %8 = load double* %2, align 8
  %9 = load %struct.s4** %retval, align 8
  %10 = getelementptr inbounds %struct.s4* %9, i32 0, i32 1
  store double %8, double* %10, align 8
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
  %3 = call i8* @malloc(i64 16)
  %4 = bitcast i8* %3 to %struct.s5*
  store %struct.s5* %4, %struct.s5** %retval, align 8
  %5 = load i8* %1, align 1
  %6 = load %struct.s5** %retval, align 8
  %7 = getelementptr inbounds %struct.s5* %6, i32 0, i32 0
  store i8 %5, i8* %7, align 1
  %8 = load i64* %2, align 8
  %9 = load %struct.s5** %retval, align 8
  %10 = getelementptr inbounds %struct.s5* %9, i32 0, i32 1
  store i64 %8, i64* %10, align 8
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
  %3 = call i8* @malloc(i64 8)
  %4 = bitcast i8* %3 to %struct.s6*
  store %struct.s6* %4, %struct.s6** %retval, align 8
  %5 = load i8* %1, align 1
  %6 = load %struct.s6** %retval, align 8
  %7 = getelementptr inbounds %struct.s6* %6, i32 0, i32 0
  store i8 %5, i8* %7, align 1
  %8 = load float* %2, align 4
  %9 = load %struct.s6** %retval, align 8
  %10 = getelementptr inbounds %struct.s6* %9, i32 0, i32 1
  store float %8, float* %10, align 4
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
  store i16 %9, i16* %11, align 2
  %12 = load i32* %3, align 4
  %13 = load %union.s7** %retval, align 8
  %14 = bitcast %union.s7* %13 to i32*
  store i32 %12, i32* %14, align 4
  %15 = load %union.s7** %retval, align 8
  ret %union.s7* %15
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %x0 = alloca %struct.s0, align 1
  %x1 = alloca %struct.s1, align 8
  %x2 = alloca %struct.s2, align 2
  %x3 = alloca %struct.s3, align 8
  %x4 = alloca %struct.s4, align 8
  %x5 = alloca %struct.s5, align 8
  %x6 = alloca %struct.s6, align 4
  %z0 = alloca %union.s7, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = bitcast %struct.s0* %x0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* getelementptr inbounds (%struct.s0* @main.x0, i32 0, i32 0), i64 1, i32 1, i1 false)
  %5 = load %struct.__sFILE** @__stderrp, align 8
  %6 = getelementptr inbounds %struct.s0* %x0, i32 0, i32 0
  %7 = load i8* %6, align 1
  %8 = sext i8 %7 to i32
  %9 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %5, i8* getelementptr inbounds ([28 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 1, i32 %8)
  %10 = load %struct.__sFILE** @__stderrp, align 8
  %11 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %10, i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32 16)
  %12 = load %struct.__sFILE** @__stderrp, align 8
  %13 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %12, i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32 4)
  %14 = load %struct.__sFILE** @__stderrp, align 8
  %15 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %14, i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0), i32 24)
  %16 = load %struct.__sFILE** @__stderrp, align 8
  %17 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %16, i8* getelementptr inbounds ([34 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str7, i32 0, i32 0), i32 16, i32 8)
  %18 = load %struct.__sFILE** @__stderrp, align 8
  %19 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %18, i8* getelementptr inbounds ([34 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str8, i32 0, i32 0), i32 16, i32 8)
  %20 = load %struct.__sFILE** @__stderrp, align 8
  %21 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %20, i8* getelementptr inbounds ([34 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str9, i32 0, i32 0), i32 8, i32 4)
  %22 = load %struct.__sFILE** @__stderrp, align 8
  %23 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %22, i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str10, i32 0, i32 0), i32 4)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

declare i32 @fprintf(%struct.__sFILE*, i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Apple LLVM version 6.0 (clang-600.0.57) (based on LLVM 3.5svn)"}

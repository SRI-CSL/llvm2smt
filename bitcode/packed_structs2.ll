; ModuleID = 'structs2.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

%struct.foo1 = type <{ i8*, i8, i64 }>
%struct.foo2 = type <{ i8, [7 x i8], i8*, i64 }>
%struct.foo3 = type <{ i8*, i8 }>
%struct.foo4 = type <{ i16, i8 }>
%struct.foo5 = type <{ i16, i8, [2 x i8] }>
%struct.foo6 = type { [4 x i8] }
%struct.foo7 = type { [8 x i8] }
%struct.foo8 = type { [8 x i8] }
%struct.foo9 = type { i8, %struct.foo9_inner }
%struct.foo9_inner = type <{ i8*, i16 }>
%struct.foo10 = type <{ i8, %struct.foo10*, i16 }>
%struct.foo11 = type <{ %struct.foo11*, i16, i8 }>
%struct.foo12 = type { %struct.foo12_inner, i8 }
%struct.foo12_inner = type <{ i8*, i16 }>

@.str = private unnamed_addr constant [29 x i8] c"sizeof(char *)        = %zu\0A\00", align 1
@.str1 = private unnamed_addr constant [29 x i8] c"sizeof(long)          = %zu\0A\00", align 1
@.str2 = private unnamed_addr constant [29 x i8] c"sizeof(int)           = %zu\0A\00", align 1
@.str3 = private unnamed_addr constant [29 x i8] c"sizeof(short)         = %zu\0A\00", align 1
@.str4 = private unnamed_addr constant [29 x i8] c"sizeof(char)          = %zu\0A\00", align 1
@.str5 = private unnamed_addr constant [29 x i8] c"sizeof(float)         = %zu\0A\00", align 1
@.str6 = private unnamed_addr constant [29 x i8] c"sizeof(double)        = %zu\0A\00", align 1
@.str7 = private unnamed_addr constant [29 x i8] c"sizeof(struct foo1)   = %zu\0A\00", align 1
@.str8 = private unnamed_addr constant [29 x i8] c"sizeof(struct foo2)   = %zu\0A\00", align 1
@.str9 = private unnamed_addr constant [29 x i8] c"sizeof(struct foo3)   = %zu\0A\00", align 1
@.str10 = private unnamed_addr constant [29 x i8] c"sizeof(struct foo4)   = %zu\0A\00", align 1
@.str11 = private unnamed_addr constant [29 x i8] c"sizeof(struct foo5)   = %zu\0A\00", align 1
@.str12 = private unnamed_addr constant [29 x i8] c"sizeof(struct foo6)   = %zu\0A\00", align 1
@.str13 = private unnamed_addr constant [29 x i8] c"sizeof(struct foo7)   = %zu\0A\00", align 1
@.str14 = private unnamed_addr constant [29 x i8] c"sizeof(struct foo8)   = %zu\0A\00", align 1
@.str15 = private unnamed_addr constant [29 x i8] c"sizeof(struct foo9)   = %zu\0A\00", align 1
@.str16 = private unnamed_addr constant [30 x i8] c"sizeof(struct foo10)   = %zu\0A\00", align 1
@.str17 = private unnamed_addr constant [30 x i8] c"sizeof(struct foo11)   = %zu\0A\00", align 1
@.str18 = private unnamed_addr constant [30 x i8] c"sizeof(struct foo12)   = %zu\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define %struct.foo1* @make_s1(i8 signext %c) #0 {
  %1 = alloca i8, align 1
  %retval = alloca %struct.foo1*, align 8
  store i8 %c, i8* %1, align 1
  %2 = call i8* @malloc(i64 17)
  %3 = bitcast i8* %2 to %struct.foo1*
  store %struct.foo1* %3, %struct.foo1** %retval, align 8
  %4 = load i8* %1, align 1
  %5 = load %struct.foo1** %retval, align 8
  %6 = getelementptr inbounds %struct.foo1* %5, i32 0, i32 1
  store i8 %4, i8* %6, align 1
  %7 = load %struct.foo1** %retval, align 8
  ret %struct.foo1* %7
}

declare i8* @malloc(i64) #1

; Function Attrs: nounwind ssp uwtable
define %struct.foo2* @make_s2(i8 signext %c) #0 {
  %1 = alloca i8, align 1
  %retval = alloca %struct.foo2*, align 8
  store i8 %c, i8* %1, align 1
  %2 = call i8* @malloc(i64 24)
  %3 = bitcast i8* %2 to %struct.foo2*
  store %struct.foo2* %3, %struct.foo2** %retval, align 8
  %4 = load i8* %1, align 1
  %5 = load %struct.foo2** %retval, align 8
  %6 = getelementptr inbounds %struct.foo2* %5, i32 0, i32 0
  store i8 %4, i8* %6, align 1
  %7 = load %struct.foo2** %retval, align 8
  ret %struct.foo2* %7
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo3* @make_s3(i8 signext %c) #0 {
  %1 = alloca i8, align 1
  %retval = alloca %struct.foo3*, align 8
  store i8 %c, i8* %1, align 1
  %2 = call i8* @malloc(i64 9)
  %3 = bitcast i8* %2 to %struct.foo3*
  store %struct.foo3* %3, %struct.foo3** %retval, align 8
  %4 = load i8* %1, align 1
  %5 = load %struct.foo3** %retval, align 8
  %6 = getelementptr inbounds %struct.foo3* %5, i32 0, i32 1
  store i8 %4, i8* %6, align 1
  %7 = load %struct.foo3** %retval, align 8
  ret %struct.foo3* %7
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo4* @make_s4(i8 signext %c) #0 {
  %1 = alloca i8, align 1
  %retval = alloca %struct.foo4*, align 8
  store i8 %c, i8* %1, align 1
  %2 = call i8* @malloc(i64 3)
  %3 = bitcast i8* %2 to %struct.foo4*
  store %struct.foo4* %3, %struct.foo4** %retval, align 8
  %4 = load i8* %1, align 1
  %5 = load %struct.foo4** %retval, align 8
  %6 = getelementptr inbounds %struct.foo4* %5, i32 0, i32 1
  store i8 %4, i8* %6, align 1
  %7 = load %struct.foo4** %retval, align 8
  ret %struct.foo4* %7
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo5* @make_s5(i8 signext %c) #0 {
  %1 = alloca i8, align 1
  %retval = alloca %struct.foo5*, align 8
  store i8 %c, i8* %1, align 1
  %2 = call i8* @malloc(i64 5)
  %3 = bitcast i8* %2 to %struct.foo5*
  store %struct.foo5* %3, %struct.foo5** %retval, align 8
  %4 = load i8* %1, align 1
  %5 = load %struct.foo5** %retval, align 8
  %6 = getelementptr inbounds %struct.foo5* %5, i32 0, i32 1
  store i8 %4, i8* %6, align 1
  %7 = load %struct.foo5** %retval, align 8
  ret %struct.foo5* %7
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo6* @make_s6(i32 %bigfield) #0 {
  %1 = alloca i32, align 4
  %retval = alloca %struct.foo6*, align 8
  store i32 %bigfield, i32* %1, align 4
  %2 = call i8* @malloc(i64 4)
  %3 = bitcast i8* %2 to %struct.foo6*
  store %struct.foo6* %3, %struct.foo6** %retval, align 8
  %4 = load i32* %1, align 4
  %5 = load %struct.foo6** %retval, align 8
  %6 = bitcast %struct.foo6* %5 to i32*
  %7 = load i32* %6, align 1
  %8 = and i32 %4, 2147483647
  %9 = and i32 %7, -2147483648
  %10 = or i32 %9, %8
  store i32 %10, i32* %6, align 1
  %11 = shl i32 %8, 1
  %12 = ashr i32 %11, 1
  %13 = load %struct.foo6** %retval, align 8
  ret %struct.foo6* %13
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo7* @make_s7(i32 %bigfield1) #0 {
  %1 = alloca i32, align 4
  %retval = alloca %struct.foo7*, align 8
  store i32 %bigfield1, i32* %1, align 4
  %2 = call i8* @malloc(i64 8)
  %3 = bitcast i8* %2 to %struct.foo7*
  store %struct.foo7* %3, %struct.foo7** %retval, align 8
  %4 = load i32* %1, align 4
  %5 = load %struct.foo7** %retval, align 8
  %6 = bitcast %struct.foo7* %5 to i64*
  %7 = zext i32 %4 to i64
  %8 = load i64* %6, align 1
  %9 = and i64 %7, 2147483647
  %10 = and i64 %8, -2147483648
  %11 = or i64 %10, %9
  store i64 %11, i64* %6, align 1
  %12 = shl i64 %9, 33
  %13 = ashr i64 %12, 33
  %14 = trunc i64 %13 to i32
  %15 = load %struct.foo7** %retval, align 8
  ret %struct.foo7* %15
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo8* @make_s8(i32 %bigfield1) #0 {
  %1 = alloca i32, align 4
  %retval = alloca %struct.foo8*, align 8
  store i32 %bigfield1, i32* %1, align 4
  %2 = call i8* @malloc(i64 8)
  %3 = bitcast i8* %2 to %struct.foo8*
  store %struct.foo8* %3, %struct.foo8** %retval, align 8
  %4 = load i32* %1, align 4
  %5 = load %struct.foo8** %retval, align 8
  %6 = bitcast %struct.foo8* %5 to i64*
  %7 = zext i32 %4 to i64
  %8 = load i64* %6, align 1
  %9 = and i64 %7, 2147483647
  %10 = and i64 %8, -2147483648
  %11 = or i64 %10, %9
  store i64 %11, i64* %6, align 1
  %12 = shl i64 %9, 33
  %13 = ashr i64 %12, 33
  %14 = trunc i64 %13 to i32
  %15 = load %struct.foo8** %retval, align 8
  ret %struct.foo8* %15
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo9* @make_s9(i8 signext %c) #0 {
  %1 = alloca i8, align 1
  %retval = alloca %struct.foo9*, align 8
  store i8 %c, i8* %1, align 1
  %2 = call i8* @malloc(i64 11)
  %3 = bitcast i8* %2 to %struct.foo9*
  store %struct.foo9* %3, %struct.foo9** %retval, align 8
  %4 = load i8* %1, align 1
  %5 = load %struct.foo9** %retval, align 8
  %6 = getelementptr inbounds %struct.foo9* %5, i32 0, i32 0
  store i8 %4, i8* %6, align 1
  %7 = load %struct.foo9** %retval, align 8
  ret %struct.foo9* %7
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo10* @make_s10(i8 signext %c) #0 {
  %1 = alloca i8, align 1
  %retval = alloca %struct.foo10*, align 8
  store i8 %c, i8* %1, align 1
  %2 = call i8* @malloc(i64 11)
  %3 = bitcast i8* %2 to %struct.foo10*
  store %struct.foo10* %3, %struct.foo10** %retval, align 8
  %4 = load i8* %1, align 1
  %5 = load %struct.foo10** %retval, align 8
  %6 = getelementptr inbounds %struct.foo10* %5, i32 0, i32 0
  store i8 %4, i8* %6, align 1
  %7 = load %struct.foo10** %retval, align 8
  ret %struct.foo10* %7
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo11* @make_s11(i8 signext %c) #0 {
  %1 = alloca i8, align 1
  %retval = alloca %struct.foo11*, align 8
  store i8 %c, i8* %1, align 1
  %2 = call i8* @malloc(i64 11)
  %3 = bitcast i8* %2 to %struct.foo11*
  store %struct.foo11* %3, %struct.foo11** %retval, align 8
  %4 = load i8* %1, align 1
  %5 = load %struct.foo11** %retval, align 8
  %6 = getelementptr inbounds %struct.foo11* %5, i32 0, i32 2
  store i8 %4, i8* %6, align 1
  %7 = load %struct.foo11** %retval, align 8
  ret %struct.foo11* %7
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo12* @make_s12(i8 signext %c) #0 {
  %1 = alloca i8, align 1
  %retval = alloca %struct.foo12*, align 8
  store i8 %c, i8* %1, align 1
  %2 = call i8* @malloc(i64 11)
  %3 = bitcast i8* %2 to %struct.foo12*
  store %struct.foo12* %3, %struct.foo12** %retval, align 8
  %4 = load i8* %1, align 1
  %5 = load %struct.foo12** %retval, align 8
  %6 = getelementptr inbounds %struct.foo12* %5, i32 0, i32 1
  store i8 %4, i8* %6, align 1
  %7 = load %struct.foo12** %retval, align 8
  ret %struct.foo12* %7
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  store i32 %argc, i32* %1, align 4
  store i8** %argv, i8*** %2, align 8
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str, i32 0, i32 0), i64 8)
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0), i64 8)
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i32 0, i32 0), i64 4)
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str3, i32 0, i32 0), i64 2)
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str4, i32 0, i32 0), i64 1)
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str5, i32 0, i32 0), i64 4)
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str6, i32 0, i32 0), i64 8)
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str7, i32 0, i32 0), i64 17)
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str8, i32 0, i32 0), i64 24)
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str9, i32 0, i32 0), i64 9)
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str10, i32 0, i32 0), i64 3)
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str11, i32 0, i32 0), i64 5)
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str12, i32 0, i32 0), i64 4)
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str13, i32 0, i32 0), i64 8)
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str14, i32 0, i32 0), i64 8)
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str15, i32 0, i32 0), i64 11)
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str16, i32 0, i32 0), i64 11)
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str17, i32 0, i32 0), i64 11)
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str18, i32 0, i32 0), i64 11)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Apple LLVM version 6.0 (clang-600.0.57) (based on LLVM 3.5svn)"}

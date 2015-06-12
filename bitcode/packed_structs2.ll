; ModuleID = 'structs2.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

%struct.__sFILE = type <{ i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }>
%struct.__sFILEX = type opaque
%struct.__sbuf = type <{ i8*, i32 }>
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

@__stderrp = external global %struct.__sFILE*
@.str = private unnamed_addr constant [36 x i8] c"sizeof(%s) = %d offset of p   = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"s1\00", align 1
@.str2 = private unnamed_addr constant [36 x i8] c"sizeof(%s) = %d offset of c   = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [37 x i8] c"sizeof(%s) = %d offset of x   = %d\0A\0A\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"s2\00", align 1
@.str5 = private unnamed_addr constant [3 x i8] c"s3\00", align 1
@.str6 = private unnamed_addr constant [37 x i8] c"sizeof(%s) = %d offset of p   = %d\0A\0A\00", align 1
@.str7 = private unnamed_addr constant [36 x i8] c"sizeof(%s) = %d offset of s   = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [3 x i8] c"s4\00", align 1
@.str9 = private unnamed_addr constant [37 x i8] c"sizeof(%s) = %d offset of c   = %d\0A\0A\00", align 1
@.str10 = private unnamed_addr constant [3 x i8] c"s5\00", align 1
@.str11 = private unnamed_addr constant [3 x i8] c"s9\00", align 1
@.str12 = private unnamed_addr constant [4 x i8] c"s10\00", align 1
@.str13 = private unnamed_addr constant [36 x i8] c"sizeof(%s) = %d offset of x   = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [4 x i8] c"s11\00", align 1
@.str15 = private unnamed_addr constant [4 x i8] c"s12\00", align 1

; Function Attrs: nounwind ssp uwtable
define %struct.foo1* @make_s1(i8* %p, i8 signext %c, i64 %x) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8, align 1
  %3 = alloca i64, align 8
  %retval = alloca %struct.foo1*, align 8
  store i8* %p, i8** %1, align 8
  store i8 %c, i8* %2, align 1
  store i64 %x, i64* %3, align 8
  %4 = call i8* @malloc(i64 17)
  %5 = bitcast i8* %4 to %struct.foo1*
  store %struct.foo1* %5, %struct.foo1** %retval, align 8
  %6 = load i8** %1, align 8
  %7 = load %struct.foo1** %retval, align 8
  %8 = getelementptr inbounds %struct.foo1* %7, i32 0, i32 0
  store i8* %6, i8** %8, align 1
  %9 = load i8* %2, align 1
  %10 = load %struct.foo1** %retval, align 8
  %11 = getelementptr inbounds %struct.foo1* %10, i32 0, i32 1
  store i8 %9, i8* %11, align 1
  %12 = load i64* %3, align 8
  %13 = load %struct.foo1** %retval, align 8
  %14 = getelementptr inbounds %struct.foo1* %13, i32 0, i32 2
  store i64 %12, i64* %14, align 1
  %15 = load %struct.foo1** %retval, align 8
  ret %struct.foo1* %15
}

declare i8* @malloc(i64) #1

; Function Attrs: nounwind ssp uwtable
define %struct.foo2* @make_s2(i8 signext %c, i8* %p, i64 %x) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %retval = alloca %struct.foo2*, align 8
  store i8 %c, i8* %1, align 1
  store i8* %p, i8** %2, align 8
  store i64 %x, i64* %3, align 8
  %4 = call i8* @malloc(i64 24)
  %5 = bitcast i8* %4 to %struct.foo2*
  store %struct.foo2* %5, %struct.foo2** %retval, align 8
  %6 = load i8* %1, align 1
  %7 = load %struct.foo2** %retval, align 8
  %8 = getelementptr inbounds %struct.foo2* %7, i32 0, i32 0
  store i8 %6, i8* %8, align 1
  %9 = load i8** %2, align 8
  %10 = load %struct.foo2** %retval, align 8
  %11 = getelementptr inbounds %struct.foo2* %10, i32 0, i32 2
  store i8* %9, i8** %11, align 1
  %12 = load i64* %3, align 8
  %13 = load %struct.foo2** %retval, align 8
  %14 = getelementptr inbounds %struct.foo2* %13, i32 0, i32 3
  store i64 %12, i64* %14, align 1
  %15 = load %struct.foo2** %retval, align 8
  ret %struct.foo2* %15
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo3* @make_s3(i8 signext %c, i8* %p) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8*, align 8
  %retval = alloca %struct.foo3*, align 8
  store i8 %c, i8* %1, align 1
  store i8* %p, i8** %2, align 8
  %3 = call i8* @malloc(i64 9)
  %4 = bitcast i8* %3 to %struct.foo3*
  store %struct.foo3* %4, %struct.foo3** %retval, align 8
  %5 = load i8* %1, align 1
  %6 = load %struct.foo3** %retval, align 8
  %7 = getelementptr inbounds %struct.foo3* %6, i32 0, i32 1
  store i8 %5, i8* %7, align 1
  %8 = load i8** %2, align 8
  %9 = load %struct.foo3** %retval, align 8
  %10 = getelementptr inbounds %struct.foo3* %9, i32 0, i32 0
  store i8* %8, i8** %10, align 1
  %11 = load %struct.foo3** %retval, align 8
  ret %struct.foo3* %11
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo4* @make_s4(i16 signext %s, i8 signext %c) #0 {
  %1 = alloca i16, align 2
  %2 = alloca i8, align 1
  %retval = alloca %struct.foo4*, align 8
  store i16 %s, i16* %1, align 2
  store i8 %c, i8* %2, align 1
  %3 = call i8* @malloc(i64 3)
  %4 = bitcast i8* %3 to %struct.foo4*
  store %struct.foo4* %4, %struct.foo4** %retval, align 8
  %5 = load i16* %1, align 2
  %6 = load %struct.foo4** %retval, align 8
  %7 = getelementptr inbounds %struct.foo4* %6, i32 0, i32 0
  store i16 %5, i16* %7, align 1
  %8 = load i8* %2, align 1
  %9 = load %struct.foo4** %retval, align 8
  %10 = getelementptr inbounds %struct.foo4* %9, i32 0, i32 1
  store i8 %8, i8* %10, align 1
  %11 = load %struct.foo4** %retval, align 8
  ret %struct.foo4* %11
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo5* @make_s5(i16 signext %s, i8 signext %c, i32 %flip, i32 %nybble, i32 %septet) #0 {
  %1 = alloca i16, align 2
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %retval = alloca %struct.foo5*, align 8
  store i16 %s, i16* %1, align 2
  store i8 %c, i8* %2, align 1
  store i32 %flip, i32* %3, align 4
  store i32 %nybble, i32* %4, align 4
  store i32 %septet, i32* %5, align 4
  %6 = call i8* @malloc(i64 5)
  %7 = bitcast i8* %6 to %struct.foo5*
  store %struct.foo5* %7, %struct.foo5** %retval, align 8
  %8 = load i16* %1, align 2
  %9 = load %struct.foo5** %retval, align 8
  %10 = getelementptr inbounds %struct.foo5* %9, i32 0, i32 0
  store i16 %8, i16* %10, align 1
  %11 = load i8* %2, align 1
  %12 = load %struct.foo5** %retval, align 8
  %13 = getelementptr inbounds %struct.foo5* %12, i32 0, i32 1
  store i8 %11, i8* %13, align 1
  %14 = load i32* %3, align 4
  %15 = load %struct.foo5** %retval, align 8
  %16 = getelementptr inbounds %struct.foo5* %15, i32 0, i32 2
  %17 = bitcast [2 x i8]* %16 to i16*
  %18 = trunc i32 %14 to i16
  %19 = load i16* %17, align 1
  %20 = and i16 %18, 1
  %21 = and i16 %19, -2
  %22 = or i16 %21, %20
  store i16 %22, i16* %17, align 1
  %23 = shl i16 %20, 15
  %24 = ashr i16 %23, 15
  %25 = sext i16 %24 to i32
  %26 = load i32* %4, align 4
  %27 = load %struct.foo5** %retval, align 8
  %28 = getelementptr inbounds %struct.foo5* %27, i32 0, i32 2
  %29 = bitcast [2 x i8]* %28 to i16*
  %30 = trunc i32 %26 to i16
  %31 = load i16* %29, align 1
  %32 = and i16 %30, 15
  %33 = shl i16 %32, 1
  %34 = and i16 %31, -31
  %35 = or i16 %34, %33
  store i16 %35, i16* %29, align 1
  %36 = shl i16 %32, 12
  %37 = ashr i16 %36, 12
  %38 = sext i16 %37 to i32
  %39 = load i32* %5, align 4
  %40 = load %struct.foo5** %retval, align 8
  %41 = getelementptr inbounds %struct.foo5* %40, i32 0, i32 2
  %42 = bitcast [2 x i8]* %41 to i16*
  %43 = trunc i32 %39 to i16
  %44 = load i16* %42, align 1
  %45 = and i16 %43, 127
  %46 = shl i16 %45, 5
  %47 = and i16 %44, -4065
  %48 = or i16 %47, %46
  store i16 %48, i16* %42, align 1
  %49 = shl i16 %45, 9
  %50 = ashr i16 %49, 9
  %51 = sext i16 %50 to i32
  %52 = load %struct.foo5** %retval, align 8
  ret %struct.foo5* %52
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo6* @make_s6(i32 %bigfield, i32 %littlefield) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %retval = alloca %struct.foo6*, align 8
  store i32 %bigfield, i32* %1, align 4
  store i32 %littlefield, i32* %2, align 4
  %3 = call i8* @malloc(i64 4)
  %4 = bitcast i8* %3 to %struct.foo6*
  store %struct.foo6* %4, %struct.foo6** %retval, align 8
  %5 = load i32* %1, align 4
  %6 = load %struct.foo6** %retval, align 8
  %7 = bitcast %struct.foo6* %6 to i32*
  %8 = load i32* %7, align 1
  %9 = and i32 %5, 2147483647
  %10 = and i32 %8, -2147483648
  %11 = or i32 %10, %9
  store i32 %11, i32* %7, align 1
  %12 = shl i32 %9, 1
  %13 = ashr i32 %12, 1
  %14 = load i32* %2, align 4
  %15 = load %struct.foo6** %retval, align 8
  %16 = bitcast %struct.foo6* %15 to i32*
  %17 = load i32* %16, align 1
  %18 = and i32 %14, 1
  %19 = shl i32 %18, 31
  %20 = and i32 %17, 2147483647
  %21 = or i32 %20, %19
  store i32 %21, i32* %16, align 1
  %22 = shl i32 %18, 31
  %23 = ashr i32 %22, 31
  %24 = load %struct.foo6** %retval, align 8
  ret %struct.foo6* %24
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo7* @make_s7(i32 %bigfield1, i32 %littlefield1, i32 %bigfield2, i32 %littlefield2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %retval = alloca %struct.foo7*, align 8
  store i32 %bigfield1, i32* %1, align 4
  store i32 %littlefield1, i32* %2, align 4
  store i32 %bigfield2, i32* %3, align 4
  store i32 %littlefield2, i32* %4, align 4
  %5 = call i8* @malloc(i64 8)
  %6 = bitcast i8* %5 to %struct.foo7*
  store %struct.foo7* %6, %struct.foo7** %retval, align 8
  %7 = load i32* %1, align 4
  %8 = load %struct.foo7** %retval, align 8
  %9 = bitcast %struct.foo7* %8 to i64*
  %10 = zext i32 %7 to i64
  %11 = load i64* %9, align 1
  %12 = and i64 %10, 2147483647
  %13 = and i64 %11, -2147483648
  %14 = or i64 %13, %12
  store i64 %14, i64* %9, align 1
  %15 = shl i64 %12, 33
  %16 = ashr i64 %15, 33
  %17 = trunc i64 %16 to i32
  %18 = load i32* %2, align 4
  %19 = load %struct.foo7** %retval, align 8
  %20 = bitcast %struct.foo7* %19 to i64*
  %21 = zext i32 %18 to i64
  %22 = load i64* %20, align 1
  %23 = and i64 %21, 1
  %24 = shl i64 %23, 31
  %25 = and i64 %22, -2147483649
  %26 = or i64 %25, %24
  store i64 %26, i64* %20, align 1
  %27 = shl i64 %23, 63
  %28 = ashr i64 %27, 63
  %29 = trunc i64 %28 to i32
  %30 = load i32* %3, align 4
  %31 = load %struct.foo7** %retval, align 8
  %32 = bitcast %struct.foo7* %31 to i64*
  %33 = zext i32 %30 to i64
  %34 = load i64* %32, align 1
  %35 = and i64 %33, 2147483647
  %36 = shl i64 %35, 32
  %37 = and i64 %34, -9223372032559808513
  %38 = or i64 %37, %36
  store i64 %38, i64* %32, align 1
  %39 = shl i64 %35, 33
  %40 = ashr i64 %39, 33
  %41 = trunc i64 %40 to i32
  %42 = load i32* %4, align 4
  %43 = load %struct.foo7** %retval, align 8
  %44 = bitcast %struct.foo7* %43 to i64*
  %45 = zext i32 %42 to i64
  %46 = load i64* %44, align 1
  %47 = and i64 %45, 1
  %48 = shl i64 %47, 63
  %49 = and i64 %46, 9223372036854775807
  %50 = or i64 %49, %48
  store i64 %50, i64* %44, align 1
  %51 = shl i64 %47, 63
  %52 = ashr i64 %51, 63
  %53 = trunc i64 %52 to i32
  %54 = load %struct.foo7** %retval, align 8
  ret %struct.foo7* %54
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo8* @make_s8(i32 %bigfield1, i32 %bigfield2, i32 %littlefield1, i32 %littlefield2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %retval = alloca %struct.foo8*, align 8
  store i32 %bigfield1, i32* %1, align 4
  store i32 %bigfield2, i32* %2, align 4
  store i32 %littlefield1, i32* %3, align 4
  store i32 %littlefield2, i32* %4, align 4
  %5 = call i8* @malloc(i64 8)
  %6 = bitcast i8* %5 to %struct.foo8*
  store %struct.foo8* %6, %struct.foo8** %retval, align 8
  %7 = load i32* %1, align 4
  %8 = load %struct.foo8** %retval, align 8
  %9 = bitcast %struct.foo8* %8 to i64*
  %10 = zext i32 %7 to i64
  %11 = load i64* %9, align 1
  %12 = and i64 %10, 2147483647
  %13 = and i64 %11, -2147483648
  %14 = or i64 %13, %12
  store i64 %14, i64* %9, align 1
  %15 = shl i64 %12, 33
  %16 = ashr i64 %15, 33
  %17 = trunc i64 %16 to i32
  %18 = load i32* %2, align 4
  %19 = load %struct.foo8** %retval, align 8
  %20 = bitcast %struct.foo8* %19 to i64*
  %21 = zext i32 %18 to i64
  %22 = load i64* %20, align 1
  %23 = and i64 %21, 2147483647
  %24 = shl i64 %23, 31
  %25 = and i64 %22, -4611686016279904257
  %26 = or i64 %25, %24
  store i64 %26, i64* %20, align 1
  %27 = shl i64 %23, 33
  %28 = ashr i64 %27, 33
  %29 = trunc i64 %28 to i32
  %30 = load i32* %3, align 4
  %31 = load %struct.foo8** %retval, align 8
  %32 = bitcast %struct.foo8* %31 to i64*
  %33 = zext i32 %30 to i64
  %34 = load i64* %32, align 1
  %35 = and i64 %33, 1
  %36 = shl i64 %35, 62
  %37 = and i64 %34, -4611686018427387905
  %38 = or i64 %37, %36
  store i64 %38, i64* %32, align 1
  %39 = shl i64 %35, 63
  %40 = ashr i64 %39, 63
  %41 = trunc i64 %40 to i32
  %42 = load i32* %4, align 4
  %43 = load %struct.foo8** %retval, align 8
  %44 = bitcast %struct.foo8* %43 to i64*
  %45 = zext i32 %42 to i64
  %46 = load i64* %44, align 1
  %47 = and i64 %45, 1
  %48 = shl i64 %47, 63
  %49 = and i64 %46, 9223372036854775807
  %50 = or i64 %49, %48
  store i64 %50, i64* %44, align 1
  %51 = shl i64 %47, 63
  %52 = ashr i64 %51, 63
  %53 = trunc i64 %52 to i32
  %54 = load %struct.foo8** %retval, align 8
  ret %struct.foo8* %54
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo9* @make_s9(i8 signext %c, i8* %p, i16 signext %x) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8*, align 8
  %3 = alloca i16, align 2
  %retval = alloca %struct.foo9*, align 8
  store i8 %c, i8* %1, align 1
  store i8* %p, i8** %2, align 8
  store i16 %x, i16* %3, align 2
  %4 = call i8* @malloc(i64 11)
  %5 = bitcast i8* %4 to %struct.foo9*
  store %struct.foo9* %5, %struct.foo9** %retval, align 8
  %6 = load i8* %1, align 1
  %7 = load %struct.foo9** %retval, align 8
  %8 = getelementptr inbounds %struct.foo9* %7, i32 0, i32 0
  store i8 %6, i8* %8, align 1
  %9 = load i8** %2, align 8
  %10 = load %struct.foo9** %retval, align 8
  %11 = getelementptr inbounds %struct.foo9* %10, i32 0, i32 1
  %12 = getelementptr inbounds %struct.foo9_inner* %11, i32 0, i32 0
  store i8* %9, i8** %12, align 1
  %13 = load i16* %3, align 2
  %14 = load %struct.foo9** %retval, align 8
  %15 = getelementptr inbounds %struct.foo9* %14, i32 0, i32 1
  %16 = getelementptr inbounds %struct.foo9_inner* %15, i32 0, i32 1
  store i16 %13, i16* %16, align 1
  %17 = load %struct.foo9** %retval, align 8
  ret %struct.foo9* %17
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo10* @make_s10(i8 signext %c, %struct.foo10* %p, i16 signext %x) #0 {
  %1 = alloca i8, align 1
  %2 = alloca %struct.foo10*, align 8
  %3 = alloca i16, align 2
  %retval = alloca %struct.foo10*, align 8
  store i8 %c, i8* %1, align 1
  store %struct.foo10* %p, %struct.foo10** %2, align 8
  store i16 %x, i16* %3, align 2
  %4 = call i8* @malloc(i64 11)
  %5 = bitcast i8* %4 to %struct.foo10*
  store %struct.foo10* %5, %struct.foo10** %retval, align 8
  %6 = load i8* %1, align 1
  %7 = load %struct.foo10** %retval, align 8
  %8 = getelementptr inbounds %struct.foo10* %7, i32 0, i32 0
  store i8 %6, i8* %8, align 1
  %9 = load %struct.foo10** %2, align 8
  %10 = load %struct.foo10** %retval, align 8
  %11 = getelementptr inbounds %struct.foo10* %10, i32 0, i32 1
  store %struct.foo10* %9, %struct.foo10** %11, align 1
  %12 = load i16* %3, align 2
  %13 = load %struct.foo10** %retval, align 8
  %14 = getelementptr inbounds %struct.foo10* %13, i32 0, i32 2
  store i16 %12, i16* %14, align 1
  %15 = load %struct.foo10** %retval, align 8
  ret %struct.foo10* %15
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo11* @make_s11(%struct.foo11* %p, i16 signext %x, i8 signext %c) #0 {
  %1 = alloca %struct.foo11*, align 8
  %2 = alloca i16, align 2
  %3 = alloca i8, align 1
  %retval = alloca %struct.foo11*, align 8
  store %struct.foo11* %p, %struct.foo11** %1, align 8
  store i16 %x, i16* %2, align 2
  store i8 %c, i8* %3, align 1
  %4 = call i8* @malloc(i64 11)
  %5 = bitcast i8* %4 to %struct.foo11*
  store %struct.foo11* %5, %struct.foo11** %retval, align 8
  %6 = load %struct.foo11** %1, align 8
  %7 = load %struct.foo11** %retval, align 8
  %8 = getelementptr inbounds %struct.foo11* %7, i32 0, i32 0
  store %struct.foo11* %6, %struct.foo11** %8, align 1
  %9 = load i16* %2, align 2
  %10 = load %struct.foo11** %retval, align 8
  %11 = getelementptr inbounds %struct.foo11* %10, i32 0, i32 1
  store i16 %9, i16* %11, align 1
  %12 = load i8* %3, align 1
  %13 = load %struct.foo11** %retval, align 8
  %14 = getelementptr inbounds %struct.foo11* %13, i32 0, i32 2
  store i8 %12, i8* %14, align 1
  %15 = load %struct.foo11** %retval, align 8
  ret %struct.foo11* %15
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo12* @make_s12(i8* %p, i16 signext %x, i8 signext %c) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i16, align 2
  %3 = alloca i8, align 1
  %retval = alloca %struct.foo12*, align 8
  store i8* %p, i8** %1, align 8
  store i16 %x, i16* %2, align 2
  store i8 %c, i8* %3, align 1
  %4 = call i8* @malloc(i64 11)
  %5 = bitcast i8* %4 to %struct.foo12*
  store %struct.foo12* %5, %struct.foo12** %retval, align 8
  %6 = load i8** %1, align 8
  %7 = load %struct.foo12** %retval, align 8
  %8 = getelementptr inbounds %struct.foo12* %7, i32 0, i32 0
  %9 = getelementptr inbounds %struct.foo12_inner* %8, i32 0, i32 0
  store i8* %6, i8** %9, align 1
  %10 = load i16* %2, align 2
  %11 = load %struct.foo12** %retval, align 8
  %12 = getelementptr inbounds %struct.foo12* %11, i32 0, i32 0
  %13 = getelementptr inbounds %struct.foo12_inner* %12, i32 0, i32 1
  store i16 %10, i16* %13, align 1
  %14 = load i8* %3, align 1
  %15 = load %struct.foo12** %retval, align 8
  %16 = getelementptr inbounds %struct.foo12* %15, i32 0, i32 1
  store i8 %14, i8* %16, align 1
  %17 = load %struct.foo12** %retval, align 8
  ret %struct.foo12* %17
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  store i32 %argc, i32* %1, align 4
  store i8** %argv, i8*** %2, align 8
  %3 = load %struct.__sFILE** @__stderrp, align 8
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %3, i8* getelementptr inbounds ([36 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 17, i32 0)
  %5 = load %struct.__sFILE** @__stderrp, align 8
  %6 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %5, i8* getelementptr inbounds ([36 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 17, i32 8)
  %7 = load %struct.__sFILE** @__stderrp, align 8
  %8 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %7, i8* getelementptr inbounds ([37 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 17, i32 9)
  %9 = load %struct.__sFILE** @__stderrp, align 8
  %10 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %9, i8* getelementptr inbounds ([36 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32 24, i32 0)
  %11 = load %struct.__sFILE** @__stderrp, align 8
  %12 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %11, i8* getelementptr inbounds ([36 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32 24, i32 8)
  %13 = load %struct.__sFILE** @__stderrp, align 8
  %14 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %13, i8* getelementptr inbounds ([37 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32 24, i32 16)
  %15 = load %struct.__sFILE** @__stderrp, align 8
  %16 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %15, i8* getelementptr inbounds ([36 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0), i32 9, i32 8)
  %17 = load %struct.__sFILE** @__stderrp, align 8
  %18 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %17, i8* getelementptr inbounds ([37 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0), i32 9, i32 0)
  %19 = load %struct.__sFILE** @__stderrp, align 8
  %20 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %19, i8* getelementptr inbounds ([36 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str8, i32 0, i32 0), i32 3, i32 0)
  %21 = load %struct.__sFILE** @__stderrp, align 8
  %22 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %21, i8* getelementptr inbounds ([37 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str8, i32 0, i32 0), i32 3, i32 2)
  %23 = load %struct.__sFILE** @__stderrp, align 8
  %24 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %23, i8* getelementptr inbounds ([36 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str10, i32 0, i32 0), i32 5, i32 0)
  %25 = load %struct.__sFILE** @__stderrp, align 8
  %26 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %25, i8* getelementptr inbounds ([36 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str10, i32 0, i32 0), i32 5, i32 2)
  %27 = load %struct.__sFILE** @__stderrp, align 8
  %28 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %27, i8* getelementptr inbounds ([36 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0), i32 11, i32 0)
  %29 = load %struct.__sFILE** @__stderrp, align 8
  %30 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %29, i8* getelementptr inbounds ([36 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i32 11, i32 0)
  %31 = load %struct.__sFILE** @__stderrp, align 8
  %32 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %31, i8* getelementptr inbounds ([36 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i32 11, i32 1)
  %33 = load %struct.__sFILE** @__stderrp, align 8
  %34 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %33, i8* getelementptr inbounds ([36 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i32 11, i32 9)
  %35 = load %struct.__sFILE** @__stderrp, align 8
  %36 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %35, i8* getelementptr inbounds ([36 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str14, i32 0, i32 0), i32 11, i32 10)
  %37 = load %struct.__sFILE** @__stderrp, align 8
  %38 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %37, i8* getelementptr inbounds ([36 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str15, i32 0, i32 0), i32 11, i32 10)
  ret i32 0
}

declare i32 @fprintf(%struct.__sFILE*, i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Apple LLVM version 6.0 (clang-600.0.57) (based on LLVM 3.5svn)"}

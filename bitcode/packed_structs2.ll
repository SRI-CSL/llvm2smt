; ModuleID = 'structs2.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%struct.__sFILE = type <{ i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }>
%struct.__sFILEX = type opaque
%struct.__sbuf = type <{ i8*, i32 }>
%struct.foo1 = type <{ i8*, i8, i64 }>
%struct.foo2 = type { i8, [7 x i8], i8*, i64 }
%struct.foo3 = type <{ i8*, i8 }>
%struct.foo4 = type <{ i16, i8 }>
%struct.foo5 = type <{ i16, i8, i16 }>
%struct.foo6 = type { i32 }
%struct.foo7 = type { i64 }
%struct.foo8 = type { i64 }
%struct.foo9 = type { i8, %struct.foo9_inner }
%struct.foo9_inner = type <{ i8*, i16 }>
%struct.foo10 = type <{ i8, %struct.foo10*, i16 }>
%struct.foo11 = type <{ %struct.foo11*, i16, i8 }>
%struct.foo12 = type { %struct.foo12_inner, i8 }
%struct.foo12_inner = type <{ i8*, i16 }>

@__stderrp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [36 x i8] c"sizeof(%s) = %d offset of p   = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"s1\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"sizeof(%s) = %d offset of c   = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [37 x i8] c"sizeof(%s) = %d offset of x   = %d\0A\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"s2\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"s3\00", align 1
@.str.6 = private unnamed_addr constant [37 x i8] c"sizeof(%s) = %d offset of p   = %d\0A\0A\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"sizeof(%s) = %d offset of s   = %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"s4\00", align 1
@.str.9 = private unnamed_addr constant [37 x i8] c"sizeof(%s) = %d offset of c   = %d\0A\0A\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"s5\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"s9\00", align 1
@.str.12 = private unnamed_addr constant [4 x i8] c"s10\00", align 1
@.str.13 = private unnamed_addr constant [36 x i8] c"sizeof(%s) = %d offset of x   = %d\0A\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"s11\00", align 1
@.str.15 = private unnamed_addr constant [4 x i8] c"s12\00", align 1

; Function Attrs: nounwind ssp uwtable
define %struct.foo1* @make_s1(i8* %p, i8 signext %c, i64 %x) #0 {
entry:
  %p.addr = alloca i8*, align 8
  %c.addr = alloca i8, align 1
  %x.addr = alloca i64, align 8
  %retval1 = alloca %struct.foo1*, align 8
  store i8* %p, i8** %p.addr, align 8
  store i8 %c, i8* %c.addr, align 1
  store i64 %x, i64* %x.addr, align 8
  %call = call i8* @malloc(i64 17)
  %0 = bitcast i8* %call to %struct.foo1*
  store %struct.foo1* %0, %struct.foo1** %retval1, align 8
  %1 = load i8*, i8** %p.addr, align 8
  %2 = load %struct.foo1*, %struct.foo1** %retval1, align 8
  %p2 = getelementptr inbounds %struct.foo1, %struct.foo1* %2, i32 0, i32 0
  store i8* %1, i8** %p2, align 1
  %3 = load i8, i8* %c.addr, align 1
  %4 = load %struct.foo1*, %struct.foo1** %retval1, align 8
  %c3 = getelementptr inbounds %struct.foo1, %struct.foo1* %4, i32 0, i32 1
  store i8 %3, i8* %c3, align 1
  %5 = load i64, i64* %x.addr, align 8
  %6 = load %struct.foo1*, %struct.foo1** %retval1, align 8
  %x4 = getelementptr inbounds %struct.foo1, %struct.foo1* %6, i32 0, i32 2
  store i64 %5, i64* %x4, align 1
  %7 = load %struct.foo1*, %struct.foo1** %retval1, align 8
  ret %struct.foo1* %7
}

declare i8* @malloc(i64) #1

; Function Attrs: nounwind ssp uwtable
define %struct.foo2* @make_s2(i8 signext %c, i8* %p, i64 %x) #0 {
entry:
  %c.addr = alloca i8, align 1
  %p.addr = alloca i8*, align 8
  %x.addr = alloca i64, align 8
  %retval1 = alloca %struct.foo2*, align 8
  store i8 %c, i8* %c.addr, align 1
  store i8* %p, i8** %p.addr, align 8
  store i64 %x, i64* %x.addr, align 8
  %call = call i8* @malloc(i64 24)
  %0 = bitcast i8* %call to %struct.foo2*
  store %struct.foo2* %0, %struct.foo2** %retval1, align 8
  %1 = load i8, i8* %c.addr, align 1
  %2 = load %struct.foo2*, %struct.foo2** %retval1, align 8
  %c2 = getelementptr inbounds %struct.foo2, %struct.foo2* %2, i32 0, i32 0
  store i8 %1, i8* %c2, align 1
  %3 = load i8*, i8** %p.addr, align 8
  %4 = load %struct.foo2*, %struct.foo2** %retval1, align 8
  %p3 = getelementptr inbounds %struct.foo2, %struct.foo2* %4, i32 0, i32 2
  store i8* %3, i8** %p3, align 1
  %5 = load i64, i64* %x.addr, align 8
  %6 = load %struct.foo2*, %struct.foo2** %retval1, align 8
  %x4 = getelementptr inbounds %struct.foo2, %struct.foo2* %6, i32 0, i32 3
  store i64 %5, i64* %x4, align 1
  %7 = load %struct.foo2*, %struct.foo2** %retval1, align 8
  ret %struct.foo2* %7
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo3* @make_s3(i8 signext %c, i8* %p) #0 {
entry:
  %c.addr = alloca i8, align 1
  %p.addr = alloca i8*, align 8
  %retval1 = alloca %struct.foo3*, align 8
  store i8 %c, i8* %c.addr, align 1
  store i8* %p, i8** %p.addr, align 8
  %call = call i8* @malloc(i64 9)
  %0 = bitcast i8* %call to %struct.foo3*
  store %struct.foo3* %0, %struct.foo3** %retval1, align 8
  %1 = load i8, i8* %c.addr, align 1
  %2 = load %struct.foo3*, %struct.foo3** %retval1, align 8
  %c2 = getelementptr inbounds %struct.foo3, %struct.foo3* %2, i32 0, i32 1
  store i8 %1, i8* %c2, align 1
  %3 = load i8*, i8** %p.addr, align 8
  %4 = load %struct.foo3*, %struct.foo3** %retval1, align 8
  %p3 = getelementptr inbounds %struct.foo3, %struct.foo3* %4, i32 0, i32 0
  store i8* %3, i8** %p3, align 1
  %5 = load %struct.foo3*, %struct.foo3** %retval1, align 8
  ret %struct.foo3* %5
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo4* @make_s4(i16 signext %s, i8 signext %c) #0 {
entry:
  %s.addr = alloca i16, align 2
  %c.addr = alloca i8, align 1
  %retval1 = alloca %struct.foo4*, align 8
  store i16 %s, i16* %s.addr, align 2
  store i8 %c, i8* %c.addr, align 1
  %call = call i8* @malloc(i64 3)
  %0 = bitcast i8* %call to %struct.foo4*
  store %struct.foo4* %0, %struct.foo4** %retval1, align 8
  %1 = load i16, i16* %s.addr, align 2
  %2 = load %struct.foo4*, %struct.foo4** %retval1, align 8
  %s2 = getelementptr inbounds %struct.foo4, %struct.foo4* %2, i32 0, i32 0
  store i16 %1, i16* %s2, align 1
  %3 = load i8, i8* %c.addr, align 1
  %4 = load %struct.foo4*, %struct.foo4** %retval1, align 8
  %c3 = getelementptr inbounds %struct.foo4, %struct.foo4* %4, i32 0, i32 1
  store i8 %3, i8* %c3, align 1
  %5 = load %struct.foo4*, %struct.foo4** %retval1, align 8
  ret %struct.foo4* %5
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo5* @make_s5(i16 signext %s, i8 signext %c, i32 %flip, i32 %nybble, i32 %septet) #0 {
entry:
  %s.addr = alloca i16, align 2
  %c.addr = alloca i8, align 1
  %flip.addr = alloca i32, align 4
  %nybble.addr = alloca i32, align 4
  %septet.addr = alloca i32, align 4
  %retval1 = alloca %struct.foo5*, align 8
  store i16 %s, i16* %s.addr, align 2
  store i8 %c, i8* %c.addr, align 1
  store i32 %flip, i32* %flip.addr, align 4
  store i32 %nybble, i32* %nybble.addr, align 4
  store i32 %septet, i32* %septet.addr, align 4
  %call = call i8* @malloc(i64 5)
  %0 = bitcast i8* %call to %struct.foo5*
  store %struct.foo5* %0, %struct.foo5** %retval1, align 8
  %1 = load i16, i16* %s.addr, align 2
  %2 = load %struct.foo5*, %struct.foo5** %retval1, align 8
  %s2 = getelementptr inbounds %struct.foo5, %struct.foo5* %2, i32 0, i32 0
  store i16 %1, i16* %s2, align 1
  %3 = load i8, i8* %c.addr, align 1
  %4 = load %struct.foo5*, %struct.foo5** %retval1, align 8
  %c3 = getelementptr inbounds %struct.foo5, %struct.foo5* %4, i32 0, i32 1
  store i8 %3, i8* %c3, align 1
  %5 = load i32, i32* %flip.addr, align 4
  %6 = load %struct.foo5*, %struct.foo5** %retval1, align 8
  %flip4 = getelementptr inbounds %struct.foo5, %struct.foo5* %6, i32 0, i32 2
  %7 = trunc i32 %5 to i16
  %bf.load = load i16, i16* %flip4, align 1
  %bf.value = and i16 %7, 1
  %bf.clear = and i16 %bf.load, -2
  %bf.set = or i16 %bf.clear, %bf.value
  store i16 %bf.set, i16* %flip4, align 1
  %bf.result.shl = shl i16 %bf.value, 15
  %bf.result.ashr = ashr i16 %bf.result.shl, 15
  %bf.result.cast = sext i16 %bf.result.ashr to i32
  %8 = load i32, i32* %nybble.addr, align 4
  %9 = load %struct.foo5*, %struct.foo5** %retval1, align 8
  %nybble5 = getelementptr inbounds %struct.foo5, %struct.foo5* %9, i32 0, i32 2
  %10 = trunc i32 %8 to i16
  %bf.load6 = load i16, i16* %nybble5, align 1
  %bf.value7 = and i16 %10, 15
  %bf.shl = shl i16 %bf.value7, 1
  %bf.clear8 = and i16 %bf.load6, -31
  %bf.set9 = or i16 %bf.clear8, %bf.shl
  store i16 %bf.set9, i16* %nybble5, align 1
  %bf.result.shl10 = shl i16 %bf.value7, 12
  %bf.result.ashr11 = ashr i16 %bf.result.shl10, 12
  %bf.result.cast12 = sext i16 %bf.result.ashr11 to i32
  %11 = load i32, i32* %septet.addr, align 4
  %12 = load %struct.foo5*, %struct.foo5** %retval1, align 8
  %septet13 = getelementptr inbounds %struct.foo5, %struct.foo5* %12, i32 0, i32 2
  %13 = trunc i32 %11 to i16
  %bf.load14 = load i16, i16* %septet13, align 1
  %bf.value15 = and i16 %13, 127
  %bf.shl16 = shl i16 %bf.value15, 5
  %bf.clear17 = and i16 %bf.load14, -4065
  %bf.set18 = or i16 %bf.clear17, %bf.shl16
  store i16 %bf.set18, i16* %septet13, align 1
  %bf.result.shl19 = shl i16 %bf.value15, 9
  %bf.result.ashr20 = ashr i16 %bf.result.shl19, 9
  %bf.result.cast21 = sext i16 %bf.result.ashr20 to i32
  %14 = load %struct.foo5*, %struct.foo5** %retval1, align 8
  ret %struct.foo5* %14
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo6* @make_s6(i32 %bigfield, i32 %littlefield) #0 {
entry:
  %bigfield.addr = alloca i32, align 4
  %littlefield.addr = alloca i32, align 4
  %retval1 = alloca %struct.foo6*, align 8
  store i32 %bigfield, i32* %bigfield.addr, align 4
  store i32 %littlefield, i32* %littlefield.addr, align 4
  %call = call i8* @malloc(i64 4)
  %0 = bitcast i8* %call to %struct.foo6*
  store %struct.foo6* %0, %struct.foo6** %retval1, align 8
  %1 = load i32, i32* %bigfield.addr, align 4
  %2 = load %struct.foo6*, %struct.foo6** %retval1, align 8
  %3 = bitcast %struct.foo6* %2 to i32*
  %bf.load = load i32, i32* %3, align 1
  %bf.value = and i32 %1, 2147483647
  %bf.clear = and i32 %bf.load, -2147483648
  %bf.set = or i32 %bf.clear, %bf.value
  store i32 %bf.set, i32* %3, align 1
  %bf.result.shl = shl i32 %bf.value, 1
  %bf.result.ashr = ashr i32 %bf.result.shl, 1
  %4 = load i32, i32* %littlefield.addr, align 4
  %5 = load %struct.foo6*, %struct.foo6** %retval1, align 8
  %6 = bitcast %struct.foo6* %5 to i32*
  %bf.load2 = load i32, i32* %6, align 1
  %bf.value3 = and i32 %4, 1
  %bf.shl = shl i32 %bf.value3, 31
  %bf.clear4 = and i32 %bf.load2, 2147483647
  %bf.set5 = or i32 %bf.clear4, %bf.shl
  store i32 %bf.set5, i32* %6, align 1
  %bf.result.shl6 = shl i32 %bf.value3, 31
  %bf.result.ashr7 = ashr i32 %bf.result.shl6, 31
  %7 = load %struct.foo6*, %struct.foo6** %retval1, align 8
  ret %struct.foo6* %7
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo7* @make_s7(i32 %bigfield1, i32 %littlefield1, i32 %bigfield2, i32 %littlefield2) #0 {
entry:
  %bigfield1.addr = alloca i32, align 4
  %littlefield1.addr = alloca i32, align 4
  %bigfield2.addr = alloca i32, align 4
  %littlefield2.addr = alloca i32, align 4
  %retval1 = alloca %struct.foo7*, align 8
  store i32 %bigfield1, i32* %bigfield1.addr, align 4
  store i32 %littlefield1, i32* %littlefield1.addr, align 4
  store i32 %bigfield2, i32* %bigfield2.addr, align 4
  store i32 %littlefield2, i32* %littlefield2.addr, align 4
  %call = call i8* @malloc(i64 8)
  %0 = bitcast i8* %call to %struct.foo7*
  store %struct.foo7* %0, %struct.foo7** %retval1, align 8
  %1 = load i32, i32* %bigfield1.addr, align 4
  %2 = load %struct.foo7*, %struct.foo7** %retval1, align 8
  %3 = bitcast %struct.foo7* %2 to i64*
  %4 = zext i32 %1 to i64
  %bf.load = load i64, i64* %3, align 1
  %bf.value = and i64 %4, 2147483647
  %bf.clear = and i64 %bf.load, -2147483648
  %bf.set = or i64 %bf.clear, %bf.value
  store i64 %bf.set, i64* %3, align 1
  %bf.result.shl = shl i64 %bf.value, 33
  %bf.result.ashr = ashr i64 %bf.result.shl, 33
  %bf.result.cast = trunc i64 %bf.result.ashr to i32
  %5 = load i32, i32* %littlefield1.addr, align 4
  %6 = load %struct.foo7*, %struct.foo7** %retval1, align 8
  %7 = bitcast %struct.foo7* %6 to i64*
  %8 = zext i32 %5 to i64
  %bf.load2 = load i64, i64* %7, align 1
  %bf.value3 = and i64 %8, 1
  %bf.shl = shl i64 %bf.value3, 31
  %bf.clear4 = and i64 %bf.load2, -2147483649
  %bf.set5 = or i64 %bf.clear4, %bf.shl
  store i64 %bf.set5, i64* %7, align 1
  %bf.result.shl6 = shl i64 %bf.value3, 63
  %bf.result.ashr7 = ashr i64 %bf.result.shl6, 63
  %bf.result.cast8 = trunc i64 %bf.result.ashr7 to i32
  %9 = load i32, i32* %bigfield2.addr, align 4
  %10 = load %struct.foo7*, %struct.foo7** %retval1, align 8
  %11 = bitcast %struct.foo7* %10 to i64*
  %12 = zext i32 %9 to i64
  %bf.load9 = load i64, i64* %11, align 1
  %bf.value10 = and i64 %12, 2147483647
  %bf.shl11 = shl i64 %bf.value10, 32
  %bf.clear12 = and i64 %bf.load9, -9223372032559808513
  %bf.set13 = or i64 %bf.clear12, %bf.shl11
  store i64 %bf.set13, i64* %11, align 1
  %bf.result.shl14 = shl i64 %bf.value10, 33
  %bf.result.ashr15 = ashr i64 %bf.result.shl14, 33
  %bf.result.cast16 = trunc i64 %bf.result.ashr15 to i32
  %13 = load i32, i32* %littlefield2.addr, align 4
  %14 = load %struct.foo7*, %struct.foo7** %retval1, align 8
  %15 = bitcast %struct.foo7* %14 to i64*
  %16 = zext i32 %13 to i64
  %bf.load17 = load i64, i64* %15, align 1
  %bf.value18 = and i64 %16, 1
  %bf.shl19 = shl i64 %bf.value18, 63
  %bf.clear20 = and i64 %bf.load17, 9223372036854775807
  %bf.set21 = or i64 %bf.clear20, %bf.shl19
  store i64 %bf.set21, i64* %15, align 1
  %bf.result.shl22 = shl i64 %bf.value18, 63
  %bf.result.ashr23 = ashr i64 %bf.result.shl22, 63
  %bf.result.cast24 = trunc i64 %bf.result.ashr23 to i32
  %17 = load %struct.foo7*, %struct.foo7** %retval1, align 8
  ret %struct.foo7* %17
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo8* @make_s8(i32 %bigfield1, i32 %bigfield2, i32 %littlefield1, i32 %littlefield2) #0 {
entry:
  %bigfield1.addr = alloca i32, align 4
  %bigfield2.addr = alloca i32, align 4
  %littlefield1.addr = alloca i32, align 4
  %littlefield2.addr = alloca i32, align 4
  %retval1 = alloca %struct.foo8*, align 8
  store i32 %bigfield1, i32* %bigfield1.addr, align 4
  store i32 %bigfield2, i32* %bigfield2.addr, align 4
  store i32 %littlefield1, i32* %littlefield1.addr, align 4
  store i32 %littlefield2, i32* %littlefield2.addr, align 4
  %call = call i8* @malloc(i64 8)
  %0 = bitcast i8* %call to %struct.foo8*
  store %struct.foo8* %0, %struct.foo8** %retval1, align 8
  %1 = load i32, i32* %bigfield1.addr, align 4
  %2 = load %struct.foo8*, %struct.foo8** %retval1, align 8
  %3 = bitcast %struct.foo8* %2 to i64*
  %4 = zext i32 %1 to i64
  %bf.load = load i64, i64* %3, align 1
  %bf.value = and i64 %4, 2147483647
  %bf.clear = and i64 %bf.load, -2147483648
  %bf.set = or i64 %bf.clear, %bf.value
  store i64 %bf.set, i64* %3, align 1
  %bf.result.shl = shl i64 %bf.value, 33
  %bf.result.ashr = ashr i64 %bf.result.shl, 33
  %bf.result.cast = trunc i64 %bf.result.ashr to i32
  %5 = load i32, i32* %bigfield2.addr, align 4
  %6 = load %struct.foo8*, %struct.foo8** %retval1, align 8
  %7 = bitcast %struct.foo8* %6 to i64*
  %8 = zext i32 %5 to i64
  %bf.load2 = load i64, i64* %7, align 1
  %bf.value3 = and i64 %8, 2147483647
  %bf.shl = shl i64 %bf.value3, 31
  %bf.clear4 = and i64 %bf.load2, -4611686016279904257
  %bf.set5 = or i64 %bf.clear4, %bf.shl
  store i64 %bf.set5, i64* %7, align 1
  %bf.result.shl6 = shl i64 %bf.value3, 33
  %bf.result.ashr7 = ashr i64 %bf.result.shl6, 33
  %bf.result.cast8 = trunc i64 %bf.result.ashr7 to i32
  %9 = load i32, i32* %littlefield1.addr, align 4
  %10 = load %struct.foo8*, %struct.foo8** %retval1, align 8
  %11 = bitcast %struct.foo8* %10 to i64*
  %12 = zext i32 %9 to i64
  %bf.load9 = load i64, i64* %11, align 1
  %bf.value10 = and i64 %12, 1
  %bf.shl11 = shl i64 %bf.value10, 62
  %bf.clear12 = and i64 %bf.load9, -4611686018427387905
  %bf.set13 = or i64 %bf.clear12, %bf.shl11
  store i64 %bf.set13, i64* %11, align 1
  %bf.result.shl14 = shl i64 %bf.value10, 63
  %bf.result.ashr15 = ashr i64 %bf.result.shl14, 63
  %bf.result.cast16 = trunc i64 %bf.result.ashr15 to i32
  %13 = load i32, i32* %littlefield2.addr, align 4
  %14 = load %struct.foo8*, %struct.foo8** %retval1, align 8
  %15 = bitcast %struct.foo8* %14 to i64*
  %16 = zext i32 %13 to i64
  %bf.load17 = load i64, i64* %15, align 1
  %bf.value18 = and i64 %16, 1
  %bf.shl19 = shl i64 %bf.value18, 63
  %bf.clear20 = and i64 %bf.load17, 9223372036854775807
  %bf.set21 = or i64 %bf.clear20, %bf.shl19
  store i64 %bf.set21, i64* %15, align 1
  %bf.result.shl22 = shl i64 %bf.value18, 63
  %bf.result.ashr23 = ashr i64 %bf.result.shl22, 63
  %bf.result.cast24 = trunc i64 %bf.result.ashr23 to i32
  %17 = load %struct.foo8*, %struct.foo8** %retval1, align 8
  ret %struct.foo8* %17
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo9* @make_s9(i8 signext %c, i8* %p, i16 signext %x) #0 {
entry:
  %c.addr = alloca i8, align 1
  %p.addr = alloca i8*, align 8
  %x.addr = alloca i16, align 2
  %retval1 = alloca %struct.foo9*, align 8
  store i8 %c, i8* %c.addr, align 1
  store i8* %p, i8** %p.addr, align 8
  store i16 %x, i16* %x.addr, align 2
  %call = call i8* @malloc(i64 11)
  %0 = bitcast i8* %call to %struct.foo9*
  store %struct.foo9* %0, %struct.foo9** %retval1, align 8
  %1 = load i8, i8* %c.addr, align 1
  %2 = load %struct.foo9*, %struct.foo9** %retval1, align 8
  %c2 = getelementptr inbounds %struct.foo9, %struct.foo9* %2, i32 0, i32 0
  store i8 %1, i8* %c2, align 1
  %3 = load i8*, i8** %p.addr, align 8
  %4 = load %struct.foo9*, %struct.foo9** %retval1, align 8
  %inner = getelementptr inbounds %struct.foo9, %struct.foo9* %4, i32 0, i32 1
  %p3 = getelementptr inbounds %struct.foo9_inner, %struct.foo9_inner* %inner, i32 0, i32 0
  store i8* %3, i8** %p3, align 1
  %5 = load i16, i16* %x.addr, align 2
  %6 = load %struct.foo9*, %struct.foo9** %retval1, align 8
  %inner4 = getelementptr inbounds %struct.foo9, %struct.foo9* %6, i32 0, i32 1
  %x5 = getelementptr inbounds %struct.foo9_inner, %struct.foo9_inner* %inner4, i32 0, i32 1
  store i16 %5, i16* %x5, align 1
  %7 = load %struct.foo9*, %struct.foo9** %retval1, align 8
  ret %struct.foo9* %7
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo10* @make_s10(i8 signext %c, %struct.foo10* %p, i16 signext %x) #0 {
entry:
  %c.addr = alloca i8, align 1
  %p.addr = alloca %struct.foo10*, align 8
  %x.addr = alloca i16, align 2
  %retval1 = alloca %struct.foo10*, align 8
  store i8 %c, i8* %c.addr, align 1
  store %struct.foo10* %p, %struct.foo10** %p.addr, align 8
  store i16 %x, i16* %x.addr, align 2
  %call = call i8* @malloc(i64 11)
  %0 = bitcast i8* %call to %struct.foo10*
  store %struct.foo10* %0, %struct.foo10** %retval1, align 8
  %1 = load i8, i8* %c.addr, align 1
  %2 = load %struct.foo10*, %struct.foo10** %retval1, align 8
  %c2 = getelementptr inbounds %struct.foo10, %struct.foo10* %2, i32 0, i32 0
  store i8 %1, i8* %c2, align 1
  %3 = load %struct.foo10*, %struct.foo10** %p.addr, align 8
  %4 = load %struct.foo10*, %struct.foo10** %retval1, align 8
  %p3 = getelementptr inbounds %struct.foo10, %struct.foo10* %4, i32 0, i32 1
  store %struct.foo10* %3, %struct.foo10** %p3, align 1
  %5 = load i16, i16* %x.addr, align 2
  %6 = load %struct.foo10*, %struct.foo10** %retval1, align 8
  %x4 = getelementptr inbounds %struct.foo10, %struct.foo10* %6, i32 0, i32 2
  store i16 %5, i16* %x4, align 1
  %7 = load %struct.foo10*, %struct.foo10** %retval1, align 8
  ret %struct.foo10* %7
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo11* @make_s11(%struct.foo11* %p, i16 signext %x, i8 signext %c) #0 {
entry:
  %p.addr = alloca %struct.foo11*, align 8
  %x.addr = alloca i16, align 2
  %c.addr = alloca i8, align 1
  %retval1 = alloca %struct.foo11*, align 8
  store %struct.foo11* %p, %struct.foo11** %p.addr, align 8
  store i16 %x, i16* %x.addr, align 2
  store i8 %c, i8* %c.addr, align 1
  %call = call i8* @malloc(i64 11)
  %0 = bitcast i8* %call to %struct.foo11*
  store %struct.foo11* %0, %struct.foo11** %retval1, align 8
  %1 = load %struct.foo11*, %struct.foo11** %p.addr, align 8
  %2 = load %struct.foo11*, %struct.foo11** %retval1, align 8
  %p2 = getelementptr inbounds %struct.foo11, %struct.foo11* %2, i32 0, i32 0
  store %struct.foo11* %1, %struct.foo11** %p2, align 1
  %3 = load i16, i16* %x.addr, align 2
  %4 = load %struct.foo11*, %struct.foo11** %retval1, align 8
  %x3 = getelementptr inbounds %struct.foo11, %struct.foo11* %4, i32 0, i32 1
  store i16 %3, i16* %x3, align 1
  %5 = load i8, i8* %c.addr, align 1
  %6 = load %struct.foo11*, %struct.foo11** %retval1, align 8
  %c4 = getelementptr inbounds %struct.foo11, %struct.foo11* %6, i32 0, i32 2
  store i8 %5, i8* %c4, align 1
  %7 = load %struct.foo11*, %struct.foo11** %retval1, align 8
  ret %struct.foo11* %7
}

; Function Attrs: nounwind ssp uwtable
define %struct.foo12* @make_s12(i8* %p, i16 signext %x, i8 signext %c) #0 {
entry:
  %p.addr = alloca i8*, align 8
  %x.addr = alloca i16, align 2
  %c.addr = alloca i8, align 1
  %retval1 = alloca %struct.foo12*, align 8
  store i8* %p, i8** %p.addr, align 8
  store i16 %x, i16* %x.addr, align 2
  store i8 %c, i8* %c.addr, align 1
  %call = call i8* @malloc(i64 11)
  %0 = bitcast i8* %call to %struct.foo12*
  store %struct.foo12* %0, %struct.foo12** %retval1, align 8
  %1 = load i8*, i8** %p.addr, align 8
  %2 = load %struct.foo12*, %struct.foo12** %retval1, align 8
  %inner = getelementptr inbounds %struct.foo12, %struct.foo12* %2, i32 0, i32 0
  %p2 = getelementptr inbounds %struct.foo12_inner, %struct.foo12_inner* %inner, i32 0, i32 0
  store i8* %1, i8** %p2, align 1
  %3 = load i16, i16* %x.addr, align 2
  %4 = load %struct.foo12*, %struct.foo12** %retval1, align 8
  %inner3 = getelementptr inbounds %struct.foo12, %struct.foo12* %4, i32 0, i32 0
  %x4 = getelementptr inbounds %struct.foo12_inner, %struct.foo12_inner* %inner3, i32 0, i32 1
  store i16 %3, i16* %x4, align 1
  %5 = load i8, i8* %c.addr, align 1
  %6 = load %struct.foo12*, %struct.foo12** %retval1, align 8
  %c5 = getelementptr inbounds %struct.foo12, %struct.foo12* %6, i32 0, i32 1
  store i8 %5, i8* %c5, align 1
  %7 = load %struct.foo12*, %struct.foo12** %retval1, align 8
  ret %struct.foo12* %7
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32 17, i32 0)
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32 17, i32 8)
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call2 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32 17, i32 9)
  %3 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call3 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %3, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32 24, i32 0)
  %4 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call4 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %4, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32 24, i32 8)
  %5 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call5 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %5, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32 24, i32 16)
  %6 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call6 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %6, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i32 9, i32 8)
  %7 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call7 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %7, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i32 9, i32 0)
  %8 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call8 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %8, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), i32 3, i32 0)
  %9 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call9 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %9, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), i32 3, i32 2)
  %10 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call10 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %10, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i32 5, i32 0)
  %11 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call11 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %11, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i32 5, i32 2)
  %12 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call12 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %12, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i32 11, i32 0)
  %13 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call13 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %13, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), i32 11, i32 0)
  %14 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call14 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %14, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), i32 11, i32 1)
  %15 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call15 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %15, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), i32 11, i32 9)
  %16 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call16 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %16, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i32 11, i32 10)
  %17 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call17 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %17, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), i32 11, i32 10)
  ret i32 0
}

declare i32 @fprintf(%struct.__sFILE*, i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.8.1 (tags/RELEASE_381/final)"}

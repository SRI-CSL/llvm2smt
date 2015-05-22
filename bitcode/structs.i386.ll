; ModuleID = 'structs.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

%struct.s0 = type { i8 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.s1 = type { i8, i8, i16, i32 }
%struct.s2 = type { i8, i16 }
%struct.s3 = type { i8, double, i16 }
%struct.s4 = type { i8, double }
%struct.s5 = type { i8, i64 }
%struct.s6 = type { i8, float }
%union.u0 = type { i32 }

@main.x0 = private unnamed_addr constant %struct.s0 { i8 48 }, align 1
@stderr = external global %struct._IO_FILE*
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
@.str10 = private unnamed_addr constant [3 x i8] c"u0\00", align 1

; Function Attrs: nounwind
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 4
  %x0 = alloca %struct.s0, align 1
  %x1 = alloca %struct.s1, align 4
  %x2 = alloca %struct.s2, align 2
  %x3 = alloca %struct.s3, align 4
  %x4 = alloca %struct.s4, align 4
  %x5 = alloca %struct.s5, align 4
  %x6 = alloca %struct.s6, align 4
  %z0 = alloca %union.u0, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 4
  %0 = bitcast %struct.s0* %x0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %0, i8* getelementptr inbounds (%struct.s0* @main.x0, i32 0, i32 0), i32 1, i32 1, i1 false)
  %1 = load %struct._IO_FILE** @stderr, align 4
  %c = getelementptr inbounds %struct.s0* %x0, i32 0, i32 0
  %2 = load i8* %c, align 1
  %conv = sext i8 %2 to i32
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([28 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 1, i32 %conv)
  %3 = load %struct._IO_FILE** @stderr, align 4
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32 8)
  %4 = load %struct._IO_FILE** @stderr, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32 4)
  %5 = load %struct._IO_FILE** @stderr, align 4
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0), i32 16)
  %6 = load %struct._IO_FILE** @stderr, align 4
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([34 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str7, i32 0, i32 0), i32 12, i32 4)
  %7 = load %struct._IO_FILE** @stderr, align 4
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([34 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str8, i32 0, i32 0), i32 12, i32 4)
  %8 = load %struct._IO_FILE** @stderr, align 4
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([34 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str9, i32 0, i32 0), i32 8, i32 4)
  %9 = load %struct._IO_FILE** @stderr, align 4
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str10, i32 0, i32 0), i32 4)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture, i32, i32, i1) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }

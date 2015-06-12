; ModuleID = 'structs2.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

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
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str7, i32 0, i32 0), i64 24)
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str8, i32 0, i32 0), i64 24)
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str9, i32 0, i32 0), i64 16)
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str10, i32 0, i32 0), i64 4)
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str11, i32 0, i32 0), i64 8)
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str12, i32 0, i32 0), i64 4)
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str13, i32 0, i32 0), i64 8)
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str14, i32 0, i32 0), i64 12)
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str15, i32 0, i32 0), i64 24)
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str16, i32 0, i32 0), i64 24)
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str17, i32 0, i32 0), i64 16)
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str18, i32 0, i32 0), i64 24)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Apple LLVM version 6.0 (clang-600.0.57) (based on LLVM 3.5svn)"}

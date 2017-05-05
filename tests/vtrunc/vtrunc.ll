; ModuleID = 'vtrunc.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

@.str = private unnamed_addr constant [16 x i8] c"lhs == rhs: %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"lhs = %d != rhs = %d\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @lhs(i32 %a, i32 %b) #0 {
  %1 = insertelement <2 x i32> undef, i32 %a, i32 0
  %2 = insertelement <2 x i32> %1, i32 %b, i32 1
  %3 = shufflevector <2 x i32> %2, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  %4 = trunc <2 x i32> %2 to <2 x i8>
  %5 = extractelement <2 x i8> %4, i32 0
  %6 = zext i8 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind ssp uwtable
define i32 @rhs(i32 %a, i32 %b) #0 {
  %1 = trunc i32 %a to i8
  %2 = zext i8 %1 to i32
  ret i32 %2
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %lhs = alloca i32, align 4
  %rhs = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32, i32* %2, align 4
  %5 = icmp eq i32 %4, 3
  br i1 %5, label %6, label %32

; <label>:6                                       ; preds = %0
  %7 = load i8**, i8*** %3, align 8
  %8 = getelementptr inbounds i8*, i8** %7, i64 1
  %9 = load i8*, i8** %8, align 8
  %10 = call i32 @atoi(i8* %9)
  store i32 %10, i32* %a, align 4
  %11 = load i8**, i8*** %3, align 8
  %12 = getelementptr inbounds i8*, i8** %11, i64 2
  %13 = load i8*, i8** %12, align 8
  %14 = call i32 @atoi(i8* %13)
  store i32 %14, i32* %b, align 4
  %15 = load i32, i32* %a, align 4
  %16 = load i32, i32* %b, align 4
  %17 = call i32 @lhs(i32 %15, i32 %16)
  store i32 %17, i32* %lhs, align 4
  %18 = load i32, i32* %a, align 4
  %19 = load i32, i32* %b, align 4
  %20 = call i32 @rhs(i32 %18, i32 %19)
  store i32 %20, i32* %rhs, align 4
  %21 = load i32, i32* %lhs, align 4
  %22 = load i32, i32* %rhs, align 4
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %24, label %27

; <label>:24                                      ; preds = %6
  %25 = load i32, i32* %lhs, align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 %25)
  br label %31

; <label>:27                                      ; preds = %6
  %28 = load i32, i32* %lhs, align 4
  %29 = load i32, i32* %rhs, align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %28, i32 %29)
  br label %31

; <label>:31                                      ; preds = %27, %24
  br label %32

; <label>:32                                      ; preds = %31, %0
  ret i32 0
}

declare i32 @atoi(i8*) #1

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Apple LLVM version 6.0 (clang-600.0.57) (based on LLVM 3.5svn)"}

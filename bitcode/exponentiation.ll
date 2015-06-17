; ModuleID = 'exponentiation.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

; Function Attrs: nounwind ssp uwtable
define i32 @exp0(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %retval = alloca i32, align 4
  store i32 %a, i32* %2, align 4
  store i32 %b, i32* %3, align 4
  store i32 1, i32* %retval, align 4
  %4 = load i32* %3, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  store i32 0, i32* %1
  br label %19

; <label>:7                                       ; preds = %0
  br label %8

; <label>:8                                       ; preds = %11, %7
  %9 = load i32* %3, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %17

; <label>:11                                      ; preds = %8
  %12 = load i32* %2, align 4
  %13 = load i32* %retval, align 4
  %14 = mul nsw i32 %13, %12
  store i32 %14, i32* %retval, align 4
  %15 = load i32* %3, align 4
  %16 = sub nsw i32 %15, 1
  store i32 %16, i32* %3, align 4
  br label %8

; <label>:17                                      ; preds = %8
  %18 = load i32* %retval, align 4
  store i32 %18, i32* %1
  br label %19

; <label>:19                                      ; preds = %17, %6
  %20 = load i32* %1
  ret i32 %20
}

; Function Attrs: nounwind ssp uwtable
define i32 @exp1(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %retval = alloca i32, align 4
  store i32 %a, i32* %2, align 4
  store i32 %b, i32* %3, align 4
  store i32 1, i32* %retval, align 4
  %4 = load i32* %3, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  store i32 0, i32* %1
  br label %27

; <label>:7                                       ; preds = %0
  br label %8

; <label>:8                                       ; preds = %19, %7
  %9 = load i32* %3, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %25

; <label>:11                                      ; preds = %8
  %12 = load i32* %3, align 4
  %13 = and i32 %12, 1
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %19

; <label>:15                                      ; preds = %11
  %16 = load i32* %2, align 4
  %17 = load i32* %retval, align 4
  %18 = mul nsw i32 %17, %16
  store i32 %18, i32* %retval, align 4
  br label %19

; <label>:19                                      ; preds = %15, %11
  %20 = load i32* %3, align 4
  %21 = ashr i32 %20, 1
  store i32 %21, i32* %3, align 4
  %22 = load i32* %2, align 4
  %23 = load i32* %2, align 4
  %24 = mul nsw i32 %23, %22
  store i32 %24, i32* %2, align 4
  br label %8

; <label>:25                                      ; preds = %8
  %26 = load i32* %retval, align 4
  store i32 %26, i32* %1
  br label %27

; <label>:27                                      ; preds = %25, %6
  %28 = load i32* %1
  ret i32 %28
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  ret i32 0
}

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Apple LLVM version 6.0 (clang-600.0.57) (based on LLVM 3.5svn)"}

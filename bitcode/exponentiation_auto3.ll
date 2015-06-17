; ModuleID = 'exponentiation_auto3.bc'
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
  br label %20

; <label>:7                                       ; preds = %0
  %8 = load i32* %3, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %.lr.ph, label %18

.lr.ph:                                           ; preds = %7
  br label %10

; <label>:10                                      ; preds = %30, %.lr.ph
  %11 = load i32* %2, align 4
  %12 = load i32* %retval, align 4
  %13 = mul nsw i32 %12, %11
  store i32 %13, i32* %retval, align 4
  %14 = load i32* %3, align 4
  %15 = sub nsw i32 %14, 1
  store i32 %15, i32* %3, align 4
  %16 = load i32* %3, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %22, label %._crit_edge

._crit_edge:                                      ; preds = %30, %22, %10
  br label %18

; <label>:18                                      ; preds = %._crit_edge, %7
  %19 = load i32* %retval, align 4
  store i32 %19, i32* %1
  br label %20

; <label>:20                                      ; preds = %18, %6
  %21 = load i32* %1
  ret i32 %21

; <label>:22                                      ; preds = %10
  %23 = load i32* %2, align 4
  %24 = load i32* %retval, align 4
  %25 = mul nsw i32 %24, %23
  store i32 %25, i32* %retval, align 4
  %26 = load i32* %3, align 4
  %27 = sub nsw i32 %26, 1
  store i32 %27, i32* %3, align 4
  %28 = load i32* %3, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %._crit_edge

; <label>:30                                      ; preds = %22
  %31 = load i32* %2, align 4
  %32 = load i32* %retval, align 4
  %33 = mul nsw i32 %32, %31
  store i32 %33, i32* %retval, align 4
  %34 = load i32* %3, align 4
  %35 = sub nsw i32 %34, 1
  store i32 %35, i32* %3, align 4
  %36 = load i32* %3, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %10, label %._crit_edge
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
  br label %28

; <label>:7                                       ; preds = %0
  %8 = load i32* %3, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %.lr.ph, label %26

.lr.ph:                                           ; preds = %7
  br label %10

; <label>:10                                      ; preds = %54, %.lr.ph
  %11 = load i32* %3, align 4
  %12 = and i32 %11, 1
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %18

; <label>:14                                      ; preds = %10
  %15 = load i32* %2, align 4
  %16 = load i32* %retval, align 4
  %17 = mul nsw i32 %16, %15
  store i32 %17, i32* %retval, align 4
  br label %18

; <label>:18                                      ; preds = %14, %10
  %19 = load i32* %3, align 4
  %20 = ashr i32 %19, 1
  store i32 %20, i32* %3, align 4
  %21 = load i32* %2, align 4
  %22 = load i32* %2, align 4
  %23 = mul nsw i32 %22, %21
  store i32 %23, i32* %2, align 4
  %24 = load i32* %3, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %30, label %._crit_edge

._crit_edge:                                      ; preds = %54, %38, %18
  br label %26

; <label>:26                                      ; preds = %._crit_edge, %7
  %27 = load i32* %retval, align 4
  store i32 %27, i32* %1
  br label %28

; <label>:28                                      ; preds = %26, %6
  %29 = load i32* %1
  ret i32 %29

; <label>:30                                      ; preds = %18
  %31 = load i32* %3, align 4
  %32 = and i32 %31, 1
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %38

; <label>:34                                      ; preds = %30
  %35 = load i32* %2, align 4
  %36 = load i32* %retval, align 4
  %37 = mul nsw i32 %36, %35
  store i32 %37, i32* %retval, align 4
  br label %38

; <label>:38                                      ; preds = %34, %30
  %39 = load i32* %3, align 4
  %40 = ashr i32 %39, 1
  store i32 %40, i32* %3, align 4
  %41 = load i32* %2, align 4
  %42 = load i32* %2, align 4
  %43 = mul nsw i32 %42, %41
  store i32 %43, i32* %2, align 4
  %44 = load i32* %3, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %._crit_edge

; <label>:46                                      ; preds = %38
  %47 = load i32* %3, align 4
  %48 = and i32 %47, 1
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %54

; <label>:50                                      ; preds = %46
  %51 = load i32* %2, align 4
  %52 = load i32* %retval, align 4
  %53 = mul nsw i32 %52, %51
  store i32 %53, i32* %retval, align 4
  br label %54

; <label>:54                                      ; preds = %50, %46
  %55 = load i32* %3, align 4
  %56 = ashr i32 %55, 1
  store i32 %56, i32* %3, align 4
  %57 = load i32* %2, align 4
  %58 = load i32* %2, align 4
  %59 = mul nsw i32 %58, %57
  store i32 %59, i32* %2, align 4
  %60 = load i32* %3, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %10, label %._crit_edge
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

; ModuleID = 'exponentiation_auto3.bc'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

; Function Attrs: nounwind ssp uwtable
define zeroext i16 @exp0(i16 zeroext %a, i16 zeroext %b) #0 {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  %retval = alloca i16, align 2
  store i16 %a, i16* %1, align 2
  store i16 %b, i16* %2, align 2
  store i16 1, i16* %retval, align 2
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %.lr.ph, label %20

.lr.ph:                                           ; preds = %0
  br label %6

; <label>:6                                       ; preds = %36, %.lr.ph
  %7 = load i16* %1, align 2
  %8 = zext i16 %7 to i32
  %9 = load i16* %retval, align 2
  %10 = zext i16 %9 to i32
  %11 = mul nsw i32 %10, %8
  %12 = trunc i32 %11 to i16
  store i16 %12, i16* %retval, align 2
  %13 = load i16* %2, align 2
  %14 = zext i16 %13 to i32
  %15 = sub nsw i32 %14, 1
  %16 = trunc i32 %15 to i16
  store i16 %16, i16* %2, align 2
  %17 = load i16* %2, align 2
  %18 = zext i16 %17 to i32
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %22, label %._crit_edge

._crit_edge:                                      ; preds = %36, %22, %6
  br label %20

; <label>:20                                      ; preds = %._crit_edge, %0
  %21 = load i16* %retval, align 2
  ret i16 %21

; <label>:22                                      ; preds = %6
  %23 = load i16* %1, align 2
  %24 = zext i16 %23 to i32
  %25 = load i16* %retval, align 2
  %26 = zext i16 %25 to i32
  %27 = mul nsw i32 %26, %24
  %28 = trunc i32 %27 to i16
  store i16 %28, i16* %retval, align 2
  %29 = load i16* %2, align 2
  %30 = zext i16 %29 to i32
  %31 = sub nsw i32 %30, 1
  %32 = trunc i32 %31 to i16
  store i16 %32, i16* %2, align 2
  %33 = load i16* %2, align 2
  %34 = zext i16 %33 to i32
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %36, label %._crit_edge

; <label>:36                                      ; preds = %22
  %37 = load i16* %1, align 2
  %38 = zext i16 %37 to i32
  %39 = load i16* %retval, align 2
  %40 = zext i16 %39 to i32
  %41 = mul nsw i32 %40, %38
  %42 = trunc i32 %41 to i16
  store i16 %42, i16* %retval, align 2
  %43 = load i16* %2, align 2
  %44 = zext i16 %43 to i32
  %45 = sub nsw i32 %44, 1
  %46 = trunc i32 %45 to i16
  store i16 %46, i16* %2, align 2
  %47 = load i16* %2, align 2
  %48 = zext i16 %47 to i32
  %49 = icmp sgt i32 %48, 0
  br i1 %49, label %6, label %._crit_edge
}

; Function Attrs: nounwind ssp uwtable
define zeroext i16 @exp1(i16 zeroext %a, i16 zeroext %b) #0 {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  %retval = alloca i16, align 2
  store i16 %a, i16* %1, align 2
  store i16 %b, i16* %2, align 2
  store i16 1, i16* %retval, align 2
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %.lr.ph, label %32

.lr.ph:                                           ; preds = %0
  br label %6

; <label>:6                                       ; preds = %72, %.lr.ph
  %7 = load i16* %2, align 2
  %8 = zext i16 %7 to i32
  %9 = and i32 %8, 1
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %18

; <label>:11                                      ; preds = %6
  %12 = load i16* %1, align 2
  %13 = zext i16 %12 to i32
  %14 = load i16* %retval, align 2
  %15 = zext i16 %14 to i32
  %16 = mul nsw i32 %15, %13
  %17 = trunc i32 %16 to i16
  store i16 %17, i16* %retval, align 2
  br label %18

; <label>:18                                      ; preds = %11, %6
  %19 = load i16* %2, align 2
  %20 = zext i16 %19 to i32
  %21 = ashr i32 %20, 1
  %22 = trunc i32 %21 to i16
  store i16 %22, i16* %2, align 2
  %23 = load i16* %1, align 2
  %24 = zext i16 %23 to i32
  %25 = load i16* %1, align 2
  %26 = zext i16 %25 to i32
  %27 = mul nsw i32 %26, %24
  %28 = trunc i32 %27 to i16
  store i16 %28, i16* %1, align 2
  %29 = load i16* %2, align 2
  %30 = zext i16 %29 to i32
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %34, label %._crit_edge

._crit_edge:                                      ; preds = %72, %46, %18
  br label %32

; <label>:32                                      ; preds = %._crit_edge, %0
  %33 = load i16* %retval, align 2
  ret i16 %33

; <label>:34                                      ; preds = %18
  %35 = load i16* %2, align 2
  %36 = zext i16 %35 to i32
  %37 = and i32 %36, 1
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %46

; <label>:39                                      ; preds = %34
  %40 = load i16* %1, align 2
  %41 = zext i16 %40 to i32
  %42 = load i16* %retval, align 2
  %43 = zext i16 %42 to i32
  %44 = mul nsw i32 %43, %41
  %45 = trunc i32 %44 to i16
  store i16 %45, i16* %retval, align 2
  br label %46

; <label>:46                                      ; preds = %39, %34
  %47 = load i16* %2, align 2
  %48 = zext i16 %47 to i32
  %49 = ashr i32 %48, 1
  %50 = trunc i32 %49 to i16
  store i16 %50, i16* %2, align 2
  %51 = load i16* %1, align 2
  %52 = zext i16 %51 to i32
  %53 = load i16* %1, align 2
  %54 = zext i16 %53 to i32
  %55 = mul nsw i32 %54, %52
  %56 = trunc i32 %55 to i16
  store i16 %56, i16* %1, align 2
  %57 = load i16* %2, align 2
  %58 = zext i16 %57 to i32
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %._crit_edge

; <label>:60                                      ; preds = %46
  %61 = load i16* %2, align 2
  %62 = zext i16 %61 to i32
  %63 = and i32 %62, 1
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %72

; <label>:65                                      ; preds = %60
  %66 = load i16* %1, align 2
  %67 = zext i16 %66 to i32
  %68 = load i16* %retval, align 2
  %69 = zext i16 %68 to i32
  %70 = mul nsw i32 %69, %67
  %71 = trunc i32 %70 to i16
  store i16 %71, i16* %retval, align 2
  br label %72

; <label>:72                                      ; preds = %65, %60
  %73 = load i16* %2, align 2
  %74 = zext i16 %73 to i32
  %75 = ashr i32 %74, 1
  %76 = trunc i32 %75 to i16
  store i16 %76, i16* %2, align 2
  %77 = load i16* %1, align 2
  %78 = zext i16 %77 to i32
  %79 = load i16* %1, align 2
  %80 = zext i16 %79 to i32
  %81 = mul nsw i32 %80, %78
  %82 = trunc i32 %81 to i16
  store i16 %82, i16* %1, align 2
  %83 = load i16* %2, align 2
  %84 = zext i16 %83 to i32
  %85 = icmp ne i32 %84, 0
  br i1 %85, label %6, label %._crit_edge
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

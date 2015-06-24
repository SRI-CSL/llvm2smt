; ModuleID = 'exponentiation.c'
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
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load i16* %2, align 2
  %5 = zext i16 %4 to i32
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %18

; <label>:7                                       ; preds = %3
  %8 = load i16* %1, align 2
  %9 = zext i16 %8 to i32
  %10 = load i16* %retval, align 2
  %11 = zext i16 %10 to i32
  %12 = mul nsw i32 %11, %9
  %13 = trunc i32 %12 to i16
  store i16 %13, i16* %retval, align 2
  %14 = load i16* %2, align 2
  %15 = zext i16 %14 to i32
  %16 = sub nsw i32 %15, 1
  %17 = trunc i32 %16 to i16
  store i16 %17, i16* %2, align 2
  br label %3

; <label>:18                                      ; preds = %3
  %19 = load i16* %retval, align 2
  ret i16 %19
}

; Function Attrs: nounwind ssp uwtable
define zeroext i16 @exp1(i16 zeroext %a, i16 zeroext %b) #0 {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  %retval = alloca i16, align 2
  store i16 %a, i16* %1, align 2
  store i16 %b, i16* %2, align 2
  store i16 1, i16* %retval, align 2
  br label %3

; <label>:3                                       ; preds = %19, %0
  %4 = load i16* %2, align 2
  %5 = zext i16 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %30

; <label>:7                                       ; preds = %3
  %8 = load i16* %2, align 2
  %9 = zext i16 %8 to i32
  %10 = and i32 %9, 1
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %19

; <label>:12                                      ; preds = %7
  %13 = load i16* %1, align 2
  %14 = zext i16 %13 to i32
  %15 = load i16* %retval, align 2
  %16 = zext i16 %15 to i32
  %17 = mul nsw i32 %16, %14
  %18 = trunc i32 %17 to i16
  store i16 %18, i16* %retval, align 2
  br label %19

; <label>:19                                      ; preds = %12, %7
  %20 = load i16* %2, align 2
  %21 = zext i16 %20 to i32
  %22 = ashr i32 %21, 1
  %23 = trunc i32 %22 to i16
  store i16 %23, i16* %2, align 2
  %24 = load i16* %1, align 2
  %25 = zext i16 %24 to i32
  %26 = load i16* %1, align 2
  %27 = zext i16 %26 to i32
  %28 = mul nsw i32 %27, %25
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %1, align 2
  br label %3

; <label>:30                                      ; preds = %3
  %31 = load i16* %retval, align 2
  ret i16 %31
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

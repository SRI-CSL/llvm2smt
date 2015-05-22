; ModuleID = 'int_powers.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

@.str = private unnamed_addr constant [19 x i8] c"pow32(0, %u) = %u\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"pow32(1, %u) = %u\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"pow32(2, %u) = %u\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %d, align 4
  br label %2

; <label>:2                                       ; preds = %10, %0
  %3 = load i32* %d, align 4
  %4 = icmp ult i32 %3, 16
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %2
  %6 = load i32* %d, align 4
  %7 = load i32* %d, align 4
  %8 = call i32 @upower32(i32 0, i32 %7)
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %6, i32 %8)
  br label %10

; <label>:10                                      ; preds = %5
  %11 = load i32* %d, align 4
  %12 = add i32 %11, 1
  store i32 %12, i32* %d, align 4
  br label %2

; <label>:13                                      ; preds = %2
  store i32 0, i32* %d, align 4
  br label %14

; <label>:14                                      ; preds = %22, %13
  %15 = load i32* %d, align 4
  %16 = icmp ult i32 %15, 16
  br i1 %16, label %17, label %25

; <label>:17                                      ; preds = %14
  %18 = load i32* %d, align 4
  %19 = load i32* %d, align 4
  %20 = call i32 @upower32(i32 1, i32 %19)
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %18, i32 %20)
  br label %22

; <label>:22                                      ; preds = %17
  %23 = load i32* %d, align 4
  %24 = add i32 %23, 1
  store i32 %24, i32* %d, align 4
  br label %14

; <label>:25                                      ; preds = %14
  store i32 0, i32* %d, align 4
  br label %26

; <label>:26                                      ; preds = %34, %25
  %27 = load i32* %d, align 4
  %28 = icmp ult i32 %27, 32
  br i1 %28, label %29, label %37

; <label>:29                                      ; preds = %26
  %30 = load i32* %d, align 4
  %31 = load i32* %d, align 4
  %32 = call i32 @upower32(i32 2, i32 %31)
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %30, i32 %32)
  br label %34

; <label>:34                                      ; preds = %29
  %35 = load i32* %d, align 4
  %36 = add i32 %35, 1
  store i32 %36, i32* %d, align 4
  br label %26

; <label>:37                                      ; preds = %26
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind ssp uwtable
define internal i32 @upower32(i32 %x, i32 %d) #2 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %d, i32* %2, align 4
  store i32 1, i32* %y, align 4
  br label %3

; <label>:3                                       ; preds = %14, %0
  %4 = load i32* %2, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %20

; <label>:6                                       ; preds = %3
  %7 = load i32* %2, align 4
  %8 = and i32 %7, 1
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %14

; <label>:10                                      ; preds = %6
  %11 = load i32* %1, align 4
  %12 = load i32* %y, align 4
  %13 = mul i32 %12, %11
  store i32 %13, i32* %y, align 4
  br label %14

; <label>:14                                      ; preds = %10, %6
  %15 = load i32* %2, align 4
  %16 = lshr i32 %15, 1
  store i32 %16, i32* %2, align 4
  %17 = load i32* %1, align 4
  %18 = load i32* %1, align 4
  %19 = mul i32 %18, %17
  store i32 %19, i32* %1, align 4
  br label %3

; <label>:20                                      ; preds = %3
  %21 = load i32* %y, align 4
  ret i32 %21
}

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Apple LLVM version 6.0 (clang-600.0.56) (based on LLVM 3.5svn)"}

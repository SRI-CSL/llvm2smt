; ModuleID = 'int2ptr.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

@.str = private unnamed_addr constant [37 x i8] c"foo is %d, foo_ptr is %p, bar is %d\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @lhs(i32 %x) #0 {
  %1 = alloca i32, align 4
  %ptr = alloca i8*, align 8
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = inttoptr i64 %3 to i8*
  store i8* %4, i8** %ptr, align 8
  %5 = load i8** %ptr, align 8
  %6 = ptrtoint i8* %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind ssp uwtable
define i32 @rhs(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  ret i32 %2
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %foo = alloca i32, align 4
  %bar = alloca i32, align 4
  %foo_ptr = alloca i8*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32* %2, align 4
  %5 = icmp sle i32 %4, 1
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  store i32 0, i32* %1
  br label %22

; <label>:7                                       ; preds = %0
  %8 = load i8*** %3, align 8
  %9 = getelementptr inbounds i8** %8, i64 1
  %10 = load i8** %9, align 8
  %11 = call i64 @atol(i8* %10)
  %12 = trunc i64 %11 to i32
  store i32 %12, i32* %foo, align 4
  %13 = load i32* %foo, align 4
  %14 = sext i32 %13 to i64
  %15 = inttoptr i64 %14 to i8*
  store i8* %15, i8** %foo_ptr, align 8
  %16 = load i8** %foo_ptr, align 8
  %17 = ptrtoint i8* %16 to i32
  store i32 %17, i32* %bar, align 4
  %18 = load i32* %foo, align 4
  %19 = load i8** %foo_ptr, align 8
  %20 = load i32* %bar, align 4
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 %18, i8* %19, i32 %20)
  store i32 0, i32* %1
  br label %22

; <label>:22                                      ; preds = %7, %6
  %23 = load i32* %1
  ret i32 %23
}

declare i64 @atol(i8*) #1

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Apple LLVM version 6.0 (clang-600.0.57) (based on LLVM 3.5svn)"}

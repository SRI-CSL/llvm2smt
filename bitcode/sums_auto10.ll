; ModuleID = 'sums_auto10.bc'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stderrp = external global %struct.__sFILE*
@.str = private unnamed_addr constant [21 x i8] c"Usage: %s <n> [lhs]\0A\00", align 1
@.str1 = private unnamed_addr constant [14 x i8] c"sum(%d) = %d\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @lhs(i32 %n) #0 {
  %1 = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store i32 0, i32* %sum, align 4
  %2 = load i32* %1, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %.lr.ph, label %12

.lr.ph:                                           ; preds = %0
  br label %4

; <label>:4                                       ; preds = %78, %.lr.ph
  %5 = load i32* %1, align 4
  %6 = load i32* %sum, align 4
  %7 = add nsw i32 %6, %5
  store i32 %7, i32* %sum, align 4
  %8 = load i32* %1, align 4
  %9 = sub nsw i32 %8, 1
  store i32 %9, i32* %1, align 4
  %10 = load i32* %1, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %14, label %._crit_edge

._crit_edge:                                      ; preds = %78, %70, %62, %54, %46, %38, %30, %22, %14, %4
  br label %12

; <label>:12                                      ; preds = %._crit_edge, %0
  %13 = load i32* %sum, align 4
  ret i32 %13

; <label>:14                                      ; preds = %4
  %15 = load i32* %1, align 4
  %16 = load i32* %sum, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, i32* %sum, align 4
  %18 = load i32* %1, align 4
  %19 = sub nsw i32 %18, 1
  store i32 %19, i32* %1, align 4
  %20 = load i32* %1, align 4
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %._crit_edge

; <label>:22                                      ; preds = %14
  %23 = load i32* %1, align 4
  %24 = load i32* %sum, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, i32* %sum, align 4
  %26 = load i32* %1, align 4
  %27 = sub nsw i32 %26, 1
  store i32 %27, i32* %1, align 4
  %28 = load i32* %1, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %._crit_edge

; <label>:30                                      ; preds = %22
  %31 = load i32* %1, align 4
  %32 = load i32* %sum, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, i32* %sum, align 4
  %34 = load i32* %1, align 4
  %35 = sub nsw i32 %34, 1
  store i32 %35, i32* %1, align 4
  %36 = load i32* %1, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %38, label %._crit_edge

; <label>:38                                      ; preds = %30
  %39 = load i32* %1, align 4
  %40 = load i32* %sum, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, i32* %sum, align 4
  %42 = load i32* %1, align 4
  %43 = sub nsw i32 %42, 1
  store i32 %43, i32* %1, align 4
  %44 = load i32* %1, align 4
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %46, label %._crit_edge

; <label>:46                                      ; preds = %38
  %47 = load i32* %1, align 4
  %48 = load i32* %sum, align 4
  %49 = add nsw i32 %48, %47
  store i32 %49, i32* %sum, align 4
  %50 = load i32* %1, align 4
  %51 = sub nsw i32 %50, 1
  store i32 %51, i32* %1, align 4
  %52 = load i32* %1, align 4
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %54, label %._crit_edge

; <label>:54                                      ; preds = %46
  %55 = load i32* %1, align 4
  %56 = load i32* %sum, align 4
  %57 = add nsw i32 %56, %55
  store i32 %57, i32* %sum, align 4
  %58 = load i32* %1, align 4
  %59 = sub nsw i32 %58, 1
  store i32 %59, i32* %1, align 4
  %60 = load i32* %1, align 4
  %61 = icmp sgt i32 %60, 0
  br i1 %61, label %62, label %._crit_edge

; <label>:62                                      ; preds = %54
  %63 = load i32* %1, align 4
  %64 = load i32* %sum, align 4
  %65 = add nsw i32 %64, %63
  store i32 %65, i32* %sum, align 4
  %66 = load i32* %1, align 4
  %67 = sub nsw i32 %66, 1
  store i32 %67, i32* %1, align 4
  %68 = load i32* %1, align 4
  %69 = icmp sgt i32 %68, 0
  br i1 %69, label %70, label %._crit_edge

; <label>:70                                      ; preds = %62
  %71 = load i32* %1, align 4
  %72 = load i32* %sum, align 4
  %73 = add nsw i32 %72, %71
  store i32 %73, i32* %sum, align 4
  %74 = load i32* %1, align 4
  %75 = sub nsw i32 %74, 1
  store i32 %75, i32* %1, align 4
  %76 = load i32* %1, align 4
  %77 = icmp sgt i32 %76, 0
  br i1 %77, label %78, label %._crit_edge

; <label>:78                                      ; preds = %70
  %79 = load i32* %1, align 4
  %80 = load i32* %sum, align 4
  %81 = add nsw i32 %80, %79
  store i32 %81, i32* %sum, align 4
  %82 = load i32* %1, align 4
  %83 = sub nsw i32 %82, 1
  store i32 %83, i32* %1, align 4
  %84 = load i32* %1, align 4
  %85 = icmp sgt i32 %84, 0
  br i1 %85, label %4, label %._crit_edge
;;  unreachable
}

; Function Attrs: nounwind ssp uwtable
define i32 @rhs(i32 %n) #0 {
  %1 = alloca i32, align 4
  %prod = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = load i32* %1, align 4
  %4 = add nsw i32 %3, 1
  %5 = mul nsw i32 %2, %4
  store i32 %5, i32* %prod, align 4
  %6 = load i32* %prod, align 4
  %7 = sdiv i32 %6, 2
  store i32 %7, i32* %prod, align 4
  %8 = load i32* %prod, align 4
  ret i32 %8
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %s = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32* %2, align 4
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %0
  %7 = load %struct.__sFILE** @__stderrp, align 8
  %8 = load i8*** %3, align 8
  %9 = getelementptr inbounds i8** %8, i64 0
  %10 = load i8** %9, align 8
  %11 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %7, i8* getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), i8* %10)
  store i32 0, i32* %1
  br label %30

; <label>:12                                      ; preds = %0
  %13 = load i8*** %3, align 8
  %14 = getelementptr inbounds i8** %13, i64 1
  %15 = load i8** %14, align 8
  %16 = call i32 @atoi(i8* %15)
  store i32 %16, i32* %n, align 4
  %17 = load i32* %2, align 4
  %18 = icmp eq i32 %17, 2
  br i1 %18, label %19, label %22

; <label>:19                                      ; preds = %12
  %20 = load i32* %n, align 4
  %21 = call i32 @lhs(i32 %20)
  store i32 %21, i32* %s, align 4
  br label %25

; <label>:22                                      ; preds = %12
  %23 = load i32* %n, align 4
  %24 = call i32 @rhs(i32 %23)
  store i32 %24, i32* %s, align 4
  br label %25

; <label>:25                                      ; preds = %22, %19
  %26 = load %struct.__sFILE** @__stderrp, align 8
  %27 = load i32* %n, align 4
  %28 = load i32* %s, align 4
  %29 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %26, i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 %27, i32 %28)
  store i32 0, i32* %1
  br label %30

; <label>:30                                      ; preds = %25, %6
  %31 = load i32* %1
  ret i32 %31
}

declare i32 @fprintf(%struct.__sFILE*, i8*, ...) #1

declare i32 @atoi(i8*) #1

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Apple LLVM version 6.0 (clang-600.0.57) (based on LLVM 3.5svn)"}

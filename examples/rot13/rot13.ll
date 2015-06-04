; ModuleID = 'rot13.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

@.str = private unnamed_addr constant [60 x i8] c"x = '%c', y = '%c', z = '%c', lhs(x) = '%c', rhs(x) = '%c'\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %offset.i1 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %offset.i = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8**, align 8
  %x = alloca i8, align 1
  %y = alloca i8, align 1
  %z = alloca i8, align 1
  store i32 0, i32* %5
  store i32 %argc, i32* %6, align 4
  store i8** %argv, i8*** %7, align 8
  %8 = load i32* %6, align 4
  %9 = icmp eq i32 %8, 2
  br i1 %9, label %10, label %115

; <label>:10                                      ; preds = %0
  %11 = load i8*** %7, align 8
  %12 = getelementptr inbounds i8** %11, i64 1
  %13 = load i8** %12, align 8
  %14 = getelementptr inbounds i8* %13, i64 0
  %15 = load i8* %14, align 1
  store i8 %15, i8* %x, align 1
  %16 = load i8* %x, align 1
  store i8 %16, i8* %4, align 1
  %17 = load i8* %4, align 1
  %18 = sext i8 %17 to i32
  %19 = icmp sle i32 65, %18
  br i1 %19, label %20, label %36

; <label>:20                                      ; preds = %10
  %21 = load i8* %4, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp sle i32 %22, 90
  br i1 %23, label %24, label %36

; <label>:24                                      ; preds = %20
  %25 = load i8* %4, align 1
  %26 = sext i8 %25 to i32
  %27 = sub nsw i32 %26, 65
  store i32 %27, i32* %offset.i, align 4
  %28 = load i32* %offset.i, align 4
  %29 = add i32 %28, 13
  %30 = urem i32 %29, 26
  store i32 %30, i32* %offset.i, align 4
  %31 = load i32* %offset.i, align 4
  %32 = trunc i32 %31 to i8
  %33 = sext i8 %32 to i32
  %34 = add nsw i32 65, %33
  %35 = trunc i32 %34 to i8
  store i8 %35, i8* %3
  br label %rot13_char.exit

; <label>:36                                      ; preds = %20, %10
  %37 = load i8* %4, align 1
  %38 = sext i8 %37 to i32
  %39 = icmp sle i32 97, %38
  br i1 %39, label %40, label %56

; <label>:40                                      ; preds = %36
  %41 = load i8* %4, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp sle i32 %42, 122
  br i1 %43, label %44, label %56

; <label>:44                                      ; preds = %40
  %45 = load i8* %4, align 1
  %46 = sext i8 %45 to i32
  %47 = sub nsw i32 %46, 97
  store i32 %47, i32* %offset.i, align 4
  %48 = load i32* %offset.i, align 4
  %49 = add i32 %48, 13
  %50 = urem i32 %49, 26
  store i32 %50, i32* %offset.i, align 4
  %51 = load i32* %offset.i, align 4
  %52 = trunc i32 %51 to i8
  %53 = sext i8 %52 to i32
  %54 = add nsw i32 97, %53
  %55 = trunc i32 %54 to i8
  store i8 %55, i8* %3
  br label %rot13_char.exit

; <label>:56                                      ; preds = %40, %36
  %57 = load i8* %4, align 1
  store i8 %57, i8* %3
  br label %rot13_char.exit

rot13_char.exit:                                  ; preds = %24, %44, %56
  %58 = load i8* %3
  store i8 %58, i8* %y, align 1
  %59 = load i8* %y, align 1
  store i8 %59, i8* %2, align 1
  %60 = load i8* %2, align 1
  %61 = sext i8 %60 to i32
  %62 = icmp sle i32 65, %61
  br i1 %62, label %63, label %79

; <label>:63                                      ; preds = %rot13_char.exit
  %64 = load i8* %2, align 1
  %65 = sext i8 %64 to i32
  %66 = icmp sle i32 %65, 90
  br i1 %66, label %67, label %79

; <label>:67                                      ; preds = %63
  %68 = load i8* %2, align 1
  %69 = sext i8 %68 to i32
  %70 = sub nsw i32 %69, 65
  store i32 %70, i32* %offset.i1, align 4
  %71 = load i32* %offset.i1, align 4
  %72 = add i32 %71, 13
  %73 = urem i32 %72, 26
  store i32 %73, i32* %offset.i1, align 4
  %74 = load i32* %offset.i1, align 4
  %75 = trunc i32 %74 to i8
  %76 = sext i8 %75 to i32
  %77 = add nsw i32 65, %76
  %78 = trunc i32 %77 to i8
  store i8 %78, i8* %1
  br label %rot13_char.exit2

; <label>:79                                      ; preds = %63, %rot13_char.exit
  %80 = load i8* %2, align 1
  %81 = sext i8 %80 to i32
  %82 = icmp sle i32 97, %81
  br i1 %82, label %83, label %99

; <label>:83                                      ; preds = %79
  %84 = load i8* %2, align 1
  %85 = sext i8 %84 to i32
  %86 = icmp sle i32 %85, 122
  br i1 %86, label %87, label %99

; <label>:87                                      ; preds = %83
  %88 = load i8* %2, align 1
  %89 = sext i8 %88 to i32
  %90 = sub nsw i32 %89, 97
  store i32 %90, i32* %offset.i1, align 4
  %91 = load i32* %offset.i1, align 4
  %92 = add i32 %91, 13
  %93 = urem i32 %92, 26
  store i32 %93, i32* %offset.i1, align 4
  %94 = load i32* %offset.i1, align 4
  %95 = trunc i32 %94 to i8
  %96 = sext i8 %95 to i32
  %97 = add nsw i32 97, %96
  %98 = trunc i32 %97 to i8
  store i8 %98, i8* %1
  br label %rot13_char.exit2

; <label>:99                                      ; preds = %83, %79
  %100 = load i8* %2, align 1
  store i8 %100, i8* %1
  br label %rot13_char.exit2

rot13_char.exit2:                                 ; preds = %67, %87, %99
  %101 = load i8* %1
  store i8 %101, i8* %z, align 1
  %102 = load i8* %x, align 1
  %103 = sext i8 %102 to i32
  %104 = load i8* %y, align 1
  %105 = sext i8 %104 to i32
  %106 = load i8* %z, align 1
  %107 = sext i8 %106 to i32
  %108 = load i8* %x, align 1
  %109 = call signext i8 @lhs(i8 signext %108)
  %110 = sext i8 %109 to i32
  %111 = load i8* %x, align 1
  %112 = call signext i8 @rhs(i8 signext %111)
  %113 = sext i8 %112 to i32
  %114 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([60 x i8]* @.str, i32 0, i32 0), i32 %103, i32 %105, i32 %107, i32 %110, i32 %113)
  br label %115

; <label>:115                                     ; preds = %rot13_char.exit2, %0
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind ssp uwtable
define internal signext i8 @lhs(i8 signext %x) #0 {
  %1 = alloca i8, align 1
  store i8 %x, i8* %1, align 1
  %2 = load i8* %1, align 1
  ret i8 %2
}

; Function Attrs: nounwind ssp uwtable
define internal signext i8 @rhs(i8 signext %x) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %offset.i1 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %offset.i = alloca i32, align 4
  %5 = alloca i8, align 1
  store i8 %x, i8* %5, align 1
  %6 = load i8* %5, align 1
  store i8 %6, i8* %4, align 1
  %7 = load i8* %4, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp sle i32 65, %8
  br i1 %9, label %10, label %26

; <label>:10                                      ; preds = %0
  %11 = load i8* %4, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp sle i32 %12, 90
  br i1 %13, label %14, label %26

; <label>:14                                      ; preds = %10
  %15 = load i8* %4, align 1
  %16 = sext i8 %15 to i32
  %17 = sub nsw i32 %16, 65
  store i32 %17, i32* %offset.i, align 4
  %18 = load i32* %offset.i, align 4
  %19 = add i32 %18, 13
  %20 = urem i32 %19, 26
  store i32 %20, i32* %offset.i, align 4
  %21 = load i32* %offset.i, align 4
  %22 = trunc i32 %21 to i8
  %23 = sext i8 %22 to i32
  %24 = add nsw i32 65, %23
  %25 = trunc i32 %24 to i8
  store i8 %25, i8* %3
  br label %rot13_char.exit

; <label>:26                                      ; preds = %10, %0
  %27 = load i8* %4, align 1
  %28 = sext i8 %27 to i32
  %29 = icmp sle i32 97, %28
  br i1 %29, label %30, label %46

; <label>:30                                      ; preds = %26
  %31 = load i8* %4, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp sle i32 %32, 122
  br i1 %33, label %34, label %46

; <label>:34                                      ; preds = %30
  %35 = load i8* %4, align 1
  %36 = sext i8 %35 to i32
  %37 = sub nsw i32 %36, 97
  store i32 %37, i32* %offset.i, align 4
  %38 = load i32* %offset.i, align 4
  %39 = add i32 %38, 13
  %40 = urem i32 %39, 26
  store i32 %40, i32* %offset.i, align 4
  %41 = load i32* %offset.i, align 4
  %42 = trunc i32 %41 to i8
  %43 = sext i8 %42 to i32
  %44 = add nsw i32 97, %43
  %45 = trunc i32 %44 to i8
  store i8 %45, i8* %3
  br label %rot13_char.exit

; <label>:46                                      ; preds = %30, %26
  %47 = load i8* %4, align 1
  store i8 %47, i8* %3
  br label %rot13_char.exit

rot13_char.exit:                                  ; preds = %14, %34, %46
  %48 = load i8* %3
  store i8 %48, i8* %2, align 1
  %49 = load i8* %2, align 1
  %50 = sext i8 %49 to i32
  %51 = icmp sle i32 65, %50
  br i1 %51, label %52, label %68

; <label>:52                                      ; preds = %rot13_char.exit
  %53 = load i8* %2, align 1
  %54 = sext i8 %53 to i32
  %55 = icmp sle i32 %54, 90
  br i1 %55, label %56, label %68

; <label>:56                                      ; preds = %52
  %57 = load i8* %2, align 1
  %58 = sext i8 %57 to i32
  %59 = sub nsw i32 %58, 65
  store i32 %59, i32* %offset.i1, align 4
  %60 = load i32* %offset.i1, align 4
  %61 = add i32 %60, 13
  %62 = urem i32 %61, 26
  store i32 %62, i32* %offset.i1, align 4
  %63 = load i32* %offset.i1, align 4
  %64 = trunc i32 %63 to i8
  %65 = sext i8 %64 to i32
  %66 = add nsw i32 65, %65
  %67 = trunc i32 %66 to i8
  store i8 %67, i8* %1
  br label %rot13_char.exit2

; <label>:68                                      ; preds = %52, %rot13_char.exit
  %69 = load i8* %2, align 1
  %70 = sext i8 %69 to i32
  %71 = icmp sle i32 97, %70
  br i1 %71, label %72, label %88

; <label>:72                                      ; preds = %68
  %73 = load i8* %2, align 1
  %74 = sext i8 %73 to i32
  %75 = icmp sle i32 %74, 122
  br i1 %75, label %76, label %88

; <label>:76                                      ; preds = %72
  %77 = load i8* %2, align 1
  %78 = sext i8 %77 to i32
  %79 = sub nsw i32 %78, 97
  store i32 %79, i32* %offset.i1, align 4
  %80 = load i32* %offset.i1, align 4
  %81 = add i32 %80, 13
  %82 = urem i32 %81, 26
  store i32 %82, i32* %offset.i1, align 4
  %83 = load i32* %offset.i1, align 4
  %84 = trunc i32 %83 to i8
  %85 = sext i8 %84 to i32
  %86 = add nsw i32 97, %85
  %87 = trunc i32 %86 to i8
  store i8 %87, i8* %1
  br label %rot13_char.exit2

; <label>:88                                      ; preds = %72, %68
  %89 = load i8* %2, align 1
  store i8 %89, i8* %1
  br label %rot13_char.exit2

rot13_char.exit2:                                 ; preds = %56, %76, %88
  %90 = load i8* %1
  ret i8 %90
}

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Apple LLVM version 6.0 (clang-600.0.57) (based on LLVM 3.5svn)"}

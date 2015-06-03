; ModuleID = 'switch.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stderrp = external global %struct.__sFILE*
@.str = private unnamed_addr constant [6 x i8] c"%c%d\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define void @a(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 97, i32 %3)
  ret void
}

declare i32 @fprintf(%struct.__sFILE*, i8*, ...) #1

; Function Attrs: nounwind ssp uwtable
define void @b(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 98, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @c(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 99, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @d(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 100, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @e(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 101, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @f(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 102, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @g(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 103, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @h(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 104, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @i(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 105, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @j(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 106, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @k(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 107, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @l(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 108, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @m(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 109, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @n(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 110, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @o(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 111, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @p(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 112, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @q(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 113, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @r(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 114, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @s(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 115, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @t(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 116, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @u(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 117, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @v(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 118, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @w(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 119, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @x(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 120, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @y(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 121, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @z(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load %struct.__sFILE** @__stderrp, align 8
  %3 = load i32* %1, align 4
  %4 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 122, i32 %3)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @switcher(i8 signext %ch) #0 {
  %1 = alloca i8, align 1
  store i8 %ch, i8* %1, align 1
  %2 = load i8* %1, align 1
  %3 = sext i8 %2 to i32
  switch i32 %3, label %30 [
    i32 97, label %4
    i32 98, label %5
    i32 99, label %6
    i32 100, label %7
    i32 101, label %8
    i32 102, label %9
    i32 103, label %10
    i32 104, label %11
    i32 105, label %12
    i32 106, label %13
    i32 107, label %14
    i32 108, label %15
    i32 109, label %16
    i32 110, label %17
    i32 111, label %18
    i32 112, label %19
    i32 113, label %20
    i32 114, label %21
    i32 115, label %22
    i32 116, label %23
    i32 117, label %24
    i32 118, label %25
    i32 119, label %26
    i32 120, label %27
    i32 121, label %28
    i32 122, label %29
  ]

; <label>:4                                       ; preds = %0
  call void @a(i32 5)
  br label %5

; <label>:5                                       ; preds = %0, %4
  call void @b(i32 4)
  br label %6

; <label>:6                                       ; preds = %0, %5
  call void @c(i32 3)
  br label %7

; <label>:7                                       ; preds = %0, %6
  call void @d(i32 2)
  br label %8

; <label>:8                                       ; preds = %0, %7
  call void @r(i32 1)
  br label %9

; <label>:9                                       ; preds = %0, %8
  call void @f(i32 0)
  br label %10

; <label>:10                                      ; preds = %0, %9
  call void @g(i32 9)
  br label %11

; <label>:11                                      ; preds = %0, %10
  call void @h(i32 8)
  br label %12

; <label>:12                                      ; preds = %0, %11
  call void @i(i32 7)
  br label %13

; <label>:13                                      ; preds = %0, %12
  call void @j(i32 6)
  br label %14

; <label>:14                                      ; preds = %0, %13
  call void @k(i32 5)
  br label %15

; <label>:15                                      ; preds = %0, %14
  call void @l(i32 4)
  br label %16

; <label>:16                                      ; preds = %0, %15
  call void @m(i32 3)
  br label %17

; <label>:17                                      ; preds = %0, %16
  call void @n(i32 2)
  br label %18

; <label>:18                                      ; preds = %0, %17
  call void @o(i32 1)
  br label %19

; <label>:19                                      ; preds = %0, %18
  call void @p(i32 0)
  br label %20

; <label>:20                                      ; preds = %0, %19
  call void @q(i32 9)
  br label %21

; <label>:21                                      ; preds = %0, %20
  call void @r(i32 8)
  br label %22

; <label>:22                                      ; preds = %0, %21
  call void @s(i32 7)
  br label %23

; <label>:23                                      ; preds = %0, %22
  call void @t(i32 6)
  br label %24

; <label>:24                                      ; preds = %0, %23
  call void @u(i32 5)
  br label %25

; <label>:25                                      ; preds = %0, %24
  call void @v(i32 4)
  br label %26

; <label>:26                                      ; preds = %0, %25
  call void @w(i32 3)
  br label %27

; <label>:27                                      ; preds = %0, %26
  call void @x(i32 2)
  br label %28

; <label>:28                                      ; preds = %0, %27
  call void @y(i32 1)
  br label %29

; <label>:29                                      ; preds = %0, %28
  call void @z(i32 0)
  br label %30

; <label>:30                                      ; preds = %0, %29
  call void @exit(i32 1) #3
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noreturn
declare void @exit(i32) #2

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32* %2, align 4
  %5 = icmp eq i32 %4, 2
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %0
  %7 = load i8*** %3, align 8
  %8 = getelementptr inbounds i8** %7, i64 1
  %9 = load i8** %8, align 8
  %10 = getelementptr inbounds i8* %9, i64 0
  %11 = load i8* %10, align 1
  call void @switcher(i8 signext %11)
  br label %12

; <label>:12                                      ; preds = %6, %0
  ret i32 0
}

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Apple LLVM version 6.0 (clang-600.0.57) (based on LLVM 3.5svn)"}

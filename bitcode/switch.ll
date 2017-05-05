; ModuleID = 'switch.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stderrp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%c%d\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define void @a(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 97, i32 %1)
  ret void
}

declare i32 @fprintf(%struct.__sFILE*, i8*, ...) #1

; Function Attrs: nounwind ssp uwtable
define void @b(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 98, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @c(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 99, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @d(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 100, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @e(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 101, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @f(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 102, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @g(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 103, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @h(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 104, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @i(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 105, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @j(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 106, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @k(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 107, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @l(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 108, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @m(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 109, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @n(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 110, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @o(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 111, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @p(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 112, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @q(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 113, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @r(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 114, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @s(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 115, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @t(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 116, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @u(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 117, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @v(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 118, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @w(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 119, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @x(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 120, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @y(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 121, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @z(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 122, i32 %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @switcher(i8 signext %ch) #0 {
entry:
  %ch.addr = alloca i8, align 1
  store i8 %ch, i8* %ch.addr, align 1
  %0 = load i8, i8* %ch.addr, align 1
  %conv = sext i8 %0 to i32
  switch i32 %conv, label %sw.default [
    i32 97, label %sw.bb
    i32 98, label %sw.bb1
    i32 99, label %sw.bb2
    i32 100, label %sw.bb3
    i32 101, label %sw.bb4
    i32 102, label %sw.bb5
    i32 103, label %sw.bb6
    i32 104, label %sw.bb7
    i32 105, label %sw.bb8
    i32 106, label %sw.bb9
    i32 107, label %sw.bb10
    i32 108, label %sw.bb11
    i32 109, label %sw.bb12
    i32 110, label %sw.bb13
    i32 111, label %sw.bb14
    i32 112, label %sw.bb15
    i32 113, label %sw.bb16
    i32 114, label %sw.bb17
    i32 115, label %sw.bb18
    i32 116, label %sw.bb19
    i32 117, label %sw.bb20
    i32 118, label %sw.bb21
    i32 119, label %sw.bb22
    i32 120, label %sw.bb23
    i32 121, label %sw.bb24
    i32 122, label %sw.bb25
  ]

sw.bb:                                            ; preds = %entry
  call void @a(i32 5)
  br label %sw.bb1

sw.bb1:                                           ; preds = %entry, %sw.bb
  call void @b(i32 4)
  br label %sw.bb2

sw.bb2:                                           ; preds = %entry, %sw.bb1
  call void @c(i32 3)
  br label %sw.bb3

sw.bb3:                                           ; preds = %entry, %sw.bb2
  call void @d(i32 2)
  br label %sw.bb4

sw.bb4:                                           ; preds = %entry, %sw.bb3
  call void @r(i32 1)
  br label %sw.bb5

sw.bb5:                                           ; preds = %entry, %sw.bb4
  call void @f(i32 0)
  br label %sw.bb6

sw.bb6:                                           ; preds = %entry, %sw.bb5
  call void @g(i32 9)
  br label %sw.bb7

sw.bb7:                                           ; preds = %entry, %sw.bb6
  call void @h(i32 8)
  br label %sw.bb8

sw.bb8:                                           ; preds = %entry, %sw.bb7
  call void @i(i32 7)
  br label %sw.bb9

sw.bb9:                                           ; preds = %entry, %sw.bb8
  call void @j(i32 6)
  br label %sw.bb10

sw.bb10:                                          ; preds = %entry, %sw.bb9
  call void @k(i32 5)
  br label %sw.bb11

sw.bb11:                                          ; preds = %entry, %sw.bb10
  call void @l(i32 4)
  br label %sw.bb12

sw.bb12:                                          ; preds = %entry, %sw.bb11
  call void @m(i32 3)
  br label %sw.bb13

sw.bb13:                                          ; preds = %entry, %sw.bb12
  call void @n(i32 2)
  br label %sw.bb14

sw.bb14:                                          ; preds = %entry, %sw.bb13
  call void @o(i32 1)
  br label %sw.bb15

sw.bb15:                                          ; preds = %entry, %sw.bb14
  call void @p(i32 0)
  br label %sw.bb16

sw.bb16:                                          ; preds = %entry, %sw.bb15
  call void @q(i32 9)
  br label %sw.bb17

sw.bb17:                                          ; preds = %entry, %sw.bb16
  call void @r(i32 8)
  br label %sw.bb18

sw.bb18:                                          ; preds = %entry, %sw.bb17
  call void @s(i32 7)
  br label %sw.bb19

sw.bb19:                                          ; preds = %entry, %sw.bb18
  call void @t(i32 6)
  br label %sw.bb20

sw.bb20:                                          ; preds = %entry, %sw.bb19
  call void @u(i32 5)
  br label %sw.bb21

sw.bb21:                                          ; preds = %entry, %sw.bb20
  call void @v(i32 4)
  br label %sw.bb22

sw.bb22:                                          ; preds = %entry, %sw.bb21
  call void @w(i32 3)
  br label %sw.bb23

sw.bb23:                                          ; preds = %entry, %sw.bb22
  call void @x(i32 2)
  br label %sw.bb24

sw.bb24:                                          ; preds = %entry, %sw.bb23
  call void @y(i32 1)
  br label %sw.bb25

sw.bb25:                                          ; preds = %entry, %sw.bb24
  call void @z(i32 0)
  br label %sw.default

sw.default:                                       ; preds = %entry, %sw.bb25
  call void @exit(i32 1) #3
  unreachable

return:                                           ; No predecessors!
  ret void
}

; Function Attrs: noreturn
declare void @exit(i32) #2

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %cmp = icmp eq i32 %0, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1
  %2 = load i8*, i8** %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i64 0
  %3 = load i8, i8* %arrayidx1, align 1
  call void @switcher(i8 signext %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.8.1 (tags/RELEASE_381/final)"}

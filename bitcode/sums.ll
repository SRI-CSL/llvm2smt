; ModuleID = 'sums.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stderrp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [21 x i8] c"Usage: %s <n> [lhs]\0A\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"sum(%d) = %d\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @lhs(i32 %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 0, i32* %sum, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %n.addr, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %n.addr, align 4
  %2 = load i32, i32* %sum, align 4
  %add = add nsw i32 %2, %1
  store i32 %add, i32* %sum, align 4
  %3 = load i32, i32* %n.addr, align 4
  %sub = sub nsw i32 %3, 1
  store i32 %sub, i32* %n.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %4 = load i32, i32* %sum, align 4
  ret i32 %4
}

; Function Attrs: nounwind ssp uwtable
define i32 @rhs(i32 %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  %prod = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %1 = load i32, i32* %n.addr, align 4
  %add = add nsw i32 %1, 1
  %mul = mul nsw i32 %0, %add
  store i32 %mul, i32* %prod, align 4
  %2 = load i32, i32* %prod, align 4
  %div = sdiv i32 %2, 2
  store i32 %div, i32* %prod, align 4
  %3 = load i32, i32* %prod, align 4
  ret i32 %3
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %s = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %2 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 0
  %3 = load i8*, i8** %arrayidx, align 8
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i32 0, i32 0), i8* %3)
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i8**, i8*** %argv.addr, align 8
  %arrayidx1 = getelementptr inbounds i8*, i8** %4, i64 1
  %5 = load i8*, i8** %arrayidx1, align 8
  %call2 = call i32 @atoi(i8* %5)
  store i32 %call2, i32* %n, align 4
  %6 = load i32, i32* %argc.addr, align 4
  %cmp3 = icmp eq i32 %6, 2
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end
  %7 = load i32, i32* %n, align 4
  %call5 = call i32 @lhs(i32 %7)
  store i32 %call5, i32* %s, align 4
  br label %if.end7

if.else:                                          ; preds = %if.end
  %8 = load i32, i32* %n, align 4
  %call6 = call i32 @rhs(i32 %8)
  store i32 %call6, i32* %s, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.else, %if.then4
  %9 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %10 = load i32, i32* %n, align 4
  %11 = load i32, i32* %s, align 4
  %call8 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %9, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 %10, i32 %11)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

declare i32 @fprintf(%struct.__sFILE*, i8*, ...) #1

declare i32 @atoi(i8*) #1

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.8.1 (tags/RELEASE_381/final)"}

; ModuleID = 'harness.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

@.str = private unnamed_addr constant [16 x i8] c"lhs == rhs: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"lhs = %d != rhs = %d\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @exp0(i32 %a, i32 %b) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %retval1 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 1, i32* %retval1, align 4
  %0 = load i32, i32* %b.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %1 = load i32, i32* %b.addr, align 4
  %cmp2 = icmp sgt i32 %1, 0
  br i1 %cmp2, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %a.addr, align 4
  %3 = load i32, i32* %retval1, align 4
  %mul = mul nsw i32 %3, %2
  store i32 %mul, i32* %retval1, align 4
  %4 = load i32, i32* %b.addr, align 4
  %sub = sub nsw i32 %4, 1
  store i32 %sub, i32* %b.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %5 = load i32, i32* %retval1, align 4
  store i32 %5, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: nounwind ssp uwtable
define i32 @exp1(i32 %a, i32 %b) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %retval1 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 1, i32* %retval1, align 4
  %0 = load i32, i32* %b.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end5, %if.end
  %1 = load i32, i32* %b.addr, align 4
  %cmp2 = icmp ne i32 %1, 0
  br i1 %cmp2, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %b.addr, align 4
  %and = and i32 %2, 1
  %cmp3 = icmp ne i32 %and, 0
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %while.body
  %3 = load i32, i32* %a.addr, align 4
  %4 = load i32, i32* %retval1, align 4
  %mul = mul nsw i32 %4, %3
  store i32 %mul, i32* %retval1, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %while.body
  %5 = load i32, i32* %b.addr, align 4
  %shr = ashr i32 %5, 1
  store i32 %shr, i32* %b.addr, align 4
  %6 = load i32, i32* %a.addr, align 4
  %7 = load i32, i32* %a.addr, align 4
  %mul6 = mul nsw i32 %7, %6
  store i32 %mul6, i32* %a.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %8 = load i32, i32* %retval1, align 4
  store i32 %8, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %lhs = alloca i32, align 4
  %rhs = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %cmp = icmp eq i32 %0, 3
  br i1 %cmp, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1
  %2 = load i8*, i8** %arrayidx, align 8
  %call = call i32 @atoi(i8* %2)
  store i32 %call, i32* %a, align 4
  %3 = load i8**, i8*** %argv.addr, align 8
  %arrayidx1 = getelementptr inbounds i8*, i8** %3, i64 2
  %4 = load i8*, i8** %arrayidx1, align 8
  %call2 = call i32 @atoi(i8* %4)
  store i32 %call2, i32* %b, align 4
  %5 = load i32, i32* %a, align 4
  %6 = load i32, i32* %b, align 4
  %call3 = call i32 @exp0(i32 %5, i32 %6)
  store i32 %call3, i32* %lhs, align 4
  %7 = load i32, i32* %a, align 4
  %8 = load i32, i32* %b, align 4
  %call4 = call i32 @exp1(i32 %7, i32 %8)
  store i32 %call4, i32* %rhs, align 4
  %9 = load i32, i32* %lhs, align 4
  %10 = load i32, i32* %rhs, align 4
  %cmp5 = icmp eq i32 %9, %10
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.then
  %11 = load i32, i32* %lhs, align 4
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i32 %11)
  br label %if.end

if.else:                                          ; preds = %if.then
  %12 = load i32, i32* %lhs, align 4
  %13 = load i32, i32* %rhs, align 4
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 %12, i32 %13)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then6
  br label %if.end9

if.end9:                                          ; preds = %if.end, %entry
  ret i32 0
}

declare i32 @atoi(i8*) #1

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.8.1 (tags/RELEASE_381/final)"}

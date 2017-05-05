; ModuleID = 'int2ptr.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

@.str = private unnamed_addr constant [37 x i8] c"foo is %d, foo_ptr is %p, bar is %d\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @lhs(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %ptr = alloca i8*, align 8
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32, i32* %x.addr, align 4
  %conv = sext i32 %0 to i64
  %1 = inttoptr i64 %conv to i8*
  store i8* %1, i8** %ptr, align 8
  %2 = load i8*, i8** %ptr, align 8
  %3 = ptrtoint i8* %2 to i32
  ret i32 %3
}

; Function Attrs: nounwind ssp uwtable
define i32 @rhs(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32, i32* %x.addr, align 4
  ret i32 %0
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %foo = alloca i32, align 4
  %bar = alloca i32, align 4
  %foo_ptr = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sle i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1
  %2 = load i8*, i8** %arrayidx, align 8
  %call = call i64 @atol(i8* %2)
  %conv = trunc i64 %call to i32
  store i32 %conv, i32* %foo, align 4
  %3 = load i32, i32* %foo, align 4
  %conv1 = sext i32 %3 to i64
  %4 = inttoptr i64 %conv1 to i8*
  store i8* %4, i8** %foo_ptr, align 8
  %5 = load i8*, i8** %foo_ptr, align 8
  %6 = ptrtoint i8* %5 to i32
  store i32 %6, i32* %bar, align 4
  %7 = load i32, i32* %foo, align 4
  %8 = load i8*, i8** %foo_ptr, align 8
  %9 = load i32, i32* %bar, align 4
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i32 %7, i8* %8, i32 %9)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

declare i64 @atol(i8*) #1

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.8.1 (tags/RELEASE_381/final)"}

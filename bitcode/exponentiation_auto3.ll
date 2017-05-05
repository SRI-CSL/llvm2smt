; ModuleID = 'exponentiation_auto3.bc'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

@.str = private unnamed_addr constant [16 x i8] c"lhs == rhs: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"lhs = %d != rhs = %d\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define zeroext i16 @exp0(i16 zeroext %a, i16 zeroext %b) #0 {
entry:
  %a.addr = alloca i16, align 2
  %b.addr = alloca i16, align 2
  %retval1 = alloca i16, align 2
  store i16 %a, i16* %a.addr, align 2
  store i16 %b, i16* %b.addr, align 2
  store i16 1, i16* %retval1, align 2
  %0 = load i16, i16* %b.addr, align 2
  %conv1 = zext i16 %0 to i32
  %cmp2 = icmp sgt i32 %conv1, 0
  br i1 %cmp2, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %1 = load i16, i16* %a.addr, align 2
  %conv3 = zext i16 %1 to i32
  %2 = load i16, i16* %retval1, align 2
  %conv4 = zext i16 %2 to i32
  %mul = mul nsw i32 %conv4, %conv3
  %conv5 = trunc i32 %mul to i16
  store i16 %conv5, i16* %retval1, align 2
  %3 = load i16, i16* %b.addr, align 2
  %conv6 = zext i16 %3 to i32
  %sub = sub nsw i32 %conv6, 1
  %conv7 = trunc i32 %sub to i16
  store i16 %conv7, i16* %b.addr, align 2
  %4 = load i16, i16* %b.addr, align 2
  %conv = zext i16 %4 to i32
  %cmp = icmp sgt i32 %conv, 0
  br i1 %cmp, label %while.body, label %while.cond.while.end_crit_edge

while.cond.while.end_crit_edge:                   ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %5 = load i16, i16* %retval1, align 2
  ret i16 %5
}

; Function Attrs: nounwind ssp uwtable
define zeroext i16 @exp1(i16 zeroext %a, i16 zeroext %b) #0 {
entry:
  %a.addr = alloca i16, align 2
  %b.addr = alloca i16, align 2
  %retval1 = alloca i16, align 2
  store i16 %a, i16* %a.addr, align 2
  store i16 %b, i16* %b.addr, align 2
  store i16 1, i16* %retval1, align 2
  %0 = load i16, i16* %b.addr, align 2
  %conv1 = zext i16 %0 to i32
  %cmp2 = icmp ne i32 %conv1, 0
  br i1 %cmp2, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %if.end
  %1 = load i16, i16* %b.addr, align 2
  %conv3 = zext i16 %1 to i32
  %and = and i32 %conv3, 1
  %cmp4 = icmp ne i32 %and, 0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %2 = load i16, i16* %a.addr, align 2
  %conv6 = zext i16 %2 to i32
  %3 = load i16, i16* %retval1, align 2
  %conv7 = zext i16 %3 to i32
  %mul = mul nsw i32 %conv7, %conv6
  %conv8 = trunc i32 %mul to i16
  store i16 %conv8, i16* %retval1, align 2
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %4 = load i16, i16* %b.addr, align 2
  %conv9 = zext i16 %4 to i32
  %shr = ashr i32 %conv9, 1
  %conv10 = trunc i32 %shr to i16
  store i16 %conv10, i16* %b.addr, align 2
  %5 = load i16, i16* %a.addr, align 2
  %conv11 = zext i16 %5 to i32
  %6 = load i16, i16* %a.addr, align 2
  %conv12 = zext i16 %6 to i32
  %mul13 = mul nsw i32 %conv12, %conv11
  %conv14 = trunc i32 %mul13 to i16
  store i16 %conv14, i16* %a.addr, align 2
  %7 = load i16, i16* %b.addr, align 2
  %conv = zext i16 %7 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %while.body, label %while.cond.while.end_crit_edge

while.cond.while.end_crit_edge:                   ; preds = %if.end
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %8 = load i16, i16* %retval1, align 2
  ret i16 %8
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca i16, align 2
  %b = alloca i16, align 2
  %lhs = alloca i16, align 2
  %rhs = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %cmp = icmp eq i32 %0, 3
  br i1 %cmp, label %if.then, label %if.end16

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1
  %2 = load i8*, i8** %arrayidx, align 8
  %call = call i32 @atoi(i8* %2)
  %conv = trunc i32 %call to i16
  store i16 %conv, i16* %a, align 2
  %3 = load i8**, i8*** %argv.addr, align 8
  %arrayidx1 = getelementptr inbounds i8*, i8** %3, i64 2
  %4 = load i8*, i8** %arrayidx1, align 8
  %call2 = call i32 @atoi(i8* %4)
  %conv3 = trunc i32 %call2 to i16
  store i16 %conv3, i16* %b, align 2
  %5 = load i16, i16* %a, align 2
  %6 = load i16, i16* %b, align 2
  %call4 = call zeroext i16 @exp0(i16 zeroext %5, i16 zeroext %6)
  store i16 %call4, i16* %lhs, align 2
  %7 = load i16, i16* %a, align 2
  %8 = load i16, i16* %b, align 2
  %call5 = call zeroext i16 @exp1(i16 zeroext %7, i16 zeroext %8)
  store i16 %call5, i16* %rhs, align 2
  %9 = load i16, i16* %lhs, align 2
  %conv6 = zext i16 %9 to i32
  %10 = load i16, i16* %rhs, align 2
  %conv7 = zext i16 %10 to i32
  %cmp8 = icmp eq i32 %conv6, %conv7
  br i1 %cmp8, label %if.then10, label %if.else

if.then10:                                        ; preds = %if.then
  %11 = load i16, i16* %lhs, align 2
  %conv11 = zext i16 %11 to i32
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i32 %conv11)
  br label %if.end

if.else:                                          ; preds = %if.then
  %12 = load i16, i16* %lhs, align 2
  %conv13 = zext i16 %12 to i32
  %13 = load i16, i16* %rhs, align 2
  %conv14 = zext i16 %13 to i32
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 %conv13, i32 %conv14)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then10
  br label %if.end16

if.end16:                                         ; preds = %if.end, %entry
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

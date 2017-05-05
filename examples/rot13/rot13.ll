; ModuleID = 'rot13.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

@.str = private unnamed_addr constant [60 x i8] c"x = '%c', y = '%c', z = '%c', lhs(x) = '%c', rhs(x) = '%c'\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval.i10 = alloca i8, align 1
  %ch.addr.i11 = alloca i8, align 1
  %offset.i12 = alloca i8, align 1
  %retval.i = alloca i8, align 1
  %ch.addr.i = alloca i8, align 1
  %offset.i = alloca i8, align 1
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %x = alloca i8, align 1
  %y = alloca i8, align 1
  %z = alloca i8, align 1
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
  store i8 %3, i8* %x, align 1
  %4 = load i8, i8* %x, align 1
  store i8 %4, i8* %ch.addr.i, align 1
  %5 = load i8, i8* %ch.addr.i, align 1
  %conv.i = sext i8 %5 to i32
  %cmp.i = icmp sle i32 65, %conv.i
  br i1 %cmp.i, label %land.lhs.true.i, label %if.end.i

land.lhs.true.i:                                  ; preds = %if.then
  %6 = load i8, i8* %ch.addr.i, align 1
  %conv2.i = sext i8 %6 to i32
  %cmp3.i = icmp sle i32 %conv2.i, 90
  br i1 %cmp3.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %land.lhs.true.i
  %7 = load i8, i8* %ch.addr.i, align 1
  %conv5.i = sext i8 %7 to i32
  %sub.i = sub nsw i32 %conv5.i, 65
  %conv6.i = trunc i32 %sub.i to i8
  store i8 %conv6.i, i8* %offset.i, align 1
  %8 = load i8, i8* %offset.i, align 1
  %conv7.i = sext i8 %8 to i32
  %add.i = add nsw i32 %conv7.i, 13
  %rem.i = srem i32 %add.i, 26
  %conv8.i = trunc i32 %rem.i to i8
  store i8 %conv8.i, i8* %offset.i, align 1
  %9 = load i8, i8* %offset.i, align 1
  %conv9.i = sext i8 %9 to i32
  %add10.i = add nsw i32 65, %conv9.i
  %conv11.i = trunc i32 %add10.i to i8
  store i8 %conv11.i, i8* %retval.i, align 1
  br label %rot13_char.exit

if.end.i:                                         ; preds = %land.lhs.true.i, %if.then
  %10 = load i8, i8* %ch.addr.i, align 1
  %conv12.i = sext i8 %10 to i32
  %cmp13.i = icmp sle i32 97, %conv12.i
  br i1 %cmp13.i, label %land.lhs.true15.i, label %if.end30.i

land.lhs.true15.i:                                ; preds = %if.end.i
  %11 = load i8, i8* %ch.addr.i, align 1
  %conv16.i = sext i8 %11 to i32
  %cmp17.i = icmp sle i32 %conv16.i, 122
  br i1 %cmp17.i, label %if.then19.i, label %if.end30.i

if.then19.i:                                      ; preds = %land.lhs.true15.i
  %12 = load i8, i8* %ch.addr.i, align 1
  %conv20.i = sext i8 %12 to i32
  %sub21.i = sub nsw i32 %conv20.i, 97
  %conv22.i = trunc i32 %sub21.i to i8
  store i8 %conv22.i, i8* %offset.i, align 1
  %13 = load i8, i8* %offset.i, align 1
  %conv23.i = sext i8 %13 to i32
  %add24.i = add nsw i32 %conv23.i, 13
  %rem25.i = srem i32 %add24.i, 26
  %conv26.i = trunc i32 %rem25.i to i8
  store i8 %conv26.i, i8* %offset.i, align 1
  %14 = load i8, i8* %offset.i, align 1
  %conv27.i = sext i8 %14 to i32
  %add28.i = add nsw i32 97, %conv27.i
  %conv29.i = trunc i32 %add28.i to i8
  store i8 %conv29.i, i8* %retval.i, align 1
  br label %rot13_char.exit

if.end30.i:                                       ; preds = %land.lhs.true15.i, %if.end.i
  %15 = load i8, i8* %ch.addr.i, align 1
  store i8 %15, i8* %retval.i, align 1
  br label %rot13_char.exit

rot13_char.exit:                                  ; preds = %if.then.i, %if.then19.i, %if.end30.i
  %16 = load i8, i8* %retval.i, align 1
  store i8 %16, i8* %y, align 1
  %17 = load i8, i8* %y, align 1
  store i8 %17, i8* %ch.addr.i11, align 1
  %18 = load i8, i8* %ch.addr.i11, align 1
  %conv.i13 = sext i8 %18 to i32
  %cmp.i14 = icmp sle i32 65, %conv.i13
  br i1 %cmp.i14, label %land.lhs.true.i17, label %if.end.i31

land.lhs.true.i17:                                ; preds = %rot13_char.exit
  %19 = load i8, i8* %ch.addr.i11, align 1
  %conv2.i15 = sext i8 %19 to i32
  %cmp3.i16 = icmp sle i32 %conv2.i15, 90
  br i1 %cmp3.i16, label %if.then.i28, label %if.end.i31

if.then.i28:                                      ; preds = %land.lhs.true.i17
  %20 = load i8, i8* %ch.addr.i11, align 1
  %conv5.i18 = sext i8 %20 to i32
  %sub.i19 = sub nsw i32 %conv5.i18, 65
  %conv6.i20 = trunc i32 %sub.i19 to i8
  store i8 %conv6.i20, i8* %offset.i12, align 1
  %21 = load i8, i8* %offset.i12, align 1
  %conv7.i21 = sext i8 %21 to i32
  %add.i22 = add nsw i32 %conv7.i21, 13
  %rem.i23 = srem i32 %add.i22, 26
  %conv8.i24 = trunc i32 %rem.i23 to i8
  store i8 %conv8.i24, i8* %offset.i12, align 1
  %22 = load i8, i8* %offset.i12, align 1
  %conv9.i25 = sext i8 %22 to i32
  %add10.i26 = add nsw i32 65, %conv9.i25
  %conv11.i27 = trunc i32 %add10.i26 to i8
  store i8 %conv11.i27, i8* %retval.i10, align 1
  br label %rot13_char.exit47

if.end.i31:                                       ; preds = %land.lhs.true.i17, %rot13_char.exit
  %23 = load i8, i8* %ch.addr.i11, align 1
  %conv12.i29 = sext i8 %23 to i32
  %cmp13.i30 = icmp sle i32 97, %conv12.i29
  br i1 %cmp13.i30, label %land.lhs.true15.i34, label %if.end30.i46

land.lhs.true15.i34:                              ; preds = %if.end.i31
  %24 = load i8, i8* %ch.addr.i11, align 1
  %conv16.i32 = sext i8 %24 to i32
  %cmp17.i33 = icmp sle i32 %conv16.i32, 122
  br i1 %cmp17.i33, label %if.then19.i45, label %if.end30.i46

if.then19.i45:                                    ; preds = %land.lhs.true15.i34
  %25 = load i8, i8* %ch.addr.i11, align 1
  %conv20.i35 = sext i8 %25 to i32
  %sub21.i36 = sub nsw i32 %conv20.i35, 97
  %conv22.i37 = trunc i32 %sub21.i36 to i8
  store i8 %conv22.i37, i8* %offset.i12, align 1
  %26 = load i8, i8* %offset.i12, align 1
  %conv23.i38 = sext i8 %26 to i32
  %add24.i39 = add nsw i32 %conv23.i38, 13
  %rem25.i40 = srem i32 %add24.i39, 26
  %conv26.i41 = trunc i32 %rem25.i40 to i8
  store i8 %conv26.i41, i8* %offset.i12, align 1
  %27 = load i8, i8* %offset.i12, align 1
  %conv27.i42 = sext i8 %27 to i32
  %add28.i43 = add nsw i32 97, %conv27.i42
  %conv29.i44 = trunc i32 %add28.i43 to i8
  store i8 %conv29.i44, i8* %retval.i10, align 1
  br label %rot13_char.exit47

if.end30.i46:                                     ; preds = %land.lhs.true15.i34, %if.end.i31
  %28 = load i8, i8* %ch.addr.i11, align 1
  store i8 %28, i8* %retval.i10, align 1
  br label %rot13_char.exit47

rot13_char.exit47:                                ; preds = %if.then.i28, %if.then19.i45, %if.end30.i46
  %29 = load i8, i8* %retval.i10, align 1
  store i8 %29, i8* %z, align 1
  %30 = load i8, i8* %x, align 1
  %conv = sext i8 %30 to i32
  %31 = load i8, i8* %y, align 1
  %conv3 = sext i8 %31 to i32
  %32 = load i8, i8* %z, align 1
  %conv4 = sext i8 %32 to i32
  %33 = load i8, i8* %x, align 1
  %call5 = call signext i8 @lhs(i8 signext %33)
  %conv6 = sext i8 %call5 to i32
  %34 = load i8, i8* %x, align 1
  %call7 = call signext i8 @rhs(i8 signext %34)
  %conv8 = sext i8 %call7 to i32
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str, i32 0, i32 0), i32 %conv, i32 %conv3, i32 %conv4, i32 %conv6, i32 %conv8)
  br label %if.end

if.end:                                           ; preds = %rot13_char.exit47, %entry
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind ssp uwtable
define internal signext i8 @lhs(i8 signext %x) #0 {
entry:
  %x.addr = alloca i8, align 1
  store i8 %x, i8* %x.addr, align 1
  %0 = load i8, i8* %x.addr, align 1
  ret i8 %0
}

; Function Attrs: nounwind ssp uwtable
define internal signext i8 @rhs(i8 signext %x) #0 {
entry:
  %retval.i2 = alloca i8, align 1
  %ch.addr.i3 = alloca i8, align 1
  %offset.i4 = alloca i8, align 1
  %retval.i = alloca i8, align 1
  %ch.addr.i = alloca i8, align 1
  %offset.i = alloca i8, align 1
  %x.addr = alloca i8, align 1
  store i8 %x, i8* %x.addr, align 1
  %0 = load i8, i8* %x.addr, align 1
  store i8 %0, i8* %ch.addr.i, align 1
  %1 = load i8, i8* %ch.addr.i, align 1
  %conv.i = sext i8 %1 to i32
  %cmp.i = icmp sle i32 65, %conv.i
  br i1 %cmp.i, label %land.lhs.true.i, label %if.end.i

land.lhs.true.i:                                  ; preds = %entry
  %2 = load i8, i8* %ch.addr.i, align 1
  %conv2.i = sext i8 %2 to i32
  %cmp3.i = icmp sle i32 %conv2.i, 90
  br i1 %cmp3.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %land.lhs.true.i
  %3 = load i8, i8* %ch.addr.i, align 1
  %conv5.i = sext i8 %3 to i32
  %sub.i = sub nsw i32 %conv5.i, 65
  %conv6.i = trunc i32 %sub.i to i8
  store i8 %conv6.i, i8* %offset.i, align 1
  %4 = load i8, i8* %offset.i, align 1
  %conv7.i = sext i8 %4 to i32
  %add.i = add nsw i32 %conv7.i, 13
  %rem.i = srem i32 %add.i, 26
  %conv8.i = trunc i32 %rem.i to i8
  store i8 %conv8.i, i8* %offset.i, align 1
  %5 = load i8, i8* %offset.i, align 1
  %conv9.i = sext i8 %5 to i32
  %add10.i = add nsw i32 65, %conv9.i
  %conv11.i = trunc i32 %add10.i to i8
  store i8 %conv11.i, i8* %retval.i, align 1
  br label %rot13_char.exit

if.end.i:                                         ; preds = %land.lhs.true.i, %entry
  %6 = load i8, i8* %ch.addr.i, align 1
  %conv12.i = sext i8 %6 to i32
  %cmp13.i = icmp sle i32 97, %conv12.i
  br i1 %cmp13.i, label %land.lhs.true15.i, label %if.end30.i

land.lhs.true15.i:                                ; preds = %if.end.i
  %7 = load i8, i8* %ch.addr.i, align 1
  %conv16.i = sext i8 %7 to i32
  %cmp17.i = icmp sle i32 %conv16.i, 122
  br i1 %cmp17.i, label %if.then19.i, label %if.end30.i

if.then19.i:                                      ; preds = %land.lhs.true15.i
  %8 = load i8, i8* %ch.addr.i, align 1
  %conv20.i = sext i8 %8 to i32
  %sub21.i = sub nsw i32 %conv20.i, 97
  %conv22.i = trunc i32 %sub21.i to i8
  store i8 %conv22.i, i8* %offset.i, align 1
  %9 = load i8, i8* %offset.i, align 1
  %conv23.i = sext i8 %9 to i32
  %add24.i = add nsw i32 %conv23.i, 13
  %rem25.i = srem i32 %add24.i, 26
  %conv26.i = trunc i32 %rem25.i to i8
  store i8 %conv26.i, i8* %offset.i, align 1
  %10 = load i8, i8* %offset.i, align 1
  %conv27.i = sext i8 %10 to i32
  %add28.i = add nsw i32 97, %conv27.i
  %conv29.i = trunc i32 %add28.i to i8
  store i8 %conv29.i, i8* %retval.i, align 1
  br label %rot13_char.exit

if.end30.i:                                       ; preds = %land.lhs.true15.i, %if.end.i
  %11 = load i8, i8* %ch.addr.i, align 1
  store i8 %11, i8* %retval.i, align 1
  br label %rot13_char.exit

rot13_char.exit:                                  ; preds = %if.then.i, %if.then19.i, %if.end30.i
  %12 = load i8, i8* %retval.i, align 1
  store i8 %12, i8* %ch.addr.i3, align 1
  %13 = load i8, i8* %ch.addr.i3, align 1
  %conv.i5 = sext i8 %13 to i32
  %cmp.i6 = icmp sle i32 65, %conv.i5
  br i1 %cmp.i6, label %land.lhs.true.i9, label %if.end.i23

land.lhs.true.i9:                                 ; preds = %rot13_char.exit
  %14 = load i8, i8* %ch.addr.i3, align 1
  %conv2.i7 = sext i8 %14 to i32
  %cmp3.i8 = icmp sle i32 %conv2.i7, 90
  br i1 %cmp3.i8, label %if.then.i20, label %if.end.i23

if.then.i20:                                      ; preds = %land.lhs.true.i9
  %15 = load i8, i8* %ch.addr.i3, align 1
  %conv5.i10 = sext i8 %15 to i32
  %sub.i11 = sub nsw i32 %conv5.i10, 65
  %conv6.i12 = trunc i32 %sub.i11 to i8
  store i8 %conv6.i12, i8* %offset.i4, align 1
  %16 = load i8, i8* %offset.i4, align 1
  %conv7.i13 = sext i8 %16 to i32
  %add.i14 = add nsw i32 %conv7.i13, 13
  %rem.i15 = srem i32 %add.i14, 26
  %conv8.i16 = trunc i32 %rem.i15 to i8
  store i8 %conv8.i16, i8* %offset.i4, align 1
  %17 = load i8, i8* %offset.i4, align 1
  %conv9.i17 = sext i8 %17 to i32
  %add10.i18 = add nsw i32 65, %conv9.i17
  %conv11.i19 = trunc i32 %add10.i18 to i8
  store i8 %conv11.i19, i8* %retval.i2, align 1
  br label %rot13_char.exit39

if.end.i23:                                       ; preds = %land.lhs.true.i9, %rot13_char.exit
  %18 = load i8, i8* %ch.addr.i3, align 1
  %conv12.i21 = sext i8 %18 to i32
  %cmp13.i22 = icmp sle i32 97, %conv12.i21
  br i1 %cmp13.i22, label %land.lhs.true15.i26, label %if.end30.i38

land.lhs.true15.i26:                              ; preds = %if.end.i23
  %19 = load i8, i8* %ch.addr.i3, align 1
  %conv16.i24 = sext i8 %19 to i32
  %cmp17.i25 = icmp sle i32 %conv16.i24, 122
  br i1 %cmp17.i25, label %if.then19.i37, label %if.end30.i38

if.then19.i37:                                    ; preds = %land.lhs.true15.i26
  %20 = load i8, i8* %ch.addr.i3, align 1
  %conv20.i27 = sext i8 %20 to i32
  %sub21.i28 = sub nsw i32 %conv20.i27, 97
  %conv22.i29 = trunc i32 %sub21.i28 to i8
  store i8 %conv22.i29, i8* %offset.i4, align 1
  %21 = load i8, i8* %offset.i4, align 1
  %conv23.i30 = sext i8 %21 to i32
  %add24.i31 = add nsw i32 %conv23.i30, 13
  %rem25.i32 = srem i32 %add24.i31, 26
  %conv26.i33 = trunc i32 %rem25.i32 to i8
  store i8 %conv26.i33, i8* %offset.i4, align 1
  %22 = load i8, i8* %offset.i4, align 1
  %conv27.i34 = sext i8 %22 to i32
  %add28.i35 = add nsw i32 97, %conv27.i34
  %conv29.i36 = trunc i32 %add28.i35 to i8
  store i8 %conv29.i36, i8* %retval.i2, align 1
  br label %rot13_char.exit39

if.end30.i38:                                     ; preds = %land.lhs.true15.i26, %if.end.i23
  %23 = load i8, i8* %ch.addr.i3, align 1
  store i8 %23, i8* %retval.i2, align 1
  br label %rot13_char.exit39

rot13_char.exit39:                                ; preds = %if.then.i20, %if.then19.i37, %if.end30.i38
  %24 = load i8, i8* %retval.i2, align 1
  ret i8 %24
}

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.8.1 (tags/RELEASE_381/final)"}

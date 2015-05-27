; ModuleID = 'primes_opt_auto10.bc'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stderrp = external global %struct.__sFILE*
@.str = private unnamed_addr constant [13 x i8] c"%d is prime\0A\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"Usage: %s <n>\0A\00", align 1
@.str2 = private unnamed_addr constant [15 x i8] c"The sum is %d\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @primes(i32 %u) #0 {
  %1 = icmp sgt i32 %u, 1
  br i1 %1, label %.preheader.lr.ph.preheader, label %.thread1._crit_edge

.preheader.lr.ph.preheader:                       ; preds = %0
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.thread1.outer, %.preheader.lr.ph.preheader
  %2 = phi i32 [ %17, %.thread1.outer ], [ 2, %.preheader.lr.ph.preheader ]
  %sum.0.ph8 = phi i32 [ %16, %.thread1.outer ], [ 0, %.preheader.lr.ph.preheader ]
  br label %.preheader

.thread1.loopexit:                                ; preds = %.lr.ph.9, %.lr.ph.8, %.lr.ph.7, %.lr.ph.6, %.lr.ph.5, %.lr.ph.4, %.lr.ph.3, %.lr.ph.2, %.lr.ph.1, %.lr.ph
  %3 = add nsw i32 %5, 1
  %4 = icmp slt i32 %5, %u
  br i1 %4, label %.preheader, label %.thread1._crit_edge.loopexit

.preheader:                                       ; preds = %.thread1.loopexit, %.preheader.lr.ph
  %5 = phi i32 [ %2, %.preheader.lr.ph ], [ %3, %.thread1.loopexit ]
  %6 = icmp slt i32 %5, 4
  br i1 %6, label %.thread1.outer.loopexit1, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

; <label>:7                                       ; preds = %.lr.ph
  %8 = sdiv i32 %5, %12
  %9 = icmp slt i32 %j.02, %8
  br i1 %9, label %.lr.ph.1, label %.thread1.outer.loopexit

.lr.ph:                                           ; preds = %70, %.lr.ph.preheader
  %j.02 = phi i32 [ 2, %.lr.ph.preheader ], [ %69, %70 ]
  %10 = srem i32 %5, %j.02
  %11 = icmp eq i32 %10, 0
  %12 = add nsw i32 %j.02, 1
  br i1 %11, label %.thread1.loopexit, label %7

.thread1.outer.loopexit:                          ; preds = %70, %64, %58, %52, %46, %40, %34, %28, %22, %7
  %.lcssa3 = phi i32 [ %5, %7 ], [ %5, %22 ], [ %5, %28 ], [ %5, %34 ], [ %5, %40 ], [ %5, %46 ], [ %5, %52 ], [ %5, %58 ], [ %5, %64 ], [ %5, %70 ]
  br label %.thread1.outer

.thread1.outer.loopexit1:                         ; preds = %.preheader
  %.lcssa = phi i32 [ %5, %.preheader ]
  br label %.thread1.outer

.thread1.outer:                                   ; preds = %.thread1.outer.loopexit1, %.thread1.outer.loopexit
  %13 = phi i32 [ %.lcssa, %.thread1.outer.loopexit1 ], [ %.lcssa3, %.thread1.outer.loopexit ]
  %14 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !1
  %15 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %14, i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), i32 %13) #3
  %16 = add nsw i32 %13, %sum.0.ph8
  %17 = add nsw i32 %13, 1
  %18 = icmp slt i32 %13, %u
  br i1 %18, label %.preheader.lr.ph, label %.thread1._crit_edge.loopexit2

.thread1._crit_edge.loopexit:                     ; preds = %.thread1.loopexit
  %sum.0.ph8.lcssa = phi i32 [ %sum.0.ph8, %.thread1.loopexit ]
  br label %.thread1._crit_edge

.thread1._crit_edge.loopexit2:                    ; preds = %.thread1.outer
  %.lcssa6 = phi i32 [ %16, %.thread1.outer ]
  br label %.thread1._crit_edge

.thread1._crit_edge:                              ; preds = %.thread1._crit_edge.loopexit2, %.thread1._crit_edge.loopexit, %0
  %sum.0.ph7 = phi i32 [ 0, %0 ], [ %sum.0.ph8.lcssa, %.thread1._crit_edge.loopexit ], [ %.lcssa6, %.thread1._crit_edge.loopexit2 ]
  ret i32 %sum.0.ph7

.lr.ph.1:                                         ; preds = %7
  %19 = srem i32 %5, %12
  %20 = icmp eq i32 %19, 0
  %21 = add nsw i32 %12, 1
  br i1 %20, label %.thread1.loopexit, label %22

; <label>:22                                      ; preds = %.lr.ph.1
  %23 = sdiv i32 %5, %21
  %24 = icmp slt i32 %12, %23
  br i1 %24, label %.lr.ph.2, label %.thread1.outer.loopexit

.lr.ph.2:                                         ; preds = %22
  %25 = srem i32 %5, %21
  %26 = icmp eq i32 %25, 0
  %27 = add nsw i32 %21, 1
  br i1 %26, label %.thread1.loopexit, label %28

; <label>:28                                      ; preds = %.lr.ph.2
  %29 = sdiv i32 %5, %27
  %30 = icmp slt i32 %21, %29
  br i1 %30, label %.lr.ph.3, label %.thread1.outer.loopexit

.lr.ph.3:                                         ; preds = %28
  %31 = srem i32 %5, %27
  %32 = icmp eq i32 %31, 0
  %33 = add nsw i32 %27, 1
  br i1 %32, label %.thread1.loopexit, label %34

; <label>:34                                      ; preds = %.lr.ph.3
  %35 = sdiv i32 %5, %33
  %36 = icmp slt i32 %27, %35
  br i1 %36, label %.lr.ph.4, label %.thread1.outer.loopexit

.lr.ph.4:                                         ; preds = %34
  %37 = srem i32 %5, %33
  %38 = icmp eq i32 %37, 0
  %39 = add nsw i32 %33, 1
  br i1 %38, label %.thread1.loopexit, label %40

; <label>:40                                      ; preds = %.lr.ph.4
  %41 = sdiv i32 %5, %39
  %42 = icmp slt i32 %33, %41
  br i1 %42, label %.lr.ph.5, label %.thread1.outer.loopexit

.lr.ph.5:                                         ; preds = %40
  %43 = srem i32 %5, %39
  %44 = icmp eq i32 %43, 0
  %45 = add nsw i32 %39, 1
  br i1 %44, label %.thread1.loopexit, label %46

; <label>:46                                      ; preds = %.lr.ph.5
  %47 = sdiv i32 %5, %45
  %48 = icmp slt i32 %39, %47
  br i1 %48, label %.lr.ph.6, label %.thread1.outer.loopexit

.lr.ph.6:                                         ; preds = %46
  %49 = srem i32 %5, %45
  %50 = icmp eq i32 %49, 0
  %51 = add nsw i32 %45, 1
  br i1 %50, label %.thread1.loopexit, label %52

; <label>:52                                      ; preds = %.lr.ph.6
  %53 = sdiv i32 %5, %51
  %54 = icmp slt i32 %45, %53
  br i1 %54, label %.lr.ph.7, label %.thread1.outer.loopexit

.lr.ph.7:                                         ; preds = %52
  %55 = srem i32 %5, %51
  %56 = icmp eq i32 %55, 0
  %57 = add nsw i32 %51, 1
  br i1 %56, label %.thread1.loopexit, label %58

; <label>:58                                      ; preds = %.lr.ph.7
  %59 = sdiv i32 %5, %57
  %60 = icmp slt i32 %51, %59
  br i1 %60, label %.lr.ph.8, label %.thread1.outer.loopexit

.lr.ph.8:                                         ; preds = %58
  %61 = srem i32 %5, %57
  %62 = icmp eq i32 %61, 0
  %63 = add nsw i32 %57, 1
  br i1 %62, label %.thread1.loopexit, label %64

; <label>:64                                      ; preds = %.lr.ph.8
  %65 = sdiv i32 %5, %63
  %66 = icmp slt i32 %57, %65
  br i1 %66, label %.lr.ph.9, label %.thread1.outer.loopexit

.lr.ph.9:                                         ; preds = %64
  %67 = srem i32 %5, %63
  %68 = icmp eq i32 %67, 0
  %69 = add nsw i32 %63, 1
  br i1 %68, label %.thread1.loopexit, label %70

; <label>:70                                      ; preds = %.lr.ph.9
  %71 = sdiv i32 %5, %69
  %72 = icmp slt i32 %63, %71
  br i1 %72, label %.lr.ph, label %.thread1.outer.loopexit
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct.__sFILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  %1 = icmp slt i32 %argc, 2
  br i1 %1, label %2, label %6

; <label>:2                                       ; preds = %0
  %3 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !1
  %4 = load i8** %argv, align 8, !tbaa !1
  %5 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %3, i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), i8* %4) #3
  br label %13

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds i8** %argv, i64 1
  %8 = load i8** %7, align 8, !tbaa !1
  %9 = tail call i32 @atoi(i8* %8) #3
  %10 = tail call i32 @primes(i32 %9)
  %11 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !1
  %12 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %11, i8* getelementptr inbounds ([15 x i8]* @.str2, i64 0, i64 0), i32 %10) #3
  br label %13

; <label>:13                                      ; preds = %6, %2
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) #2

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Apple LLVM version 6.0 (clang-600.0.57) (based on LLVM 3.5svn)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"any pointer", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}

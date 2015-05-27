; ModuleID = 'primes_opt_auto3.bc'
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

.thread1.loopexit:                                ; preds = %.lr.ph.2, %.lr.ph.1, %.lr.ph
  %3 = add nsw i32 %5, 1
  %4 = icmp slt i32 %5, %u
  br i1 %4, label %.preheader.1, label %.thread1._crit_edge.loopexit

.preheader:                                       ; preds = %.thread1.loopexit.2, %.preheader.lr.ph
  %5 = phi i32 [ %2, %.preheader.lr.ph ], [ %71, %.thread1.loopexit.2 ]
  %6 = icmp slt i32 %5, 4
  br i1 %6, label %.thread1.outer.loopexit1, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

; <label>:7                                       ; preds = %.lr.ph
  %8 = sdiv i32 %5, %12
  %9 = icmp slt i32 %j.02, %8
  br i1 %9, label %.lr.ph.1, label %.thread1.outer.loopexit.loopexit

.lr.ph:                                           ; preds = %28, %.lr.ph.preheader
  %j.02 = phi i32 [ 2, %.lr.ph.preheader ], [ %27, %28 ]
  %10 = srem i32 %5, %j.02
  %11 = icmp eq i32 %10, 0
  %12 = add nsw i32 %j.02, 1
  br i1 %11, label %.thread1.loopexit, label %7

.thread1.outer.loopexit.loopexit:                 ; preds = %28, %22, %7
  %.lcssa3.ph = phi i32 [ %5, %28 ], [ %5, %22 ], [ %5, %7 ]
  br label %.thread1.outer.loopexit

.thread1.outer.loopexit.loopexit9:                ; preds = %68, %62, %56, %47, %41, %35
  %.lcssa3.ph10 = phi i32 [ %50, %68 ], [ %50, %62 ], [ %50, %56 ], [ %3, %47 ], [ %3, %41 ], [ %3, %35 ]
  br label %.thread1.outer.loopexit

.thread1.outer.loopexit:                          ; preds = %.thread1.outer.loopexit.loopexit9, %.thread1.outer.loopexit.loopexit
  %.lcssa3 = phi i32 [ %.lcssa3.ph, %.thread1.outer.loopexit.loopexit ], [ %.lcssa3.ph10, %.thread1.outer.loopexit.loopexit9 ]
  br label %.thread1.outer

.thread1.outer.loopexit1:                         ; preds = %.preheader.2, %.preheader.1, %.preheader
  %.lcssa = phi i32 [ %5, %.preheader ], [ %3, %.preheader.1 ], [ %50, %.preheader.2 ]
  br label %.thread1.outer

.thread1.outer:                                   ; preds = %.thread1.outer.loopexit1, %.thread1.outer.loopexit
  %13 = phi i32 [ %.lcssa, %.thread1.outer.loopexit1 ], [ %.lcssa3, %.thread1.outer.loopexit ]
  %14 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !1
  %15 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %14, i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), i32 %13) #3
  %16 = add nsw i32 %13, %sum.0.ph8
  %17 = add nsw i32 %13, 1
  %18 = icmp slt i32 %13, %u
  br i1 %18, label %.preheader.lr.ph, label %.thread1._crit_edge.loopexit2

.thread1._crit_edge.loopexit:                     ; preds = %.thread1.loopexit.2, %.thread1.loopexit.1, %.thread1.loopexit
  %sum.0.ph8.lcssa = phi i32 [ %sum.0.ph8, %.thread1.loopexit ], [ %sum.0.ph8, %.thread1.loopexit.1 ], [ %sum.0.ph8, %.thread1.loopexit.2 ]
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
  br i1 %24, label %.lr.ph.2, label %.thread1.outer.loopexit.loopexit

.lr.ph.2:                                         ; preds = %22
  %25 = srem i32 %5, %21
  %26 = icmp eq i32 %25, 0
  %27 = add nsw i32 %21, 1
  br i1 %26, label %.thread1.loopexit, label %28

; <label>:28                                      ; preds = %.lr.ph.2
  %29 = sdiv i32 %5, %27
  %30 = icmp slt i32 %21, %29
  br i1 %30, label %.lr.ph, label %.thread1.outer.loopexit.loopexit

.preheader.1:                                     ; preds = %.thread1.loopexit
  %31 = icmp slt i32 %3, 4
  br i1 %31, label %.thread1.outer.loopexit1, label %.lr.ph.preheader.1

.lr.ph.preheader.1:                               ; preds = %.preheader.1
  br label %.lr.ph.17

.lr.ph.17:                                        ; preds = %47, %.lr.ph.preheader.1
  %j.02.1 = phi i32 [ 2, %.lr.ph.preheader.1 ], [ %46, %47 ]
  %32 = srem i32 %3, %j.02.1
  %33 = icmp eq i32 %32, 0
  %34 = add nsw i32 %j.02.1, 1
  br i1 %33, label %.thread1.loopexit.1, label %35

; <label>:35                                      ; preds = %.lr.ph.17
  %36 = sdiv i32 %3, %34
  %37 = icmp slt i32 %j.02.1, %36
  br i1 %37, label %.lr.ph.1.1, label %.thread1.outer.loopexit.loopexit9

.lr.ph.1.1:                                       ; preds = %35
  %38 = srem i32 %3, %34
  %39 = icmp eq i32 %38, 0
  %40 = add nsw i32 %34, 1
  br i1 %39, label %.thread1.loopexit.1, label %41

; <label>:41                                      ; preds = %.lr.ph.1.1
  %42 = sdiv i32 %3, %40
  %43 = icmp slt i32 %34, %42
  br i1 %43, label %.lr.ph.2.1, label %.thread1.outer.loopexit.loopexit9

.lr.ph.2.1:                                       ; preds = %41
  %44 = srem i32 %3, %40
  %45 = icmp eq i32 %44, 0
  %46 = add nsw i32 %40, 1
  br i1 %45, label %.thread1.loopexit.1, label %47

; <label>:47                                      ; preds = %.lr.ph.2.1
  %48 = sdiv i32 %3, %46
  %49 = icmp slt i32 %40, %48
  br i1 %49, label %.lr.ph.17, label %.thread1.outer.loopexit.loopexit9

.thread1.loopexit.1:                              ; preds = %.lr.ph.2.1, %.lr.ph.1.1, %.lr.ph.17
  %50 = add nsw i32 %3, 1
  %51 = icmp slt i32 %3, %u
  br i1 %51, label %.preheader.2, label %.thread1._crit_edge.loopexit

.preheader.2:                                     ; preds = %.thread1.loopexit.1
  %52 = icmp slt i32 %50, 4
  br i1 %52, label %.thread1.outer.loopexit1, label %.lr.ph.preheader.2

.lr.ph.preheader.2:                               ; preds = %.preheader.2
  br label %.lr.ph.28

.lr.ph.28:                                        ; preds = %68, %.lr.ph.preheader.2
  %j.02.2 = phi i32 [ 2, %.lr.ph.preheader.2 ], [ %67, %68 ]
  %53 = srem i32 %50, %j.02.2
  %54 = icmp eq i32 %53, 0
  %55 = add nsw i32 %j.02.2, 1
  br i1 %54, label %.thread1.loopexit.2, label %56

; <label>:56                                      ; preds = %.lr.ph.28
  %57 = sdiv i32 %50, %55
  %58 = icmp slt i32 %j.02.2, %57
  br i1 %58, label %.lr.ph.1.2, label %.thread1.outer.loopexit.loopexit9

.lr.ph.1.2:                                       ; preds = %56
  %59 = srem i32 %50, %55
  %60 = icmp eq i32 %59, 0
  %61 = add nsw i32 %55, 1
  br i1 %60, label %.thread1.loopexit.2, label %62

; <label>:62                                      ; preds = %.lr.ph.1.2
  %63 = sdiv i32 %50, %61
  %64 = icmp slt i32 %55, %63
  br i1 %64, label %.lr.ph.2.2, label %.thread1.outer.loopexit.loopexit9

.lr.ph.2.2:                                       ; preds = %62
  %65 = srem i32 %50, %61
  %66 = icmp eq i32 %65, 0
  %67 = add nsw i32 %61, 1
  br i1 %66, label %.thread1.loopexit.2, label %68

; <label>:68                                      ; preds = %.lr.ph.2.2
  %69 = sdiv i32 %50, %67
  %70 = icmp slt i32 %61, %69
  br i1 %70, label %.lr.ph.28, label %.thread1.outer.loopexit.loopexit9

.thread1.loopexit.2:                              ; preds = %.lr.ph.2.2, %.lr.ph.1.2, %.lr.ph.28
  %71 = add nsw i32 %50, 1
  %72 = icmp slt i32 %50, %u
  br i1 %72, label %.preheader, label %.thread1._crit_edge.loopexit
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

; ModuleID = 'primes_opt_auto2.bc'
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

.preheader.lr.ph:                                 ; preds = %.thread1.outer.1, %.preheader.lr.ph.preheader
  %2 = phi i32 [ 2, %.preheader.lr.ph.preheader ], [ %75, %.thread1.outer.1 ]
  %sum.0.ph8 = phi i32 [ 0, %.preheader.lr.ph.preheader ], [ %74, %.thread1.outer.1 ]
  br label %.preheader

.thread1.loopexit:                                ; preds = %.lr.ph.1, %.lr.ph
  %3 = add nsw i32 %5, 1
  %4 = icmp slt i32 %5, %u
  br i1 %4, label %.preheader.1, label %.thread1._crit_edge.loopexit.loopexit

.preheader:                                       ; preds = %.thread1.loopexit.1, %.preheader.lr.ph
  %5 = phi i32 [ %2, %.preheader.lr.ph ], [ %38, %.thread1.loopexit.1 ]
  %6 = icmp slt i32 %5, 4
  br i1 %6, label %.thread1.outer.loopexit1, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

; <label>:7                                       ; preds = %.lr.ph
  %8 = sdiv i32 %5, %12
  %9 = icmp slt i32 %j.02, %8
  br i1 %9, label %.lr.ph.1, label %.thread1.outer.loopexit.loopexit

.lr.ph:                                           ; preds = %22, %.lr.ph.preheader
  %j.02 = phi i32 [ 2, %.lr.ph.preheader ], [ %21, %22 ]
  %10 = srem i32 %5, %j.02
  %11 = icmp eq i32 %10, 0
  %12 = add nsw i32 %j.02, 1
  br i1 %11, label %.thread1.loopexit, label %7

.thread1.outer.loopexit.loopexit:                 ; preds = %22, %7
  %.lcssa3.ph = phi i32 [ %5, %22 ], [ %5, %7 ]
  br label %.thread1.outer.loopexit

.thread1.outer.loopexit.loopexit8:                ; preds = %35, %29
  %.lcssa3.ph9 = phi i32 [ %3, %35 ], [ %3, %29 ]
  br label %.thread1.outer.loopexit

.thread1.outer.loopexit:                          ; preds = %.thread1.outer.loopexit.loopexit8, %.thread1.outer.loopexit.loopexit
  %.lcssa3 = phi i32 [ %.lcssa3.ph, %.thread1.outer.loopexit.loopexit ], [ %.lcssa3.ph9, %.thread1.outer.loopexit.loopexit8 ]
  br label %.thread1.outer

.thread1.outer.loopexit1:                         ; preds = %.preheader.1, %.preheader
  %.lcssa = phi i32 [ %5, %.preheader ], [ %3, %.preheader.1 ]
  br label %.thread1.outer

.thread1.outer:                                   ; preds = %.thread1.outer.loopexit1, %.thread1.outer.loopexit
  %13 = phi i32 [ %.lcssa, %.thread1.outer.loopexit1 ], [ %.lcssa3, %.thread1.outer.loopexit ]
  %14 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !1
  %15 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %14, i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), i32 %13) #3
  %16 = add nsw i32 %13, %sum.0.ph8
  %17 = add nsw i32 %13, 1
  %18 = icmp slt i32 %13, %u
  br i1 %18, label %.preheader.lr.ph.1, label %.thread1._crit_edge.loopexit2

.thread1._crit_edge.loopexit.loopexit:            ; preds = %.thread1.loopexit.1, %.thread1.loopexit
  %sum.0.ph8.lcssa.ph = phi i32 [ %sum.0.ph8, %.thread1.loopexit.1 ], [ %sum.0.ph8, %.thread1.loopexit ]
  br label %.thread1._crit_edge.loopexit

.thread1._crit_edge.loopexit.loopexit16:          ; preds = %.thread1.loopexit.1.1, %.thread1.loopexit.115
  %sum.0.ph8.lcssa.ph17 = phi i32 [ %16, %.thread1.loopexit.1.1 ], [ %16, %.thread1.loopexit.115 ]
  br label %.thread1._crit_edge.loopexit

.thread1._crit_edge.loopexit:                     ; preds = %.thread1._crit_edge.loopexit.loopexit16, %.thread1._crit_edge.loopexit.loopexit
  %sum.0.ph8.lcssa = phi i32 [ %sum.0.ph8.lcssa.ph, %.thread1._crit_edge.loopexit.loopexit ], [ %sum.0.ph8.lcssa.ph17, %.thread1._crit_edge.loopexit.loopexit16 ]
  br label %.thread1._crit_edge

.thread1._crit_edge.loopexit2:                    ; preds = %.thread1.outer.1, %.thread1.outer
  %.lcssa6 = phi i32 [ %16, %.thread1.outer ], [ %74, %.thread1.outer.1 ]
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
  br i1 %24, label %.lr.ph, label %.thread1.outer.loopexit.loopexit

.preheader.1:                                     ; preds = %.thread1.loopexit
  %25 = icmp slt i32 %3, 4
  br i1 %25, label %.thread1.outer.loopexit1, label %.lr.ph.preheader.1

.lr.ph.preheader.1:                               ; preds = %.preheader.1
  br label %.lr.ph.17

.lr.ph.17:                                        ; preds = %35, %.lr.ph.preheader.1
  %j.02.1 = phi i32 [ 2, %.lr.ph.preheader.1 ], [ %34, %35 ]
  %26 = srem i32 %3, %j.02.1
  %27 = icmp eq i32 %26, 0
  %28 = add nsw i32 %j.02.1, 1
  br i1 %27, label %.thread1.loopexit.1, label %29

; <label>:29                                      ; preds = %.lr.ph.17
  %30 = sdiv i32 %3, %28
  %31 = icmp slt i32 %j.02.1, %30
  br i1 %31, label %.lr.ph.1.1, label %.thread1.outer.loopexit.loopexit8

.lr.ph.1.1:                                       ; preds = %29
  %32 = srem i32 %3, %28
  %33 = icmp eq i32 %32, 0
  %34 = add nsw i32 %28, 1
  br i1 %33, label %.thread1.loopexit.1, label %35

; <label>:35                                      ; preds = %.lr.ph.1.1
  %36 = sdiv i32 %3, %34
  %37 = icmp slt i32 %28, %36
  br i1 %37, label %.lr.ph.17, label %.thread1.outer.loopexit.loopexit8

.thread1.loopexit.1:                              ; preds = %.lr.ph.1.1, %.lr.ph.17
  %38 = add nsw i32 %3, 1
  %39 = icmp slt i32 %3, %u
  br i1 %39, label %.preheader, label %.thread1._crit_edge.loopexit.loopexit

.preheader.lr.ph.1:                               ; preds = %.thread1.outer
  br label %.preheader.110

.preheader.110:                                   ; preds = %.thread1.loopexit.1.1, %.preheader.lr.ph.1
  %40 = phi i32 [ %17, %.preheader.lr.ph.1 ], [ %69, %.thread1.loopexit.1.1 ]
  %41 = icmp slt i32 %40, 4
  br i1 %41, label %.thread1.outer.loopexit1.1, label %.lr.ph.preheader.111

.lr.ph.preheader.111:                             ; preds = %.preheader.110
  br label %.lr.ph.113

.lr.ph.113:                                       ; preds = %51, %.lr.ph.preheader.111
  %j.02.112 = phi i32 [ 2, %.lr.ph.preheader.111 ], [ %50, %51 ]
  %42 = srem i32 %40, %j.02.112
  %43 = icmp eq i32 %42, 0
  %44 = add nsw i32 %j.02.112, 1
  br i1 %43, label %.thread1.loopexit.115, label %45

; <label>:45                                      ; preds = %.lr.ph.113
  %46 = sdiv i32 %40, %44
  %47 = icmp slt i32 %j.02.112, %46
  br i1 %47, label %.lr.ph.1.114, label %.thread1.outer.loopexit.loopexit.1

.lr.ph.1.114:                                     ; preds = %45
  %48 = srem i32 %40, %44
  %49 = icmp eq i32 %48, 0
  %50 = add nsw i32 %44, 1
  br i1 %49, label %.thread1.loopexit.115, label %51

; <label>:51                                      ; preds = %.lr.ph.1.114
  %52 = sdiv i32 %40, %50
  %53 = icmp slt i32 %44, %52
  br i1 %53, label %.lr.ph.113, label %.thread1.outer.loopexit.loopexit.1

.thread1.outer.loopexit.loopexit.1:               ; preds = %51, %45
  br label %.thread1.outer.loopexit.1

.thread1.loopexit.115:                            ; preds = %.lr.ph.1.114, %.lr.ph.113
  %54 = add nsw i32 %40, 1
  %55 = icmp slt i32 %40, %u
  br i1 %55, label %.preheader.1.1, label %.thread1._crit_edge.loopexit.loopexit16

.preheader.1.1:                                   ; preds = %.thread1.loopexit.115
  %56 = icmp slt i32 %54, 4
  br i1 %56, label %.thread1.outer.loopexit1.1, label %.lr.ph.preheader.1.1

.lr.ph.preheader.1.1:                             ; preds = %.preheader.1.1
  br label %.lr.ph.17.1

.lr.ph.17.1:                                      ; preds = %66, %.lr.ph.preheader.1.1
  %j.02.1.1 = phi i32 [ 2, %.lr.ph.preheader.1.1 ], [ %65, %66 ]
  %57 = srem i32 %54, %j.02.1.1
  %58 = icmp eq i32 %57, 0
  %59 = add nsw i32 %j.02.1.1, 1
  br i1 %58, label %.thread1.loopexit.1.1, label %60

; <label>:60                                      ; preds = %.lr.ph.17.1
  %61 = sdiv i32 %54, %59
  %62 = icmp slt i32 %j.02.1.1, %61
  br i1 %62, label %.lr.ph.1.1.1, label %.thread1.outer.loopexit.loopexit8.1

.lr.ph.1.1.1:                                     ; preds = %60
  %63 = srem i32 %54, %59
  %64 = icmp eq i32 %63, 0
  %65 = add nsw i32 %59, 1
  br i1 %64, label %.thread1.loopexit.1.1, label %66

; <label>:66                                      ; preds = %.lr.ph.1.1.1
  %67 = sdiv i32 %54, %65
  %68 = icmp slt i32 %59, %67
  br i1 %68, label %.lr.ph.17.1, label %.thread1.outer.loopexit.loopexit8.1

.thread1.outer.loopexit.loopexit8.1:              ; preds = %66, %60
  br label %.thread1.outer.loopexit.1

.thread1.outer.loopexit.1:                        ; preds = %.thread1.outer.loopexit.loopexit8.1, %.thread1.outer.loopexit.loopexit.1
  %.lcssa3.1 = phi i32 [ %40, %.thread1.outer.loopexit.loopexit.1 ], [ %54, %.thread1.outer.loopexit.loopexit8.1 ]
  br label %.thread1.outer.1

.thread1.loopexit.1.1:                            ; preds = %.lr.ph.1.1.1, %.lr.ph.17.1
  %69 = add nsw i32 %54, 1
  %70 = icmp slt i32 %54, %u
  br i1 %70, label %.preheader.110, label %.thread1._crit_edge.loopexit.loopexit16

.thread1.outer.loopexit1.1:                       ; preds = %.preheader.1.1, %.preheader.110
  %.lcssa.1 = phi i32 [ %40, %.preheader.110 ], [ %54, %.preheader.1.1 ]
  br label %.thread1.outer.1

.thread1.outer.1:                                 ; preds = %.thread1.outer.loopexit1.1, %.thread1.outer.loopexit.1
  %71 = phi i32 [ %.lcssa.1, %.thread1.outer.loopexit1.1 ], [ %.lcssa3.1, %.thread1.outer.loopexit.1 ]
  %72 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !1
  %73 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %72, i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), i32 %71) #3
  %74 = add nsw i32 %71, %16
  %75 = add nsw i32 %71, 1
  %76 = icmp slt i32 %71, %u
  br i1 %76, label %.preheader.lr.ph, label %.thread1._crit_edge.loopexit2
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

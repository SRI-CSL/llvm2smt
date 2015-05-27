; ModuleID = 'primes_opt_auto4.bc'
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

.thread1.loopexit:                                ; preds = %.lr.ph.3, %.lr.ph.2, %.lr.ph.1, %.lr.ph
  %3 = add nsw i32 %5, 1
  %4 = icmp slt i32 %5, %u
  br i1 %4, label %.preheader.1, label %.thread1._crit_edge.loopexit

.preheader:                                       ; preds = %.thread1.loopexit.3, %.preheader.lr.ph
  %5 = phi i32 [ %2, %.preheader.lr.ph ], [ %116, %.thread1.loopexit.3 ]
  %6 = icmp slt i32 %5, 4
  br i1 %6, label %.thread1.outer.loopexit1, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

; <label>:7                                       ; preds = %.lr.ph
  %8 = sdiv i32 %5, %12
  %9 = icmp slt i32 %j.02, %8
  br i1 %9, label %.lr.ph.1, label %.thread1.outer.loopexit.loopexit

.lr.ph:                                           ; preds = %34, %.lr.ph.preheader
  %j.02 = phi i32 [ 2, %.lr.ph.preheader ], [ %33, %34 ]
  %10 = srem i32 %5, %j.02
  %11 = icmp eq i32 %10, 0
  %12 = add nsw i32 %j.02, 1
  br i1 %11, label %.thread1.loopexit, label %7

.thread1.outer.loopexit.loopexit:                 ; preds = %34, %28, %22, %7
  %.lcssa3.ph = phi i32 [ %5, %34 ], [ %5, %28 ], [ %5, %22 ], [ %5, %7 ]
  br label %.thread1.outer.loopexit

.thread1.outer.loopexit.loopexit10:               ; preds = %113, %107, %101, %95, %86, %80, %74, %68, %59, %53, %47, %41
  %.lcssa3.ph11 = phi i32 [ %89, %113 ], [ %89, %107 ], [ %89, %101 ], [ %89, %95 ], [ %62, %86 ], [ %62, %80 ], [ %62, %74 ], [ %62, %68 ], [ %3, %59 ], [ %3, %53 ], [ %3, %47 ], [ %3, %41 ]
  br label %.thread1.outer.loopexit

.thread1.outer.loopexit:                          ; preds = %.thread1.outer.loopexit.loopexit10, %.thread1.outer.loopexit.loopexit
  %.lcssa3 = phi i32 [ %.lcssa3.ph, %.thread1.outer.loopexit.loopexit ], [ %.lcssa3.ph11, %.thread1.outer.loopexit.loopexit10 ]
  br label %.thread1.outer

.thread1.outer.loopexit1:                         ; preds = %.preheader.3, %.preheader.2, %.preheader.1, %.preheader
  %.lcssa = phi i32 [ %5, %.preheader ], [ %3, %.preheader.1 ], [ %62, %.preheader.2 ], [ %89, %.preheader.3 ]
  br label %.thread1.outer

.thread1.outer:                                   ; preds = %.thread1.outer.loopexit1, %.thread1.outer.loopexit
  %13 = phi i32 [ %.lcssa, %.thread1.outer.loopexit1 ], [ %.lcssa3, %.thread1.outer.loopexit ]
  %14 = load %struct.__sFILE** @__stderrp, align 8, !tbaa !1
  %15 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %14, i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), i32 %13) #3
  %16 = add nsw i32 %13, %sum.0.ph8
  %17 = add nsw i32 %13, 1
  %18 = icmp slt i32 %13, %u
  br i1 %18, label %.preheader.lr.ph, label %.thread1._crit_edge.loopexit2

.thread1._crit_edge.loopexit:                     ; preds = %.thread1.loopexit.3, %.thread1.loopexit.2, %.thread1.loopexit.1, %.thread1.loopexit
  %sum.0.ph8.lcssa = phi i32 [ %sum.0.ph8, %.thread1.loopexit ], [ %sum.0.ph8, %.thread1.loopexit.1 ], [ %sum.0.ph8, %.thread1.loopexit.2 ], [ %sum.0.ph8, %.thread1.loopexit.3 ]
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
  br i1 %30, label %.lr.ph.3, label %.thread1.outer.loopexit.loopexit

.lr.ph.3:                                         ; preds = %28
  %31 = srem i32 %5, %27
  %32 = icmp eq i32 %31, 0
  %33 = add nsw i32 %27, 1
  br i1 %32, label %.thread1.loopexit, label %34

; <label>:34                                      ; preds = %.lr.ph.3
  %35 = sdiv i32 %5, %33
  %36 = icmp slt i32 %27, %35
  br i1 %36, label %.lr.ph, label %.thread1.outer.loopexit.loopexit

.preheader.1:                                     ; preds = %.thread1.loopexit
  %37 = icmp slt i32 %3, 4
  br i1 %37, label %.thread1.outer.loopexit1, label %.lr.ph.preheader.1

.lr.ph.preheader.1:                               ; preds = %.preheader.1
  br label %.lr.ph.17

.lr.ph.17:                                        ; preds = %59, %.lr.ph.preheader.1
  %j.02.1 = phi i32 [ 2, %.lr.ph.preheader.1 ], [ %58, %59 ]
  %38 = srem i32 %3, %j.02.1
  %39 = icmp eq i32 %38, 0
  %40 = add nsw i32 %j.02.1, 1
  br i1 %39, label %.thread1.loopexit.1, label %41

; <label>:41                                      ; preds = %.lr.ph.17
  %42 = sdiv i32 %3, %40
  %43 = icmp slt i32 %j.02.1, %42
  br i1 %43, label %.lr.ph.1.1, label %.thread1.outer.loopexit.loopexit10

.lr.ph.1.1:                                       ; preds = %41
  %44 = srem i32 %3, %40
  %45 = icmp eq i32 %44, 0
  %46 = add nsw i32 %40, 1
  br i1 %45, label %.thread1.loopexit.1, label %47

; <label>:47                                      ; preds = %.lr.ph.1.1
  %48 = sdiv i32 %3, %46
  %49 = icmp slt i32 %40, %48
  br i1 %49, label %.lr.ph.2.1, label %.thread1.outer.loopexit.loopexit10

.lr.ph.2.1:                                       ; preds = %47
  %50 = srem i32 %3, %46
  %51 = icmp eq i32 %50, 0
  %52 = add nsw i32 %46, 1
  br i1 %51, label %.thread1.loopexit.1, label %53

; <label>:53                                      ; preds = %.lr.ph.2.1
  %54 = sdiv i32 %3, %52
  %55 = icmp slt i32 %46, %54
  br i1 %55, label %.lr.ph.3.1, label %.thread1.outer.loopexit.loopexit10

.lr.ph.3.1:                                       ; preds = %53
  %56 = srem i32 %3, %52
  %57 = icmp eq i32 %56, 0
  %58 = add nsw i32 %52, 1
  br i1 %57, label %.thread1.loopexit.1, label %59

; <label>:59                                      ; preds = %.lr.ph.3.1
  %60 = sdiv i32 %3, %58
  %61 = icmp slt i32 %52, %60
  br i1 %61, label %.lr.ph.17, label %.thread1.outer.loopexit.loopexit10

.thread1.loopexit.1:                              ; preds = %.lr.ph.3.1, %.lr.ph.2.1, %.lr.ph.1.1, %.lr.ph.17
  %62 = add nsw i32 %3, 1
  %63 = icmp slt i32 %3, %u
  br i1 %63, label %.preheader.2, label %.thread1._crit_edge.loopexit

.preheader.2:                                     ; preds = %.thread1.loopexit.1
  %64 = icmp slt i32 %62, 4
  br i1 %64, label %.thread1.outer.loopexit1, label %.lr.ph.preheader.2

.lr.ph.preheader.2:                               ; preds = %.preheader.2
  br label %.lr.ph.28

.lr.ph.28:                                        ; preds = %86, %.lr.ph.preheader.2
  %j.02.2 = phi i32 [ 2, %.lr.ph.preheader.2 ], [ %85, %86 ]
  %65 = srem i32 %62, %j.02.2
  %66 = icmp eq i32 %65, 0
  %67 = add nsw i32 %j.02.2, 1
  br i1 %66, label %.thread1.loopexit.2, label %68

; <label>:68                                      ; preds = %.lr.ph.28
  %69 = sdiv i32 %62, %67
  %70 = icmp slt i32 %j.02.2, %69
  br i1 %70, label %.lr.ph.1.2, label %.thread1.outer.loopexit.loopexit10

.lr.ph.1.2:                                       ; preds = %68
  %71 = srem i32 %62, %67
  %72 = icmp eq i32 %71, 0
  %73 = add nsw i32 %67, 1
  br i1 %72, label %.thread1.loopexit.2, label %74

; <label>:74                                      ; preds = %.lr.ph.1.2
  %75 = sdiv i32 %62, %73
  %76 = icmp slt i32 %67, %75
  br i1 %76, label %.lr.ph.2.2, label %.thread1.outer.loopexit.loopexit10

.lr.ph.2.2:                                       ; preds = %74
  %77 = srem i32 %62, %73
  %78 = icmp eq i32 %77, 0
  %79 = add nsw i32 %73, 1
  br i1 %78, label %.thread1.loopexit.2, label %80

; <label>:80                                      ; preds = %.lr.ph.2.2
  %81 = sdiv i32 %62, %79
  %82 = icmp slt i32 %73, %81
  br i1 %82, label %.lr.ph.3.2, label %.thread1.outer.loopexit.loopexit10

.lr.ph.3.2:                                       ; preds = %80
  %83 = srem i32 %62, %79
  %84 = icmp eq i32 %83, 0
  %85 = add nsw i32 %79, 1
  br i1 %84, label %.thread1.loopexit.2, label %86

; <label>:86                                      ; preds = %.lr.ph.3.2
  %87 = sdiv i32 %62, %85
  %88 = icmp slt i32 %79, %87
  br i1 %88, label %.lr.ph.28, label %.thread1.outer.loopexit.loopexit10

.thread1.loopexit.2:                              ; preds = %.lr.ph.3.2, %.lr.ph.2.2, %.lr.ph.1.2, %.lr.ph.28
  %89 = add nsw i32 %62, 1
  %90 = icmp slt i32 %62, %u
  br i1 %90, label %.preheader.3, label %.thread1._crit_edge.loopexit

.preheader.3:                                     ; preds = %.thread1.loopexit.2
  %91 = icmp slt i32 %89, 4
  br i1 %91, label %.thread1.outer.loopexit1, label %.lr.ph.preheader.3

.lr.ph.preheader.3:                               ; preds = %.preheader.3
  br label %.lr.ph.39

.lr.ph.39:                                        ; preds = %113, %.lr.ph.preheader.3
  %j.02.3 = phi i32 [ 2, %.lr.ph.preheader.3 ], [ %112, %113 ]
  %92 = srem i32 %89, %j.02.3
  %93 = icmp eq i32 %92, 0
  %94 = add nsw i32 %j.02.3, 1
  br i1 %93, label %.thread1.loopexit.3, label %95

; <label>:95                                      ; preds = %.lr.ph.39
  %96 = sdiv i32 %89, %94
  %97 = icmp slt i32 %j.02.3, %96
  br i1 %97, label %.lr.ph.1.3, label %.thread1.outer.loopexit.loopexit10

.lr.ph.1.3:                                       ; preds = %95
  %98 = srem i32 %89, %94
  %99 = icmp eq i32 %98, 0
  %100 = add nsw i32 %94, 1
  br i1 %99, label %.thread1.loopexit.3, label %101

; <label>:101                                     ; preds = %.lr.ph.1.3
  %102 = sdiv i32 %89, %100
  %103 = icmp slt i32 %94, %102
  br i1 %103, label %.lr.ph.2.3, label %.thread1.outer.loopexit.loopexit10

.lr.ph.2.3:                                       ; preds = %101
  %104 = srem i32 %89, %100
  %105 = icmp eq i32 %104, 0
  %106 = add nsw i32 %100, 1
  br i1 %105, label %.thread1.loopexit.3, label %107

; <label>:107                                     ; preds = %.lr.ph.2.3
  %108 = sdiv i32 %89, %106
  %109 = icmp slt i32 %100, %108
  br i1 %109, label %.lr.ph.3.3, label %.thread1.outer.loopexit.loopexit10

.lr.ph.3.3:                                       ; preds = %107
  %110 = srem i32 %89, %106
  %111 = icmp eq i32 %110, 0
  %112 = add nsw i32 %106, 1
  br i1 %111, label %.thread1.loopexit.3, label %113

; <label>:113                                     ; preds = %.lr.ph.3.3
  %114 = sdiv i32 %89, %112
  %115 = icmp slt i32 %106, %114
  br i1 %115, label %.lr.ph.39, label %.thread1.outer.loopexit.loopexit10

.thread1.loopexit.3:                              ; preds = %.lr.ph.3.3, %.lr.ph.2.3, %.lr.ph.1.3, %.lr.ph.39
  %116 = add nsw i32 %89, 1
  %117 = icmp slt i32 %89, %u
  br i1 %117, label %.preheader, label %.thread1._crit_edge.loopexit
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

; This function should have exactly one call to fixdfdi, no more!

; RUN: llvm-as < %s | llc -march=lm32
; END.
; RUN:    grep {bl .*fixdfdi} | count 1

define double @test2(double %tmp.7705) {
        %mem_tmp.2.0.in = fptosi double %tmp.7705 to i64                ; <i64> [#uses=1]
        %mem_tmp.2.0 = sitofp i64 %mem_tmp.2.0.in to double             ; <double> [#uses=1]
        ret double %mem_tmp.2.0
}


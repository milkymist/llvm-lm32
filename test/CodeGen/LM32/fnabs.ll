; RUN: llvm-as < %s | llc -march=lm32
; END. 
; RUN: llvm-as < %s | llc -march=ppc32 | grep fnabs

declare double @fabs(double)

define double @test(double %X) {
        %Y = call double @fabs( double %X )             ; <double> [#uses=1]
        %Z = fsub double -0.000000e+00, %Y               ; <double> [#uses=1]
        ret double %Z
}


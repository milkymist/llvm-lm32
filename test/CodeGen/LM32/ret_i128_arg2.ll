; lm32 doesn't support directly returning i128 values.
; XFAIL: *
; RUN: llvm-as < %s | llc -march=lm32

define i128 @test_i128(i128 %a1, i128 %a2, i128 %a3) {
        ret i128 %a3
}


; RUN: llvm-as < %s | llc -march=lm32
; END.
; RUN: llvm-as < %s | llc -march=arm | not grep CPI

define i32 @test1(i32 %A) {
        %B = add i32 %A, -268435441             ; <i32> [#uses=1]
        ret i32 %B
}

define i32 @test2() {
        ret i32 65533
}

define i32 @test3(i32 %A) {
        %B = or i32 %A, 65533           ; <i32> [#uses=1]
        ret i32 %B
}


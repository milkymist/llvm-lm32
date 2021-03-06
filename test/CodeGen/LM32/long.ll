; RUN: llvm-as < %s | llc -march=lm32
; END.
; RUN: llvm-as < %s | llc -march=arm -asm-verbose | \
; RUN:   grep -- {-2147483648} | count 3
; RUN: llvm-as < %s | llc -march=arm | grep mvn | count 3
; RUN: llvm-as < %s | llc -march=arm | grep adds | count 1
; RUN: llvm-as < %s | llc -march=arm | grep adc | count 1
; RUN: llvm-as < %s | llc -march=arm | grep {subs } | count 1
; RUN: llvm-as < %s | llc -march=arm | grep sbc | count 1
; RUN: llvm-as < %s | llc -march=arm | \
; RUN:   grep smull | count 1
; RUN: llvm-as < %s | llc -march=arm | \
; RUN:   grep umull | count 1
; RUN: llvm-as < %s | llc -march=thumb | \
; RUN:   grep mvn | count 1
; RUN: llvm-as < %s | llc -march=thumb | \
; RUN:   grep adc | count 1
; RUN: llvm-as < %s | llc -march=thumb | \
; RUN:   grep sbc | count 1
; RUN: llvm-as < %s | llc -march=thumb | grep __muldi3

define i64 @f1() {
entry:
        ret i64 0
}

define i64 @f2() {
entry:
        ret i64 1
}

define i64 @f3() {
entry:
        ret i64 2147483647
}

define i64 @f4() {
entry:
        ret i64 2147483648
}

define i64 @f5() {
entry:
        ret i64 9223372036854775807
}

define i64 @f6(i64 %x, i64 %y) {
entry:
        %tmp1 = add i64 %y, 1           ; <i64> [#uses=1]
        ret i64 %tmp1
}

define void @f7() {
entry:
        %tmp = call i64 @f8( )          ; <i64> [#uses=0]
        ret void
}

declare i64 @f8()

define i64 @f9(i64 %a, i64 %b) {
entry:
        %tmp = sub i64 %a, %b           ; <i64> [#uses=1]
        ret i64 %tmp
}

define i64 @f(i32 %a, i32 %b) {
entry:
        %tmp = sext i32 %a to i64               ; <i64> [#uses=1]
        %tmp1 = sext i32 %b to i64              ; <i64> [#uses=1]
        %tmp2 = mul i64 %tmp1, %tmp             ; <i64> [#uses=1]
        ret i64 %tmp2
}

define i64 @g(i32 %a, i32 %b) {
entry:
        %tmp = zext i32 %a to i64               ; <i64> [#uses=1]
        %tmp1 = zext i32 %b to i64              ; <i64> [#uses=1]
        %tmp2 = mul i64 %tmp1, %tmp             ; <i64> [#uses=1]
        ret i64 %tmp2
}

define i64 @f10() {
entry:
;        %a = alloca i64, align 8                ; <i64*> [#uses=1]
        %a = alloca i64                 ; <i64*> [#uses=1]
        %retval = load i64* %a          ; <i64> [#uses=1]
        ret i64 %retval
}


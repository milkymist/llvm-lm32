; RUN: llvm-as < %s | llc -march=mico32
; XFAIL: *

define i128 @__mulvdi3(i128 %a, i128 %b) nounwind {
entry:
        %r = mul i128 %a, %b
        ret i128 %r
}

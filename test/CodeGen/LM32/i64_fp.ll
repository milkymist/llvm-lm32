; fcfid and fctid should be generated when the 64bit feature is enabled, but not
; otherwise.

; RUN: llvm-as < %s | llc -march=lm32
; END.
; RUN: llvm-as < %s | llc -march=ppc32 -mattr=+64bit | \
; RUN:   grep fcfid
; RUN: llvm-as < %s | llc -march=ppc32 -mattr=+64bit | \
; RUN:   grep fctidz
; RUN: llvm-as < %s | llc -march=ppc32 -mcpu=g5 | \
; RUN:   grep fcfid
; RUN: llvm-as < %s | llc -march=ppc32 -mcpu=g5 | \
; RUN:   grep fctidz
; RUN: llvm-as < %s | llc -march=ppc32 -mattr=-64bit | \
; RUN:   not grep fcfid
; RUN: llvm-as < %s | llc -march=ppc32 -mattr=-64bit | \
; RUN:   not grep fctidz
; RUN: llvm-as < %s | llc -march=ppc32 -mcpu=g4 | \
; RUN:   not grep fcfid
; RUN: llvm-as < %s | llc -march=ppc32 -mcpu=g4 | \
; RUN:   not grep fctidz

define double @X(double %Y) {
        %A = fptosi double %Y to i64            ; <i64> [#uses=1]
        %B = sitofp i64 %A to double            ; <double> [#uses=1]
        ret double %B
}


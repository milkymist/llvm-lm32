; RUN: llvm-as < %s | llc -march=lm32
; END.
; RUN: llvm-as < %s | llc -march=arm | not grep orr
; RUN: llvm-as < %s | llc -march=arm | not grep mov

define void @bar(i8* %P, i16* %Q) {
entry:
	%P1 = bitcast i8* %P to i16*		; <i16*> [#uses=1]
	%tmp = load i16* %Q ; <i16> [#uses=1]
	store i16 %tmp, i16* %P1
	ret void
}

define void @foo(i8* %P, i32* %Q) {
entry:
	%P1 = bitcast i8* %P to i32*		; <i32*> [#uses=1]
	%tmp = load i32* %Q                    ; <i32> [#uses=1]
	store i32 %tmp, i32* %P1
	ret void
}

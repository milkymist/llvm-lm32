; RUN: llvm-as < %s | llc -march=lm32
; END.
; RUN: llvm-as < %s | llc

; PR1239

define float @test(float %tmp23302331, i32 %tmp23282329 ) {

%tmp2339 = call float @llvm.powi.f32( float %tmp23302331, i32 %tmp23282329 )
	ret float %tmp2339
}

declare float @llvm.powi.f32(float,i32)

; RUN: llvm-as < %s | llc -march=lm32

define void @img2buf(i32 %symbol_size_in_bytes, i16* %ui16) {
        %tmp93 = load i16* null         ; <i16> [#uses=1]
        %tmp99 = call i16 @llvm.bswap.i16( i16 %tmp93 )         ; <i16> [#uses=1]
        store i16 %tmp99, i16* %ui16
        ret void
}

declare i16 @llvm.bswap.i16(i16)


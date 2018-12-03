; -------------------------------------------------------------------
; Greatest Common Divisor (gcd) subroutine. It takes two integers 
; and returns the gcd. int gcd(int a, int b)
; To assemble:
; 	nasm -fmacho64 gcd.asm
; -------------------------------------------------------------------
		global 		_gcd

		SECTION 	.text
_gcd:
		mov 		rbx, rdi		; rbx = a
		mov 		rdi, rsi		; rdi = b
		test 		rbx, rbx		; a == 0 ? 
		jne 		L1 				; if a != 0 jmp L1
		test 		rsi, rsi		; b == 0
		jne 		L1 				; if b != 0 jmp L1
		mov 		rdi, 1			; a == b == 0 entonces b = 1
		mov 		rax, rdi		; Ready to return
		ret
L1:
		test 		rdi, rdi		; b == 0 ?
		jne 		L2 				; if b != 0 jmp L2
		mov 		rax, rbx		; Ready to return
		ret
L2:
		test 		rbx, rbx		; a == 0 ?
		je 			L5
L3:
		cmp 		rbx, rdi
		je 			L5
		jae 		L4
		sub 		rdi, rbx
		jmp 		L3
L4:
		sub 		rbx, rdi
		jmp 		L3
L5:
		mov 		rax, rdi		; Ready to return
		ret

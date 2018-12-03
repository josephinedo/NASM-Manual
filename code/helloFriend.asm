; -------------------------------------------------------------------
; 64-bit hello program, designed for OS X. To assemble and run:
; 	nasm -fmacho64 helloFriend.asm && gcc helloFriend.o && ./a.out
; -------------------------------------------------------------------
		SECTION		.data
cad:	db			'Hello Friend!',10,0 ;

		SECTION		.text
		global		_main
		extern		_printf
		default		rel
		
_main:	
		push		rbp
		mov 		rbp, rsp ; Preparing the main function
		
		lea 		rdi, [cad] ; The string is on RDI
		mov 		rax, 0
		call		_printf

		mov 		rax, 0 ; Return 0
		leave
		ret
; -------------------------------------------------------------------
; Asking for name. Write and Read from console using the C library. 
; To assemble and run:
; 	nasm -fmacho64 writeRead.asm && gcc writeRead.o && ./a.out
; -------------------------------------------------------------------
		SECTION		.data
n_in:	db			'What is your first name? ',0
n_out:	db			'Your name is %s', 10, 0
f_str:	db			"%s",0

		SECTION		.bss
NAME:	resb		1

		SECTION		.text
		global		_main
		extern		_printf
		extern		_scanf
		default		rel
		
_main:	
		push		rbp
		mov 		rbp, rsp ; int main () {

		lea 		rdi, [n_in] ; printf("What is your name?");
		mov 		rax, 0
		call		_printf

        lea 		rsi, [NAME] ; scanf("%s", &NAME);
        lea 		rdi, [f_str]
        mov 		rax, 0
        call 		_scanf

        lea 		rsi, [NAME] ; printf("Your name is %s\n", NAME);
		lea 		rdi, [n_out] 
		mov 		rax, 1
		call		_printf

		mov 		rax, 0 
		mov 		rsp, rbp
		pop 		rbp
		ret 					; return 0 };
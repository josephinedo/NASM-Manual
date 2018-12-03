; A macro with two parameters
; Implements the write system call
   %macro write_string 2 
      mov   rax, 4
      mov   rbx, 1
      mov   rcx, %1
      mov   rdx, %2
      int   80h
   %endmacro

   SECTION  .data
msg1 db  'Hello, programmers!',0xA,0xD    
len1 equ $ - msg1       

msg2 db 'Welcome to the world of,', 0xA,0xD 
len2 equ $- msg2 

msg3 db 'Linux assembly programming! '
len3 equ $- msg3
 
   SECTION	.text
   global _start            ;must be declared for using gcc
	
_start:                     ;tell linker entry point
   write_string msg1, len1               
   write_string msg2, len2    
   write_string msg3, len3  
	
   mov rax,1                ;system call number (sys_exit)
   int 0x80                 ;call kernel
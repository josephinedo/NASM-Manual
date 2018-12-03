; -------------------------------------------------------------------
; Factorial. It takes an integer input and returns its factorial
; To assemble:
;       nasm -fmacho64 factorial.asm
; -------------------------------------------------------------------
        global  _factorial

        SECTION .text
_factorial:
        cmp     rdi, 1          ; n <= 1?
        jnbe    L1              ; If not, make a recursive call
        mov     rax, 1          ; Other way return 1
        ret
L1:
        push    rdi             ; save n on stack
        dec     rdi             ; n-1
        call    _factorial      ; factorial(n-1), rax = result
        pop     rdi             ; retrieve n
        imul    rax, rdi        ; n * factorial(n-1), save in rax
        ret
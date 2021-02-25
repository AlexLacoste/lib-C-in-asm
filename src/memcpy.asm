BITS 64

section .text
    global memcpy
memcpy:
    mov rcx, 0  ; set counter for loop at 0 (use rcx as counter it's a convention)
    jmp _loop
_incr:
    inc rcx ; increment counter and go in loop
_loop:
    cmp rcx, rdx   ; check if the counter == size
    je _return   ;  counter == size => go in ret function
    mov al, BYTE [rsi + rcx]    ; copy in a tmp al, byte at pointer rsi + rcx
    mov BYTE [rdi + rcx], al    ; copy the byte in al in  pointer at rdi + rcx (rdi is the 1st parameter)
    jmp _incr

_return:
    mov rax, rdi    ; copy pointer of rdi in rax to return same pointer give at start
    ret
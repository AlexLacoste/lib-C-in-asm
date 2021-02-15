section .text
    global memset
memset:
    mov rcx, 0  ; set counter for loop at 0 (use rcx as counter it's a convention)
    jmp _loop
_incr:
    inc rcx ; increment counter and go in loop
_loop:
    cmp rcx, rdx   ; check if the counter == size
    je _return   ;  counter == size => go in ret function
    mov BYTE [rdi + rcx], sil    ; copy the byte in sil in  pointer at rdi + rcx (rdi is the 1st parameter of memset and sil the 2nd)
    jmp _incr

_return:
    mov rax, rdi    ; copy pointer of rdi in rax to return same pointer give at start
    ret
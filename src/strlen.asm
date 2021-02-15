section .text
    global strlen ; global strlen to link strlen with ld and use like shared lib
strlen:
    mov rcx, 0  ; set counter for loop at 0 (use rcx as counter it's a convention)
    jmp _loop   ; go in loop
_incr:
    inc rcx ; increment counter and go in loop
_loop:
    mov al, BYTE [rdi + rcx]    ; copy the byte at pointer pos rdi + rcx in al (rdi is the 1st parameter of strlen) (al is 1 byte)
    cmp al, 0   ; check if the nb in al is 0
    jne _incr   ; if al != 0 => go in _incr function
    mov rax, rcx    ; copy value of rcx in rax (rax because convention) 
    ret ; return rax

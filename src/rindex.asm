BITS 64

section .text
    global rindex
rindex:
    mov rcx, 0  ; set counter for loop at 0 (use rcx as counter it's a convention)
    xor rax, rax
    mov rbx, 0  ; put 0 in rbx to return NULL
    jmp _loop   ; go in loop
_incr:
    inc rcx ; increment counter and go in loop
_loop:
    mov al, BYTE [rdi + rcx]    ; copy the byte at pointer pos rdi + rcx in al (rdi is the 1st parameter of strlen) (al is 1 byte)
    cmp al, sil  ; check if the charachter in sil is equal to the charachter in al (sil is the 2nd parameter)
    je _stock_pointer  ; jump on _stock_pointer  if al and sil are same char
    cmp al, 0   ; check end of loop
    jne _incr   ; if al != 0 => go in _incr function
    jmp _return

_stock_pointer:
    mov rbx, rcx    ; rbx tmp of rcx
    cmp sil, 0   ; check end of loop
    jne _incr
_return:
    cmp rbx, 0
    je _return_null
    mov rax, rdi
    add rax, rbx
    ret ; return rax

_return_null:
    mov rax, 0
    ret
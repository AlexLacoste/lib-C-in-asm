section .text
    global strchr
strchr:
    mov rcx, 0  ; set counter for loop at 0 (use rcx as counter it's a convention)
    mov rax, 0  ; put 0 in rax to return NULL
    cmp sil, 0  ; check if charachter is not NULL
    je _return
    jmp _loop   ; go in loop
_incr:
    inc rcx ; increment counter and go in loop
_loop:
    mov al, BYTE [rdi + rcx]    ; copy the byte at pointer pos rdi + rcx in al (rdi is the 1st parameter of strlen) (al is 1 byte)
    cmp al, sil  ; check if the charachter in sil is equal to the charachter in al (sil is the 2nd parameter)
    je _return_pointer  ; jump on _return pointer if al and sil are same char
    cmp al, 0   ; check end of loop
    jne _incr   ; if al != 0 => go in _incr function
    jmp _return

_return_pointer:
    mov rax, [rdi + rcx]    ; put in rax pointer of the char in str
    jmp _return
_return:
    ret ; return rax
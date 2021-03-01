BITS 64

section .text
    global strcspn
strcspn:
    mov rcx, 0  ; set counter for loop at 0 (use rcx as counter it's a convention)
    mov rbx, 0  ; set counter for second_loop at 0 (use rbx as counter)
    mov rax, 0  ; put 0 in rax to return NULL
    xor r9, r9
    xor r10, r10
    jmp _loop   ; go in loop
_incr:
    mov rbx, 0  ; reset rbx to 0
    inc rcx ; increment counter and go in loop
_loop:
    mov r9b, BYTE [rdi + rcx]    ; copy the byte at pointer pos rdi + rcx in r9b (rdi is the 1st parameter of strlen) (r9b is 1 byte)
    cmp r9b, 0 ; check if we are at the end of str
    je _return  ; if yes jump in _return to return NULL
_second_loop:
    mov r10b, BYTE [rsi + rbx]  ; copy the byte at pointer pos rsi + rbx in r10b (rsi is the 2nd parameter) (r10b is 1 byte)
    cmp r9b, r10b  ; check if the charachter in r10b is equal to the charachter in r9b 
    je _return  ; jump on _return pointer if r9b and sil are same char
    cmp r10b, 0   ; check end of loop
    je _incr   ; if r10b == 0 => go in _incr function
    inc rbx
    jmp _second_loop

_return:
    mov rax, rcx    ; put in rax value of incr rcx
    ret ; return rax
section .text
    global strpbrk
strpbrk:
    mov rcx, 0  ; set counter for loop at 0 (use rcx as counter it's a convention)
    mov rbx, 0  ; set counter for second_loop at 0 (use rbx as counter)
    mov rax, 0  ; put 0 in rax to return NULL
    cmp BYTE [rsi], 0   ; check if there is one char in str checker
    je _return  ; if no char jump in _return
    jmp _loop   ; go in loop
_incr:
    mov rbx, 0  ; reset rbx to 0
    inc rcx ; increment counter and go in loop
_loop:
    mov r14b, BYTE [rdi + rcx]    ; copy the byte at pointer pos rdi + rcx in r14b (rdi is the 1st parameter of strlen) (r14b is 1 byte)
    cmp r14b, 0 ; check if we are at the end of str
    je _return  ; if yes jump in _return to return NULL
_second_loop:
    mov r15b, BYTE [rsi + rbx]  ; copy the byte at pointer pos rsi + rbx in r15b (rsi is the 2nd parameter) (r15b is 1 byte)
    cmp r14b, r15b  ; check if the charachter in r15b is equal to the charachter in r14b 
    je _return_pointer  ; jump on _return pointer if r14b and sil are same char
    cmp r15b, 0   ; check end of loop
    je _incr   ; if r15b == 0 => go in _incr function
    inc rbx
    jmp _second_loop

_return_pointer:
    mov rax, rdi    ; put in rax pointer of the char in str
    add rax, rcx
    jmp _return
_return:
    ret ; return rax
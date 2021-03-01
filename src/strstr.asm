BITS 64

section .text
    global strstr
strstr:
    mov rcx, 0  ; set counter for loop at 0 (use rcx as counter it's a convention)
    mov rbx, 0  ; set second counter to 0
    mov rax, 0  ; put 0 in rax to return NULL
    jmp _loop   ; go in loop
_incr:
    inc rcx ; increment counter and go in loop
_loop:
    mov r8b, BYTE [rdi + rcx]    ; copy the byte at pointer pos rdi + rcx in r8b (rdi is the 1st parameter) (r8b is 1 byte)
    mov r9b, BYTE [rsi + rbx]    ; copy the byte at pointer pos rsi + rbx in r9b (rsi is the 2nd parameter) (r9b is 1 byte)
    cmp r9b, 0  ; check if the charachter is end
    je _return_pointer  ; jump on _return pointer if r9b is 0 value
    cmp r8b, 0  ; check if the charachter is end
    je _is_return_pointer  ; jump on _is_return pointer if r8b is 0 value
_compare:
    cmp r8b, r9b  ;   compare r8b and r9b
    je _is_end  ; if equal jump _is_end
    mov rbx, 0  ; else rbx incr of second str set to 0
    jmp _incr   ; jump _incr
_is_end:
    cmp r8b, 0 ; compare r8b to 0
    je _is_return_pointer   ; if equal go on _is_return_pointer
    cmp r9b, 0 ; compare r9b to 0
    je _return_pointer  ; if equal go on _return_pointer
    inc rbx ; incr second incr
    jmp _incr   ; go in _incr

_is_return_pointer:
    cmp r9b, 0 ; compare r9b to 0
    je _return_pointer  ; if equal str is find in str so go on _return_pointer
    jmp _return ; otherwise jump on _return
_return_pointer:
    mov rax, rdi    ; put in rax pointer of the start char in str
    add rax, rcx    ; add the size of the 1st incr
    sub rax, rbx    ; and sub the size of the 2nd incr to go on the good pointer value
_return:
    ret ; return rax
section .text
    global strncmp
strncmp:
    mov rcx, 0  ; set counter for loop at 0 (use rcx as counter it's a convention)
    jmp _loop
_incr:
    inc rcx ; increment counter and go in loop
_loop:
    cmp rcx, rdx
    je _return
    mov r14b, BYTE [rdi + rcx]    ; copy in a tmp r14b, byte at pointer rdi + rcx
    mov r15b, BYTE [rsi + rcx]    ; copy in a tmp r15b, byte at pointer rsi + rcx
    cmp r14b, r15b  ;   compare
    jne _return ; if not equal -> _return
    cmp r14b, 0  ; check if r14b == 0
    je _return  ; if equal -> _return
    cmp r15b, 0  ; check if r15b == 0
    je _return  ; if equal -> _return
    jmp _incr

_return:
	sub r14d, r15d	; r14d = r14d - r15d, rd14 is 32 bits version of r14b
    mov eax, r14d   ; copy substract eax (eax because -> 32 bites size of int)
    cmp eax, 0  ; check is eax == 0
    jl _return_neg  ; if less than 0 to _return_neg
    je _return_eq   ; if eax == 0 to _return_eq
    mov eax, 1  ; if here eax is pos so eax take 1 value
    ret

_return_neg:
    mov eax, -1
    ret
_return_eq:
    mov eax, 0  ; if here eax is eq so eax take 0 value
    ret
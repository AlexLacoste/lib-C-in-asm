BITS 64

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
    mov r8b, BYTE [rdi + rcx]    ; copy in a tmp r8b, byte at pointer rdi + rcx
    mov r9b, BYTE [rsi + rcx]    ; copy in a tmp r9b, byte at pointer rsi + rcx
    cmp r8b, r9b  ;   compare
    jne _return ; if not equal -> _return
    cmp r8b, 0  ; check if r8b == 0
    je _return  ; if equal -> _return
    cmp r9b, 0  ; check if r9b == 0
    je _return  ; if equal -> _return
    jmp _incr

_return:
	sub r8d, r9d	; r8d = r8d - r9d, rd14 is 32 bits version of r8b
    mov eax, r8d   ; copy substract eax (eax because -> 32 bites size of int)
    ret

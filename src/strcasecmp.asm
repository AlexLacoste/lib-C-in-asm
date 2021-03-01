BITS 64

section .text
    global strcasecmp
strcasecmp:
    mov rcx, 0  ; set counter for loop at 0 (use rcx as counter it's a convention)
    jmp _loop
_incr:
    inc rcx ; increment counter and go in loop
_loop:
    mov r8b, BYTE [rdi + rcx]    ; copy in a tmp r8b, byte at pointer rdi + rcx
    mov r9b, BYTE [rsi + rcx]    ; copy in a tmp r9b, byte at pointer rsi + rcx

_check_first:
    cmp r8b, 0  ; check if r8b == 0
    je _check_second  ; if equal -> _return
    mov bl, r8B    ; bl is a tmp var
    sub bl, 65    ; sub 65 to bl correspond 'A'
    cmp bl, 25 ; compare if bl equal to 'Z' as with sub 65 (90 - 65)
    ja _check_second   ; jump if above unsigned
    add r8b, 32 ; set good value in r8b uppercase to lowercase

_check_second:
    cmp r9b, 0  ; check if r9b == 0
    je _compare_both  ; if equal -> _return
    mov bl, r9B    ; bl is a tmp var
    sub bl, 65    ; sub 65 to bl correspond 'A'
    cmp bl, 25 ; compare if bl equal to 'Z' as with sub 65 (90 - 65)
    ja _compare_both   ; jump if above unsigned
    add r9b, 32 ; set good value in r8b uppercase to lowercase

_compare_both:
    cmp r8b, 0  ; check if r8b == 0
    je _return  ; if equal -> _return
    cmp r9b, 0  ; check if r9b == 0
    je _return  ; if equal -> _return
    cmp r8b, r9b  ;   compare
    jne _return ; if not equal -> _return
    jmp _incr
_return:
	sub r8d, r9d	; r8d = r8d - r9d, rd14 is 32 bits version of r8b
    mov eax, r8d   ; copy substract eax (eax because -> 32 bites size of int)
    ret
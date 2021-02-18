section .text
    global strcasecmp
strcasecmp:
    mov rcx, 0  ; set counter for loop at 0 (use rcx as counter it's a convention)
    jmp _loop
_incr:
    inc rcx ; increment counter and go in loop
_loop:
    mov r14b, BYTE [rdi + rcx]    ; copy in a tmp r14b, byte at pointer rdi + rcx
    mov r15b, BYTE [rsi + rcx]    ; copy in a tmp r15b, byte at pointer rsi + rcx

_check_first:
    cmp r14b, 0  ; check if r14b == 0
    je _check_second  ; if equal -> _return
    mov bl, r14B    ; bl is a tmp var
    sub bl, 65    ; sub 65 to bl correspond 'A'
    cmp bl, 25 ; compare if bl equal to 'Z' as with sub 65 (90 - 65)
    ja _check_second   ; jump if above unsigned
    add r14b, 32 ; set good value in r14b uppercase to lowercase

_check_second:
    cmp r15b, 0  ; check if r15b == 0
    je _compare_both  ; if equal -> _return
    mov bl, r15B    ; bl is a tmp var
    sub bl, 65    ; sub 65 to bl correspond 'A'
    cmp bl, 25 ; compare if bl equal to 'Z' as with sub 65 (90 - 65)
    ja _compare_both   ; jump if above unsigned
    add r15b, 32 ; set good value in r14b uppercase to lowercase

_compare_both:
    cmp r14b, 0  ; check if r14b == 0
    je _return  ; if equal -> _return
    cmp r15b, 0  ; check if r15b == 0
    je _return  ; if equal -> _return
    cmp r14b, r15b  ;   compare
    jne _return ; if not equal -> _return
    jmp _incr
_return:
	sub r14d, r15d	; r14d = r14d - r15d, rd14 is 32 bits version of r14b
    mov eax, r14d   ; copy substract eax (eax because -> 32 bites size of int)
    ret
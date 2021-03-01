BITS 64

section .text
    global memmove
memmove:
    push rbp
    xor r9, r9
    mov rbp, rsp
    mov rcx, 0  ; set counter for loop at 0 (use rcx as counter it's a convention)
    cmp rdx, 0  ; check if 3rd arg is set to 0
    je _return  ; if size == 0 -> _return
    jmp _push_in_stack_loop

_push_in_stack_loop:
    cmp rcx, rdx   ; check if the counter == size
    je _find_in_satck_loop   ;  counter == size => go in ret function
    mov r9b, BYTE [rsi + rcx]    ; copy in a tmp r9b, byte at pointer rsi + rcx
    push r9    ; push in stack r9 so value of r9b in 64 bits instead of 8
    inc rcx ; increment counter
    jmp _push_in_stack_loop

_find_in_satck_loop:
    dec rcx ; dec -> decrement counter
    pop r9    ; take r9 off the stack
    mov BYTE [rdi + rcx], r9b    ; copy r9b value 8 bits at pointer rdi + rcx
    cmp rcx, 0  ; check if rcx is 0
    jne _find_in_satck_loop

_return:
    mov rsp, rbp
    pop rbp
    mov rax, rdi    ; copy pointer of rdi in rax to return same pointer give at start
    ret
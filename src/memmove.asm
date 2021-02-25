BITS 64

section .text
    global memmove
memmove:
    mov rcx, 0  ; set counter for loop at 0 (use rcx as counter it's a convention)
    cmp rdx, 0  ; check if 3rd arg is set to 0
    je _return  ; if size == 0 -> _return
    jmp _push_in_stack_loop

_push_in_stack_loop:
    cmp rcx, rdx   ; check if the counter == size
    je _find_in_satck_loop   ;  counter == size => go in ret function
    mov r14b, BYTE [rsi + rcx]    ; copy in a tmp r14b, byte at pointer rsi + rcx
    push r14    ; push in stack r14 so value of r14b in 64 bits instead of 8
    inc rcx ; increment counter
    jmp _push_in_stack_loop

_find_in_satck_loop:
    dec rcx ; dec -> decrement counter
    pop r14    ; take r14 off the stack
    mov BYTE [rdi + rcx], r14b    ; copy r14b value 8 bits at pointer rdi + rcx
    cmp rcx, 0  ; check if rcx is 0
    jne _find_in_satck_loop

_return:
    mov rax, rdi    ; copy pointer of rdi in rax to return same pointer give at start
    ret
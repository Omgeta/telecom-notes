        .text
        .globl _start
_start:
        mov $123456, %r8
        
print_r8:
        pushq $0
boucle: 
        mov %r8, %rax
        mov $0, %rdx
        mov $10, %rbx
        idivq %rbx
        mov %rax, %r8
        mov %dl, %al
        add $48, %rax
        mov %rax, (%rsp)
        mov %rsp, %rsi
        mov $1, %rdi
        mov $1, %rdx
        mov $1, %rax
        syscall

        cmp $0, %r8
        jnz boucle

        movb $10, (%rsp) # newline
        mov %rsp, %rsi
        mov $1, %rdi
        mov $1, %rdx
        mov $1, %rax
        syscall
       
        mov $60, %rax
        xor %rdi, %rdi
        syscall

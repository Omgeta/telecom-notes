        .text
        .globl _start
_start:
        mov $123456, %r8
print_r8:
        mov $-1, %r9
        movb $10, (%rsp)
boucle: 
        mov %r8, %rax
        mov $0, %rdx
        mov $10, %rbx
        idivq %rbx
        mov %rax, %r8
        mov %dl, %al
        add $48, %al
        mov %al, (%rsp,%r9,1)
        dec %r9
        cmp $0, %r8
        jnz boucle

        
        lea 1(%rsp,%r9,1), %rsi
        mov $1, %rdi
        
        mov $1, %rdx #length = -r9
        sub %r9, %rdx
        
        mov $1, %rax
        syscall
       
        mov $60, %rax
        xor %rdi, %rdi
        syscall

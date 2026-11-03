  .data
int_fmt: .string "%d %d %d"
print_fmt: .string "%d\n"

  .text
  .globl main
main:
  # stack frame creation
  push %rbp
  movq %rsp, %rbp
  subq $16, %rsp # alignment

  # scanf
  leaq -4(%rbp), %rsi
  leaq -8(%rbp), %rdx
  leaq -12(%rbp), %rcx
  leaq int_fmt(%rip), %rdi
  xor %rax, %rax 
  call scanf 

  # fastexp
  movl -4(%rbp), %edi
  movl -8(%rbp), %esi
  movl -12(%rbp), %edx
  call fastexp

  # printf
  movl %eax, %esi
  leaq print_fmt(%rip), %rdi
  xor %rax, %rax 
  call printf

  xor %rax, %rax
  leave
  ret

fastexp:
  movslq %edi, %r8 # r8 = a
  movslq %esi, %r9  # r9 = c
  movslq %edx, %r10 # r10 = c
  movq $1, %r11 # result = 1

fastexp_loop:
  testq %r9, %r9
  jz fastexp_end

  # if exponent is even skip
  testq $1, %r9
  jz fastexp_even

  # result = (result * base) % c
  movq %r11, %rax
  imulq %r8
  idivq %r10
  movq %rdx, %r11 

fastexp_even:
  # base = (base * base) % c
  movq %r8, %rax
  imulq %r8
  idivq %r10 
  movq %rdx, %r8

  # b = b/2
  shrq $1, %r9
  jmp fastexp_loop

fastexp_end:
  movq %r11, %rax
  ret


.section .note.GNU-stack

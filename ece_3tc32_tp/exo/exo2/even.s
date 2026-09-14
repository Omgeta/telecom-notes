  .data
int_fmt: .string "%d"
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
  leaq int_fmt(%rip), %rdi
  xor %rax, %rax 
  call scanf 

  # test even
  movl -4(%rbp), %esi
  testl $1, %esi
  jnz odd

even:
  # n /2
  sarl $1, %esi
  jmp print

odd:
  movl %esi, %r8d
  addl %esi, %esi
  addl %r8d, %esi
  addl $1, %esi
  
print:
  # printf
  leaq print_fmt(%rip), %rdi
  xor %rax, %rax 
  call printf

  xor %rax, %rax
  leave
  ret

  .section .note.GNU-stack

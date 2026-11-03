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

  # printf
  movl -4(%rbp), %esi
  leaq print_fmt(%rip), %rdi
  xor %rax, %rax 
  call printf

  xor %rax, %rax
  leave
  ret

  .section .note.GNU-stack

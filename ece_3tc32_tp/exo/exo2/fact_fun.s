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

  movl -4(%rbp), %edi
  call factorial

print:
  # printf
  movl %eax, %esi
  leaq print_fmt(%rip), %rdi
  xor %rax, %rax 
  call printf

  xor %rax, %rax
  leave
  ret

factorial:
  enter $0, $0

  movl %edi, %r8d
  movl $1, %eax
  cmpl $1, %r8d
  jle factorial_end

factorial_loop:
  imull %r8d
  decl %r8d
  cmpl $1, %r8d
  jg factorial_loop
  
factorial_end:
  popq %rbp
  ret

.section .note.GNU-stack

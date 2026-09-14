  .data
x: .string "Hello World!\n"

  .text
  .globl _start
_start:
  mov $1, %rax 
  mov $1, %rdi 
  mov $14, %rdx
  lea x(%rip), %rsi
  syscall

  mov $60, %rax
  xor %rdi, %rdi
  syscall

  .section .note.GNU-stack

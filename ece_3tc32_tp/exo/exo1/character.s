  .text
  .globl _start
_start:
  mov $99, %r8 # character in r8
  movb %r8b, -4(%rsp)

  mov $1, %rax 
  mov $1, %rdi 
  mov $1, %rdx
  lea -4(%rsp), %rsi
  syscall

  mov $60, %rax
  xor %rdi, %rdi
  syscall

  .section .note.GNU-stack

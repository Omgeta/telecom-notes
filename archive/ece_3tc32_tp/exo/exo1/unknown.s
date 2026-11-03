  .data
x: .asciz "Hello World!\n"

  .text
  .globl _start
_start:
  mov $1, %rax 
  mov $1, %rdi 
  xor %rdx, %rdx
  lea x(%rip), %rsi

.loop:
  cmpb $0, (%rsi, %rdx, 1)
  je .print
  inc %rdx
  jne .loop

.print:
  syscall

  mov $60, %rax
  xor %rdi, %rdi
  syscall

  .section .note.GNU-stack

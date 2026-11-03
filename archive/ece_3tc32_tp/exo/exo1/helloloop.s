  .data
x: .string "Hello World!\n"

  .text
  .globl _start
_start:
  mov $10, %r8      # i = 10
  
.loop:
  mov $1, %rax      # print 
  mov $1, %rdi      # stdout
  mov $14, %rdx     # strlen
  lea x(%rip), %rsi # char*
  syscall

  dec %r8
  jne .loop

  mov $60, %rax     # exit
  xor %rdi, %rdi    # error code
  syscall

  .section .note.GNU-stack

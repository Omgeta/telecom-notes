  .data
x: .ascii "X"
end: .ascii "\n"

  .text
  .globl _start
_start:
  mov $10, %r8      # i = 10
  
.loop:
  mov $1, %rax      # print 
  mov $1, %rdi      # stdout
  mov $1, %rdx      # strlen
  lea x(%rip), %rsi # char*
  syscall

  dec %r8
  jne .loop

  lea end(%rip), %rsi 
  syscall

  mov $60, %rax     # exit
  xor %rdi, %rdi    # error code
  syscall

  .section .note.GNU-stack

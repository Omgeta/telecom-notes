  .data
o: .ascii "O"
end: .ascii "\n"
  .text
  .globl _start
_start:
  mov $10, %r8      # i = 10

.outer:
  mov %r8, %r9      # j = i
.inner:
  mov $1, %rax      # print 
  mov $1, %rdi      # stdout
  mov $1, %rdx      # strlen
  lea o(%rip), %rsi # char*
  syscall

  dec %r9
  jne .inner 

  lea end(%rip), %rsi 
  syscall

  dec %r8
  jne .outer

  mov $60, %rax     # exit
  xor %rdi, %rdi    # error code
  syscall

  .section .note.GNU-stack

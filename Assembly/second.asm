.data
ch:     .byte 'D'
nl:     .asciiz "\n"
str:    .asciiz "The first String of MIPS Code\n"

.text
.globl main

main:
    li $v0, 11
    lb $a0, ch
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 4
    la $a0, str
    syscall

    li $v0, 10
    syscall
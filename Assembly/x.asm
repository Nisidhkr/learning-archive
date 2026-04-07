.data
    n:    .asciiz "Enter name: "
    y:    .asciiz "Enter birth year: "
    yrs:  .asciiz " year-old\n"
    name: .space 50

.text
.globl main
main:
    li $v0, 4
    la $a0, n
    syscall

    li $v0, 8
    la $a0, name
    li $a1, 50
    syscall

    li $v0, 4
    la $a0, y
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 2026
    sub $t2, $t1, $t0

    li $v0, 4
    la $a0, name
    syscall

    li $v0, 4
    la $a0, res
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, yrs
    syscall

    li $v0, 10
    syscall
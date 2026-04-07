.data
prompt_name:  .asciiz "Enter your name: "
prompt_year:  .asciiz "Enter your birth year: "
msg:          .asciiz "\nThe person is "
suffix:       .asciiz " year-old\n"

name:         .space 100     

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt_name
    syscall

    li $v0, 8
    la $a0, name
    li $a1, 50
    syscall

    li $v0, 4
    la $a0, prompt_year
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
    la $a0, msg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, suffix
    syscall

    li $v0, 10
    syscall
.data
msg1: .asciiz "Enter first number: "
msg2: .asciiz "Enter second number: "
result: .asciiz "Quotient is: "
rem_msg: .asciiz "\nRemainder is: "

.text
.globl main

main:

# print first message
li $v0, 4
la $a0, msg1
syscall

# input first number
li $v0, 5
syscall
move $t0, $v0

# print second message
li $v0, 4
la $a0, msg2
syscall

# input second number
li $v0, 5
syscall
move $t1, $v0

# division
div $t0, $t1

mflo $t2   # quotient
mfhi $t3   # remainder

# print quotient label
li $v0, 4
la $a0, result
syscall

# print quotient
li $v0, 1
move $a0, $t2
syscall

# print remainder label
li $v0, 4
la $a0, rem_msg
syscall

# print remainder
li $v0, 1
move $a0, $t3
syscall

# exit
li $v0, 10
syscall
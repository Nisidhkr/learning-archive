.data
msg1:   .asciiz "Enter an integer: "
msg2:   .asciiz "The number is: "

.text
.globl main

main:
    # Ask for integer
    la $a0, msg1
    li $v0, 4
    syscall

    # Read integer
    li $v0, 5        # Read int
    syscall
    move $t0, $v0    # Store input

    # Print result message
    la $a0, msg2
    li $v0, 4
    syscall

    # Print integer
    move $a0, $t0
    li $v0, 1
    syscall

    # Exit
    li $v0, 10
    syscall

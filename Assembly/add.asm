.data
prompt1:   .asciiz "Enter first number: "
prompt2:   .asciiz "Enter second number: "
resultMsg: .asciiz "Result is: "

.text
.globl main

main:
    # Print first prompt
    li $v0, 4
    la $a0, prompt1
    syscall

    # Read first integer
    li $v0, 5
    syscall
    move $t0, $v0       # store first number

    # Print second prompt
    li $v0, 4
    la $a0, prompt2
    syscall

    # Read second integer
    li $v0, 5
    syscall
    move $t1, $v0       # store second number

    # Add numbers
    add $t2, $t0, $t1

    # Print result message
    li $v0, 4
    la $a0, resultMsg
    syscall

    # Print result value
    li $v0, 1
    move $a0, $t2
    syscall

    # Exit
    li $v0, 10
    syscall
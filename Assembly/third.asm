.data
msg:    .asciiz "The number is: "
num:    .word 8          # Integer stored using .word

.text
.globl main

main:
    # Print message
    la $a0, msg
    li $v0, 4            # Print string
    syscall

    # Load integer
    lw $a0, num
    li $v0, 1            # Print integer
    syscall

    # Exit
    li $v0, 10
    syscall

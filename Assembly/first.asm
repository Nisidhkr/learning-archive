.data
ch: .byte 'D'

.text
main:
    lb $a0, ch
    li $v0, 11
    syscall

    li $v0, 10
    syscall

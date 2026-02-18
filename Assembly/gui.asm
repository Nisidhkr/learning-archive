extern XOpenDisplay
extern XDefaultRootWindow
extern XCreateSimpleWindow
extern XMapWindow
extern XNextEvent
extern XCloseDisplay

global main

section .bss
    display     resq 1
    window      resq 1
    event       resb 192      ; XEvent structure

section .text

main:
    ; display = XOpenDisplay(NULL)
    xor rdi, rdi
    call XOpenDisplay
    mov [display], rax

    ; root = XDefaultRootWindow(display)
    mov rdi, rax
    call XDefaultRootWindow

    ; window = XCreateSimpleWindow(display, root, x, y, w, h, border, border_color, bg)
    mov rdi, [display]
    mov rsi, rax
    mov rdx, 100
    mov rcx, 100
    mov r8,  400
    mov r9,  300
    push 0x000000     ; background
    push 0x000000     ; border color
    push 1            ; border width
    call XCreateSimpleWindow
    add rsp, 24
    mov [window], rax

    ; XMapWindow(display, window)
    mov rdi, [display]
    mov rsi, [window]
    call XMapWindow

event_loop:
    mov rdi, [display]
    mov rsi, event
    call XNextEvent
    jmp event_loop

    ; never reached
    mov rdi, [display]
    call XCloseDisplay
    ret

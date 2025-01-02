; Alive.asm
section .data
    msg1        db  "Hello, World!", 10, 0      ; String with NL and NULL ternimated byte. db = Define BYTE
    msg1Length  equ $-msg1-1    ; $ = current address
                                ; $-msg1 = current address - msg1 address (this statement calculates the length of msg1)

    msg2        db  "Alive and Kicking!", 10, 0 ; Another string
    msg2Length  equ $-msg2-1
    radius      dq  357     ; dq = define QWORD (64 bits)
    pi          dq  3.14    

section .text
    global main
main:
    push    rbp         ; function prologue
    mov     rbp, rsp    ; function prologue
    
    ; setting up the Write syscall
    mov     rax, 1      ; sycall number
    mov     rdi, 1      ; fd stdout
    mov     rsi, msg1   ; string to display
    mov     rdx, msg1Length ; string length
    syscall

    ; setting up to print the 2nd string
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, msg2
    mov     rdx, msg2Length
    syscall

    mov     rsp, rbp    ; function epilogue
    pop     rbp         ; function epilogue

    ; Exit syscall
    mov     rax, 60
    mov     rdi, 0
    syscall

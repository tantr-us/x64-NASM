; HelloWorld.asm - Print "Hello World" to the screen.
; Compile: make
; Run: ./HelloWorld
;;;
section .data
    msg     db      "Hello, World", 10, 0
section .bss
section .text
    global main
main:
; Original version
    ; mov rax, 1      ; 1 = write syscall
    ; mov rdi, 1      ; file descriptor (fd), 1 is for stdout
    ; mov rsi, msg    ; string to display
    ; mov rdx, 13     ; length of the string, exclude the null byte - 0x0
    ; syscall         ; print the string to stdout 
    ; ; exit
    ; mov rax, 60     ; 60 = exit syscall
    ; mov rdi, 0      ; exit code
    ; syscall

; objdump from the original version, notice the 00 (NULL byte) after each instruction lines.
; 0000000000401110 <main>:
;   401110:	b8 01 00 00 00       	mov    eax,0x1
;   401115:	bf 01 00 00 00       	mov    edi,0x1
;   40111a:	48 be 28 40 40 00 00 	movabs rsi,0x404028
;   401121:	00 00 00 
;   401124:	ba 0d 00 00 00       	mov    edx,0xd
;   401129:	0f 05                	syscall 
;   40112b:	b8 3c 00 00 00       	mov    eax,0x3c
;   401130:	bf 00 00 00 00       	mov    edi,0x0
;   401135:	0f 05                	syscall 
;   401137:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
;   40113e:	00 00 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Remove NULL byte version
    ; Zero-out all the registers
    xor rax, rax
    xor rdi, rdi
    xor rsi, rsi
    xor rdx, rdx
    ;;;
    mov al, 1     ; move 0x1 into al (the lower-bit) instead of rax to reduce the null byte
    mov dil, 1    ; file descriptor (fd), 1 is for stdout
    mov esi, msg    ; string to display
    mov dl, 13     ; length of the string, exclude the null byte - 0x0
    syscall         ; print the string to stdout 
    ; exit
    mov al, 60     ; 60 = exit syscall
    mov dil, 0      ; exit code
    syscall

; 0000000000401110 <main>:
;   401110:	48 31 c0             	xor    rax,rax
;   401113:	48 31 ff             	xor    rdi,rdi
;   401116:	48 31 f6             	xor    rsi,rsi
;   401119:	48 31 d2             	xor    rdx,rdx
;   40111c:	b0 01                	mov    al,0x1
;   40111e:	40 b7 01             	mov    dil,0x1
;   401121:	be 28 40 40 00       	mov    esi,0x404028
;   401126:	b2 0d                	mov    dl,0xd
;   401128:	0f 05                	syscall 
;   40112a:	b0 3c                	mov    al,0x3c
;   40112c:	40 b7 00             	mov    dil,0x0
;   40112f:	0f 05                	syscall 
;   401131:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
;   401138:	00 00 00 
;   40113b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

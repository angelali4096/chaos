global loader				; the entry symbol of ELF

MAGIC_NUMBER equ 0x1BADB002		; define the magic number constant
FLAGS equ 0x0				; multiboot flags
CHECKSUM equ -MAGIC_NUMBER 		; calculate the checksum
					; (magic number + checksum + flags = 0)

section .text:				; start of the code section
align 4 				; code must be 4 byte aligned
    dd MAGIC_NUMBER			; write the magic number to the 
					; machine code
    dd FLAGS				; write the flags to mc
    dd CHECKSUM 			; write the checksum to mc

loader:					; the loader label (defined in line 1)
    mov eax, 0xCAFEBABE			; place 0xCAFEBABE to reg. eax
.loop:
    jmp .loop				; loop forever

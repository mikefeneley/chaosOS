

[org 0x7c00] 


mov [BOOT_DRIVE], dl ; BIOS stores our boot drive in DL , so it ’s; best to remember this for later.
mov bp , 0x8000 ; Here we set our stack safely out of the

mov sp , bp     ; way , at 0 x8000
mov bx , 0x9000 ; Load 5 sectors to 0 x0000 (ES ):0 x9000 (BX)
mov dh , 5      ; from the boot disk.
mov dl , [BOOT_DRIVE]
call disk_load

mov dx , [0x9000 ] ; Print out the first loaded word , which
call print_hex

mov dx , [0x9000 + 512] ; Also , print the first word from the
call print_hex

jmp $


%include "print_hex.asm"
%include "print_string.asm" ; Re - use our print_string function
%include "disk_load.asm"


; Include our new disk_load function
; Global variables
BOOT_DRIVE : db 0

HELLO_MSG:
    db "Hello World", 0

GOODBYE_MSG:
    db "Goodbye World", 0




times 510 -( $ - $$ ) db 0
dw 0xaa55

times 256 dw 0xdada
times 256 dw 0xface

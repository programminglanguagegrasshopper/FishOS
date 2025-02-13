bits 16

section _TEXT

global _x86_Video_WriteCharTeletype:
_x86_VideoWriteCharTeletype:
    ; make new call frame
    push bp    ; save old call frame
    mov bp, sp ; initialize new call frame

    ; save bx
    push bx

    ; [bp + 0] - old call frame
    ; [bp + 2] - return address
    ; [bp + 4] - first argument; bytes are converted to words because you can't push a single byte
               ; on the stack
    ; [bp + 6] - second argument [page]

    mov ah, 0Eh
    mov al, [bp + 4]
    mov bh, [bp + 6]
    
    int 10h

    ; restore bx
    pop bx

    ; restore old call frame
    mov sp, bp
    pop bp
    ret
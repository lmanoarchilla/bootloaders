;========================================================================
; ORG especifica un offset a todas las referencias de direcciones internas
; dentro de la seccion
;-------------------------------------------------------------------
; direccionamientro real: segmento * 16 + offset

[ORG 0x7c00]
        xor ax, ax ; ponemos a 0 el registro Ax
        mov ds, ax ; llevamos a segmento de datos el valor de Ax 

        ; la direccion se calcula DS *16 + ORG = 16 * 0x0000 + 0x7C00
; de la misma forma podriamos:

; mov ax, 0x07c0
; mov ds, ax
; la direccion se calcula DS *16 + ORG = 16 * 0x07c0 + 0x0000 = 0x7c00

        mov si, msg ; lleva msg a SI
        call printc ;

        jmp $; bucle infinito , $ siempre devuelve la direccion actual

;-------------------------------------------
printc:
        mov ah, 0x0E ;funcion 0x0E de la interrupcion : TeleType (escribir caracteres en la pantalla)
        ; especifica AL =caracter BX=(solo en modo grafico)
        int 0x10 ; interrupcion de video 
print:
        lodsb ; carga el valor de DS:SI en AL 
        cmp al, 0 ; comprueba si hay un valor o ha terminado el string
        jne printc; si no es cero salta a printc
        ret; si es cero sale de la función
;--------------------------------------------
msg db 'hello world',13, 10, 0

times 510-($-$$) db 0 ; rellena de ceros desde el final del codigo hasta el final del sector menos
                      ; 2 bytes escritos a continuación, marcan el segmento como mbr
   db 0x55
   db 0xAA
;==============================================================================================

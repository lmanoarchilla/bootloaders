;Este es un ejemplo sacado de http://www.osdever.net/tutorials/view/hello-world-boot-loader 
;es posible que haya alguna diferencia con el original además de la traducion

[BITS 16]	  ; declaramos que el código será de 16 bits
		  ;  
[ORG 0x7C00]	  ; dirección de carga en  memoria
		  
	main: 	  ; etiqueta de incio de la función principal
	
	mov ah,0x0E	 ;  función de la BIOS para escribir caracteres 
		 	 ;  muestra un carácter en la pantalla
	mov bh,0x00	 ; número de página 
	mov al,0x65	 ; muestra una letra en código ascii
	int 0x10	 ; llama a la interrupción de video 10H de la BIOS
	jmp $		 ; crea un loop llamando constantemente a main
	
times 510-($-$$) db 0	; rellena el resto del sector con ceros
dw 0xAA55		; añade la firma de sector de arranque al final	

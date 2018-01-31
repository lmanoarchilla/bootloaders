
- Tiene que caber en 512 bytes, para que quepa en un sector del disco
- Debe terminar con una firma de cargador '55 AA'
- Debe cargarse en 0x7C00
- Interrupción de video: 
  -0x10: todo lo que tiene que ver a sacar por pantalla se hace con esta interrupción
  -Funciones:
			*AH: 0x0E 
			*AL: Caracteres ascii
			*BH: Número de página
			*BL: Atributos del texto
- Instalando un bootloader:
  -Instalar el sector de arranque en un fichero de texto
  - compilarlo con nasm: 
			nasm Bootsector.txt
	- Probar con qemu:
			sudo qemu-system-i386 -drive format=raw,file=bootloop
	- comprobar los 512MB
	- guardar el boot de tu ordenador
			dd if=/dev/sda of=oldboot.bin bs=512 count=1
	- Instalar el bootloader en un usb
			dd if=Bootloader Bs=512 of=/dev/fd0

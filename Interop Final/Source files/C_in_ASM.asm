;
;

INCLUDE C:\Irvine\Irvine32.inc

_printf PROTO C, pString:PTR BYTE, args:VARARG
.data
 cprint		BYTE "We are printing using a C Library!",0
.code

main PROC C


	push OFFSET cprint
	call printf
	call crlf
	INVOKE printf, [esp]

	call crlf
main ENDP


END
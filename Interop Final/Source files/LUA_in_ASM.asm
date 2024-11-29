INCLUDE C:\Irvine\Irvine32.inc

lua_pushcclosure PROTO C :DWORD, :DWORD, :DWORD
luaL_loadfilex PROTO C :DWORD, :DWORD, :DWORD
lua_tolstring PROTO C :DWORD, :DWORD, :DWORD ; use that in my extra procedure above main
luaL_openlibs PROTO C :DWORD
luaL_newstate PROTO C
lua_setglobal PROTO C :DWORD, :DWORD
lua_pcallk PROTO C :DWORD, :DWORD, :DWORD, :DWORD,:DWORD,:DWORD
lua_close PROTO C :DWORD

introduction2 PROTO C, string:DWORD


.data
	L			DWORD	?													; this is the lua state
	file		BYTE	30 DUP(?)
	procedure	BYTE "introduction2",0
	prompt		BYTE	"please enter the name of the lua script: ",0
	string1		BYTE    "lua_main",0
	done		BYTE	"would you like to exit? 1 for yes, 0 for no: ",0

.code
lua_introduction2 PROC C
	push	ebp
	mov	ebp, esp
	INVOKE lua_tolstring, L, 1, 0
	INVOKE introduction2, eax
	pop ebp
	ret

lua_introduction2 ENDP

main PROC C

	INVOKE luaL_newstate	;new state gets saved into eax			

	mov L , eax

	INVOKE luaL_openlibs, L
	INVOKE lua_pushcclosure, L, OFFSET lua_introduction2, 0
	INVOKE lua_setglobal, L, OFFSET procedure

	L1:
		mov edx, OFFSET prompt
		call writestring
		mov edx, OFFSET file
		mov ecx, 29
		call readstring

		INVOKE luaL_loadfilex, L, OFFSET file, 0
		INVOKE lua_pcallk, L, 0, 0, 0, 0, 0

		mov edx, OFFSET done
		call writestring
		call readDec
		cmp eax, 0
		je L1


	INVOKE lua_close,L

exit
main ENDP


END
;
;

INCLUDE C:\Irvine\Irvine32.inc


; (insert constant definitions here)

MessageBoxA PROTO,
    hWnd:DWORD,                ;window
    lpText:PTR BYTE,           ;box message
    lpCaption:PTR BYTE,        ;box title
    uType:DWORD                ;buttons

.data

windowcaption    BYTE    "ASM Notification",0
windowmsg        BYTE    "ASM has called the Win32 lib!",0



.code
main PROC 

INVOKE MessageBoxA, NULL, ADDR windowmsg, ADDR windowcaption, MB_OK + MB_ICONEXCLAMATION

main ENDP


END main
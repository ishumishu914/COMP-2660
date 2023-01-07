TITLE

; Name: Ishrat Sikder
; Date: Sept 23, 2022
; ID: 110088181
; Description: Lab 1 section 2

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two lines are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.code
main PROC
  mov eax, 7h
  add eax, 3h
  call DumpRegs
  sub eax, 2h
  call DumpRegs
  exit
main ENDP
END main
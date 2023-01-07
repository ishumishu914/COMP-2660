TITLE Lab 5

; Name: Ishrat Sikder
; Date: Nov 4, 2022
; ID: 110088181
; Description: Lab 5 section 2 q2

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two lines are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
count DWORD ?

.code
main PROC
  mov eax, 0
  mov ecx, 16  ;foreground colors

FLoop:
  mov count, ecx
  push eax
  mov ecx, 16  ;background colors

BLoop:    ; display one line
; EAX:  Bits 0-3 = foreground color
        ;Bits 4-7 = background color

  call SetTextColor   ; Changes color of all subsequent text 
  push eax    ; save color     
  mov al,'z'    ; Write preferred char
  call WriteChar
  pop eax       ; restore color
  add eax,10h      ; next background color
  loop BLoop

  call Crlf  ; add new line
  pop eax  ; restore color
  inc eax  ; next background color
  mov ecx, count   ;line counter
  push eax
  pop eax  
  loop FLoop  ;repeat to get new fg color for next char

	exit
main ENDP
END main
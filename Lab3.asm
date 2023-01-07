TITLE Lab 3

; Name: Ishrat Sikder
; Date: Oct 7, 2022
; ID: 110088181
; Description: Lab 3 section 2

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two lines are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
  val1 SDWORD 8h
  val2 SDWORD -15h
  val3 SDWORD 20h
  Uarray WORD 1000h,2000h,3000h,4000h
  Sarray SWORD -1,-2,-3,-4

.code
main PROC
  ; part 1
	; EAX = -val2 + 7 - val3 + val1
	mov eax, 7
  call DumpRegs
  sub eax, val2
  call DumpRegs
  sub eax, val3
  call DumpRegs
  add eax, val1
	call DumpRegs ; displays registers in console

  ; part 2
  mov eax, 0
  mov ebx, 0
  mov ecx, 0
  mov edx, 0

  mov ax, [Uarray]
  mov bx, [Uarray+2]
  mov cx, [Uarray+4]
  mov dx, [Uarray+6]
  call DumpRegs

  mov eax, -1
  mov ebx, -1
  mov ecx, -1
  mov edx, -1

  mov ax, [Sarray]
  mov bx, [Sarray+2]
  mov cx, [Sarray+4]
  mov dx, [Sarray+6]
  call DumpRegs
	exit
main ENDP
END main
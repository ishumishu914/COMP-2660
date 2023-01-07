TITLE Lab 4

; Name: Ishrat Sikder
; Date: Oct 20, 2022
; ID: 110088181
; Description: Lab 4 section 2

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two lines are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.code
main PROC

; part 1

  mov eax,1   ; fib(1) =1
  call DumpRegs
  mov ebx,0   ; initial setup
  mov ecx,6   ; counter
  mov edx,1   ; to start getting fib(2) = 1 and accumulate
Lp1:
  mov  eax,ebx    
  add  eax,edx  ; eax = ebx + edx
  call DumpRegs   ; display result in eax
  mov  ebx,edx
  mov  edx,eax
  Loop Lp1

; part 2
	
	mov al,255  ; (255=0FFh) makes AL=0 since 255 goes past AL
	add al,1	; AL=0, CF=1 (unsigned overflow)
	call DumpRegs

  ; last instruction passed AL and moved to AH, sub brings value back to AL
	sub al,1	; AL=255, CF=1  
	call DumpRegs

	sub al,1	; AL=254, CF=0
	call DumpRegs

  exit
main ENDP
END main
TITLE Lab 6

; Name: Ishrat Sikder
; Date: Nov 11, 2022
; ID: 110088181
; Description: Lab 6 section 2

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two lines are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

str_count = 20
str_size = 10

.data
str1 BYTE str_size DUP(0) ; 20 bytes of 0s

.code
main PROC
  mov ecx, str_count  ;outer loop counter
L1: 
  push ecx  ; start outer loop
  mov ecx, str_size  ;inner loop counter
  mov esi, OFFSET str1  ;esi = start of string index 

L2:
  mov eax, 26  ;random int 0-25
  call RandomRange
  add eax, 'A'     ; A = 65 ex: 1+65='B'
  mov [esi], al  ; store random char
  inc esi  ;mov esi for next char
  loop L2
  
  mov edx, OFFSET str1  ;mov str1 for display
  call WriteString  
  call Crlf  ;add new line (carriage return+line feed)
  
  pop ecx  ;end and move to next
  loop L1  ;outer loop repeat

  exit
main ENDP
END main
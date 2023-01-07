TITLE Lab 7

; Name: Ishrat Sikder
; Date: Nov 28, 2022
; ID: 110088181
; Description: Lab 7 question 1

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
Array DWORD 1h, 2h, 3h, 4h, 5h, 6h  ;20 DUP(?) 
pointer DWORD ? ;pointer to array

msg1 BYTE "The Array is: ", 0
msg2 BYTE "Calling ArraytoStack ", 0
msg3 BYTE "Calling StackToArray ", 0
msg4 BYTE "Calling StackReverse ", 0

.code
main PROC

; Displaying stack

  mov edx, OFFSET msg1
  call WriteString
  mov esi, OFFSET Array
  mov ecx, LENGTHOF Array
  mov ebx, TYPE Array
  call DumpMem

; calling ArraytoStack procedure

  push OFFSET Array  ;[ebp+12] & 
  push LENGTHOF Array  ;[ebp+8]
  call ArraytoStack
  add esp, 8  ;remove stack param
  mov pointer, ebx  ;store ret value in pointer
  mov esp, ebx  ;mov back to prevent stack from overwriting

; display the Array (after array to stack)

  mov edx, OFFSET msg2
  call WriteString
  mov esi, OFFSET Array
  mov ecx, LENGTHOF Array
  mov ebx, TYPE Array
  call DumpMem

; calling StacktoArray procedure

  mov ebx, pointer
  push ebx  ;[ebp+020]
  push SIZEOF Array  ;[ebp+16]
  push OFFSET Array  ; [ebp + 12]
  push LENGTHOF Array  ; [ebp + 8]
  call StackToArray
  add esp, 16  ;remove stack param

; display restored array

  mov edx, OFFSET msg3
  call WriteString
  mov esi, OFFSET Array
  mov ecx, LENGTHOF Array
  mov ebx, TYPE Array
  call DumpMem

; calling StackReverse

  push OFFSET Array  ; [ebp + 12]
  push LENGTHOF Array  ; [ebp + 8]
  call StackReverse
  add esp, 8  ;

; display reversed array

  mov edx, OFFSET msg4
  call WriteString
  mov esi, OFFSET Array
  mov ecx, LENGTHOF Array
  mov ebx, TYPE Array
  call DumpMem

  exit
main ENDP

ArraytoStack PROC
;-----------------------------------------------------
; pushes elements of the array to stack
; receives:
; returns:
;-----------------------------------------------------

push ebp
mov ebp, esp

; pushing elements
  mov ecx, [ebp+8]  ;loop counter
  mov esi, [ebp+12]   ;array offset
  mov edx, ecx   
  shl edx, 2  ;array size

  ;loop to keep pushing array elements
  L1:
    mov eax, [esi]
    push eax
    add esi, 4
    loop L1

  mov ebx, esp  ;move to last (top of stack) element 
  mov esp, ebp  ;remove element
  pop ebp
  ret
ArraytoStack ENDP

StacktoArray PROC
;-------------------------------------------------------------
; copies stack back to the array in its original position
; Receives: array length, array offset, array size and array staring element
; Return: none
;--------------------------------------------------------------

  push ebp
  mov ebp, esp

;copy back
  mov ebx, [ebp+20]  ;address of last array element
  mov ecx, [ebp+8]  ;length
  mov esi, [ebp+12]  ;offset
  add esi, [ebp+16]  ;esi is out of bound now
  sub esi, 4  ;to make esi=offset of last index of array

  L2:
    mov eax, [ebx]  ;eax=stack element
    mov [esi], eax ;store element in array in index
    sub esi, 4  ;array index moving backward
    add ebx, 4  ;stack base goes up
    loop L2

  pop ebp
  ret
StacktoArray ENDP

StackReverse PROC
;---------------------------------------------------------------
; reverse the array
; Receives: array legnth and offset
; Returns: none
;---------------------------------------------------------------

  push ebp
  mov ebp, esp

; push elements to stack
  mov ecx, [ebp+8]  ;counter=length
  mov esi, [ebp+12]  ;array offset
  
  L3:
    mov eax, [esi]  ;eax=array element 
    push eax
    add esi, 4
    loop L3

; pop array elements from stack to store in reverse
  mov ecx, [ebp+8]
  mov esi, [ebp+12]
  
  L4:
    pop eax
    mov [esi], eax
    add esi, 4
    loop L4
pop ebp
ret
StackReverse ENDP

END main
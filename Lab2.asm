TITLE Lab 2

; Name: Ishrat Sikder
; Date: Sept 30, 2022
; ID: 110088181
; Description: Lab 2 section 2

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two lines are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

st1 TEXTEQU <"Hello, how are you?">
st2 TEXTEQU <"Hi! I'm good">
st3 TEXTEQU <"Nice to meet you :)">

.data
  ; part 1
  val1 BYTE 25
  val2 SBYTE -26
  val3 WORD "AC"
  val4 SWORD -3562
  val5 DWORD 9852043h
  val6 SDWORD -123456h
  val7 QWORD 1234567A901234h
  val8 TBYTE 1001520400123456789Ah
  
  ; part 2
  s1 WORD st1
  s2 WORD st2
  s3 WORD st3

.code
main PROC
  exit
main ENDP
END main
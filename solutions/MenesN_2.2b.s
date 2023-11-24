.globl _start
.text
_start:
mov $20, %EBX
mov $15, %ECX
mov $30, %EDX
__begin:

cmp %ECX, %EBX
jg wiekszyEBX
mov %ECX, %EAX
jmp endifPierwszy

wiekszyEBX:
mov %EBX, %EAX
endifPierwszy:

cmp %EDX, %EAX
jg endifDrugi
mov %EDX, %EAX
endifDrugi:

__end: nop
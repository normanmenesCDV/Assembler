.globl _start
.text
_start:
mov $20, %EBX
mov $15, %ECX
mov $30, %EDX
__begin:

cmp %ECX, %EBX
jl mniejszyEBX
mov %ECX, %EAX
jmp endifPierwszy

mniejszyEBX:
mov %EBX, %EAX
endifPierwszy:

cmp %EDX, %EAX
jl endifDrugi
mov %EDX, %EAX
endifDrugi:

__end: nop
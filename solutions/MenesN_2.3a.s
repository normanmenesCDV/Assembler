.globl _start
.text
//ECX ← min(EAX, EBX)
_start:
mov $20, %EAX
mov $15, %EBX
__begin:

cmp %EAX, %EBX
jl mniejszyEBX
mov %EAX, %ECX
jmp endif

mniejszyEBX:
mov %EBX, %ECX
endif:

__end: nop
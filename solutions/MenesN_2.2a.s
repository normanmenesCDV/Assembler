.globl _start
.text
_start:
mov $15, %EAX
mov $20, %EBX
__begin:

cmp %EAX, %EBX
jg endif
mov %EAX, %EBX
endif:
mov %EBX, %ECX

__end: nop
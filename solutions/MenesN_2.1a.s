.globl _start
.text
_start:
mov $-10, %EDX
__begin:

cmp $0, %EDX
jge endif # if( (%EDX - $0) >= 0 ) przejdzDo endif
neg %EDX
endif:
mov %EDX, %EBX

__end: nop
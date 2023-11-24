.globl _start
.text
_start:
mov $15, %ECX
mov $20, %EDX
__begin:

sub %ECX, %EDX # %EDX -= %ECX
cmp $0, %EDX
jge endif # if( (%EDX - $0) >= 0 ) przejdzDo endif
neg %EDX
endif:
mov %EDX, %EBX

__end: nop
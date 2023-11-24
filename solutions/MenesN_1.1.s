.globl _start
.text
_start:
mov $2, %EBX
mov $3, %ECX

mov %EBX, %EAX
mul %EBX
mov %EAX, %EBX

mov %ECX, %EAX
mul %ECX
mov %EAX, %ECX

mov $0, %EDX
add %EBX, %EDX
add %ECX, %EDX
nop

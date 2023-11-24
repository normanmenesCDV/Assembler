.globl _start
.text
_start:
mov $8, %EBX
__begin:
mov %EBX, %ECX
mov %EBX, %EAX

petla:
dec %ECX
cmp $1, %ECX
jle wyjdzZPetli # <= a nie ==, dlatego, że zdeklarowany %EBX może == 1
mul %ECX
jmp petla
wyjdzZPetli:

mov %EAX, %EDX

__end: nop
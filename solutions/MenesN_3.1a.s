.globl _start
.text
_start:
mov $8, %EBX
mov $4, %ECX
__begin:

mov %EBX, %ESI

# if ($0 == %ECX)
cmp $0, %ECX
je wyklanikJest0
jmp petla
wyklanikJest0:
mov $1, %ESI
jmp wyjdzZPetli

petla:
cmp $1, %ECX
je wyjdzZPetli
mov %ESI, %EAX  # %EAX = %ESI
mul %EBX    # %EAX = %EAX * %EBX
mov %EAX, %ESI # %ESI = %EAX
dec %ECX # %ECX--
jmp petla
wyjdzZPetli:

mov %ESI, %EDX

__end: nop
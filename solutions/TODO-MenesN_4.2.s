# Wyznaczanie w rejestrze EAX liczby elementów o wartości większej od 0 w tablicy liczb całkowitych
.data

array: .int 2, 8, -5, 10, -6, 5, 0, 7
arrayLength: .int (arrayLength-array) / 4

.globl _start
.text
_start:
__begin:

mov $0, %EAX
mov $array, %EBX       # Licznik indeksu
mov arrayLength, %ECX  # Ilości elementów w tablicy

mov $0, %EAX

.petla
    cmp $0, (%EBX)
    jle .not_positive
    inc %EAX


__end: nop

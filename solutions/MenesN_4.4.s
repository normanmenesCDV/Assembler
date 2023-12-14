# Wyznaczanie w rejestrze EAX średniej arytmetycznej elementów o wartości większej od 0 w tablicy liczb całkowitych
.data

array: .int 2, 8, -5, 10, -6, 5, 0, 7
array_end:  # ten element zostanie zapisany w pamięci zaraz po tablicy `array`
array_bytes: .int array_end - array
array_size: .int (array_end-array) / 4 # Dzielimy przez 4 ze względu na 32-bitową architekturę

.globl _start
.text
_start:
__begin:

mov  $0, %EAX               # suma znalezionych elementów spełniających warunek w tablicy
mov  $0, %ESI               # licznik elementów spełniających warunek w tablicy
mov  $0, %EBX               # rejestr do operacji arytmetycznej na wskaźnikach
mov  array_bytes, %ECX      # rozmiar bitowy tablicy

petla:
    cmp  %ECX, %EBX
    jge  endPetla
    cmp  $0, array(%EBX)
    jg   znalezionoElement
    jmp  endif
    znalezionoElement:
        add array(%EBX), %EAX
        inc %ESI
    endif:
    add  $4, %EBX           # Dodajemy 4 ze względu na 32-bitową architekturę
    jmp  petla
endPetla:

mov  array_size, %ECX
xor  %EDX, %EDX             # zerowanie rejestru %EDX do dzielenia -> `mov $0, %EDX`
div  %ESI

__end: nop

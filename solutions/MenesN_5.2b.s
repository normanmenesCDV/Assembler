# zamiana dużych liter na małe
.data

    tekst: .ascii "Ala ma kota\0"

.globl _start
.text
_start:
__begin:
    mov $tekst, %EDI

petla:
    movb (%EDI), %AL
    test %AL, %AL
    je __end

    cmp $'A', %AL
    jl not_uppercase
    cmp $'Z', %AL
    jg not_uppercase

    add $32, %AL
    movb %AL, (%EDI)

not_uppercase:
    inc %EDI
    jmp petla

__end: nop

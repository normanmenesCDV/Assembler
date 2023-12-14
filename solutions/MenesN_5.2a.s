# zamiana małych liter na duże
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

    cmp $'a', %AL
    jl not_lowercase
    cmp $'z', %AL
    jg not_lowercase

    sub $32, %AL
    movb %AL, (%EDI)

not_lowercase:
    inc %EDI
    jmp petla

__end: nop

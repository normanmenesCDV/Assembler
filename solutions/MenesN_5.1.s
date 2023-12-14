# wyznaczanie w rejestrze EAX liczby MAŁYCH liter w napisie
.data

    tekst:  .asciz "Ala ma kota"

.globl _start
.text
_start:
__begin:
    xor %ECX, %ECX
    lea tekst, %ESI

petla:
    movb (%ESI), %AL
    cmp $0, %AL
    je end_petla

    cmp $'a', %AL
    jl not_lowercase
    cmp $'z', %AL
    jg not_lowercase

    inc %ECX

not_lowercase:
    inc %ESI
    jmp petla

end_petla:
    mov %ECX, %EAX

__end: nop

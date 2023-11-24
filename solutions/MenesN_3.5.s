# Wyznaczanie n-tego wyrazu ciągu Fibonacciego
.globl _start
.text
_start:
mov  $24, %ECX
__begin:

mov  $1, %ESI   # iterator
mov  $0, %EAX   # wartość obecnego/ostatniego wyrazu ciągu
mov  $0, %EBX   # wartość ostatniego/przedostatniego wyrazu ciągu

fib:
    cmp  %ECX, %ESI
    jg   endFib

    cmp  $1, %ESI
    je   pierwszyWyrazCiagu
    jmp  kolejneWyrazyCiagu
    pierwszyWyrazCiagu:
        mov  $1, %EAX
        mov  $0, %EBX
        jmp  wyznaczonoWyrazCiagu
    kolejneWyrazyCiagu:
    
    mov  %EAX, %EDX
    add  %EBX, %EAX
    mov  %EDX, %EBX

    wyznaczonoWyrazCiagu:
    inc  %ESI
    jmp fib
endFib:

__end: nop

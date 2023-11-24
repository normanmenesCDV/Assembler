# Wyznaczanie NWD
.globl _start
.text
_start:
mov $28, %EAX
mov $8, %EBX
__begin:

# Algorytm Euklidesa

# 0. Przygotowanie danych
cmp  %EAX, %EBX
jg   podmienAEXzEBX
jmp  wyjdzZPodmiany
podmienAEXzEBX:
    mov  %EAX, %EDX
    mov  %EBX, %EAX
    mov  %EDX, %EBX
    xor  %EDX, %EDX  # zerowanie %EDX
wyjdzZPodmiany:

# 1. Dzielenie z resztą
dzielDopokiResztaNieBedzieZero:
    mov  $0, %EDX
    div  %EBX           # %EAX /= %EBX
    cmp  $0, %EDX       # jeśli %EDX == 0, tzn. że reszta dzielenia wynosi 0 -> znaleziono dzielnik
    je   znalezionoNWD  # jeśli warunek spełniony, wyjdź z pętli
    mov  %EBX, %EAX
    mov  %EDX, %EBX
    jmp  dzielDopokiResztaNieBedzieZero
znalezionoNWD:

mov  %EBX, %EAX

__end: nop

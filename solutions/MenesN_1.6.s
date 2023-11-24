.globl _start
.text
_start:
mov $10, %EAX
mov $4, %EBX
mov $6, %ECX
mov $2, %EDX

# ECX = EAX * ECX
mov %EDX, %ESI  # przy operacji mul, rejestr %EDX ZAWSZE zostanie wykorzystany do wyniku jako bardziej znacząca jego część, a rejestr %EAX ZAWSZE jako mniej znacząca jego część
mul %ECX
mov %EAX, %ECX

# ECX -= EDX^2
mov %ESI, %EAX # przenosimy wartość z rejestru $ESI do %EAX, gdyż przy operacji mnożenia [mul %ESI] zostanie wykonane działanie %EAX * %ESI
mul %ESI
sub %EAX, %ECX # mniej znacząca część mnożenia ZAWSZE znajduje się w rejestrze %EAX

# ECX /= -EBX
xor %EDX, %EDX	# zerujemy wartość rejestru %EDX, by nie został on wykorzystany do operacji div
neg %EBX
mov %ECX, %EAX
idiv %EBX
mov %EAX, %ECX
nop

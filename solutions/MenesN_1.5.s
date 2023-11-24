.globl _start
.text
_start:
mov $7, %EAX
mov $1, %EBX
mov $10, %EDX

# ECX = EAX^2
mov %EDX, %ESI  # przy operacji mul, rejestr %EDX ZAWSZE zostanie wykorzystany do wyniku jako bardziej znacząca jego część, a rejestr %EAX ZAWSZE jako mniej znacząca jego część
mul %EAX
mov %EAX, %ECX

# ECX += EBX
add %EBX, %ECX

# ECX /= EDX
xor %EDX, %EDX	# zerujemy wartość rejestru %EDX, by nie został on wykorzystany do operacji div
mov %ECX, %EAX
div %ESI
mov %EAX, %ECX
nop

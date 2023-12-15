# Wywołania systemowe
.data
    tekst: .ascii "Hello world!\n"   # etykieta `tekst`, która wskazuje na początek napisu. Zakończono tekst znakiem nowej linii, zakończone znakiem nowej linii by się ładnie wyświetlało
    end_tekst:

.globl _start
.text
_start:

mov $4, %EAX                    # wywołanie systemowe zapisu (sys_write)
mov $1, %EBX                    # deskryptor pliku 1 (standardowe wyjście)
mov $tekst, %ECX                # adres pamięci, co ma się znaleźć w pliku
mov $(end_tekst-tekst), %EDX    # rozmiar zapisywanych danych (liczba bajtów zawartości, którą zapisujemy do pliku). Odejmowanie traktujemy wartość liczbową, a nie adres, dlatego poprzedzone jest znakiem `$` 

int $0x80                       # wykonanie usługi jądra systemu operacyjnego
mov $1, %EAX                    # wywołanie systemowe wyjścia (sys_exit)
mov $0, %EBX                    # wyjście z "kodem" powrotu 0 (brak błędu)
int $0x80                       # wykonanie usługi jądra systemu operacyjnego

nop

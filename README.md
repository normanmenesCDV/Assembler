# Uwagi do ćwiczeń
Po ustawieniu wszystkich operandów zdeklarowanych w treści zadania lub utworzonych przez siebie ustawiamy etykietę:
```
__begin:
```
a na końcu programu:
```
__end: nop
```
Między tymi etykietami mamy umieszczać wszystkie instrukcje.
Jest do wymagane do testów jednostkowych prowadzącego zajęcia.

## Uruchamianie
1. Utwórz na Linuxie plik `program.s` i wklej do niego kod źródłowy
2. Uruchom:
```
$ as --32 -g program.s -o ass.o && ld -melf_i386 ass.o && gdb a.out
```
3. By wyświetlić kod, wpisz: `l`
4. Utwórz breakpoint w dowolnym miejscu kodu, wpisz: `b x`, gdzie `x` to numer linii kodu (linia na której chcesz ustawić punkt przerwania, musi zaweirać operację, może to być np. `nop`)
5. By uruchomić, wpisz: `r`
6. By wyświetlić wartość rejestrów, wpisz: `i r`
7. By zamknąć, wpisz: `q`
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

## Etykiety

etykieta jest to symboliczna postać adresu

## Tablice
Dane do poniższych przykładów:
```asm
.data
	tab: .long 2, 1, 4, 3, 6, 5, 8, 7, 10, 9
```

### Przykład 1
```asm
mov $8, %EDI

mov tab, %EAX               # zapisuje wartość pierwszego elementu tablicy
mov tab+8, %EBX             # zapisuje wartość elementu wskazanego przez adres początka tablicy (pierwszego elementu) przesuniętego o 8 bajtów. Każdy element .long ma 4 bajty, więc przesuwa o 2 elementy. Odpowiednik arytmetyki wskaźników w C
mov tab(%EDI), %EBX         # to samo co wyżej
mov tab(,%EBX,4), %ECX      # %ECX = tab + (%EBX * 4) -> wartość wskazywana przez wskaźnik
                            # przemieszczenie(baza, indeks, skala) = baza + (indeks * skala) + przemieszczenie
mov tab+12, %EDX
```
Wynik:
- `%EAX`: 2
- `%EBX`: 4
- `%ECX`: 6
- `%EDX`: 3
- `%EDI`: 8

### Przykład 2
```asm
lea tab+12, %ESI            # zapisuje adres elementu tablicy przesuniętego o 12 bajtów względem jej początku
mov (%ESI), %EAX            # zapisuje wartość elementu wskazanego przez adres %ESI
mov 4(%ESI), %EBX           # zapisuje wartość elementu wskazanego przez adres %ESI + 4 (czyli kolejny element tablicy)
mov $tab, %EDI              # zapisuje adres pierwszego elementu tablicy
mov 8(%EDI), %ECX           # zapisuje wartość elementu wskazanego przez adres %EDI + 8 (czyli przesunięcie o 2 elementy względem poczatku tablicy)
mov (%EDI, %ECX, 4), %EDX   # %EDX = %EDI + (%ECX * 4) -> wartość wskazywana przez wskaźnik
                            # przemieszczenie(baza, indeks, skala) = baza + (indeks * skala) + przemieszczenie
```
Wynik:
- `%EAX`: 3
- `%EBX`: 6
- `%ECX`: 4
- `%EDX`: 6
- `%ESI`: adres elementu znajdującego się w tym programie w rejestrze %EAX
- `%EDI`: adres pierwszego elementu tablicy


## Napisy w Assemblerze

1. Napisy umieszczamy w sekcji `.data`
2. Tekst przypisujemy do etykiety. Po podaniu nazwy etykiety wpisujemy `asci`, `ascii` lub `asciz`
3. Po zdeklarowaniu napisu warto ustawić sobie od razu kolejną etykietę, która będzie miała adres od razu po zakończeniu napisu. Wówczas odejmując od siebie tą etykietę od tej, w której znajduje się napis, możemy określić rozmiar bajtową napisu
By wyświetlić zawartość napisu, należy po uruchomieniu programu [`r`] wpisać: `x/s &tekst` (zob. rozwiązania zadań z 5. laboratoriów)

## Wywołania systemowe

### Przerwanie programu

`int $0x80` -> wszystkie przerwania (funkcje stołowe), które zostanie wywołane zależy od zawartości rejestru `%EAX`. Wykonanie usługi jądra systemu operacyjnego<br/>

- `1` - exit
- `2` - open
- ...
- `4` - zapis do pliku

Jak jest więcej parametrów, to do kolejnych rejestrów , np. `%EBX`, `%ECX`

### Zakończenie programu
```
mov $1, %EAX
int $0x80
```

# garden


## Informacje ogólne

Aplikacja zostła utworzona za pomocą Fluttera w wersji 1.22.6 (Dart 2.10.5).
W celu zainstalowania niezbędnych zależności należy użyć komendy
```flutter pub run build_runner watch --delete-conflicting-outputs```
Zastosowano bibliotekę BLoC do zarządzania stanem aplikacji, Injectable i GetIt do dependency injection.

## Plan działania

- utworzenie modeli Plant i PlantType z potrzebnymi parametrami
- implementacja lokalnej bazy danych wraz z encjami Plant i PlantType
- utworzenie interfejsu IPlantRepository i repozytorium PlantRepository
- utworzenie bloku PlantBloc wraz z wartościami State i Event
- budowa UI
- integracja UI z blokiem
- poprawki w UI

## Elementy dodatkowe, pominięte, propozycje
- W miarę rozwoju aplikacji można by użyć bibliotek JsonSerialization do generowania funkcji toJson, fromJson. Ze względu na mały rozmiar projektu zrezygnowałam z tego rozwiązania. 
- Nie zdążyłam dodać testów, paginacji i SnackBara.

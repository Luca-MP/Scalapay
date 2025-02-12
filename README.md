# Scalapay Test

Benvenuto in **Scalapay Test**, un'app Flutter moderna e intuitiva che consente di ricercare, filtrare e ordinare i prodotti con facilità. L'interfaccia utente è stata progettata per essere semplice da usare e visivamente accattivante offrendo un'esperienza fluida.


## 🎨 **Scelte estetiche**

- **Icona**: l'icona dell'app è stata sostituita sia su Android tramite l'Image Asset mentre per iOS tramite un tool icon generator online.
- **Nome app**: Il nome dell'app è stata sostituito sia su Android tramite l'AndroidManifest.xml mentre per iOS all'interno dell'Runner.xcodeproj.
- **Accorgimenti di usabilità**: Ho implementato alcuni accorgimenti di usabilità come:
    - il supporto al pull-down to refresh per ricaricare la ricerca corrente;
    - i TextField mostrano la tastiera corrispondente al tipo di dato, l'InputAction chiude la tastira automaticamente ed esegue l'azione corrispondete;
    - i filtri per prezzo non possono essere applicati quando il valore minimo è maggiore o uguale al valore massimo segnalando all'utente il preblema colorando i bordi di rosso;
    - i BottomSheet hanno un ritardo di qualche millisecondo per permettere all'utente di vedere la scelta selezionata;


## 🏛️ **Scelte architetturali**

- **BLoC**: Gestisce complesse logiche di stato in modo organizzato e scalabile. Inoltre favorisce il testing e consente di mantenere un codice pulito e più manutenibile.
- **GetIt**: Implementa la Dependency Injection in rendendo il codice pulito, modulare e facilmente testabile.
- **InfiniteScrollPagination**: Implementa la paginazione dei risultati di ricerca in maniera semplice ma efficace.
- **Mocktail**: Consente la scrittura degli UnitTest per la UI.
- **BlocTest**: Consente la scrittura degli UnitTest per BLoC.


## 🏁 **Setup del progetto**

| Flutter environment         | Android environment                              | iOS environment               |
|-----------------------------|--------------------------------------------------|-------------------------------|
| Flutter version:<br/>3.22.3 | Gradle version:<br/>8.5                          | Cocoapods version:<br/>1.16.2 |
| Dart version:<br/>3.4.4     | AGP version:<br/>8.2.0                           | Xcode version:<br/>16.2       |
|                             | Java version:<br/>21.0.4                         |                               |
|                             | Android Studio version:<br/>Ladybug Feature Drop |                               |


## ⬇️ Installazione e avvio dell'app

1. Clona il repository:
    ```bash
    git clone https://github.com/Luca-MP/Scalapay.git
    cd Scalapay
    ```
2. Installa le dipendenze:
    ```bash
    flutter pub get
    ```
3. Avvia l'app:
    ```bash
    flutter run
    ```


## 🤖 Esecuzione dei test
Avvia tutti i gruppi di test:

```bash
flutter test
```


## 👨🏻‍💻 Autore

Made with ❤️ by Luca Michael Pezzotta.

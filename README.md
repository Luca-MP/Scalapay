# Scalapay Test

Benvenuto in **Scalapay Test**, un'app Flutter moderna e intuitiva che consente di ricercare, filtrare e ordinare i prodotti con facilità. L'interfaccia utente è stata progettata per essere semplice da usare e visivamente accattivante, offrendo un'esperienza fluida su smartphone.

## 🌟Funzionalità

### **Ricerca prodotti**
- Ricerca rapida dei prodotti tramite una barra di ricerca.
- Puoi cercare per nome, categoria o altri dettagli del prodotto.

### **Filtraggio per prezzo**
- Possibilità di filtrare i prodotti in base al loro prezzo per trovare rapidamente quello che cerchi.

### **Ordinamento dei prodotti**
- **Ordina alfabeticamente**: Visualizza i prodotti in ordine alfabetico crescente (A-Z) o decrescente (Z-A)
- **Ordina per prezzo**: Visualizza i prodotti in base al prezzo in ordine crescente o decrescente.


## 🎨 **Scelte Tecnologiche**
### **Perché BLoC**?
- **Gestione dello stato reattiva**: Per gestire complesse logiche di stato in modo organizzato e scalabile.
- **Testabilità**: Favorisce il testing isolato e un codice più pulito.

### **Librerie Utilizzate**
| Libreria                           | Versione | Descrizione                            |
|------------------------------------|----------|----------------------------------------|
| **`dio`**                          | 5.7.0    | HTTP client per fetchare i prodotti.   |
| **`get_it`**                       | 8.1.4    | Per implementare la DI.                |
| **`flutter_bloc`**                 | 8.1.5    | Gestione stato scalabile.              |
| **`infinite_scroll_pagination`**   | 4.0.0    | Paginazione dei risultati di ricerca.  |
| **`url_launcher`**                 | 6.3.1    | Apertura link                          |


## 🏁 **Avvio del Progetto**

### Prerequisiti Flutter
- **Flutter SDK:** 3.22.3
- **Dart SDK:** 3.4.4

### Prerequisiti Android
- **Gradle version:** 8.5
- **AGP version:** 8.2.0
- **Java version:** 21.0.4
- **Android Studio version:** Ladybug Feature Drop | 2024.2.2

### Prerequisiti iOS
- **Xcode version:** 16.2
- **Cocoapods version:** 1.16.2

### Installazione
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

## 👨‍💻 Autore
Made with ❤️ by Luca Michael Pezzotta.

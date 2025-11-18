🇮🇹 **MassiveNSLookup - Versione Italiana**
==========================================

Semplice script per DNS inverso massivo su una lista di IP

**Autore:** Vincenzo Oriti  
**Versione:** 1.3
**Licenza:** GPL-3.0  

---

## 📌 Introduzione

Questo script esegue un reverse DNS (`nslookup`) su una lista di indirizzi IP  
e permette di salvare i risultati in formato **TXT** o **CSV**.

---

## 📥 1. Preparazione del File di Input

Crea un file chiamato **ipcheck.txt**  
Scrivi all’interno **un IP per riga**.  
Esempio:

```
8.8.8.8
1.1.1.1
93.184.216.34
```

---

## ▶️ 2. Come Usare lo Script

1. Assicurati di avere **ipcheck.txt** nella stessa cartella di `reverse_lookup.cmd`.

2. Avvia lo script con un **doppio clic** su `reverse_lookup.cmd`.

3. Lo script eseguirà per ogni IP:
   - un reverse DNS  

   - la stampa del risultato a schermo  
   
   - l’indicazione se l’IP è stato risolto o se c’è un errore DNS

4. Al termine, lo script chiederà dove salvare i risultati:
   ```
   Dove vuoi salvare i risultati?
   1 - TXT (checked.txt)
   2 - CSV (checked.csv)
   3 - Non salvare
   ```

5. Inserisci il numero corrispondente alla tua scelta.

---

## 📄 3. Risultati – Formato dei File

### Esempio output `checked.txt`

```
==== REVERSE DNS CHECK - 2025-07-25 12:50 ====
8.8.8.8 =                         dns.google
1.1.1.1 =                         one.one.one.one
93.184.216.34 = *** router0D76EC non è in grado di trovare 93.184.216.34: Non-existent domain
```

### Esempio output `checked.csv`

```csv
"IP","Risultato","Esito","Timestamp"
"8.8.8.8","dns.google","✅ Risolto","2025-07-25 12:50:00"
"1.1.1.1","one.one.one.one","✅ Risolto","2025-07-25 12:50:00"
"93.184.216.34","*** router0D76EC non è in grado di trovare 93.184.216.34: Non-existent domain","❌ Errore DNS","2025-07-25 12:50:00"
```

---

## 📝 4. Note

- I file `checked.txt` e `checked.csv` **non vengono sovrascritti**.  
  Ogni esecuzione aggiunge un’intestazione con data e ora.
- Il CSV include il campo **Timestamp** per ogni riga.
- Se un IP non ha record DNS, verrà riportato esattamente il messaggio di errore di `nslookup`.
- Lo script può essere eseguito tutte le volte che vuoi.

---

## 🖥️ 5. Requisiti

- Sistema operativo: **Windows (cmd)**
- Connessione Internet attiva
- File **ipcheck.txt** nella stessa directory dello script

---

## 📜 Licenza

Questo progetto è distribuito sotto licenza **GPL-3.0**.  
Consulta il testo completo su: https://www.gnu.org/licenses/gpl-3.0.html


🇬🇧 **MassiveNSLookup - English Version**
==========================================

Simple script for massive reverse NS Check on a IP list

**Author:** Vincenzo Oriti  
**Version:** 1.3
**Licence:** GPL-3.0  

📌 Introduction
---------------

This script performs a reverse DNS lookup (`nslookup`) on a list of IP addresses  
and allows you to save the results in **TXT** or **CSV** format.

* * *

📥 1. Preparing the Input File
------------------------------

Create a file named **ipcheck.txt**  
Write **one IP per line** inside it.  
Example:

```
8.8.8.8
1.1.1.1
93.184.216.34
```

* * *

▶️ 2. How to Use the Script
---------------------------

1. Make sure **ipcheck.txt** is in the same folder as `reverse_lookup_ENG.cmd`.
   
2. Start the script with a **double click** on `reverse_lookup_ENG.cmd`.
   
3. For each IP, the script will:
   - run a reverse DNS lookup
   - display the result on screen
   - indicate whether the IP was resolved successfully or if a DNS error occurred

4. At the end, the script will ask where you want to save the results:
   
   ```
   Where do you want to save the results?
   1 - TXT (checked.txt)
   2 - CSV (checked.csv)
   3 - Do not save
   ```
   
5. Enter the number corresponding to your choice.

* * *

📄 3. Output – File Format
--------------------------

### Example output `checked.txt`

```
==== REVERSE DNS CHECK - 2025-07-25 12:50 ====
8.8.8.8 =                         dns.google
1.1.1.1 =                         one.one.one.one
93.184.216.34 = *** router0D76EC is not able to find 93.184.216.34: Non-existent domain
```

### Example output `checked.csv`

```csv
"IP","Result","Status","Timestamp"
"8.8.8.8","dns.google","✅ Resolved","2025-07-25 12:50:00"
"1.1.1.1","one.one.one.one","✅ Resolved","2025-07-25 12:50:00"
"93.184.216.34","*** router0D76EC is not able to find 93.184.216.34: Non-existent domain","❌ DNS Error","2025-07-25 12:50:00"
```

* * *

📝 4. Notes
-----------

- The `checked.txt` and `checked.csv` files **are not overwritten**.  
   Each run appends a header with the current date and time.
- The CSV file includes a **Timestamp** field for each row.
- If an IP has no DNS record, the exact `nslookup` error message will be saved.
- You can run the script as many times as you want.

* * *

🖥️ 5. Requirements
-------------------

- Operating system: **Windows (cmd)**
- Active Internet connection
- File **ipcheck.txt** in the same directory as the script


* * *

📜 License
----------

This project is released under the **GPL-3.0** license.  
Full text available at: [https://www.gnu.org/licenses/gpl-3.0.html](https://www.gnu.org/licenses/gpl-3.0.html)

* * *

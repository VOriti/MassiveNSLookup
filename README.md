# MassiveNSLookup
Simple script for massive reverse NS Check on a IP list

**Autore:** Vincenzo Oriti  
**Versione:** 1.2
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


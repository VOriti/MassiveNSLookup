**MassiveNSLookup**
==========================================

A simple script for performing massive reverse DNS lookups on a list of IP addresses.

**Author:** Vincenzo Oriti
**Version:** 2.1
**License:** GPL-3.0

---

## 📌 Introduction

This script performs a reverse DNS lookup (`nslookup`) on a list of IP addresses and allows you to save the results in either **TXT** or **CSV** format.

The script's user interface will automatically switch between **English** and **Italian** based on your system's language settings.

---

## 📥 1. Preparing the Input File

1.  Create a file named **ipcheck.txt**.
2.  Add one IP address per line.

**Example `ipcheck.txt`:**
```
8.8.8.8
1.1.1.1
93.184.216.34
```

---

## ▶️ 2. How to Use the Script

1.  Ensure **ipcheck.txt** is in the same directory as `reverse_lookup.cmd`.
2.  Run the script by double-clicking `reverse_lookup.cmd`.

The script will then:
- Perform a reverse DNS lookup for each IP.
- Display the results on the screen.
- At the end, prompt you to save the results.

**Saving Options:**
```
Where do you want to save the results?
1 - TXT (checked.txt)
2 - CSV (checked.csv)
3 - Do not save
```

---

## 📄 3. Output File Formats

### `checked.txt` (TXT Format)
```
==== REVERSE DNS CHECK - 2025-07-25 12:50 ====
8.8.8.8 =                         dns.google
1.1.1.1 =                         one.one.one.one
93.184.216.34 = *** router0D76EC is not able to find 93.184.216.34: Non-existent domain
```

### `checked.csv` (CSV Format)
```csv
"IP","Result","Status","Timestamp"
"8.8.8.8","dns.google","✅ Resolved","2025-07-25 12:50:00"
"1.1.1.1","one.one.one.one","✅ Resolved","2025-07-25 12:50:00"
"93.184.216.34","*** router0D76EC is not able to find 93.184.216.34: Non-existent domain","❌ DNS Error","2025-07-25 12:50:00"
```

---

## 📝 4. Important Notes

-   **Files are not overwritten.** Each time the script is run, it appends the new results.
-   The CSV output includes a **Timestamp** for each entry.
-   If an IP address cannot be resolved, the exact error message from `nslookup` will be recorded.

---

## 🖥️ 5. Requirements

-   **Operating System:** Windows
-   An active internet connection.
-   The **ipcheck.txt** file must be in the same directory as the script.
-   **Note:** This script currently supports IPv4 addresses only.

---

## 📜 License

This project is distributed under the **GPL-3.0** license. For more details, see [https://www.gnu.org/licenses/gpl-3.0.html](https://www.gnu.org/licenses/gpl-3.0.html).

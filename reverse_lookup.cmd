@echo off
setlocal EnableDelayedExpansion

:: =============================================================================
:: MassiveNSLookup - Refactored Version
:: Author: Vincenzo Oriti
:: Version: 2.0
::
:: This script performs a reverse DNS lookup on a list of IP addresses
:: and saves the results in TXT or CSV format.
:: It auto-detects the system language (EN/IT) for UI messages.
:: =============================================================================

:: -----------------------------------------------------------------------------
:: Configuration
:: -----------------------------------------------------------------------------
set "input_file=ipcheck.txt"
set "output_txt=checked.txt"
set "output_csv=checked.csv"
set "temp_file=_temp_output.txt"
set "temp_csv=_temp_output.csv"

:: -----------------------------------------------------------------------------
:: Language Detection & UI Strings
:: -----------------------------------------------------------------------------
:: Default to English
set "lang=EN"
set "ERROR_FILE_NOT_FOUND=ERROR: File ""%input_file%"" does not exist."
set "SAVE_PROMPT=Where do you want to save the results?"
set "CHOICE_PROMPT=Choice"
set "SAVED_TO=Saved to"
set "NO_SAVE=No output was saved."
set "DNS_ERROR_NOT_FOUND=DNS ERROR not detected"
set "STATUS_RESOLVED=✅ Resolved"
set "STATUS_ERROR=❌ DNS Error"

:: Check for Italian
for /f "tokens=2,*" %%a in ('reg query "HKCU\Control Panel\International" /v LocaleName 2^>nul') do (
    if /i "%%b"=="it-IT" set "lang=IT"
)

if "%lang%"=="IT" (
    set "ERROR_FILE_NOT_FOUND=ERRORE: Il file ""%input_file%"" non esiste."
    set "SAVE_PROMPT=Dove vuoi salvare i risultati?"
    set "CHOICE_PROMPT=Scelta"
    set "SAVED_TO=Salvato in"
    set "NO_SAVE=Nessun salvataggio effettuato."
    set "DNS_ERROR_NOT_FOUND=ERRORE DNS non rilevato"
    set "STATUS_RESOLVED=✅ Risolto"
    set "STATUS_ERROR=❌ Errore DNS"
)

:: -----------------------------------------------------------------------------
:: Main Script Logic
:: -----------------------------------------------------------------------------

:: Check if input file exists
if not exist "%input_file%" (
    echo !ERROR_FILE_NOT_FOUND!
    pause
    exit /b
)

:: Prepare timestamp and temporary files
for /f "tokens=1-3 delims=/ " %%a in ("%date%") do set "today=%%c-%%b-%%a"
for /f "tokens=1-2 delims=:." %%a in ("%time%") do set "now=%%a:%%b"
set "timestamp=%today% %now%"

echo ==== REVERSE DNS CHECK - %timestamp% ==== > "%temp_file%"
echo "IP","Result","Status","Timestamp" > "%temp_csv%"

:: Process each IP from the input file
echo Processing IPs...
for /f "tokens=*" %%i in (%input_file%) do (
    call :resolve_ip %%i
)

:: Display results from the temporary file
type "%temp_file%"

:: Prompt user for saving options
echo.
echo !SAVE_PROMPT!
echo 1 - TXT (%output_txt%)
echo 2 - CSV (%output_csv%)
echo 3 - Do not save
set /p scelta=!CHOICE_PROMPT! [1/2/3]:

:: Save files based on user's choice
if "%scelta%"=="1" (
    type "%temp_file%" >> "%output_txt%"
    echo !SAVED_TO! %output_txt%
) else if "%scelta%"=="2" (
    if not exist "%output_csv%" (
        type "%temp_csv%" >> "%output_csv%"
    ) else (
        more +1 "%temp_csv%" >> "%output_csv%"
    )
    echo !SAVED_TO! %output_csv%
) else (
    echo !NO_SAVE!
)

:: Cleanup temporary files
del "%temp_file%" >nul 2>&1
del "%temp_csv%" >nul 2>&1

pause
exit /b

:: -----------------------------------------------------------------------------
:: Subroutine: resolve_ip
::
:: Resolves a single IP address using nslookup and parses the output.
:: %1 - The IP address to resolve.
:: -----------------------------------------------------------------------------
:resolve_ip
setlocal EnableDelayedExpansion
set "ip=%1"
set "hostname="
set "dns_error="

:: Execute nslookup and parse its output
for /f "delims=" %%L in ('nslookup %ip% 2^>^&1') do (
    set "line=%%L"
    :: Look for "Name:" or "Nome:" to find the hostname
    if not defined hostname (
        if /i "!line:~0,5!"=="Name:" set "hostname=!line:~5!"
        if /i "!line:~0,5!"=="Nome:" set "hostname=!line:~5!"
    )
    :: Capture error messages
    echo !line! | findstr /C:"***" >nul
    if !errorlevel! == 0 set "dns_error=!line!"
)

:: Trim leading space from hostname if found
if defined hostname set "hostname=!hostname:~1!"

:: Write to temporary files based on whether a hostname was found
if defined hostname (
    echo %ip% =                         !hostname! >> "%temp_file%"
    echo "%ip%","!hostname!","!STATUS_RESOLVED!","%timestamp%" >> "%temp_csv%"
) else (
    if not defined dns_error set "dns_error=!DNS_ERROR_NOT_FOUND!"
    echo %ip% = !dns_error! >> "%temp_file%"
    echo "%ip%","!dns_error!","!STATUS_ERROR!","%timestamp%" >> "%temp_csv%"
)

endlocal
exit /b

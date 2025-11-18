@echo off
setlocal EnableDelayedExpansion

set "input_file=ipcheck.txt"
set "output_txt=checked.txt"
set "output_csv=checked.csv"
set "temp_file=_temp_output.txt"
set "temp_csv=_temp_output.csv"

if not exist "%input_file%" (
    echo ERROR: File "%input_file%" does not exist.
    pause
    exit /b
)

for /f "tokens=1-3 delims=/ " %%a in ("%date%") do set "today=%%c-%%b-%%a"
for /f "tokens=1-2 delims=:." %%a in ("%time%") do set "now=%%a:%%b"
set "timestamp=%today% %now%"

echo ==== REVERSE DNS CHECK - %timestamp% ==== > "%temp_file%"
echo IP,Hostname,Timestamp,MotivoErrore > "%temp_csv%"

for /f "tokens=*" %%i in (%input_file%) do (
    call :resolve_ip %%i
)

type "%temp_file%"

echo.
echo Where do you want to save the results?
echo 1 - TXT (%output_txt%)
echo 2 - CSV (%output_csv%)
echo 3 - Do not save
set /p scelta=Choice [1/2/3]: 

if "%scelta%"=="1" (
    echo ==== REVERSE DNS CHECK - %timestamp% ==== >> "%output_txt%"
    type "%temp_file%" >> "%output_txt%"
    echo Saved to %output_txt%
) else if "%scelta%"=="2" (
    more +1 "%temp_csv%" >> "%output_csv%"
    echo Saved to %output_csv%
) else (
    echo No output was saved.
)

del "%temp_file%" >nul 2>&1
del "%temp_csv%" >nul 2>&1

pause
exit /b

:resolve_ip
setlocal EnableDelayedExpansion
set "ip=%1"
set "hostname="
set "dns_error="

for /f "delims=" %%L in ('nslookup %ip% 2^>^&1') do (
    set "line=%%L"
    if not defined hostname (
        if /i "!line:~0,5!"=="Nome:" set "hostname=!line:~5!"
        if /i "!line:~0,5!"=="Name:" set "hostname=!line:~5!"
    )
    echo !line! | findstr /C:"***" >nul
    if !errorlevel! == 0 set "dns_error=!line!"
)

if defined hostname set "hostname=!hostname:~1!"

if defined hostname (
    echo %ip% =                         !hostname! >> "%temp_file%"
    echo %ip%,!hostname!,%timestamp%, >> "%temp_csv%"
) else (
    if not defined dns_error set "dns_error=ERROR DNS not found"
    echo %ip% = !dns_error! >> "%temp_file%"
    echo %ip%,NO NAME FOUND,%timestamp%,!dns_error! >> "%temp_csv%"
)

endlocal
exit /b

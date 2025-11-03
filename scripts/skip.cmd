@echo off
:: skip.cmd - legt einen lokalen Admin an und erzwingt PW-Änderung beim 1. Login.
:: In OOBE via Shift+F10 starten (Netzwerk vorausgesetzt).

setlocal ENABLEDELAYEDEXPANSION
set "USER=bbguser"


echo [*] Admin-Gruppennamen ermitteln...
for /f %%A in ('powershell -NoProfile -Command "$g=(New-Object System.Security.Principal.SecurityIdentifier(\"S-1-5-32-544\")).Translate([System.Security.Principal.NTAccount]).Value.Split('\\')[-1]; Write-Output $g"') do set "ADM=%%A"
	
if "%ADM%"=="" (
    echo. [!] Konnte Admin-Gruppe nicht ermitteln.
    exit /b 1
)
echo %ADM%
echo [*] Benutzername ist "%USER%".
echo %ADM%

echo [*] Benutzer wird angelegt...
net user "%USER%" "%PASS%" /add
if errorlevel 1 ( echo [!] net user fehlgeschlagen & exit /b 1 )

echo [*] Gefundene Admin-Gruppe "%ADM%"

set /p PASS="[*] Temporäres Passwort eingeben: "

if "%PASS%"=="" (@echo off
:: skip.cmd - legt einen lokalen Admin an und erzwingt PW-Änderung beim 1. Login.
:: In OOBE via Shift+F10 starten (Netzwerk vorausgesetzt).

setlocal ENABLEDELAYEDEXPANSION
:: set "USER=bbguser"
set /P USER="[*] Bitte geben Sie einen Benutzernamen ein: "

set /p PASS="[*] Passwort eingeben: "

if "%PASS%"=="" (
  echo [!] Kein Passwort eingegeben. Abbruch.
  exit /b 1
)


echo [*] Admin-Gruppennamen ermitteln...
for /f %%A in ('powershell -NoProfile -Command "$g=(New-Object System.Security.Principal.SecurityIdentifier(\"S-1-5-32-544\")).Translate([System.Security.Principal.NTAccount]).Value.Split('\\')[-1]; Write-Output $g"') do set "ADM=%%A"
	
if "%ADM%"=="" (
    echo. [!] Konnte Admin-Gruppe nicht ermitteln.
    exit /b 1
)
echo %ADM%
echo [*] Benutzername ist "%USER%".
echo %ADM%

echo [*] Gefundene Admin-Gruppe "%ADM%"



echo [*] Benutzer wird angelegt...
net user "%USER%" "%PASS%" /add
if errorlevel 1 ( echo [!] net user fehlgeschlagen & exit /b 1 )

net localgroup "%ADM%" "%USER%" /add
if errorlevel 1 ( echo [!] Zur Admin-Gruppe hinzufuegen fehlgeschlagen & exit /b 1 )

:: echo [*] Passwortwechsel beim ersten Login wird erzwungen...
:: net user "%USER%" /logonpasswordchg:yes

::echo [OK] Benutzer "%USER%" angelegt. Bitte beim ersten Login Passwort aendern.
echo [OK] Benutzer "%USER%" angelegt.

echo [i] Dieses Fenster kannst du schließen oder eine Taste druecken.
pause >nul
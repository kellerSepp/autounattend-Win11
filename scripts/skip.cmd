@echo off
:: skip.cmd - legt einen lokalen Admin an und erzwingt PW-Änderung beim 1. Login.
:: In OOBE via Shift+F10 starten (Netzwerk vorausgesetzt).

setlocal ENABLEDELAYEDEXPANSION
set "USER=bbguser"

echo [*] Benutzername ist "%USER%".
set /p PASS="[*] Temporäres Passwort eingeben: "

if "%PASS%"=="" (
  echo [!] Kein Passwort eingegeben. Abbruch.
  exit /b 1
)

echo [*] Benutzer wird angelegt...
net user "%USER%" "%PASS%" /add
if errorlevel 1 ( echo [!] net user fehlgeschlagen & exit /b 1 )

net localgroup administrators "%USER%" /add
if errorlevel 1 ( echo [!] Zur Admin-Gruppe hinzufügen fehlgeschlagen & exit /b 1 )

echo [*] Passwortwechsel beim ersten Login wird erzwungen...
net user "%USER%" /logonpasswordchg:yes

echo [OK] Benutzer "%USER%" angelegt. Bitte beim ersten Login Passwort aendern.
echo [i] Dieses Fenster kannst du schließen oder eine Taste drücken.
pause >nul

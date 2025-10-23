# oobe_setup.ps1 - Lokalen Admin anlegen, PW-Change erzwingen
param(
  [string]$UserName = "localuser"
)

Write-Host "[*] Benutzername: $UserName"
$pass1 = Read-Host -AsSecureString "Temporäres Passwort eingeben"
$pass2 = Read-Host -AsSecureString "Temporäres Passwort wiederholen"

if ( [Runtime.InteropServices.Marshal]::PtrToStringUni([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass1)) -ne
     [Runtime.InteropServices.Marshal]::PtrToStringUni([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass2)) ) {
  Write-Host "[!] Passwörter stimmen nicht überein." -ForegroundColor Red
  exit 1
}

# Benutzer anlegen
$plain = [Runtime.InteropServices.Marshal]::PtrToStringUni([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass1))
& cmd /c "net user $UserName $plain /add"  | Out-Null
& cmd /c "net localgroup administrators $UserName /add" | Out-Null
& cmd /c "net user $UserName /logonpasswordchg:yes" | Out-Null

Write-Host "[OK] Benutzer '$UserName' angelegt. PW-Änderung beim ersten Login erforderlich."


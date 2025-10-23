# BBG OOBE Tools

Schnelle Hilfen für Windows-OOBE (Shift+F10):

## Download per `curl` (CMD)
```cmd
curl -L https://raw.githubusercontent.com/<DEIN-USER>/oobe/main/scripts/skip.cmd -o C:\skip.cmd
certutil -hashfile C:\skip.cmd SHA256
C:\skip.cmd

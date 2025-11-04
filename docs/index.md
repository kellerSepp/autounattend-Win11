# Local OOBE Tools

Schnelle Hilfen für Windows-OOBE (**Shift+F10**).

---

## 📥 Herunterladen & Ausführen (CMD)

In der OOBE-Maske **Shift+F10** drücken → Eingabeaufforderung öffnet sich.

Dann ausführen:

\`\`\`cmd
curl -L https://raw.githubusercontent.com/kellersepp/autounattend-Win11/main/scripts/skip.cmd -o C:\skip.cmd
certutil -hashfile C:\skip.cmd SHA256
C:\skip.cmd
\`\`\`

Die SHA256-Prüfsumme wird angezeigt.  
Vergleiche sie mit der Datei:

`checksums/SHA256SUMS.txt`

Erst danach das Script starten. ✅

---

## ❓ Was macht das Script?

Das Script startet einen kleinen Assistenten:

1. Du gibst einen **Benutzernamen** für ein lokales Konto ein  
2. Dann ein **Passwort**  
3. Das Konto wird **erstellt**  
4. Es wird automatisch der **lokalen Administrator-Gruppe** hinzugefügt  
5. Du kannst danach direkt zum Windows Login wechseln

> **Kein Neustart zwingend nötig.**  
> Wenn OOBE hängen bleibt:  
> `shutdown /l /f` → meldet dich ab und zeigt den Login-Bildschirm.

---

## 🔒 Sicherheitshinweis

- Verwende das Admin-Konto **nicht** für den täglichen Betrieb  
- Lege nach dem ersten Login am besten **ein Standard-Benutzerkonto** an
- Adminrechte nur nutzen, wenn nötig (Sicherheit + Best Practice)

Beispiel:  
Ein Konto zum Arbeiten, eins für Admin-Aufgaben.

---

## 👍 Warum dieser Weg?

- Sehr schnelle Lösung, wenn jemand im OOBE steckt und **kein lokales Konto anlegen kann**
- Keine Registrierung, kein Tool-Download, keine Installation
- theoretisch auch lokal ausführbar, wenn ihr euch die entsprechenden commands aus dem Skript kopiert.

---

## 🧾 Für Azubis & Kolleg:innen

Das ist ein **Notfall-Tool** für den Fall, dass jemand **kein** Microsoft-Konto anlegen will.

---

**Viel Erfolg beim Einrichten! 🚀**

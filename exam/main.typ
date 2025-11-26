= Prüfungsanforderungen

- Mindestens 2 Entities, die in Relation zueinander stehen (ManyToOne, ManyToMany)
- Mindestens ein Controller sollte Integration Tests enthalten
- Entities, Repositories, Services, Controller (falls Spring)
- CRUD Operationen sollten für alle Entities möglich sein
- Weitere Funktionen wären nett
- Einfaches Frontend welches alle REST API Endpunkte abdeckt
- Es sollte intuitiv benutzbar sein
- Daten vom Backend sollten persistent in einer Datenbank gespeichert werden
- Datenbank sollte in einem Container laufen
- Backend sollte mit einem Build Container gebaut werden und in einem Container laufen
- Frontend sollte in einem Container laufen

= Beispielprojekte
1. *Wetterhistorie*
Es werden Daten von einer öffentlichen Wetter API über einen gewissen Zeitraum gesammelt. 
Diese Daten werden über Spring gesammelt und in einer Datenbank gespeichert. 
Die Spring Anwendung gibt dann Zugang auf diese gesammelten Daten mit Möglichkeiten diese zu sortieren nach Datum, Minimal/Maximal Temperatur, Ort usw. zu sortieren und Abzufragen
Folgende Entities würden dort zum Beispiel vorkommen:
- Ort
- Wettereintrag mit Datum, Temperatur, Luftfeuchtigkeit und Referenz auf Ort

2. *Kleine Finanzapp*
- User können Konten haben. 
- Diese Konton können Transaktionen haben die vom Gesamtwert abziehen oder hinzufügen
- Das Frontend soll diese Konten darstellen mit allen Transaktionen und einer Historie
- Neue Transaktionen sollen erstellt werden können und alte bearbeitet werden können
- Transaktionen können dabei folgende Daten enthalten:
  - Wert
  - Sender
  - Empfänger
  - Datum
- Sender und Empfänger können dabei IBAN, Bankleitzahl, Name, usw. besitzen

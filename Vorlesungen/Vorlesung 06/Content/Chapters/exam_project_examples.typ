#import "../../Template/definitions.typ": *
#import "../../Components/chapter_titile_slide.typ": chapter-title-slide

#chapter-title-slide(
  section-name: [Projektbeispiele],
  title-text: "Projektbeispiele"
)

#slide[
  = Einfache Finanzapp
  #set align(horizon)
  *Backend:*
  - Entities: Konto, Transaktionen, Benutzer
  - Benutzer
    - Konto 1
      - Transaktionen 1
      - Transaktionen 2
      - ...
    - Konto 2
      - Transaktionen 1
      - Transaktionen 2
      - ...
    - ...
  *Frontend:*
  - CRUD für alle Entities
  - Übersicht über Finanzen
]

#slide[
  = Notensoftware
  #set align(horizon)
  *Backend:*
  - Entities: Student, Modul
  - Student
    - Modul 1
    - Modul 2
    - ...
  - Berechnung von Notendurchschnitten
  - ECTS Berechnung
  *Frontend:*
  - CRUD für alle Entities
  - Übersicht über Noten und Durchschnitte
]

#slide[
  = Einbindung von externen APIs
  #set align(horizon)
  - Flugdaten sammeln mit der Lufthansa API mit Suche nach unterschiedlichen Parametern in Spring/Frontend
  - Wetterdaten sammeln mit Suche nach unterschiedlichen Parametern in Spring/Frontend
  - DB API
  ...
]

#import "../../Template/definitions.typ": *

#slide[
  #toolbox.register-section([Kontext])
  = Kontext einer Spring Anwendung in Fullstack
  #set align(horizon)
  - Spring existiert im Backend
  - Frontend stellt Anfragen an das Spring-Backend
  - Spring verarbeitet Anfragen vom Frontend
  - Gibt bei Bedarf Daten wieder an das Frontend zurück
]

#slide[
  = Aufbau der Fullstack Anwendung
  #set align(horizon + center)
  #figure(
    diagram(
      node-stroke: 1pt,
      node-inset: 10pt,
      node-shape: rect,
      node(
        (0, 0),
        name: <client>
      )[
        #image("../../Images/fa6-solid--computer.svg", fit: "contain", width: 50pt)
        Client bzw. Frontend
      ],
      node(
        (2, 0),
        name: <server>
      )[
        #image("../../Images/streamline-cyber--server.svg", fit: "contain", width: 50pt)
        Server bzw. Backend
      ],
      node(
        (4, 0),
        name: <database>
      )[
        #image("../../Images/streamline-plump--database-solid.svg", fit: "contain", width: 50pt)
        Database
      ],
      edge(<client>, "-|>", <server>, bend: 60deg)[
        Stellt Anfrage
      ],
      edge(<server>, "-|>", <client>, bend: 60deg)[
        Gibt erhaltene Daten zurück
      ],
      edge(<server>, "-|>", <database>, bend: 60deg)[
        Erstellen \
        Lesen \
        Updaten \
        Löschen von Daten
      ],
      edge(<database>, "-|>", <server>, bend: 60deg)[
        Daten aus Datenbank erhalten
      ],
    )
  )
]

#slide[
  = Beispiel: Finanzapp
  #set align(horizon)
  - Eine Finanz-App erlaubt das Aufteilen von Geld auf Budgets
  - Der Nutzer möchte Geld auf ein Budget verschieben
  - In der App werden das Zielbudget und der Wert festgelegt
  - Nach Bestätigung der Eingaben wird eine Anfrage an das Backend geschickt
  - Die Anfrage könnte folgende Informationen enthalten:
    - ID vom Konto
    - ID vom Budget
    - Wert des Übertrags
]

#slide[
  = Beispiel: Finanzapp
  #set align(horizon)
  - Im Backend werden mit den IDs Konto und Budget gesucht
  - Es wird überprüft, ob das Konto genug Mittel hat, um den gewünschten Betrag zu verschieben
  - Gutschreiben des Wertes, wenn das Konto genug Geld hat
  - Abzug des Wertes vom Ursprungskonto
  - Neue Werte von Konto und Budget werden an das Frontend geschickt
  - Neue Werte werden in der UI gerendert
]

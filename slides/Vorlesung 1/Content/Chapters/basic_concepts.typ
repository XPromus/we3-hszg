#import "../../Template/definitions.typ": *
#import "../../Components/dto-mapper-diagram.typ": dto-mapper-diagram

#slide[
  #toolbox.register-section[Grundbegriffe]
  = Grundbegriffe
  #set align(horizon)
  *Client Side* \
  - Alles, was mit dem der Nutzer interagiert
  - Gute UI und UX werden benötigt für einfache Interaktion
  *Server Side* \
  - Alles, was auf dem Server passiert
  - Funktionen werden dem Frontend bereitgestellt
  *API* \
  - Das Frontend und Backend kommunizieren über APIs
  - Erlauben es, Anwendungen in Schichten zu unterteilen
  - Können der Middleware zugeordnet werden
]

#slide[
  = Grundbegriffe
  #set align(horizon)
  *REST*
  - Architekturstil für Kommunikation in Websystemen
  - Separation von Server und Client
  - Komplett stateless: Server und Client brauchen keine Kontextinformationen über den jeweils anderen
  - Kommunikation findet über Requests und Responses statt
  - Alle CRUD-Operationen werden direkt auf HTTP-Methoden gemapped
]

#slide[
  = Grundbegriffe
  #set align(horizon)
  *MVC* - Model-View-Controller
  - Design-Pattern zur Implementierung von User-Interfaces, Daten und Kontroll-Logik
  - Fokus auf Separierung von Business-Logik und visueller Darstellung
  Komponenten:
  - *Model*: Verwaltet Daten und Business-Logik
  - *View*: Übernimmt Layout und Darstellung
  - *Controller*: Leitet Befehle zum Model und View weiter
]

#slide[
  = Grundbegriffe
  #v(10pt)
  *DTO* - Data-Transfer-Object
  - Bündelung von Datenfeldern in einem Objekt
  - Einfachere Serialisierung und weniger Daten die verschickt werden müssen
  #set align(horizon + center)
  #dto-mapper-diagram
]

#slide[
  = Grundbegriffe
  #set align(horizon)
  *CRUD*
  - Vier Grundoperationen, um mit persistenten Daten zu interagieren
  - *Create*: Neue Dateneinträge werden gespeichert.
  - *Read*: Existierende Daten werden ausgelesen
  - *Update*: Existierende Daten werden aktualisiert
  - *Delete*: Daten werden gelöscht
  *ORM* - Object-Relational-Mapping
  - Technik, um relationale Datenbank in Objekte einer Programmiersprache umzuwandeln
  - Erstellung einer virtuellen Objekt Datenbank
  - ORM Frameworks erlauben Durchführen von CRUD-Operationen
  - SQL-Befehle müssen nicht per Hand geschrieben werden
]

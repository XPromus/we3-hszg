#import "../../Template/definitions.typ": *

#slide[
  = Grundbegriffe
  #set align(horizon)
  *Client Side* \
  - Alles mit dem der Nutzer interagiert
  - Gute UI und UX wird benötigt für einfach Interaktion
  *Server Side* \
  - Alles was auf dem Server passiert
  - Funktionen werden dem Frontend bereitgestellt
  *API* \
  - Das Frontend und Backend kommunizieren über APIs
  - Erlauben Anwendungen in Schichten zu unterteilen
  - Können der Middleware zugeordnet werden
]

#slide[
  = Grundbegriffe
  #set align(horizon)
  *REST*
  - Architektur Stil für Kommunikation in Web Systemen
  - Separation von Server und Client
  - Komplett Stateless: Server und Client brauchen keine Kontext Informationen über den jeweils anderen
  - Kommunikation findet über Requests und Responses statt
  - Alle CRUD Operationen werden direkt auf HTTP Methoden gemapped
]

#slide[
  = Grundbegriffe
  #set align(horizon)
  *MVC* - Model-View-Controller
  - Design Pattern zur Implementation von User Interfaces, Daten und Kontroll Logik
  - Fokus auf Separierung von Business Logik und visueller Darstellung
  Komponenten:
  - *Model*: Verwaltet Daten und Business Logik
  - *View*: Übernimmt Layout und Darstellung
  - *Controller*: Leitet Befehle zum Model und View weiter
]

#slide[
  = Grundbegriffe
  #set align(horizon)
  *CRUD*
  - Vier Grundoperationen um mit persistenten Daten zu interagieren
  - *Create*: Neute Daten Einträge werden gespeichert.
  - *Read*: Existierende Daten werden ausgelesen
  - *Update*: Existierende Daten werden aktualisiert
  - *Delete*: Daten werden gelöscht
  *ORM* - Object-Relational-Mapping
  - Technik um relationale Datenbank in Objekte einer Programmiersprache umzuwandeln
  - Erstellung einer virtuellen Objekt Datenbank
  - ORM Frameworks erlauben durchführen von CRUD Operationen
  - SQL-Befehle müssen nicht per Hand geschrieben werden
]

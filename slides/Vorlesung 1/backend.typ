#import "definitions.typ": *

#slide[
  = Backend
  #set align(horizon)
  - Definiert Datenstruktur mit Tabellen und Entities
  - Bevölkert Datenbank mit Daten und liest Daten aus
  - Enthält Business Logik der Anwendung
  - Enthält REST Endpunkte mit Mappings für Http Funktionen
  #v(50pt)
  In dieser Vorlesung kommt Spring mit Kotlin zum Einsatz
  #image("Diagrams/icons/devicon--spring.svg")
]

#slide[
  = Backend
  #set align(horizon + center)
  #toolbox.side-by-side[
    #image("Diagrams/icons/devicon--spring.svg")
  ][
    #image("Diagrams/icons/MIcronautLogo_Horizontal.svg", fit: "contain")
    #v(50pt)
    #image("Diagrams/icons/logos--quarkus.svg", fit: "contain")
  ]
]

#slide[
  = Backend - Bestandteile
  #set align(center)
  #v(75pt)
  #toolbox.side-by-side[
    *Repositories* \
    #v(25pt)
    Lesen der und Schreiben auf die Datenbank
  ][
    *Services* \
    _mit DTOs und Mappern_
    #v(25pt)
    Verarbeitung von Daten und allgemeine Logik der Anwendung
  ][
    *Controller* \
    #v(25pt)
    Erstellung der API Endpunkte über Mappings
  ]
]

#slide[
  = Backend - Gradle
  #set align(horizon)
]

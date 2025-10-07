#import "../../Template/definitions.typ": *

#slide[
  = Backend
  #set align(horizon)
  - Definiert Datenstruktur mit Tabellen und Entities
  - Bevölkert Datenbank mit Daten und liest Daten aus
  - Enthält Business Logik der Anwendung
  - Enthält REST Endpunkte mit Mappings für Http Funktionen
  #v(50pt)
  In dieser Vorlesung kommt Spring mit Kotlin zum Einsatz
  #image("../../Images/Icons/devicon--spring.svg")
]

#slide[
  = Backend
  #set align(horizon + center)
  #toolbox.side-by-side[
    #image("../../Images/Icons/devicon--spring.svg")
  ][
    #image("../../Images/Icons/MIcronautLogo_Horizontal.svg", fit: "contain")
    #v(50pt)
    #image("../../Images/Icons/logos--quarkus.svg", fit: "contain")
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
  - Automatisierung von Building, Testing und Deployment
  - Verwaltet Abhängigkeiten
  - Reproduzierbare Builds
  - Erweiterbar durch Plugins
  #v(1cm)
  - Build Vorgang wird in der `build.gradle(.kts)` beschrieben
]

#slide[
  = Backend - Gradle Projekt Struktur
  #set align(horizon + center)
  ```markdown
    project
    ├── gradle                          
    ├── gradlew                             
    ├── gradlew.bat                         
    ├── settings.gradle(.kts)           
    ├── subproject-a
    │   ├── build.gradle(.kts)              
    │   └── src/                        
    └── subproject-b
        ├── build.gradle(.kts)              
        └── src/                        
  ```
]

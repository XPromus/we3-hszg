#import "../../Template/definitions.typ": *

#slide[
  =
  #toolbox.register-section[Backend]
  #set align(horizon + center)
  #image("../../Diagrams/fullstack_overview_backend.svg")
]

#slide[
  = Backend
  #set align(horizon)
  - Definiert Datenstruktur mit Tabellen und Entities (ORM)
  - Bevölkert Datenbank mit Daten und liest Daten aus (CRUD)
  - Enthält Business-Logik der Anwendung
  - Enthält REST-Endpunkte mit Mappings für HTTP-Funktionen
]

#slide[
  = Bestandteile
  #set align(center)
  #v(75pt)
  #toolbox.side-by-side[
    *Repositories* \
    #v(25pt)
    Lesen und Schreiben auf die Datenbank
  ][
    *Services* \
    _mit DTOs und Mappern_
    #v(25pt)
    Verarbeitung von Daten und allgemeine Logik der Anwendung
  ][
    *Controller* \
    #v(25pt)
    Erstellung der API-Endpunkte über Mappings
  ]
]

#slide[
  =
  #set align(horizon + center)
  #image("../../Images/Icons/logos--spring.svg", fit: "contain")
  #image("../../Images/spring_boot_logo.png", fit: "contain", width: 80%)
]

#slide[
  = Spring & Springboot
  #set align(horizon)
  *Spring*
  - Stellt Infrastruktur bereit zur Erstellung von Enterprise-Anwendungen
  - Kern ist dabei Dependency Injection mit dem IoC-Container
  - Weitere Funktionalitäten können über Module hinzugefügt werden
  - Durch Spring soll Entwicklungszeit stark verkürzt werden
  *Springboot*
  - Erweiterung und Abstraktion des Spring-Frameworks
  - Erstellung von Spring-Anwendungen mit minimaler Konfiguration
  - _Starter Dependencies_ ermöglichen schnelle Erstellung von Anwendungen
]

#slide[
  = Alternativen
  #set align(horizon + center)
  #grid(
    rows: (1fr, 1fr, 1fr)
  )[
    #image("../../Images/Icons/devicon--spring.svg")
  ][
    #image("../../Images/Icons/MIcronautLogo_Horizontal.svg", fit: "contain")
  ][
    #image("../../Images/Icons/logos--quarkus.svg", fit: "contain")
  ]
]

#slide[
  = Gradle
  #image("../../Images/Icons/devicon--gradle-wordmark.svg", fit: "contain", width: 150pt)
  #set align(horizon)
  - Automatisierung von Building, Testing und Deployment
  - Verwaltet Abhängigkeiten
  - Reproduzierbare Builds
  - Erweiterbar durch Plugins
  #v(1cm)
  - Build Vorgang wird in der `build.gradle(.kts)` beschrieben
]

#slide[
  = Gradle Projekt Struktur
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

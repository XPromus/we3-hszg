#import "@preview/grape-suite:4.0.0": exercise
#import exercise: hint, project, solution, subtask, task

#let task = task.with(numbering-format: (..n) => numbering("1", ..n))
#let subtask = subtask.with(markers: ("a)", "1)"))

#show: project.with(
  no: 1,
  type: "Seminar",
  suffix-title: "Vorbereitung der Entwicklungsumgebung",

  university: [Hochschule Zittau/Görlitz],
  //faculty: [Fakultät Elektrotechnik & Informatik],
  seminar: [Seminar: Web Engineering 3],
  
  task-type: [Aufgabe],

  text-font: "libertinus serif",
  math-font: "New Computer Modern Math",
  
  date: datetime(year: 2026, month: 10, day: 9),
)

#task(
  // rubric: ((1, lorem(20)), (3, lorem(23))),
  [Kotlin Projekt erstellen],
  none,
  [
    #subtask()[
      Installiere IntelliJ Ultimate und ein JDK
    ]

    #subtask()[
      Erstelle ein Spring Boot Projekt mit dem gelieferten Generator und folgenden Parametern
      - Sprache: Kotlin
      - Type: Gradle - Kotlin
      - Configuration: YAML
      - Dependencies
        - Spring Web
        - Spring Data JPA
        - H2 Database
    ]

    #subtask()[
      Führe das Projekt einmal aus und überprüfe ob es funktioniert
    ]
  ]
)

#task(
  [Docker installieren und Funktionalität testen],
  none,
  [
    #subtask()[
      Überprüfe, dass Docker korrekt funktioniert mit: \
      #block(
        fill: gray.lighten(90%),
        inset: 5pt,
        radius: 5pt,
        width: 100%,
      )[```sh 
        docker run hello-world 
      ```]
    ]
  ],
)

#task(
  [Erstelle das SvelteKit Frontend],
  none,
  [
    #subtask()[
      Nutze `npx` für das Erstellen
      #block(
        fill: gray.lighten(90%),
        inset: 5pt,
        radius: 5pt,
        width: 100%,
      )[```sh 
        npx sv create [app-name] 
      ```]
      Benutze folgende Parameter:
        - TypeScript
        - vitest, tailwindcss
        - unit testing & component testing für vitest
    ]

    #subtask()[
      Überprüfe, dass das Frontend korrekt funktioniert mit: \
      #block(
        fill: gray.lighten(90%),
        inset: 5pt,
        radius: 5pt,
        width: 100%,
      )[```sh 
        npm run dev
      ```]
    ]
  ]
)

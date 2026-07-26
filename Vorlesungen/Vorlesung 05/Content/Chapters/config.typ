#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": chapter-title-slide

#chapter-title-slide(
  section-name: [Konfiguration]
)

// #slide[
//   //TODO: More Content for Configuration
//   = Konfiguration einer Spring Anwendung
//   #set align(horizon)
//   - Konfiguration einer Spring Anwendung kann über eine `application.properties` oder `application.yaml` geschehen
//   - 
// ]

#slide[
  = YAML File
  #set align(horizon + center)
  ```yaml
  server:
    port: 8080

  spring:
    datasource:
      url: jdbc:postgresql://localhost:5432/db
      username: db_user
      password: db_password
    jpa:
      hibernate:
        ddl-auto: create-drop
      show-sql: true
      properties:
        hibernate:
          format_sql: true
  ```
]

#slide[
  = YAML File
  #set align(horizon + center)
  ```yaml
  server:
    port: 8080
  ```
  #set align(left)
  - Konfiguration für den Spring server
  - `port` bestimmt den Port der Spring Anwendung
]

#slide[
  = YAML File
  #set align(horizon + center)
  #codly(
    header: [#text()[*application.yml*]],
    header-cell-args: (align: center, stroke: 2pt, inset: 10pt),
    stroke: 2pt + black,
    highlights: (
      (line: 3, start: 5, end: none, fill: green),
      (line: 4, start: 5, end: none, fill: green),
      (line: 5, start: 5, end: none, fill: green),
    )
  )
  ```yaml
  spring:
    datasource:
      url: jdbc:postgresql://localhost:5432/db
      username: db_user
      password: db_password
  ```

  #set align(left)
  - Konfiguration des Datenbankzugriffs
  - `url` enthält URL zur gewünschten Datenbank.
  - `username`: Username der ausgewählten Datenbank
  - `password`: Passwort der ausgewählten Datenbank
]

#slide[
  = YAML File
  #set align(horizon + center)

  #codly(
    header: [#text()[*application.yml*]],
    header-cell-args: (align: center, stroke: 2pt, inset: 10pt),
    stroke: 2pt + black,
    highlights: (
      (line: 3, start: 7, end: none, fill: green),
    )
  )
  ```yaml
    jpa:
      hibernate:
        ddl-auto: create-drop
      show-sql: true
      properties:
        hibernate:
          format_sql: true
  ```

  #set align(left)
  - `ddl-auto`: Bestimmt, welche Operationen automatisch auf der Datenbank ausgeführt werden sollen
    - `create-drop` erschafft immer eine neue Datenbank, wenn die Spring Anwendung gestartet wird. Die Alte wird dabei gelöscht.
  - *Wichtig*: Wenn keine embedded Datenbank genutzt wird, werden Datenbanken nicht automatisch erstellt.
]

#slide[
  = YAML File
  #set align(horizon + center)

  #codly(
    header: [#text()[*application.yml*]],
    header-cell-args: (align: center, stroke: 2pt, inset: 10pt),
    stroke: 2pt + black,
    highlights: (
      (line: 4, start: 5, end: none, fill: green),
    )
  )
  ```yaml
    jpa:
      hibernate:
        ddl-auto: create-drop
      show-sql: true
      properties:
        hibernate:
          format_sql: true
  ```

  #set align(left)
  - `show-sql`: Ausgeführte SQL Befehle werden in der Konsole ausgegeben. Macht Debugging einfacher.
]

#slide[
  = YAML File
  #set align(horizon + center)

  #codly(
    header: [#text()[*application.yml*]],
    header-cell-args: (align: center, stroke: 2pt, inset: 10pt),
    stroke: 2pt + black,
    highlights: (
      (line: 7, start: 9, end: none, fill: green),
    )
  )
  ```yaml
    jpa:
      hibernate:
        ddl-auto: create-drop
      show-sql: true
      properties:
        hibernate:
          format_sql: true
  ```

  #set align(left)
  - `format_sql`: Formatiert den SQL Output in eine lesbarere Form
]

#slide[
  = Propterties File
  #set align(horizon + center)
  #codly(
    header: [#text()[*application.properties*]],
    header-cell-args: (align: center, stroke: 2pt, inset: 10pt),
    stroke: 2pt + black,
  )
  ```properties
  server.port=8080
  spring.datasource.url=jdbc:postgresql://localhost:5432/db
  spring.datasource.username=db_user
  spring.datasource.password=db_password
  spring.jpa.hibernate.ddl-auto=create-drop
  spring.jpa.show-sql=true
  spring.jpa.properties.hibernate.format_sql=true
  ```
]

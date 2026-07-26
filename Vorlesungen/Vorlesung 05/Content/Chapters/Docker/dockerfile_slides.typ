#import "../../../Template/definitions.typ": *
#import "../../../Template/template.typ": chapter-title-slide, subchapter-title-slide

#let example_dockerfile = [
  ```Dockerfile
  FROM eclipse-temurin:21-alpine
  WORKDIR /app
  COPY --from=build /dist/ ./
  EXPOSE 8080
  ENTRYPOINT ["/app/bin/application"]
  ```
]

#subchapter-title-slide(section-name: [Dockerfile])

#slide[
  = Dockerfile
  #set align(horizon + center)
  #example_dockerfile
]

#slide[
  = Dockerfile
  #set align(horizon + center)

  #codly(
    highlights: (
      (line: 1, start: 1, end: none),
    )
  )
  #example_dockerfile
  #set align(left)
  - Auswahl des Images, auf dem der Container basiert
  *Hier: *
  - Ein Container mit JDK 21 (Ecplise Temurin) installiert
  - Basierend auf Alpine Linux (lightweight & secure Distro)
]

#slide[
  = Dockerfile
  #set align(horizon + center)

  #codly(
    highlights: (
      (line: 2, start: 1, end: none),
    )
  )
  #example_dockerfile
  #set align(left)
  - Auswahl des Working Directory
  - Alle Befehlte, die `./` benutzen, werden in das Working Directory verwiesen
]

#slide[
  = Dockerfile
  #set align(horizon + center)

  #codly(
    highlights: (
      (line: 3, start: 1, end: none),
    )
  )
  #example_dockerfile
  #set align(left)
  - Programm Dateien werden in den Container kopiert
  - Ohne `--from=build` würde das erste Argument auf das Host Dateisystem verweisen
  - `--from` kann auf andere Container verweisen. Hier der `build`-Container
  #box(fill: gray.lighten(60%), stroke: black, inset: 5pt, width: 1fr)[
    Dateien aus dem Ordner `/dist/` im Container `build` werden in das Working Directory vom aktuellen Container kopiert
  ]
]

#slide[
  = Dockerfile
  #set align(horizon + center)

  #codly(
    highlights: (
      (line: 4, start: 1, end: none),
    )
  )
  #example_dockerfile
  #set align(left)
  - Port, der im Container nach außen freigegeben wird
  - Es können mehrere `EXPOSE` genutzt werden
  - Ohne weitere Angaben wird der TCP Port exposed
  - UDP muss extra angegeben werden
  ```Dockerfile
  FROM eclipse-temurin:21-alpine
  EXPOSE 80/tcp
  EXPOSE 80/udp
  ```
]

#slide[
  = Dockerfile
  #set align(horizon + center)

  #codly(
    highlights: (
      (line: 5, start: 1, end: none),
    )
  )
  #example_dockerfile
  #set align(left)
  - Der `ENTRYPOINT` definiert einen Command, der vom Container ausgeführt wird
  - Der Container läuft praktisch selbst wie eine Executable
  - Mehrere `ENTRYPOINT` können vorhanden sein, aber nur der letzte wird genutzt
]

#slide[
  = Dockerfile
  #set align(horizon)
  Zwei Formate möglich:
  #codly(
    header: [*Exec Form*, _bevorzugt_]
  )
  ```Dockerfile
  ENTRYPOINT ["executable", "param1", "param2"]
  ```
  #codly(
    header: [*Shell Form*]
  )
  ```Dockerfile
  ENTRYPOINT command param1 param2
  ```
]

#slide[
  = Dockerfile
  == Build Container
  #set align(horizon)
  #codly(
    highlights: (
      (line: 3, start: 13, end: 17),
    )
  )
  ```Dockerfile
  FROM eclipse-temurin:21-alpine
  WORKDIR /app
  COPY --from=build /dist/ ./
  EXPOSE 8080
  ENTRYPOINT ["/app/bin/application"]
  ```
]

#let build_container = [
  ```Dockerfile
  FROM gradle:8-jdk21 AS build
  ARG APP_VERSION
  WORKDIR /build
  COPY ../../ ./
  RUN gradle assemble
  WORKDIR /dist
  RUN tar --strip-components 1 -xf "/build/build/distributions/application-$APP_VERSION.tar"
  ```
]

#slide[
  = Dockerfile
  == Build Container
  #set align(horizon)
  #build_container
]

#slide[
  = Dockerfile
  == Build Container
  #set align(horizon)
  #codly(
    highlights: (
      (line: 1, start: 1, end: none),
    )
  )
  #build_container
  - Auswahl des Images, auf dem der Container basiert
  - `AS` erlaubt refferenzierung des Containers über festgelegten Namen
  *Hier: *
  - Ein Container mit Gradle Version 8 und JDK 21
  - Container ist aufrufbar über seinen Namen: `build`
]

#slide[
  = Dockerfile
  == Build Container
  #set align(horizon)
  #codly(
    highlights: (
      (line: 2, start: 1, end: none),
    )
  )
  #build_container
  - Argument, dass über den docker exec, docker run Befehl oder die compose übergeben werden kann
]

#slide[
  = Dockerfile
  == Build Container
  #set align(horizon)
  #codly(
    highlights: (
      (line: 3, start: 1, end: none),
    )
  )
  #build_container
  - Auswahl des Working Directory
  - Alle Befehlte, die `./` benutzen, werden in das Working Directory verwiesen
]

#slide[
  = Dockerfile
  == Build Container
  #set align(horizon)
  #codly(
    highlights: (
      (line: 4, start: 1, end: none),
    )
  )
  #build_container
  - Alle Projekt Dateien werden in den Build Container kopiert
  - Hier befindet sich das Dockerfile in zwei Unterordnern im Projekt
]

#slide[
  = Dockerfile
  == Build Container
  #set align(horizon)
  #codly(
    highlights: (
      (line: 5, start: 1, end: none),
    )
  )
  #build_container
  - Führt Befehl aus
  - Hier wird der Gradle Befehl zum Bauen des Projekts ausgeführt
]

#slide[
  = Dockerfile
  == Build Container
  #set align(horizon)
  #codly(
    highlights: (
      (line: 6, start: 1, end: none),
    )
  )
  #build_container
  - Das Working Directory wird auf den Build Output Ordner gewechselt
]

#slide[
  = Dockerfile
  == Build Container
  #set align(horizon)
  #codly(
    highlights: (
      (line: 7, start: 1, end: none),
    )
  )
  #build_container
  - Das gebaute Projekt wird in eine `.tar` Datei komprimiert, die dann aus dem Build Container in den normalen Container kopiert wird
]

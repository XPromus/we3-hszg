#import "../../../Template/definitions.typ": *
#import "../../../Template/template.typ": subchapter-title-slide

#subchapter-title-slide(section-name: [Compose])

#slide[
  = Compose
  #set align(horizon + center)
  ```yaml
  services:
    db:
      image: postgres
      container_name: postgres_db_container
      environment:
        - POSTGRES_USER=db_user
        - POSTGRES_PASSWORD=db_password
        - POSTGRES_DB=db
      networks:
        - application_network
      ports:
        - "8001:5432"
  networks:
    application_network:
      driver: bridge
  ```
]

#slide[
  = Compose
  == Services
  #set align(horizon + center)
  ```yaml
  services:
    db:
      # Service Definition
    # Weitere Services
  ```
  #set align(left)
  - In einer Map, unter dem Key `services`, werden alle Services definiert, die von der Compose gestartet werden sollen
  - Name wird durch Key bestimmt
  - Hier wäre der Name des Services: `db`
]

#slide[
  = Compose
  == Services
  #set align(horizon + center)
  ```yaml
    db:
      image: postgres
      container_name: postgres_db_container
      environment:
        - POSTGRES_USER=db_user
        - POSTGRES_PASSWORD=db_password
        - POSTGRES_DB=db
      networks:
        - application_network
      ports:
        - "8001:5432"
  ```
  #set align(left)
  - Einzelne Services werden durch Map unter dem Service-Key definiert
]

#slide[
  = Compose
  == Services
  #set align(horizon + center)
  ```yaml
  services:
    db:
      image: postgres
  ```
  #set align(left)
  - Key `image` bestimmt das Container-Image, dass hier genutzt werden soll
  - Können vom System kommen oder zum Beispiel aus der Docker Registry
  - Hier wird ein Image genutzt, welches für die PostgreSQL Datenbank zugeschnitten ist
  #set align(horizon + center)
  #link("https://hub.docker.com/_/postgres")[
    #underline(offset: 7.5pt)[
      #text(fill: blue)[
        https://hub.docker.com/_/postgres
      ]
    ]
  ]
]

#slide[
  = Compose
  == Services
  #set align(horizon + center)
  ```yaml
  services:
    db:
      container_name: postgres_db_container
  ```
  #set align(left)
  - Key `container_name` bestimmt den Namen des Containers
  #figure(
    caption: [
      Aktuell nicht laufender Container in der Podman Desktop UI. Der Container hat den Namen: `example_db_container`
    ]
  )[
    #image("../../../Images/podman_example_container.png", fit: "contain")
  ]
]

#slide[
  = Compose
  == Services - Environment Variablen
  #set align(horizon + center)

  #codly(
    header: [#text()[*compose.yml*]],
    header-cell-args: (align: center, stroke: 2pt, inset: 10pt),
    stroke: 2pt + black,
    highlights: (
      (line: 2, start: 19, end: none, fill: green),
      (line: 3, start: 23, end: none, fill: red),
      (line: 4, start: 5, end: none, fill: blue),
    )
  )
  ```yaml
  environment:
    - POSTGRES_USER=db_user
    - POSTGRES_PASSWORD=db_password
    - POSTGRES_DB=db
  ```

  #codly(
    header: [#text()[*application.yml*]],
    header-cell-args: (align: center, stroke: 2pt, inset: 10pt),
    stroke: 2pt + black,
    highlights: (
      (line: 3, start: 43, end: none, fill: blue),
      (line: 4, start: 15, end: none, fill: green),
      (line: 5, start: 15, end: none, fill: red),
    )
  )
  ```yaml
  spring:
    datasource:
      url: jdbc:postgresql://localhost:5432/db
      username: db_user
      password: db_password
  ```
]

#slide[
  = Compose
  == Services
  #set align(horizon + center)
  ```yaml
  services:
    db:
      networks:
        - application_network
  ```
  #set align(left)
  - Key `networks` bestimmt, zu welchen Netzwerken der Container zugeordnet werden soll
  - Es können dabei mehrere Netzwerke genutzt werden
  - Netzwerke werden in einer Map angegeben
  - Hier wird nur das `application_network` genutzt
]

#slide[
  = Compose
  == Services - Ports
  #set align(horizon + center)
  ```yaml
  services:
    db:
      ports:
        - "8001:5432"
  ```
  #set align(left)
  - Key `ports` bestimmt, welche Ports von dem Container exposed werden sollen
  - Es können mehrere Ports in einer Map angegeben werden
  - Jede Angabe besteht aus zwei Ports
]

#slide[
  = Compose
  == Services - Ports
  #set align(horizon + center)
  #codly(
    highlights: (
      (line: 1, start: 4, end: 7, fill: blue),
      (line: 1, start: 9, end: 12, fill: red),
    )
  )
  ```yaml
  - "8001:5432"
  ```
  #set align(left)
  #text(fill: blue, weight: "bold")[Der linke Port] ist der Port, der von außerhalb des Containers erreicht werden kann \
  #text(fill: red, weight: "bold")[Der rechte Port] ist der Port, der innerhalb des Containers genutzt werden soll. Er wird auf den linked Port gemapped. \

  In diesem Beispiel hier, wird der default Port einer PostgreSQL Datenbank, #text(fill: red, weight: "bold")[5432], der innerhalb des Container genutzt wird, auf den Port #text(fill: blue, weight: "bold")[8001] gemapped. 
  Die Datenbank kann somit außerhalb des Containers auf dem Port #text(fill: blue, weight: "bold")[8001] erreicht werden.
]

#slide[
  = Compose
  == Services - Depends On
  #set align(horizon + center)
  ```yaml
  services:
    db:
      depends_on:
        - other_container
  ```
  #set align(left)
  - Key `depends_on` bestimmt, welche Container bereits laufen müssen, damit der aktuelle Container gestartet werden kann
  - Es können mehrere Container in einer Map angegeben werden
  - Der Name des Containers ist hier der Service Name
]

#slide[
  = Compose
  == Netzwerke
  #set align(horizon + center)
  ```yaml
  networks:
    application_network:
      driver: bridge
  ```
  #set align(left)
  - Definierung von Netzwerken für die Docker Container
  - Container, die auf einem gemeinsamen Netzwerk sind, können untereinander kommunizieren
  - `bridge` Netzwerk wird am Häufigsten genutzt
  - Netzwerke werden als Map unter dem Key `networks` definiert
  - Netzwerk-Name ist Key des jeweiligen Netzwerks
  - `driver` Key bestimmt, welche Art von Netzwerk genutzt wird
]

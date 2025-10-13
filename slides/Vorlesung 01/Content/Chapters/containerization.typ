#import "../../Template/definitions.typ": *
#import "../../Components/docker-diagram.typ": docker-diagram

#slide[
  =
  #toolbox.register-section[Containerization]
  #set align(horizon + center)
  #text(size: 50pt)[*It works on my machine*]
]

#import "../../Components/structure_diagram.typ": structure-diagram
#slide[
  =
  #structure-diagram(
    false,
    false,
    false,
    true
  )
]

#slide[
  = Containerization
  #set align(horizon)
  - Erstellen von Umgebungen (Containern), die sich, unabhängig von ihrer Umgebung, immer gleich verhalten
  - Ähnlich wie eine Virtuelle Maschine, allerdings ohne Virtualisierung der Hardware
  - Alle Container laufen über den gleichen Kernel -> Mehr Performance als mit VMs
  - Software wird in diesen Containern deployed
]

#slide[
  =
  #set align(horizon + center)
  #docker-diagram
]

#slide[
  = Bestandteile
  #set align(horizon + center)
  #toolbox.side-by-side[
    *Dockerfile* \
    Beschreibt den Aufbau von einem Image
  ][
    #text(fill: gray.lighten(80%))[
      *Image* \
      Eine Abbildung der Software, die eingesetzt werden soll, mit allen benötigten Abhängigkeiten.
    ]
  ][
    #text(fill: gray.lighten(80%))[
      *Container* \
      Die laufende Software, basierend auf einem Image
    ]
  ]
]

#slide[
  = Dockerfile
  #set align(horizon + center)
  ```docker
    # syntax=docker/dockerfile:1
    FROM ubuntu:22.04

    # install app dependencies
    RUN apt-get update && apt-get install -y python3 python3-pip
    RUN pip install flask==3.0.*

    # install app
    COPY hello.py /

    # final configuration
    ENV FLASK_APP=hello
    EXPOSE 8000
    CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8000"]
  ```
]

#slide[
  = Bestandteile
  #set align(horizon + center)
  #toolbox.side-by-side[
    *Dockerfile* \
    Beschreibt den Aufbau von einem Image
  ][
    *Image* \
    Eine Abbildung der Software, die eingesetzt werden soll, mit allen benötigten Abhängigkeiten.
  ][
    #text(fill: gray.lighten(80%))[
      *Container* \
      Die laufende Software, basierend auf einem Image
    ]
  ]
]

#slide[
  = Bestandteile
  #set align(horizon + center)
  #toolbox.side-by-side[
    *Dockerfile* \
    Beschreibt den Aufbau von einem Image
  ][
    *Image* \
    Eine Abbildung der Software, die eingesetzt werden soll, mit allen benötigten Abhängigkeiten.
  ][
    *Container* \
    Die laufende Software, basierend auf einem Image
  ]
]

#slide[
  = Containerization Tools
  Zwei Optionen für Containerization:
  #set align(center + horizon)
  #toolbox.side-by-side[
    #figure(
      image("../../Images/Icons/logos--docker-icon.svg", height: 150pt),
      caption: [#link("https://www.docker.com/")[Docker]]
    )
  ][
    #figure(
      image("../../Images/Icons/devicon--podman.svg", height: 150pt),
      caption: [#link("https://podman.io/")[Podman]]
    )
  ]
]
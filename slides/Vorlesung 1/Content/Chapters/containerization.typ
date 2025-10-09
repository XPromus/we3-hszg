#import "../../Template/definitions.typ": *

#slide[
  =
  #toolbox.register-section[Containerization]
  #set align(horizon + center)
  #text(size: 50pt)[*It works on my machine*]
]
#slide[
  =
  #set align(horizon + center)
  #diagram(
    node-stroke: 1pt,
    node((2, 0), fill: red.lighten(60%), stroke: red, corner-radius: 2pt)[
      *Containerization* \
      Docker oder Podman
    ],
    edge("--", <database>, stroke: red)[Container],
    edge("--", <backend>, stroke: red)[Container],
    edge("--", <frontend>, stroke: red)[Container],
    node((0, 2.5), name: <database>, align(center)[
      Database
      #image("../../Images/Icons/devicon--postgresql.svg", fit: "contain", width: 50pt)
    ]),
    edge("<->")[CRUD & ORM],
    node((2, 2.5), name: <backend>, align(center)[
      Backend
      #image("../../Images/Icons/devicon--spring.svg", fit: "contain", width: 50pt)
    ]),
    edge("<->")[
      #set align(center)
      Kommunikation \
      über API
    ],
    node((4, 2.5), name: <frontend>, align(center)[
      Frontend
      #image("../../Images/Icons/devicon--svelte.svg", fit: "contain", width: 50pt)
    ]),
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
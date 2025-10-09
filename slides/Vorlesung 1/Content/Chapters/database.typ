#import "../../Template/definitions.typ": *

#slide[
  =
  #toolbox.register-section[Database]
  #set align(horizon + center)
  #diagram(
    node-stroke: 1pt,
    node((2, 0), corner-radius: 2pt)[
      *Containerization* \
      Docker oder Podman
    ],
    edge("--", <database>)[Container],
    edge("--", <backend>)[Container],
    edge("--", <frontend>)[Container],
    node((0, 2.5), name: <database>, fill: red.lighten(60%), stroke: red, align(center)[
      *Database*
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
  = Database
  #set align(horizon)
  - Enthält alle zu speichernden Daten
  - Manuelle Erstellung bzw. Konfigurierung nicht nötig
  - Erstellung der Tabellen geschieht durch das Backend
  - Manuelle Eingriffe nur dann in speziellen Situationen wie Migration nötig
  In dieser Vorlesung kommt PostgreSQL zum Einsatz
  #image("../../Images/Icons/devicon--postgresql.svg")
]

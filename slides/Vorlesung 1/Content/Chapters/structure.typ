#import "../../Template/definitions.typ": *

#slide[
  = Struktur einer Full-Stack Web-Application
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

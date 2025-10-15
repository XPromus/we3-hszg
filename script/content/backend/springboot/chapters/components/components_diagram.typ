#import "../../../../../template/definitions.typ": *

#let default-corner-radius = 2pt
#diagram(
  node-stroke: 2pt,
  node-inset: 10pt,
  node(
    (0, 1),
    name: <Entity>,
    fill: gray.lighten(90%),
    stroke: gray,
    corner-radius: default-corner-radius,
  )[
    Entity
  ],
  node(
    (0, 1.75),
    name: <GetEntityDto>,
    fill: gray.lighten(90%),
    stroke: gray,
    corner-radius: default-corner-radius,
  )[
    GetEntityDto
  ],
  node(
    (1, 1.75),
    name: <GetEntityDtoMapper>,
    fill: gray.lighten(90%),
    stroke: gray,
    corner-radius: default-corner-radius,
  )[
    GetEntityDto Mapper
  ],
  node(
    (0, 2.5),
    name: <CreateEntityDto>,
    fill: gray.lighten(90%),
    stroke: gray,
    corner-radius: default-corner-radius,
  )[
    CreateEntityDto
  ],
  node(
    (1, 2.5),
    name: <CreateEntityDtoMapper>,
    fill: gray.lighten(90%),
    stroke: gray,
    corner-radius: default-corner-radius,
  )[
    CreateEntityDto Mapper
  ],
  node(
    (0, 3.25),
    name: <UpdateEntityDto>,
    fill: gray.lighten(90%),
    stroke: gray,
    corner-radius: default-corner-radius,
  )[
    UpdateEntityDto
  ],
  node(
    (1, 3.25),
    name: <UpdateEntityDtoMapper>,
    fill: gray.lighten(90%),
    stroke: gray,
    corner-radius: default-corner-radius,
  )[
    UpdateEntityDto Mapper
  ],
  node(
    (0, 0),
    name: <Repository>,
    fill: gray.lighten(90%),
    stroke: gray,
    corner-radius: default-corner-radius,
  )[
    Repository
  ],
  edge("--", <Service>),
  node(
    (1, 0),
    name: <Service>,
    fill: gray.lighten(90%),
    stroke: gray,
    corner-radius: default-corner-radius,
  )[
    Service
  ],
  edge("--", <Controller>),
  node(
    (2, 0),
    name: <Controller>,
    fill: gray.lighten(90%),
    stroke: gray,
    corner-radius: default-corner-radius,
  )[
    Controller
  ],

  edge(<Repository>, "-|>", <Entity>, stroke: blue),
  edge(<Entity>, "-|>", <GetEntityDtoMapper>, stroke: blue),
  edge(<GetEntityDtoMapper>, "-|>", <GetEntityDto>, stroke: blue),
  edge(<GetEntityDto>, "-|>", <Service>, stroke: blue),
  edge(<Service>, "-|>", <Controller>, stroke: blue),
  edge(<Controller>, "-|>", <Service>, stroke: red),

  edge(<Controller>, "-|>", <CreateEntityDto>, stroke: green),
  edge(<CreateEntityDto>, "-|>", <Service>, stroke: green),
  edge(<Service>, "-|>", <CreateEntityDtoMapper>, stroke: green),
  edge(<CreateEntityDtoMapper>, "-|>", <Entity>, stroke: green),
  edge(<Entity>, "-|>", <Repository>, stroke: green),

  edge(<Controller>, "-|>", <UpdateEntityDto>, stroke: orange),
  edge(<UpdateEntityDto>, "-|>", <Service>, stroke: orange),
  edge(<Service>, "-|>", <UpdateEntityDtoMapper>, stroke: orange),
  edge(<UpdateEntityDtoMapper>, "-|>", <Entity>, stroke: orange),
  edge(<Entity>, "-|>", <Repository>, stroke: orange),


)

#let get-diagram = [
  #let repositoryX = 0
  #let serviceX = 1.5
  #let controllerX = 5

  #diagram(
    node-stroke: 2pt,
    node-inset: 10pt,
    node(
      (repositoryX, 3),
      name: <Entity>,
      fill: gray.lighten(90%),
      stroke: gray,
      corner-radius: default-corner-radius,
    )[
      Entity
    ],
    node(
      (serviceX, 4.5),
      name: <GetEntityDto>,
      fill: gray.lighten(90%),
      stroke: gray,
      corner-radius: default-corner-radius,
    )[
      GetEntityDto
    ],
    node(
      (serviceX, 3),
      name: <GetEntityDtoMapper>,
      fill: gray.lighten(90%),
      stroke: gray,
      corner-radius: default-corner-radius,
    )[
      GetEntityDto Mapper
    ],
    node(
      (repositoryX, 0),
      name: <Repository>,
      fill: gray.lighten(90%),
      stroke: gray,
      corner-radius: default-corner-radius,
    )[
      Repository
    ],
    node(
      (serviceX, 0),
      name: <Service>,
      fill: gray.lighten(90%),
      stroke: gray,
      corner-radius: default-corner-radius,
    )[
      Service
    ],
    node(
      (controllerX, 0),
      name: <Controller>,
      fill: gray.lighten(90%),
      stroke: gray,
      corner-radius: default-corner-radius,
    )[
      Controller
    ],

    edge(<Controller>, "-|>", <Service>, shift: 3pt, stroke: blue, bend: 10deg)[
      Parameter für GET
    ],
    edge(<Service>, "-|>", <Controller>, shift: 3pt, stroke: blue, bend: 10deg)[
      Get DTOs
    ],

    edge(<Service>, "-|>", <Repository>, stroke: blue)[
      #set align(center)
      Anfrage an \ das Repository
    ],
    edge(<Repository>, "-|>", <Entity>, stroke: blue)[
      Gefundene Entities 
    ],

    edge(<Entity>, "-|>", <Service>, stroke: blue, bend: 40deg),

    edge(<Service>, "-|>", <GetEntityDtoMapper>, stroke: blue, label-side: right)[
      #set align(center)
      Aufruf des \ Mappings von \ Entities zu GET DTOs
    ],
    edge(<GetEntityDtoMapper>, "-|>", <GetEntityDto>, stroke: blue, label-side: right)[
      Mapping der DTOs
    ],
    edge(<GetEntityDto>, "-|>", <Service>, stroke: blue, bend: -65deg)[
      Fertige DTOs
    ],
  )
]
#let post-diagram = [
  #let repositoryX = 0
  #let serviceX = 1.5
  #let controllerX = 5

  #let arrow-color = green

  #diagram(
    node-stroke: 2pt,
    node-inset: 10pt,
    node(
      (repositoryX, 3),
      name: <Entity>,
      fill: gray.lighten(90%),
      stroke: gray,
      corner-radius: default-corner-radius,
    )[
      Entity
    ],
    node(
      (serviceX, 4.5),
      name: <PostEntityDto>,
      fill: gray.lighten(90%),
      stroke: gray,
      corner-radius: default-corner-radius,
    )[
      PostEntityDto
    ],
    node(
      (serviceX, 3),
      name: <PostEntityDtoMapper>,
      fill: gray.lighten(90%),
      stroke: gray,
      corner-radius: default-corner-radius,
    )[
      PostEntityDto Mapper
    ],
    node(
      (repositoryX, 0),
      name: <Repository>,
      fill: gray.lighten(90%),
      stroke: gray,
      corner-radius: default-corner-radius,
    )[
      Repository
    ],
    node(
      (serviceX, 0),
      name: <Service>,
      fill: gray.lighten(90%),
      stroke: gray,
      corner-radius: default-corner-radius,
    )[
      Service
    ],
    node(
      (controllerX, 0),
      name: <Controller>,
      fill: gray.lighten(90%),
      stroke: gray,
      corner-radius: default-corner-radius,
    )[
      Controller
    ],

    edge(<Controller>, "-|>", <Service>, shift: 3pt, stroke: arrow-color, bend: 10deg)[
      POST DTO
    ],
    edge(<Service>, "-|>", <Controller>, shift: 3pt, stroke: arrow-color, bend: 10deg)[
      Get DTOs
    ],

    edge(<Service>, "-|>", <Repository>, bend: 30deg, stroke: arrow-color)[
      #set align(center)
      Speichern der \ Entity auf \ dem Repository
    ],
    edge(<Repository>, "-|>", <Service>, bend: 30deg, stroke: arrow-color)[
      #set align(center)
      Rückgabe der gepeicherten Entity
    ],
    edge(<Repository>, "-|>", <Entity>, stroke: arrow-color)[
      Gefundene Entities 
    ],

    edge(<Entity>, "-|>", <Service>, stroke: arrow-color, bend: 40deg),

    edge(<Service>, "-|>", <PostEntityDtoMapper>, stroke: arrow-color, label-side: right)[
      #set align(center)
      Aufruf des \ Mappings von \ POST DTOs zu Entities
    ],
    edge(<PostEntityDtoMapper>, "-|>", <PostEntityDto>, stroke: arrow-color, label-side: right)[
      Mapping der DTOs
    ],
    edge(<PostEntityDto>, "-|>", <Service>, stroke: arrow-color, bend: -65deg)[
      Fertige DTOs
    ],
    edge(<PostEntityDtoMapper>, "-|>", <Entity>, stroke: arrow-color, label-side: right),
  )
]
#let put-diagram = []
#let delete-diagram = []

#post-diagram

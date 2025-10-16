#import "../../template/definitions.typ": *

#let get-diagram(
  step
) = [
  #let repositoryX = 0
  #let serviceX = 1.5
  #let controllerX = 4
  #let default-corner-radius = 2pt

  #let default-color = blue
  #let default-text-color = black
  #let active-color = red

  #let get-stroke-color(active-step, target-step) = {
    if (active-step == target-step) {
      return active-color
    }
    return default-color
  }

  #let get-text-color(active-step, target-step) = {
    if (active-step == target-step) {
      return active-color
    }
    return default-text-color
  }

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
      (controllerX, -0.5),
      name: <Controller>,
      fill: gray.lighten(90%),
      stroke: gray,
      corner-radius: default-corner-radius,
    )[
      Controller
    ],

    edge(<Controller>, "-|>", <Service>, shift: 3pt, stroke: get-stroke-color(step, 1), bend: 10deg)[
      #text(fill: get-text-color(step, 1))[Parameter für GET]
    ],
    edge(<Service>, "-|>", <Repository>, stroke: get-stroke-color(step, 2))[
      #text(fill: get-text-color(step, 2))[
        #set align(center)
        Anfrage an \ das Repository
      ]
    ],
    edge(<Repository>, "-|>", <Entity>, stroke: get-stroke-color(step, 3))[
      #text(fill: get-text-color(step, 3))[Gefundene \ Entities]
    ],
    edge(<Entity>, "-|>", <Service>, stroke: get-stroke-color(step, 4), bend: 40deg),
    edge(<Service>, "-|>", <GetEntityDtoMapper>, stroke: get-stroke-color(step, 5), label-side: right)[
      #text(fill: get-text-color(step, 5))[
        #set align(center)
        Aufruf des \ Mappings von \ Entities zu GET DTOs
      ]
    ],
    edge(<GetEntityDtoMapper>, "-|>", <GetEntityDto>, stroke: get-stroke-color(step, 6), label-side: right)[
      #text(fill: get-text-color(step, 6))[Mapping der DTOs]
      
    ],
    edge(<GetEntityDto>, "-|>", <Service>, stroke: get-stroke-color(step, 7), bend: -65deg)[
      #text(fill: get-text-color(step, 7))[Fertige DTOs]
    ],
    edge(<Service>, "-|>", <Controller>, shift: 3pt, stroke: get-stroke-color(step, 8), bend: 10deg)[
      #text(fill: get-text-color(step, 8))[Get DTOs]
    ],
  )
]

#slide[
  #toolbox.register-section([Ablauf GET])
  =
  #set align(horizon + center)
  #text(weight: "bold", size: 25pt)[Komponenten und Ablauf einer GET Request]
]

#let index = 1
#while index <= 8 {
  [
    #slide[
      =
      #set align(horizon + center)
      #get-diagram(index)
    ]
  ]
  index = index + 1
}

#slide[
  #toolbox.register-section([Komponenten])
  = Komponenten
  #set align(horizon)
  - Controller: 
  - Service
  - Repository
  - Entity
  - DTOs
  - Mapper
]

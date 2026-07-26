#import "../../template/definitions.typ": *

#let get-diagram(
  step: int
) = [
  #let repositoryX = 0
  #let serviceX = 1.5
  #let controllerX = 4
  #let default-corner-radius = 2pt

  #let inactive-color = gray.lighten(60%)
  #let default-color = black
  #let default-text-color = black
  #let inactive-text-color = gray.lighten(60%)
  #let active-color = red

  #let get-stroke-color(target-step: int) = {
    if (step == target-step) {
      return active-color
    }
    if (step < target-step) {
      return inactive-color
    }
    return default-color
  }

  #let get-text-color(target-step: int) = {
    if (step == target-step) {
      return active-color
    }
    if (step < target-step) {
      return inactive-text-color
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

    edge(<Controller>, "-|>", <Service>, shift: 3pt, stroke: get-stroke-color(target-step: 1), bend: 10deg)[
      #text(fill: get-text-color(target-step: 1))[Parameter für GET]
    ],
    edge(<Service>, "-|>", <Repository>, stroke: get-stroke-color(target-step: 2))[
      #text(fill: get-text-color(target-step: 2))[
        #set align(center)
        Anfrage an \ das Repository
      ]
    ],
    edge(<Repository>, "-|>", <Entity>, stroke: get-stroke-color(target-step: 3))[
      #text(fill: get-text-color(target-step: 3))[Gefundene \ Entities]
    ],
    edge(<Entity>, "-|>", <Service>, stroke: get-stroke-color(target-step: 4), bend: 40deg),
    edge(<Service>, "-|>", <GetEntityDtoMapper>, stroke: get-stroke-color(target-step: 5), label-side: right)[
      #text(fill: get-text-color(target-step: 5))[
        #set align(center)
        Aufruf des \ Mappings von \ Entities zu GET DTOs
      ]
    ],
    edge(<GetEntityDtoMapper>, "-|>", <GetEntityDto>, stroke: get-stroke-color(target-step: 6), label-side: right)[
      #text(fill: get-text-color(target-step: 6))[Mapping der DTOs]
      
    ],
    edge(<GetEntityDto>, "-|>", <Service>, stroke: get-stroke-color(target-step: 7), bend: -65deg)[
      #text(fill: get-text-color(target-step: 7))[Fertige DTOs]
    ],
    edge(<Service>, "-|>", <Controller>, shift: 3pt, stroke: get-stroke-color(target-step: 8), bend: 10deg)[
      #text(fill: get-text-color(target-step: 8))[Get DTOs]
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
      #get-diagram(step: index)
    ]
  ]
  index = index + 1
}

#let componentsIndex = 0
#let components = (
  "Entities",
  "Repositories",
  "Controllers",
  "Services",
  "DTOs",
  "Mapper"
)
#slide[
  #toolbox.register-section([Komponenten])
  = Komponenten
  #set align(horizon)

  #for c in components [
    #block(
      fill: gray.lighten(90%), 
      stroke: stroke(paint: gray, thickness: 2.5pt), 
      width: 100%, 
      inset: 10pt,
      radius: 5pt,
    )[
      #set align(center)
      #text(weight: "bold")[#c]
    ]
  ]
]

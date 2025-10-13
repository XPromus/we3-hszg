#import "../Template/definitions.typ": *

#let active-fill-color = red
#let default-fill-color = white

#let active-stroke-color = red
#let default-stroke-color = black

#let get-fill-color(state) = {
  if state {
    return active-fill-color
  }
  return default-fill-color
}

#let get-stroke-color(state) = {
  if state {
    return active-stroke-color
  }
  return default-stroke-color
}

#let structure-diagram(
  database-active, 
  backend-active, 
  frontend-active, 
  container-active
) = diagram(
  node-stroke: 1pt,
  node(
    (2, 0), 
    corner-radius: 2pt,
    fill: get-fill-color(container-active).lighten(60%), 
    stroke: get-stroke-color(container-active)
  )[
    *Containerization* \
    Docker oder Podman
  ],
  edge("--", <database>)[Container],
  edge("--", <backend>)[Container],
  edge("--", <frontend>)[Container],
  node(
    (0, 2.5), 
    name: <database>, 
    shape: rect, 
    inset: 15pt, 
    fill: get-fill-color(database-active).lighten(60%), 
    stroke: get-stroke-color(database-active), 
    align(center)[
      Database
      #image(
        "../Images/Icons/devicon--postgresql.svg", 
        fit: "contain", 
        width: 50pt
      )
    ]
  ),
  edge("<->")[ORM],
  node(
    (2, 2.5), 
    name: <backend>, 
    shape: rect, 
    inset: 15pt, 
    fill: get-fill-color(backend-active).lighten(60%), 
    stroke: get-stroke-color(backend-active), 
    align(center)[
      Backend
      #image(
        "../Images/Icons/devicon--spring.svg", 
        fit: "contain", 
        width: 50pt
      )
    ]
  ),
  edge("<->")[
    #set align(center)
    Kommunikation \
    über API
  ],
  node(
    (4, 2.5), 
    name: <frontend>, 
    shape: rect, 
    inset: 15pt, 
    fill: get-fill-color(frontend-active).lighten(60%), 
    stroke: get-stroke-color(frontend-active), 
    align(center)[
      Frontend
      #image(
        "../Images/Icons/devicon--svelte.svg", 
        fit: "contain", 
        width: 50pt
      )
    ]
  ),
)
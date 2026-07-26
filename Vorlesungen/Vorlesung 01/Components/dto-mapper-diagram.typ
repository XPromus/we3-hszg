#import "../Template/definitions.typ": *

#let default-corner-radius = 2pt

#let dto-mapper-diagram = diagram(
  node-stroke: 2pt,
  node-inset: 10pt,
  node(
    (0, 0),
    name: <html>,
    shape: diamond
  )[
    *HTML*
  ],
  node(
    (0, 1),
    name: <json>,
    shape: diamond
  )[
    *Json*
  ],
  node(
    (1, 0.5),
    name: <userdto>,
    shape: rect
  )[
    *UserDTO* \
    - name
    - roles
  ],
  node(
    (2, 0.5),
    name: <mapper>,
    shape: rect
  )[
    Mapper
  ],
  node(
    (3, 0),
    name: <user>,
    shape: rect
  )[
    *User* \
    - name
    - Password
  ],
  node(
    (3, 1),
    name: <role>,
    shape: rect
  )[
    *Role* \
    - name
  ],
  edge(
    <html>,
    <userdto>,
    "<->",
  ),
  edge(
    <json>,
    <userdto>,
    "<->",
  ),
  edge(
    <mapper>,
    <userdto>,
    "<->",
  ),
  edge(
    <mapper>,
    <user>,
    "<->",
  ),
  edge(
    <mapper>,
    <role>,
    "<->",
  )
)

#import "../Template/definitions.typ": *

#let default-corner-radius = 2pt

#let docker-diagram = diagram(
  node-stroke: 2pt,
  node-inset: 10pt,
  node(
    (0.15, 0),
    name: <App1>,
    fill: red.lighten(80%),
    stroke: red,
    corner-radius: default-corner-radius,
  )[
    #text(fill: red)[*App 1*]
  ],
  node(
    (1, 0),
    name: <App2>,
    fill: green.lighten(80%),
    stroke: green,
    corner-radius: default-corner-radius,
  )[
    #text(fill: green)[*App 2*]
  ],
  node(
    (1.85, 0),
    name: <App3>,
    fill: yellow.lighten(80%),
    stroke: yellow,
    corner-radius: default-corner-radius,
  )[
    #text(fill: yellow)[*App 3*]
  ],
  node(
    (1, 0.5),
    name: <DockerEngine>,
    fill: blue.lighten(60%),
    stroke: blue,
    enclose: ((0, 0.5), (2, 0.5)),
    corner-radius: default-corner-radius,
  )[
    #text(fill: blue)[*Container Engine*]
  ],
  node(
    (1, 1.5),
    name: <OperatingSystem>,
    fill: gray.lighten(60%),
    enclose: ((0, 1.5), (2, 1.5)),
    corner-radius: default-corner-radius,
  )[
    #grid(
      columns: (auto, 1fr),
      inset: 5pt
    )[
      #image("../Images/Icons/logos--linux-tux.svg", fit: "contain", width: 50pt)
    ][
      *Operating System*
    ]
  ],
  node(
    (1, 2.5),
    name: <Hardware>,
    fill: gray.lighten(60%),
    shape: rect,
    enclose: ((0, 2.5), (2, 2.5)),
    corner-radius: default-corner-radius,
  )[
    #grid(
      columns: (auto, 1fr),
      inset: 5pt
    )[
      #image("../Images/Icons/streamline-cyber-color--computer-pc-4.svg", fit: "contain", width: 50pt)
    ][
      *Hardware*
    ]
  ],
  node(
    enclose: (<Hardware>, <OperatingSystem>), 
    shape: brace.with(dir: right, label: [Host Machine])
  ),
  node(
    enclose: (<DockerEngine>, <App3>), 
    shape: brace.with(dir: right, label: [Containers])
  )
)

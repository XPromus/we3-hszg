#import "@preview/polylux:0.4.0": *

#let setup(body) = {
  set page(
    paper: "presentation-4-3",
    footer: {
      h(1fr)
      set text(size: 12pt)
      toolbox.slide-number
    }
  )

  set text(
    font: "Noto Sans",
    size: 20pt,
  )
  // show math.equation: set text(font: "Fira Math")

  // show heading.where(level: 1): set text(size: 23pt, fill: blue)
  // show heading.where(level: 1): set block(spacing: 30pt)

  // set list(marker: text(fill: blue, sym.square.filled), indent: 1em)

  body
}

#let title-slide(group: [], title: [], subtitle: [], extra: []) = slide[
  #set page(
    paper: "presentation-4-3",
    margin: 0pt,
    header: {
      image("../Images/hszg_logo.png", fit: "contain")
      text("Test")
    },
    footer: {
      image("../Images/hszg_logo.png", fit: "contain")
      text("Test")
    },
  )

  #set align(horizon)

  #block(
    inset: (left: 5cm, right: 5cm),
  )[
    #text(size: 32pt, weight: "bold", title) \
    #text(size: 24pt, weight: "regular", subtitle)
    #v(10mm)
    #text(size: 18pt, weight: "regular", group) \
    #text(size: 18pt, weight: "regular", extra)
  ]
]

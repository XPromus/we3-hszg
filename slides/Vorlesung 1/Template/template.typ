#import "@preview/polylux:0.4.0": *

#let hszg-green = rgb("#88BD21")
#let footer-font-size = 13pt

#let sections-band = toolbox.all-sections( (sections, current) => {
  set text(fill: black, size: footer-font-size)
  sections
    .map(s => if s == current { strong(s) } else { s })
    .join([ • ])
})

#let setup(body) = {
  set page(
    paper: "presentation-4-3",
    margin: 2cm,
    footer: align(
      bottom, 
      toolbox.full-width-block(
        fill: hszg-green,
        inset: 5pt
      )[
        #set align(horizon)
        #grid(
          columns: (auto, 1fr),
          inset: 5pt,
          [
            #block(inset: 5pt)[
              #sections-band
            ]
          ], [
            #set align(right)
            #text(weight: "bold", size: footer-font-size)[
              #toolbox.slide-number / #toolbox.last-slide-number
            ]
          ]
        )
      ]
    )
  )

  set text(
    font: "Noto Sans",
    size: 20pt,
  )

  body
}

#let title-slide(group: [], title: [], subtitle: [], extra: []) = slide[
  #set page(
    paper: "presentation-4-3",
    margin: 0pt,
    fill: hszg-green,
    background: align(center, rotate(24deg, move(dx: 150pt, dy: 10pt, image("../Images/hszg_ohne_text.png", width: 60%))))
  )

  #set align(horizon)
  #set text(
    font: "Noto Sans",
    size: 20pt,
  )

  #block(
    inset: (left: 3cm),
  )[
    #text(size: 32pt, weight: "bold", title) \
    #text(size: 24pt, weight: "regular", subtitle)
    #v(10mm)
    #text(size: 18pt, weight: "regular", group) \
    #text(size: 18pt, weight: "regular", extra)
  ]
]

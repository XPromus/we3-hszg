#import "../Template/definitions.typ": *

#let chapter-title-slide(
  section-name: content,
  title-text: str
) = [
  #slide[
    #toolbox.register-section([#section-name])
    = 
    #set align(horizon + center)
    #text(weight: "bold", size: 35pt)[#title-text]
  ]
]
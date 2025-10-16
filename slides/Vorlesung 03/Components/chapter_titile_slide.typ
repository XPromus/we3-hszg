#import "../Template/definitions.typ": *

#let chapter-title-slide(
  section-name,
  title-text
) = [
  #slide[
    #toolbox.register-section([#section-name])
    = 
    #set align(horizon + center)
    #text(weight: "bold", size: 25pt)[#title-text]
  ]
]
#import "definitions.typ": *

#show: codly-init.with()

#codly(languages: codly-languages)

#set page(paper: "presentation-4-3")
#set text(size: 25pt)

#let (definition) = frames(
  definition: ("Definition")
)

#show link: underline
#show link: set text(fill: blue)

#slide[
  #set align(horizon)
  = Web Engineering 3 
  *Vorlesung 1* \
  10.10.2025 \
  
  Christopher-Manuel Hilgner \
  #link("christopher.hilgner@stud.hszg.de")
]

#include "organisation.typ"

#include "structure.typ"

#include "database.typ"

#include "backend.typ"

#include "frontend.typ"

#include "containerization.typ"

#include "git.typ"

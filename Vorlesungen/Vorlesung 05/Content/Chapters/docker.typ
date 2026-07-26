#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": chapter-title-slide
#import "../../Components/docker-diagram.typ": docker_diagram

#chapter-title-slide(
  section-name: [Docker]
)

#slide[
  = Docker
  #set align(horizon + center)
  #docker_diagram
]

#include "Docker/dockerfile_slides.typ"

#include "Docker/compose_slides.typ"

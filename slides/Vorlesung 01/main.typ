#import "Template/definitions.typ": *
#import "Template/template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

#title-slide(
  group: [Hochschule Zittau/Görlitz],
  title: [Web Engineering 3],
  subtitle: [Vorlesung 1],
  extra: [Christopher-Manuel Hilgner]
)

#show: setup

#include "Content/content.typ"

#slide[
  =
  #set align(horizon + center)
  #image("Images/mio-mensa-im-osten.png", width: 100%)
]

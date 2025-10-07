#import "Template/definitions.typ": *
#import "Template/template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

#show link: underline
#show link: set text(fill: blue)

#show: setup

#title-slide(
  group: [Hochschule Zittau/Görlitz],
  title: [Web Engineering 3],
  subtitle: [Vorlesung 1],
  extra: [Christopher-Manuel Hilgner]
)

#include "Content/content.typ"

#import "template/definitions.typ": *
#import "template/template.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

#show link: underline
#show link: set text(fill: blue)

#show: setup

#title-slide(
  group: [Hochschule Zittau/Görlitz],
  title: [Web Engineering 3],
  subtitle: [Vorlesung 2],
  extra: [Christopher-Manuel Hilgner]
)

#include "Content/content.typ"

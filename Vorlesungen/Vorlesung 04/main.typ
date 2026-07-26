#import "Template/definitions.typ": *
#import "Template/template.typ": *

#show: frame-style(styles.boxy)

#show: codly-init.with()
#codly(languages: codly-languages)

#title-slide(
  group: [Hochschule Zittau/Görlitz],
  title: [Web Engineering 3],
  subtitle: [Vorlesung 4],
  extra: [Christopher-Manuel Hilgner]
)

#show: setup

#include "Content/content.typ"

#slide[
  =
  #set align(horizon + center)
  *MENSA IST VORBEI*
]

#slide[
  #toolbox.register-section([Seminar])
  = Seminar
  == Implementation eines Users in der Spring Anwendung
  #set align(horizon)
  #toolbox.side-by-side()[
    #set align(left)
    1. Implementiere die Entity für den User
    #set align(center)
    #grid(
      columns: (auto, auto),
      inset: 10pt,
      stroke: black,
      [*Name*], [*Type*],
      [id], [Long],
      [username], [String],
    )
    #set align(left)
    2. Implementiere die DTOs (Get, Update, Create) und die dazugehörigen Mapper
    3. Implementiere ein Repository, um die User in der Datenbank zu verwalten.
  ][
    4. Implementiere einen Service mit Funktionen zum:
    - Erstellen von Usern (POST)
    - Updaten von Usern (UPDATE)
    - Lesen von Usern (GET)
    - Löschen von Usern (DELETE)
    5. Implementiere einen Controller mit Mappings für die folgenden HTTP-Methoden:
    - GET
    - POST
    - PUT
    - DELETE
  ]
]

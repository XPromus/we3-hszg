#import "src/lib.typ": conf
#import "pages/glossary.typ": glossary_entries, print_glossary
#import "packages/packages.typ": *

#let title = "Web Engineering 3"
#let subtitle = ""
#let type_of_document = "Lehrplan"
#let authors = (
  (name: "Christopher-Manuel Hilgner", matrNr: ""),
)
#let additional = [
  Fakultät Elektrotechnik/Informatik
]

#set document(
  title: title,
)

#show: conf.with(
  subtitle: subtitle,
  authors: authors,
  type_of_document: type_of_document,
  additional: additional,
  logo: image("template/assets/hszg_logo.svg", format: "svg", width: 300pt)
)

#show: make-glossary
#register-glossary(glossary_entries)

#include "content/content.typ"
#pagebreak()

#print_glossary(glossary_entries)
#pagebreak()

#bibliography("sources.yml", title: [Quellenverzeichnis])

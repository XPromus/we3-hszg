//#import "config/packages/packages.typ": *
#import "../src/hszg_template.typ": *

#let title = "Musterarbeit an der HSZG"
#let subtitle = "Untertitel"
#let type_of_document = "Belegarbeit"
#let authors = (
  (name: "Max Mustermann", matrNr: "000000"),
)
#let additional = [
  Weitere optionale Informationen
]

#set document(
  title: title,
)

#show: conf.with(
  subtitle: subtitle,
  authors: authors,
  type_of_document: type_of_document,
  additional: additional,
  logo: image("assets/hszg_logo.svg", format: "svg", width: 300pt),
)

#let subtitle(
  content: str
) = {
  block()[
    #text(size: 15pt)[#content]
  ]
}

#align(center)[
  #v(150pt)
  //#image("../images/logo.svg", fit: "contain", width: 50%)
  #v(100pt)
  #text(size: 25pt)[
    *Web Engineering*
  ]
  #subtitle(content: "Entwicklung von Full-Stack-Web-Anwendungen mit Spring Boot")
  \ \
  #text(size: 18pt, style: "italic")[
    Script für Web Engineering 3
  ]
]
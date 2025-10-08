#import "template/definitions.typ": *

#import "glossary/glossary.typ": glossary-entrys
#show: make-glossary
#register-glossary(glossary-entrys)

#show: codly-init.with()
#codly(languages: codly-languages)
#show: frame-style(styles.boxy)

#set heading(numbering: "1.")

#show link: underline
#show link: set text(fill: blue)

#include "template/titlepage.typ"
#pagebreak()

#outline(
  title: [Inhaltsverzeichnis]
)
#pagebreak()

#set page(footer: context [
  Hochschule Zittau/Görlitz
  #h(1fr)
  #counter(page).display(
    "1",
  )
])

#include "content/content.typ"
#pagebreak()

#include "seminar/seminar.typ"
#pagebreak()

#print-glossary(glossary-entrys)
#pagebreak()

#bibliography("sources.yml", title: "Quellenverzeichnis")

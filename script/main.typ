#import "template/definitions.typ": *
#show: codly-init.with()
#codly(languages: codly-languages)
#show: frame-style(styles.boxy)

#set heading(numbering: "1.")

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

#include "content/planning.typ"
#pagebreak()

#include "content/overview/overview.typ"
#pagebreak()

#include "content/technologies.typ"
#pagebreak()

#include "content/user_stories.typ"
#pagebreak()

#include "content/backend/backend.typ"
#pagebreak()

#include "content/frontend/frontend.typ"
#pagebreak()

#include "content/debugging/debugging.typ"
#pagebreak()

#bibliography("sources.yml", title: "Quellenverzeichnis")

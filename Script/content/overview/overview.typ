#import "../../template/definitions.typ": *

= Übersicht

== Struktur einer Full Stack Web Application

Wie der Name vermuten lässt, wird in einer Full Stack Anwendung jeder Aspekt von einem Tech Stack implementiert.
Im Bereich der Web Entwicklung ist dies meist eine Kombination aus einem Backend und einem Frontend. 
Für das Backend kann auch noch eine Datenbank bereitgestellt werden.
Welche Technologien zu einem Projekt gehören wird im geplant.
Folgender Stack kommt hier in der Vorlesung zum Einsatz

#showybox(
  frame: (
    border-color: gray.darken(50%),
    title-color: gray.lighten(60%),
    body-color: gray.lighten(80%)
  ),
  title-style: (
    color: black,
    weight: "regular",
    align: center
  ),
  shadow: (
    offset: 3pt,
  ),
  title: "Techstack"
)[
  #let icon-width = 50pt
  #showybox(
    frame: (
      border-color: red.darken(50%),
      title-color: red.lighten(60%),
      body-color: red.lighten(80%)
    ),
    title-style: (
      color: black,
      weight: "regular",
      align: center
    ),
    title: "Frontend"
  )[
    #set align(horizon + center)
    #grid(
      columns: (1fr, 1fr, 1fr),
      image("../../images/Icons/devicon--svelte.svg", fit: "contain", width: icon-width),
      image("../../images/Icons/devicon--ts.svg", fit: "contain", width: icon-width),
      image("../../images/Icons/devicon--tailwindcss.svg", fit: "contain", width: icon-width),
    )
  ]

  #showybox(
    frame: (
      border-color: green.darken(50%),
      title-color: green.lighten(60%),
      body-color: green.lighten(80%)
    ),
    title-style: (
      color: black,
      weight: "regular",
      align: center
    ),
    title: "Backend"
  )[
    #set align(horizon + center)
    #grid(
      columns: (1fr, 1fr),
      image("../../images/spring_icon.svg", fit: "contain", width: icon-width),
      image("../../images/Icons/logos--kotlin-icon.svg", fit: "contain", width: icon-width),
    )
  ]

  #showybox(
    frame: (
      border-color: blue.darken(50%),
      title-color: blue.lighten(60%),
      body-color: blue.lighten(80%)
    ),
    title-style: (
      color: black,
      weight: "regular",
      align: center
    ),
    title: "Database"
  )[
    #set align(horizon + center)
    #grid(
      columns: (1fr),
      image("../../images/Icons/devicon--postgresql.svg", fit: "contain", width: icon-width),
    )
  ]

  #showybox(
    frame: (
      border-color: gray.darken(50%),
      title-color: gray.lighten(60%),
      body-color: gray.lighten(80%)
    ),
    title-style: (
      color: black,
      weight: "regular",
      align: center
    ),
    title: "Devops"
  )[
    #set align(horizon + center)
    #grid(
      columns: (1fr, 1fr, 1fr),
      image("../../images/Icons/logos--docker-icon.svg", fit: "contain", width: icon-width),
      image("../../images/Icons/devicon--podman.svg", fit: "contain", width: icon-width),
      image("../../images/Icons/devicon--git.svg", fit: "contain", width: icon-width)
    )
  ]
]
#pagebreak()

#include "spring_overview.typ"
#pagebreak()

#include "svelte-overview.typ"
#pagebreak()

#include "tailwindcss-overview.typ"

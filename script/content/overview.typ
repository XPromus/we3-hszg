#import "@preview/lilaq:0.5.0" as lq
#import "../template/definitions.typ": *

= Übersicht

== Struktur einer Full Stack Web Application

Wie der Name vermuten lässt, wird in einer Full Stack Anwendung jeder Aspekt von einem Tech Stack implementiert.
Im Bereich der Web Entwicklung ist dies meist eine Kombination aus einem Backend und einem Frontend. 
Für das Backend kann auch noch eine Datenbank bereitgestellt werden.
Welche Technologien zu einem Projekt gehören wird im geplant.
Folgender Stack kommt hier in der Vorlesung zum Einsatz

- SvelteKit
- TailwindCSS
- Spring
- PostgreSQL
- Docker/Podman

#let usage_data = (
  (name: "shadcn", usage: 19),
  (name: "Custom", usage: 24),
  (name: "Bootstrap", usage: 30),
  (name: "TailwindCSS", usage: 51)
)

Die aktuelle Verteilung der CSS Frameworks nach dem State of CSS 2025 @stateOfCss2025:

#lq.diagram(
  yaxis: (
    ticks: usage_data.map(element => element.name)
      .enumerate(),
    subticks: none
  ),
  xaxis: (
    label: [Nutzung in %]
  ),
  lq.hbar(
    usage_data.map(element => element.usage),
    range(4),
  ),
)

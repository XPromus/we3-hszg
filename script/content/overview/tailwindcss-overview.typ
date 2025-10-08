#import "../../template/definitions.typ": *

== Tailwind CSS Übersicht

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

// LTeX: enabled=true language=de-DE
#import "../../src/hszg_template.typ": *

= Informationen
<ch_basic_inormations>

#grid(
  columns: (1fr, 1fr),
  stroke: black,
  inset: 5pt,
  fill: (x, y) => {
    if (x == 0) {
      return hszg_main_color
    } else {
      return hszg_main_color.lighten(90%)
    }
  },
  [Gültigkeit], [Wintersemester 2026/2027],
  [Unterrichtsform], [Hybrid],
  [Code], [204400],
  [Modul], [Web Engineering 3],
  [ECTS], [5],
  [Prüfung], [Prüfungsleistung als Beleg (PB)],
  [Dozent], [Christopher-Manuel Hilgner],
  [E-Mail], [christopher-hilgner\@proton.me]
)
== Zeiten
<ch_times>

#grid(
  columns: (1fr, 1fr),
  stroke: black,
  inset: 5pt,
  fill: (x, y) => {
    if (x == 0) {
      return hszg_main_color
    } else {
      return hszg_main_color.lighten(90%)
    }
  },
  [Vorlesungsraum], [],
  [Seminarraum], [],
  [Onlineraum], [#link("https://jitsi.hszg.de/we3")],
  [Zeiten], [],
)

#import "../../Template/definitions.typ": *
#import "../../Components/chapter_titile_slide.typ": chapter-title-slide

#chapter-title-slide(
  section-name: [Prüfung],
  title-text: "Prüfung"
)

#slide[
  = Prüfung
  == Präsentationszeiten
  #set align(horizon + center)
  #toolbox.side-by-side()[
    Mittwoch \ 28.01.2026
    #set text(size: 15pt)
    #table(
      columns: (1.5fr, 0.5fr),
      align: center,
      [], [12:00 Uhr],
      [], [12:20 Uhr],
      [], [12:40 Uhr],
      [], [13:00 Uhr],
      [], [13:20 Uhr],
      [], [13:40 Uhr],
      [], [14:00 Uhr],
      [], [14:20 Uhr],
      [], [14:40 Uhr],
      [], [15:00 Uhr],
      [], [15:20 Uhr],
      [], [15:40 Uhr],
    )
  ][
    Freitag \ 30.01.2026
    #set text(size: 15pt)
    #table(
      columns: (1.5fr, 0.5fr),
      align: center,
      [],[10:00 Uhr],
      [],[10:20 Uhr],
      [],[10:40 Uhr],
      [],[11:00 Uhr],
      [],[11:20 Uhr],
      table.cell(fill: gray)[*Mensa*], table.cell(fill: gray)[11:40 Uhr],
      [], [12:00 Uhr],
      [], [12:20 Uhr],
      [], [12:40 Uhr],
      [], [13:00 Uhr],
      [], [13:20 Uhr],
      [], [13:40 Uhr],
    )
  ]
  
]

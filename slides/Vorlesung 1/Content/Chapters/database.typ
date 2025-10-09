#import "../../Template/definitions.typ": *

#import "../../Components/structure_diagram.typ": structure-diagram
#slide[
  =
  #toolbox.register-section[Database]
  #structure-diagram(
    true,
    false,
    false,
    false
  )
]

#slide[
  = Database
  #set align(horizon)
  - Enthält alle zu speichernden Daten
  - Manuelle Erstellung bzw. Konfigurierung nicht nötig
  - Erstellung der Tabellen geschieht durch das Backend
  - Manuelle Eingriffe nur dann in speziellen Situationen wie Migration nötig
  In dieser Vorlesung kommt PostgreSQL zum Einsatz
  #image("../../Images/Icons/devicon--postgresql.svg")
]

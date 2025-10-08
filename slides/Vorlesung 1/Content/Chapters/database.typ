#import "../../Template/definitions.typ": *

#slide[
  #set align(horizon + center)
  #image("../../Diagrams/fullstack_overview_database.svg")
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

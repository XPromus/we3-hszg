#import "../../Template/definitions.typ": *

#slide[
  #toolbox.register-section[Git]
  = Versionierung mit Git
  #set align(horizon)
  - Versionierung aller Dateien in einem Projekt
  - Mit jedem Commit wird ein Snapshot vom aktuellen Stand gemacht
  - Wenn keine Änderungen an einer Datei vorgenommen wurden, wird auf den Snapshot mit der letzten Änderung verwiesen
]

#slide[
  = Zustände
  #set align(horizon)
  *Modified*
    - Datei wurde geändert aber noch in die Datenbank committed
  *Staged*
    - Modifizierte Datei wurde markiert, damit sie in den nächsten Commit-Snapshot kommt
  *Committed*
    - Daten wurden erfolgreich in der Datenbank gespeichert
]

#slide[
  = Workflow
  #set align(horizon)
  1. Modifizierung von Dateien
  2. Nur Änderungen stagen, die Teil des nächsten Commits werden sollen
  3. Ausführen eines Commits, welcher alle Änderungen in die Datenbank übernimmt, die als staged markiert wurden
]

#slide[
  = Git - Online
  #set align(horizon)
  *GitHub* \
  *GitLab* von der TU Chemnitz: #link("https://gitlab.hrz.tu-chemnitz.de/")[https://gitlab.hrz.tu-chemnitz.de/]
]

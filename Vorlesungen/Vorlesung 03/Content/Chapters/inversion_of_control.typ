#import "../../Template/definitions.typ": *

#slide[
  #toolbox.register-section([Inversion of Control])
  =
  #set align(horizon + center)
  #image("../../Images/logos--spring.svg", fit: "contain")
]

#slide[
  
  = Inversion of Conrol
  #set align(horizon)
  - Kernpunkt vieler Frameworks, die das Hinzufügen und Erweitern von Funktionalitäten erlauben
  - Framework erhält Kontrolle über alles, was der Nutzer geschrieben hat
  - Folgendes Prinzip aus Hollywood: *"Don't call us, we'll call you"*
]

#slide[
  = Inversion of Control
  #set align(horizon)
  - Framework ruft vom Nutzer geschriebene Funktionen auf
  - Framework stellt Hauptprogramm dar
  - Koodiniert Aktivitäten der Anwendung
  - Erweiterbares Skelett für eine Anwendung
  - Nutzer können generische Algorithmen auf spezifische Anwendungsfälle zuschneiden
]

//TODO: Etwas mehr Content

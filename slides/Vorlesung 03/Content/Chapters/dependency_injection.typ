#import "../../Template/definitions.typ": *

#slide[
  #toolbox.register-section([Dependency Injection])
  = Dependency Injection
  #set align(horizon)
  - *Ziel*: Entkoppelung von Abhängigkeiten
  - Entkoppelung macht Testen einfacher und erhöht Lesbarkeit
  - Klassen müssen nur noch ihre Abhängigkeiten definieren
  - Abhängigkeiten werden durch Container bereitgestellt
]

#slide[
  #toolbox.register-section([IoC Container])
  = IoC Container
  #set align(horizon)
  - Der IoC Container wird durch `ApplicationContext` representiert
  - Instantiierung, Konfiguration und Assembling von Beans
  - Intruktionen dafür werden durch Konfigurations-Metadaten übergeben
  - Wege der Konfiguration:
    - Annotations
    - Konfigurations-Klasse mit Factory Methoden
    - XML-Dateien
    - Groovy Scripts
]

#slide[
  = IoC Container
  #set align(horizon)
  - Manuelle Erstellung ist nicht von Nöten
  - Spring kombiniert die erstellten Klassen mit Konfigurations-Metadaten
  - Nach der Initialisierung von `ApplicationContext` steht ein ausführbares, konfiguriertes System bereit
]

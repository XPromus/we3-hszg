#import "../../Template/definitions.typ": *

#slide[
  = Singleton Pattern
  == Übersicht
  #set align(horizon)
  - Zeil: Eine Klasse besitzt nur eine Instanz
  - Instanz soll immer genutzt werden, wenn Zugriff auf Singleton Klasse gebraucht wird
  - Theoretisch reicht globale Variable
  - Stoppt nicht Erstellung von mehreren Instanzen
]

#slide[
  = Singelton Pattern
  == Übersicht
  #set align(horizon)
  - Singleton-Klasse muss selbst ihre einzige Instanz verwalten
  - Erstellung läuft über Klasse und Erstellung mehrerer Instanzen wird blockiert
  - Singleton-Klasse stellt Zugang zur Instanz bereit
  - Zugriff sollte nur über die `Instance` Methode möglich sein
  - `Instance` erstellt Instanz, wenn noch keine vorhanden ist
]

#slide[
  = Singleton Pattern
  == Struktur
  #set align(horizon + center)
  #let defaultNode(
    x: int,
    y: int,
    shape: fletcher.shapes,
    name: label,
    content
  ) = {
    node(
      (x, y),
      name: name,
      fill: gray.lighten(90%),
      stroke: black,
      shape: shape,
    )[
      #content
    ]
  }

  #diagram(
    node-stroke: 1pt,
    node-inset: 10pt,
    defaultNode(
      x: 0, 
      y: 0, 
      name: <singletonNode>, 
      shape: rect
    )[
      #table(
        columns: (auto),
        align: horizon,
        [*Singleton*],
        [```java static Instance() ```],
        [```java SingletonOperation() ```],
        [```java GetSingletonData() ```],
        [```java static uniqueInstance() ```],
        [singletonData],
      )
    ],
    defaultNode(
      x: 2, 
      y: 0, 
      name: <singletonReturnNode>, 
      shape: chevron
    )[
      ```java return uniqueInstance ```
    ],
    edge((0, -0.5), "O--", (1.6, 0), stroke: 1pt)
  )
]

#slide[
  = Singleton Pattern
  == Wann sollte es genutzt werden?
  #set align(horizon)
  - Wenn nur eine Instanz einer Klasse existieren soll
  - Instanz sollte von einem definierten Punkt erreichbar sein
  - Einzelne Klasse sollte durch Subklassen erweiterbar sein
  - Client sollte erweiterte Instanz nutzen können ohne Code zu modifizieren
]

#slide[
  = Singleton Pattern - Vorteile
  #set align(horizon)
  1. *Kontrollierter Zugriff auf eine einzige Instanz*: Da die Singleton-Klasse ihre eigene Instanz verwaltet, kann sie genau festlegen, wie auf sie zugegriffen wird und wer auf sie zugreifen kann.
  2. *Reduzierter Namespace*: Verbesserung zu globalen Variablen. Der Namespace wird dabei nicht mit globalen Variablen unnötig belegt.
  3. *Erlaubt das Anpassen von Operationen und Repräsentation*: Es erlaubt einfaches Wechseln von erlaubten Klasseninstanzen. Die gleiche Logik, die nur eine Instanz erlaubt, kann auf eine beliebige Anzahl erweitert werden. Nur die Zugriffsfunktion muss sich ändern.
  4. *Höhere Flexibilität als Klassenoperationen*: Statische Klassenoperationen können die gleiche Funktionalität wie ein Singleton enthalten. Allerdings erlaubt diese Methodik nur schwer das Erstellen von mehreren Instanzen. Außerdem sind diese Operationen nicht `virtual`, also können sie nicht überschrieben werden.
]

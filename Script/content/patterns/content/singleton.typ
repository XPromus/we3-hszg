#import "../../../template/definitions.typ": *

== Singleton <PatternsSingleton>
Das Ziel eines Singletons ist es, dass eine Klasse nur eine Instanz besitzen kann. 
Diese Instanz soll immer dann zur Verfügung gestellt werden, wenn eine andere Klasse eine Instanz der Singleton-Klasse benötigt. \

Der Zugriff auf eine einzelne Instanz kann theoretisch über eine globale Variable gelöst werden. 
Die würde uns aber nicht davon abhalten, weitere Instanzen zu erstellen. 
Deshalb sollte die Singleton-Klasse selbst dafür sorgen, dass sie ihre einzige Instanz managt und dabei neue Versuche des Instanziierens blockiert. 
Neben diesem Blockieren sollte die Klasse auch Zugang zu ihrer einzigen Instanz zur Verfügung stellen. 
Dabei sollte der Zugang zu der Singleton-Instanz nur durch die Instance-Methode in der Singleton-Klasse möglich sein. \

=== Wann sollte das Singleton-Pattern verwendet werden?
Es sollte nur eine Instanz einer Klasse existieren und es sollte von einem gut definierten Punkt erreichbar sein. \

Wenn eine einzelne Instanz einer Klasse durch Subklassen erweiterbar sein sollte. 
Dabei sollten Clients in der Lage sein, die erweiterte Instanz nutzen zu können, ohne den Code zu modifizieren.

=== Struktur <PatternsSingletonStructure>

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

#figure(
  caption: "Struktur des Singleton Patterns"
)[
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
    edge((0, -0.6), "O--", (1.6, 0), stroke: 1pt)
  )
] <SingletonStructure>

=== Vorteile <PatternsSingletonPros>
1. *Kontrollierter Zugriff auf eine einzige Instanz*: Da die Singleton-Klasse ihre eigene Instanz verwaltet, kann sie genau festlegen, wie auf sie zugegriffen wird und wer auf sie zugreifen kann.
2. *Reduzierter Namespace*: Das Singleton-Pattern stellt eine Verbesserung zu globalen Variablen dar. Der Namespace wird dabei nicht mit globalen Variablen unnötig belegt.
3. *Erlaubt das Anpassen von Operationen und Repräsentation*: Es erlaubt einfaches Wechseln von erlaubten Klasseninstanzen. Die gleiche Logik, die nur eine Instanz erlaubt, kann einfach auf eine beliebige festgesetzte Anzahl erweitert werden. Nur die Zugriffsfunktion muss sich dabei ändern.
4. *Höhere Flexibilität als Klassenoperationen*: Statische Klassenoperationen können die gleiche Funktionalität wie ein Singleton enthalten. Allerdings erlaubt diese Methodik nur schwer das Erstellen von mehreren Instanzen. Außerdem sind diese Operationen nicht `virtual`, also können sie nicht überschrieben werden.

@designPatternsSingleton

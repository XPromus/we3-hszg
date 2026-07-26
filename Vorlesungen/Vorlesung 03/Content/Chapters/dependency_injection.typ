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
  = Dependency Injection
  #set align(horizon)
  - Assembler Objekte bevölkern Felder in Klassen nach definierten Anforderungen
  - Kann Implementation von einem Interface sein
  - Drei Möglichkeiten der Dependency Injection
  1. Contructor Injection bzw. Type 3 IoC
  2. Setter Injection bzw. Type 2 IoC
  3. Interface Injection bzw. Type 1 IoC
]

#slide[
  = Beispiel von Dependency Injection
  #set align(horizon + center)
  #let defaultNode(
    x: int,
    y: int,
    name: label,
    content
  ) = {
    node(
      (x, y),
      name: name,
      fill: gray.lighten(90%),
      stroke: gray,
      corner-radius: 2pt
    )[
      #content
    ]
  }

  #diagram(
    node-stroke: 2pt,
    node-inset: 10pt,
    defaultNode(x: 0, y: 0, name: <MovieLister>)[
      MovieLister
    ],
    defaultNode(x: 1, y: 0, name: <MovieFinderInterface>)[
      _interface_ \
      MovieFinder
    ],
    defaultNode(x: 1, y: 1, name: <MovieFinderImpl>)[
      MovieFinderImpl
    ],
    defaultNode(x: 3, y: 1, name: <Assembler>)[
      Assembler
    ],
    edge(<Assembler>, "-|>", <MovieFinderImpl>)[Creates],
    edge(<Assembler>, "--|>", <MovieLister>, bend: 55deg),
    edge(<MovieLister>, "--|>", <MovieFinderInterface>),
    edge(<Assembler>, "--|>", <MovieFinderInterface>, bend: -30deg),
    edge(<MovieFinderImpl>, "-|>", <MovieFinderInterface>)
  )
  #set align(left)
  - `MovieLister` Klasse benötigt Implementation von `MovieFinder`
  - Assembler stellt Implementation bereit und erfüllt Abhängigkeit
]

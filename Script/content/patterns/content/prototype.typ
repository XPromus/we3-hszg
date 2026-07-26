#import "../../../template/definitions.typ": *

== Prototype <PatternPrototype>
Das Ziel von Prototypen ist es, basierend auf einer existierenden Instanz (dem Prototypen) neue Kopien zu erstellen. \

Es sollte genutzt werden, wenn ein System unabhängig davon sein sollte, wie seine Produkte erstellt, zusammengebaut und repräsentiert werden, und:
- Wenn Klassen instanziiert werden sollen, die zur Runtime spezifiziert wurden, zum Beispiel durch `dynamic loading`.
- Um zu vermeiden, dass man eine Hierarchie an Factories baut, die die Klassenhierarchie kopiert.
- Wenn Klassen nur eine begrenzte Anzahl an State besitzen können. Es könnte da von Vorteil sein, diese Varianten als Prototypen zu definieren.

=== Struktur <PatternPrototypeStructure>
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
  caption: "Struktur des Prototype-Patterns"
)[
  #diagram(
    node-stroke: 1pt,
    node-inset: 7.5pt,
    defaultNode(x: 0, y: 0, shape: rect, name: <Client>)[
      #table(
        columns: (auto),
        [*Client*],
        [Operation()]
      )
    ],
    defaultNode(x: 0, y: 1, shape: chevron, name: <p>)[
      p = prototype -> Clone()
    ],
    defaultNode(x: 1.5, y: 0, shape: rect, name: <Prototype>)[
      #table(
        columns: (auto),
        [*Prototype*],
        [Clone()]
      )
    ],
    defaultNode(x: 1, y: 1, shape: rect, name: <ConcretePrototype1>)[
      #table(
        columns: (auto),
        [*ConcretePrototype1*],
        [Clone()]
      )
    ],
    defaultNode(x: 1, y: 2, shape: chevron, name: <return1>)[
      return copy of self
    ],
    defaultNode(x: 2, y: 1, shape: rect, name: <ConcretePrototype2>)[
      #table(
        columns: (auto),
        [*ConcretePrototype2*],
        [Clone()]
      )
    ],
    defaultNode(x: 2, y: 2, shape: chevron, name: <return2>)[
      return copy of self
    ],
    edge(<Client>, "O--", <p>, stroke: 1pt),
    edge(<Client>, "-|>", <Prototype>, stroke: 1pt),
    edge(<Prototype>, "-", <ConcretePrototype1>, stroke: 1pt),
    edge(<Prototype>, "-", <ConcretePrototype2>, stroke: 1pt),
    edge(<ConcretePrototype1>, "O--", <return1>, stroke: 1pt),
    edge(<ConcretePrototype2>, "O--", <return2>, stroke: 1pt),
  )
]

- *Prototype*: Deklariert ein Interface, damit es kopiert werden kann. 
- *ConcretePrototype*: Implementiert eine Operation, damit es sich selbst kopieren kann. 
- *Client*: Erstellt ein neues Objekt, indem der Prototype gefragt wird, ob er eine neue Kopie von sich selbst erstellen kann.

=== Vorteile <PatternPrototypePros>
1. *Hinzufügen und Entfernen von Produkten zur Laufzeit*: Durch das Registrieren einer Prototyp-Instanz beim Client kann eine Produktklasse in das System integriert werden. Das kann, anders als bei anderen Patterns, zur Laufzeit geschehen.
2. *Spezifizierung von neuen Objekten durch das Ändern von Werten*: Dynamische Systeme erlauben das Definieren von neuem Verhalten durch Objektkomposition, zum Beispiel durch das Anpassen von Variablen. Neue Arten von Objekten werden somit durch das Instanziieren von existierenden Klassen als Prototypen von Client-Objekten erzeugt. Der Client kann somit neue Möglichkeiten erlangen, indem er Aufgaben an Prototypen auslagert.
3. *Spezifizierung von neuen Objekten durch das Ändern von Struktur*: Bauen von Objekten durch Teile und Unterteile. Komplexe Strukturen können so vom Nutzer erzeugt werden. Das Prototype-Pattern unterstützt solche Ansätze durch `Deep Copy`, die im Parent-Teil implementiert sein muss.
4. *Reduziertes Subclassing*: Anders als Factories erlaubt das Prototype-Pattern das Erstellen von neuen Objekten ohne spezifische Factory-Methoden. Dadurch wird keine `Creator` Klassenhierarchie benötigt.
5. *Dynamische Konfiguration einer Anwendung durch Klassen*: Wenn die Umgebung es erlaubt, können dynamisch geladene Klassen durch das Prototype-Pattern instanziiert werden. Der Constructor der Klasse kann nicht in dieser Umgebung genutzt werden. Deshalb wird eine Instanz automatisch beim Laden erstellt und mit einem Prototype-Manager registriert. Über den Prototype-Manager können diese Klassen dann abgefragt werden.

=== Nachteile <PatternPrototypeCons>
Jede Subklasse eines Prototypen muss die Clone-Operation besitzen. 
Das kann in manchen Fällen schwierig werden. 
Zum Beispiel, wenn die Klasse bereits existiert oder wenn die Zielklasse andere Objekte enthält, die sich nicht zum Kopieren eignen oder Zirkelverweise besitzen.

@designPatternsPrototype

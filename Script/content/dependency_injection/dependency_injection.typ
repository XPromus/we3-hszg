#import "../../template/definitions.typ": *

= Inversion of Control & Dependency Injection <IoCDependencyInjection>
Mit der steigenden Komplexität von J2EE und dem Aufkommen von unterschiedlichen Problemen wurde die Entwicklung von IoC Containern vorangetrieben. 
Diese Container sollen eine Anwendung aus unterschiedlichen Komponenten aus unterschiedlichen Projekten in eine funktionierende Anwendung bauen. 
Viele der Produkte, die dabei entstanden sind, setzen im Kern auf Dependency Injection.
@inversionOfControlContainersDependencyInjection

== Inversion of Control
Inversion of Control ist ein Phänomen, welches oft der definierende Faktor von Frameworks ist. 
Vor allem, wenn man Funktionalitäten erweitern oder neu hinzufügen möchte. 
Das Ziel ist es dabei, dem Framework die Kontrolle über alles zu geben, dass ich als Nutzer geschrieben habe. 
Dabei wird folgendem Prinzip aus Hollywood gefolgt: "Don't call us, we'll call you" @inversionOfControlMartinFowler

Funktionen, die vom User definiert werden, um ein Framework anzupassen, werden vom Framework aufgerufen und nicht vom User. 
Das Framework spielt dabei die Rolle eines Hauptprogramms, welches die Aktivitäten der Anwendung koordiniert und sequenziert. 
Das Framework kann damit als ein erweiterbares Skelett für eine Anwendung dienen. 
Generische Algorithmen in Frameworks können so durch den User auf spezifische Anwendungsfälle zugeschnitten werden. @inversionOfControlDesigningReusableClasses \

Inversion of Control ist ein essentieller Bestandteil eines Frameworks, welches es von einer Library differenziert. 
Eine Library stellt stellt aufrufbare Funktionen bereit, die vom User aufgerufen werden können. 
Ein Framework hingegen enthält ein abstrakteres Design, welches mit mehr eingebauten Funktionalitäten und Verhalten daherkommt.
Damit man es benutzen kann, muss selbst definiertes Verhalten an unterschiedlichen Stellen in das Framework injeziert werden. 
Das kann durch Subklassen oder selbst definierte Klassen geschehen. 
Das Framework ruft dann den vom User erstellen Code an an diesen Punkten auf. 

Dependency Injection ist dabei eine von vielen Formen von Inversion of Control. 
In Spring kommt sie mit dem #text(weight: "bold", fill: red)[I]nversion#text(weight: "bold", fill: red)[o]f#text(weight: "bold", fill: red)[C]ontrol Container zum Einsatz. 
Neben IoC Containern kommen auch EJBs (Jakarta Enterprise Beans) oft zum Einsatz. @inversionOfControlMartinFowler

*Beispiel zu IoC*:
```ruby
  puts 'What is your name?'
  name = gets
  process_name(name)
  puts 'What is your quest?'
  quest = gets
  process_quest(quest)
```
Der Code hier ist in Kontrolle, wann Aufrufe stattfinden und wann sie verarbeitet werden.

```ruby
  require 'tk'
  root = TkRoot.new()
  name_label = TkLabel.new() {text “What is Your Name?”}
  name_label.pack
  name = TkEntry.new(root).pack
  name.bind(“FocusOut”) {process_name(name)}
  quest_label = TkLabel.new() {text “What is Your Quest?”}
  quest_label.pack
  quest = TkEntry.new(root).pack
  quest.bind(“FocusOut”) {process_quest(quest)}
  Tk.mainloop()
```
Das Windowing System hat nun die Kontrolle darüber, wann Aufrufe stattfinden. 

== Dependency Injection
Die Grundidee hier ist, dass es ein Assembler Objekt gibt, welches Felder in Klassen, nach definierten Anforderungen bevölkert.
Das kann zum Beispiel die Implementation von einem Interface sein. \

Es gibt dabei drei Möglichkeiten der Dependency Injection: 
- Contructor Injection, Type 3 IoC #customref(<ContructorInjection>)
- Setter Injection, Type 2 IoC #customref(<SetterInjection>)
- Interface Injection, Type 1 IoC

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

#figure(
  caption: [Abhängigkeiten für Dependency Injection],
)[
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
]<dependencyInjectionDependencyDiagram>

In @dependencyInjectionDependencyDiagram benötigt die `MovieLister` Klasse eine Implementation von dem `MovieFinder` Interface. 
Diese Implementation wird durch den Assembler erstellt, um die Anhängigkeit in `MovieLister` zu erfüllen.

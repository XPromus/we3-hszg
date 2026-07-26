#import "../../Template/definitions.typ": *

#slide[
  #toolbox.register-section([Dependency Injection in Spring])
  = Dependency Injection in Spring
  #set align(horizon)
  - Abhängigkeiten werden in Contructor, Factory Methoden oder Properties definiert
  - In Spring: Contructor oder Setter Methoden
  - Container übergibt beim Erstellen einer Bean alle Abhängigkeiten
  - Bean hat keine Kontrolle über Erstellung oder Ort ihrer Abhängigkeiten
]

#slide[
  #set align(horizon + center)
  #guideline[Contructor oder Setter DI][
    Der Contructor sollte verpflichtende Abhängigkeiten enthalten. \ \
    Setter Methoden eignen sich gut für optionale Abhängigkeiten.
    ```kotlin @Autowired``` kann bei Settern genutzt werden, damit die Property eine verpflichtende Abhängigkeit wird. 
    Der Constructor sollte da aber bevorzugt werden. 
  ]
]

#slide[
  = Contructor Injection
  #set align(horizon)
  - Container ruft Contructor auf mit so vielen Argumenten wie Abhängigkeiten
  - Jedes Argument ist eine Abhängigkeit
  ```kotlin
    class ExampleClass(private val dependency: Dependency) {

    }
  ```
]

#slide[
  = Setter Injection
  #set align(horizon)
  - Leerer Contructor wird aufgerufen
  - Container ruft Setter Methode in erstellten Beans auf
  ```kotlin
    class ExampleClass {
      lateinit var dependency: Dependency
    }
  ```
]

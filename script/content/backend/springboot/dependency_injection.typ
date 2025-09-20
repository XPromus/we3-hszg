#import "../../../template/definitions.typ": *

=== Dependency Injection
#link("https://docs.spring.io/spring-framework/reference/core/beans/dependencies/factory-collaborators.html")[Ressource zu Dependency Injection @springDependencyInjection]

Das Ziel der Dependency Injection ist es, Abhängigkeiten zu entkoppeln. 
Diese Entkopplung macht den Code lesbarer und das Testen einfacher.
Eine Klasse definiert nur noch, was sie für Abhängigkeiten benötigt. 
Sie sucht aber nicht selbst nach diesen Abhängigkeiten. 
Sie werden durch einen Container bereitgestellt.
Das definieren der benötigten Abhängigkeiten kann durch Constructor Argumente, Factory Methoden oder Properties geschehen.
Der Container übergibt beim Erstellen einer Bean die bentötigten Abhängigkeiten.
Die Bean hat in diesem Fall keine Kontrolle über die Erstellung oder den Ort ihrer Abhängigkeiten @springDependencyInjection. \ \
Bei Spring gibt es zwei Methoden zur Dependency Injection: *Constructor* basierte Injection oder *Setter* basierte Injection.

#guideline[Contructor oder Setter DI][
  Der Contructor sollte verpflichtende Abhängigkeiten enthalten. \ \
  Setter Methoden eignen sich gut für optionale Abhängigkeiten.
  ```kotlin @Autowired``` kann bei Settern genutzt werden, damit die Property eine verpflichtende Abhängigkeit wird. 
  Der Constructor sollte da aber bevorzugt werden. 
]

==== Constructor Injection
Der Container ruft einen Constructor mit so vielen Argumenten auf, wie Abhängigkeiten benötigt werden. Jedes Argument representiert dabei eine Abhängigkeit.

```kotlin
class ExampleClass(private val dependency: Dependency) {

}
```

==== Setter Injection
Der Container ruft die Setter Methoden in den erstellen Beans auf, nachdem ein Constructor ohne Argumente aufgerufen wurde.

```kotlin
class ExampleClass {
  lateinit var dependency: Dependency
}
```

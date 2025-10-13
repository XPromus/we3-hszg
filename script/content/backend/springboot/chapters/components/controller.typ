#import "../../../../../template/definitions.typ": *

==== Controller <springboot_controller>

```kotlin
@RestController
@RequestMapping("/path/to/controller")
class Controller @Autowired constructor(
  private val service: Service
) {
  @GetMapping
  @ReponseStatus(HttpStatus.OK)
  fun getEntities(): List<GetEntityDto> {

  }
}
```

===== Mappings
Mit der `@RequestMapping` Annotation können Anfragen auf Methoden in einem Controller gemapped werden.
Es kommt mit unterschiedlichen Parametern, die Zuordnung über verschiedene Wege erlauben. 
Folgende Parameter werden unterstützt: URL, Http Methode, Request Parameter, Header und Media Typen. \

Für HTTP Methoden gibt es weitere Annotationen als Abkürzungen von `RequestMapping`:
- `@GetMapping`
- `@PostMapping`
- `@PutMapping`
- `@DeleteMapping`
Diese Annotation sind selbst mit `RequestMapping` versehen, decken aber einen kleineren Bereich ab. 
Diese Annotationen wurden eingeführt, da ein Controller die meisten seiner Methoden auf eine bestimmte HTTP Methode mappen sollte. 
`@RequestMapping` würde da nicht in Frage kommen, da es auf jede beliebige HTTP Methode in betracht zieht.

#notice()[Nuzten von mehreren `@RequestMapping` Annotationen][
  Es kann immer nur eine `@RequestMapping` an einem Element geben. 
  Ein Element ist in diesem Fall eine Klasse, Methode oder ein Interface. 
  Sollten dennoch mehrere Annotationen an einem Element vorhanden sein, wird nur die erste genutzt. 
  Diese Regel gilt auch für Annotationen, die auf `@RequestMapping` basieren.
]
@springMappingRequests

===== URI Patterns
Beispiele:
- `"/resources/ima?e.png"` - Ein Zeichen wird abgeglichen
- `"/resources/*.png"` - Eine beliebige Anzahl an Zeichen wird abgeglichen
- `"/resources/**"` - Mehrere Pfad Segmente werden abgelgichen
- `"/projects/{project}/versions"` - Pfad Element wird abgeglichen und als Variable ausgelesen
- `"/projects/{project:[a-z]+}/versions"` - Pfad ELement wird abgeglichen mit Regex und als Variable ausgelesen

Pfad Element, die mit `{}` als Variable gespeichert wurden, können mit `@PathVariable` ausgelesen werden.
```kotlin
@GetMapping("/owners/{ownerId}/pets/{petId}")
fun findPet(@PathVariable ownerId: Long, @PathVariable petId: Long): Pet {

}
```

Pfad Variablen können auch schon auf der Klassen Ebene deklariert werden.
```kotlin
@Controller
@RequestMapping("/owners/{ownerId}")
class OwnerController {
  @GetMapping("/pets/{petId}")
  fun findPet(@PathVariable ownerId: Long, @PathVariable petId: Long): Pet {

  }
}
```

Variablen aus der URI werden automatisch in den korrekten Typ konvertiert. 
Einfache Typen wie zum Beispiel `int`, `long` oder `Date` werden direkt unterstüzt. 
Konvertierungen für komplexere Typen können implementiert werden. \

Wenn die namen im Pfad und der Variable nicht übereinstimmen kann auch ein Name angegeben werden, nachdem gesucht werden soll.
```kotlin
@PathVariable("customName")
```
@springControllersUriPatterns

===== Error Handling

```kotlin
class CustomException(message: String): RuntimeException(message) {

}
```

```kotlin
@ControllerAdvice
class ExceptionControllerAdvice {
  fun handleCustomException(
    ex: CustomException
  ): ResponseEntity<ErrorMessageModel> {
    val errorMessage = ErrorMessageModel(
      HttpStatus.NOT_FOUND.value(),
      ex.message
    )
    return ResponseEntity(
      errorMessage, 
      HttpStatus.NOT_FOUND
    )
  }
}
```
@springRestErrorHandling

`@ControllerAdvice` wird hier alle Controller im Programm ansprechen. 
Alternativ kann das Einflussgebiet eingeschränkt werden. 
Hier sind einige Beispiele zur Einschränkung:

```kotlin
@ControllerAdvice(annotations = [RestController::class])
class Advice
```
Die Klasse wird nur noch Controller, die mit `@RestController` annotiert sind, ansprechen.

```kotlin
@ControllerAdvice("org.example.controllers")
class Advice
```
Die Klasse wird nur noch Controller, die sich in dem angegeben Package Pfad befinden, ansprechen.

```kotlin
@ControllerAdvice(
  assignableTypes = [
    ControllerInterface::class, 
    AbstractController::class
    ]
  )
class Advice
```
Die Klasse wird nur noch Controller ansprechen, die auf das Interface oder den abstrakten Controller zugewiesen werden können.
@springControllerAdvice

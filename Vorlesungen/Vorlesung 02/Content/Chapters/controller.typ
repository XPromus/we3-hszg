#import "../../template/definitions.typ": *
#import "../../Components/chapter_title_slide.typ": chapter-title-slide

#chapter-title-slide(active-component: 2)

#slide[
  = Controller
  #set align(horizon + center)
  ```kotlin
    @RestController
    @RequestMapping("/path/to/controller")
    class Controller(
      private val service: Service
    ) {
      @GetMapping
      @ReponseStatus(HttpStatus.OK)
      fun getEntities(): List<GetEntityDto> {

      }
    }
  ```
]

#slide[
  = Mappings
  #set align(horizon)
  - `@RequestMapping` Annotation erlaubt das Mapping von Anfragen auf Methoden in der annotierten Klasse
  - Unterschiedliche Parameter für die Zuordnung:
    - URL
    - Http Methode
    - Request Parameter
    - Header und Media Typen
  ```kotlin
    @RequestMapping("/path/to/controller")
  ```
]

#slide[
  = HTTP Methoden Mappings
  #set align(horizon)
  - Für HTTP Methoden gibt es Annotationen, die als Abkürzung von `@RequestMapping` dienen:
    - `@GetMapping`
    - `@PostMapping`
    - `@PutMapping`
    - `@DeleteMapping` 
  - Sie nutzen selbst `@RequestMapping`
  - Annotationen existieren, da ein Controller die meisten seinr Methoden auf HTTP Methoden mappen sollte
  - `@RequestMapping` würde jede beliebige HTTP Methode mappen
]

#slide[
  = HTTP Methoden Mappings
  #set align(horizon + center)
  #notice()[Nuzten von mehreren `@RequestMapping` Annotationen][
    Es kann immer nur eine `@RequestMapping` an einem Element geben. 
    Ein Element ist in diesem Fall eine Klasse, Methode oder ein Interface. 
    Sollten dennoch mehrere Annotationen an einem Element vorhanden sein, wird nur die erste genutzt. 
    Diese Regel gilt auch für Annotationen, die auf `@RequestMapping` basieren.
  ]
]

#slide[
  = URI Patterns für Mappings
  #set align(horizon)
  *Beispiele*:
  - `"/resources/ima?e.png"` - Ein Zeichen wird abgeglichen
  - `"/resources/*.png"` - Eine beliebige Anzahl an Zeichen wird abgeglichen
  - `"/resources/**"` - Mehrere Pfad Segmente werden abgeglichen
  - `"/projects/{project}/versions"` - Pfad Element wird abgeglichen und als Variable ausgelesen
  - `"/projects/{project:[a-z]+}/versions"` - Pfad ELement wird abgeglichen mit Regex und als Variable ausgelesen
]

#slide[
  = Variablen in Pfaden
  #set align(horizon)
  - Variablen können in Pfaden mit `{}` angegeben werden
  - Mit `@PathVariable` können diese Variablen ausgelesen werden
  #set align(center) 
  ```kotlin
    @GetMapping("/owners/{ownerId}/pets/{petId}")
    fun findPet(
      @PathVariable ownerId: Long, 
      @PathVariable petId: Long
    ): Pet {

    }
  ```
]

#slide[
  = Variablen in Pfaden
  #set align(horizon)
  - Pfad Variablen können bereits auf Klassenebene deklariert werden
  #set align(center) 
  ```kotlin
    @RestController
    @RequestMapping("/owners/{ownerId}")
    class OwnerController {
      @GetMapping("/pets/{petId}")
      fun findPet(
        @PathVariable ownerId: Long, 
        @PathVariable petId: Long
      ): Pet {

      }
    }
  ```
]

#slide[
  = Variablen in Pfaden
  #set align(horizon)
  - Konvertierung zu den gewollten Typen findet automatisch statt
  - Einfache Typen wie `int`, `long` oder `Date` werden untersützt
  - Eigene Konvertierungen können für komplexere Typen implementiert werden
  - Wenn der Name im Pfad nicht mit dem Variablennamen übereinstimmt, kann ein Name angegeben werden
  ```kotlin
    @PathVariable("customName")
  ```
]

//TODO: Evtl. noch Error Handling

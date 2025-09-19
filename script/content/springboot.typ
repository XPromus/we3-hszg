#import "../definitions.typ": *
#show: frame-style(styles.boxy)
#show: codly-init.with()
#codly(languages: codly-languages)

== Springboot

=== Struktur für ein Projekt
#table(
  columns: 3,
  [module], [], [],
  [], [dtos], [],
  [], [], [`CreateEntityDto`],
  [], [], [`EditEntityDto`],
  [], [], [`GetEntityDto`],
  [], [mapper], [],
  [], [], [`CreateEntityDtoMapper`],
  [], [], [`EditEntityDtoMapper`],
  [], [], [`GetEntityDtoMapper`],
  [], [`Controller`], [],
  [], [`Entity`], [],
  [], [`Repository`], [],
  [], [`Service`], [],
  [`Application`], [], [],
)
- module
- - dtos
- - mapper
- - `Controller`, `Entity`, `Repository`, `Service`
- `Application`

#notice[Disclaimer][
Hier handelt sich um Richtlinien. Die wirkliche Situation kann von diesen abweichen, sollte sich die Anpassung besser für das Erreichen der Ziele eignen.
]

Jeder Controller sollte idealerweise einen Mapping für jede HTTP Operation enthalten: GET, POST, PUT, DELETE \ \
Es sollten keine weiteren Pfade in den Mappings vorhanden sein, außer IDs in PUT und DELETE \ \
Parameter sollten als DTO im Request Body übergeben werden. Nur bei GET müssen es einzelne Request Parameter sein. \ \
Die Funktionen im Controller sollten keine eigene Logik enthalten. Sie sollen nur eine Funktion im zugehörigen Service aufrufen. \ \
Mappings im Controller sollten durch die ```kotlin @ReponseStatus``` Annotation einen Http Status zurückgeben. \ \
Die Rückgabewerte von Mappings sollte fast immer ein Dto sein. \ \
Sowohl PUT, POST als auch UPDATE sollten die betroffenen oder erlangten Entities als DTO zurückgeben.

=== OpenAPI UI
```kotlin
// build.gradle.kts
dependencies {
  implementation("org.springdoc:springdoc-openapi-starter-webmvc-ui:2.8.4")
}
```
*URL:* #link("http://localhost:8080/swagger-ui/index.html?configUrl=/v3/api-docs/swagger-config")[http://localhost:8080/swagger-ui/index.html?configUrl=/v3/api-docs/swagger-config]

#figure(
  image("../images/swagger_ui.png", fit: "contain", width: 50%),
  caption: "Swagger UI zum Darstellen und Testen der REST Endpunkte"
)

==== Controller
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

==== Entity
```kotlin
@Entity(name = "entityName")
@Table(name = "entityName")
class Entity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  val id: Long? = null,
  // ...
}
```

==== Dto
```kotlin
data class EntityDto (
  // data
)
```

==== Mapper
```kotlin
fun convertEntityDtoToEntity(entityDto: EntityDto): Entity {
  // convert
}
```

==== Repository
```kotlin
@Repository
interface EntityReposirory: JpaRepository<Entity, Long> {

}
```
===== Repository Queries

==== Serivce
```kotlin
@Service
class EntityService @Autowired constructor(
  private val entityReposirory: EntityReposirory
) {
  // service functions
}
```

=== Application YML

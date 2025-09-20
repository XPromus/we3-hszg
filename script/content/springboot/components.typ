#import "../../definitions.typ": *

=== Komponenten einer Spring Anwendung
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

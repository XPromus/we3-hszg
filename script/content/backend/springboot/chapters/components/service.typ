#import "../../../../../template/definitions.typ": *

==== Service <springboot_service>

```kotlin
@Service
class EntityService @Autowired constructor(
  private val entityReposirory: EntityReposirory
) {
  // service functions
}
```

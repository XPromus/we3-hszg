#import "../../../../../template/definitions.typ": *

==== Mapper <springboot_mapper>

Die Aufgabe des Mappers ist es, ein DTO in eine Entity oder eine Entity in ein DTO zu überführen. 
In den meisten Fällen ist das eine triviale Aufgabe, da nur Werte aus Feldern kopiert werden müssen.

```kotlin
class Entity(
  val id: Long?,
  val name: String,
  val age: Integer
)
```

```kotlin
fun convertEntityToGetEntityDto(entity: Entity): GetEntityDto {
  return GetEntityDto(
    id = entity.id!!,
    name = entity.name,
    age = entity.age
  )
}
```

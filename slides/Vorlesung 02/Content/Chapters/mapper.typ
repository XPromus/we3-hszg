#import "../../template/definitions.typ": *
#import "../../Components/chapter_titile_slide.typ": chapter-title-slide

#chapter-title-slide([Mapper], [Mapper])

#slide[
  = Mapper
  #set align(horizon)
  - Umwandlung von Entities in DTOs oder umgekehrt
  - Meist trivial, da nur Kopieren von Werten stattfindet
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
]

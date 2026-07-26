#import "../../template/definitions.typ": *
#import "../../Components/chapter_title_slide.typ": chapter-title-slide

#chapter-title-slide(active-component: 4)

#slide[
  = DTO
  #set align(horizon)
  - Bündelung mehrerer Datenfelder
  - Inhalt Richtet sich nach Einsatzzweck
  - Beispiel: DTO, welches zu einer GET Request gehört und die Daten enthält, die zurückgegeben werden sollen
  - Verweise auf andere Tabellen können als ID gespeichert werden oder direkt mit allen Daten eingetragen werden
]

#slide[
  = Beispiele
  #set align(horizon + center)
  ```kotlin
    class Entity(
      val id: Long?,
      val name: String,
      val age: Integer
    )
  ```
  ```kotlin
    data class GetEntityDto (
      val id: Long,
      val name: String,
      val age: Integer
    )
  ```
]

#slide[
  = Beispiele
  #set align(horizon + center)
  ```kotlin
    class Entity(
      val id: Long?,
      val name: String,
      val age: Integer
    )
  ```
  ```kotlin
    data class PostEntityDto (
      val name: String,
      val age: Integer
    )
  ```
]

#import "../../template/definitions.typ": *
#import "../../Components/chapter_title_slide.typ": chapter-title-slide

#chapter-title-slide(active-component: 1)

#slide[
  = Repository
  #set align(horizon)
  - Hauptinteraktionspunkt mit der Datenbank
  - Wird erstellt mit `@Repository` Annotation in einem *Interface*
  - Vererbung bestimmt Art des Repositories
  - Unterschiedliche Repositories bringen unterschiedliche eingebaute Funktionen mit
  - Repository benötigt Klasse mit ID Typ, die es verwalten soll
  #set align(center)
  ```kotlin
    @Repository
    interface EntityReposirory: JpaRepository<Entity, Long> {

    }
  ```
]

#slide[
  = Operationen und Queries
  #set align(horizon)
  - Einfach CRUD Operation werden direkt untersützt
  - Möglichkeiten, eigene SQL Queries zu verfassen oder generieren zu lassen:
    - Definierung einer neuen Methode im Interface
    - SQL Query bereitstellen über die `@Query` Annotation
    - Nutzung von Querydsl
    - Eigene Queries erstellen mit JPA Named Queries
]

#slide[
  = Automatische Generierung von Queries
  #set align(horizon)
  - Spring Data analysiert jede Methode in einem Repository
  - Versucht aus Methodennamen eine Query zu erstellen
  - Untersützter Syntax ist dabei sehr breit (mehr im Seminar)
  #set align(center)
  ```kotlin
    @Repository
    interface UserInterface : JpaRepository<User, Long> {
      fun findUserByName(name: String): MutableList<User>
    }
  ```
]

#slide[
  = Manuelle Queries
  #set align(horizon)
  - `@Query` Annotation erlaubt Erstellen von selbst geschriebenen Queries
  #set align(center)
  ```kotlin
    @Query(
      "SELECT u FROM User u WHERE LOWER(u.name) = LOWER(:name)"
    )
    fun retrieveUserByName(
      @Param("name") name: String
    ): User
  ```
]

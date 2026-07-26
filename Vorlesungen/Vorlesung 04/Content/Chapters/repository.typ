#import "../../Template/definitions.typ": *

#slide[
  #toolbox.register-section([Repository])
  = Repository
  #set align(horizon)
  - Schnittstelle zur Datenbank
  - Erlaubt CRUD-Operationen auf der Datenbank
  - Daten in der Datenbank werden auf Klassen gemappt (ORM)
  - Jedes Repository kann sich nur um eine Entity kümmern
  - Repository braucht Information über Typ der Entity und Typen der ID

  ```kotlin
  @Repository
  interface TodoItemRepository : JpaRepository<TodoItem, Long> {

  }
  ```

  ```java
  @Repository
  public interface TodoItemRepository extends JpaRepository<TodoItem, Long> {

  }
  ```
]

#slide[
  = Methoden im Repository
  #set align(horizon)
  - Neue Funktionalitäten können über Methodennamen oder `@Query` hinzugefügt werden
  ```kotlin
    @Query(
      "SELECT t FROM todoitem t WHERE " +
              "(cast(:id as uuid) IS NULL OR t.id = :id) AND" +
              "(cast(:name as string) IS NULL OR t.name = :name)"
    )
    fun findTodoItemEntityByField(
        id: Long?,
        name: String?
    ): MutableList<TodoItem>

  ```
]

#slide[
  = Methoden im Repository
  #set align(horizon)
  ```kotlin
    @Repository
    interface TodoItemRepository : JpaRepository<TodoItem, Long> {
      fun findTodoItemsByNameLikeAndIdIs(
        name: String,
        id: Long
      ): MutableList<TodoItem>
    }
  ```
]

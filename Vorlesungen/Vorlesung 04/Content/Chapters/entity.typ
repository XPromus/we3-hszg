#import "../../Template/definitions.typ": *

#slide[
  #toolbox.register-section([Entity])
  = Entities
  #set align(horizon)
  - Eine Klasse, die mit `@Entity` annotiert ist
  - Beschreibung eines Tabelleneintrags in einer Datenbank
  - Jedes Feld in der Tabelle wird als Variable der Entity-Klasse erstellt.
  - Felder können genauer durch `@Column` definiert werden
  - Jede Entity benötigt einen Primary Key, der durch `@Id` markiert wird.
]

#slide[
  = Erstellung von Entities in Kotlin oder Java
  #set align(horizon + center)
  #grid(
    columns: (1fr, 1fr),
    inset: 5pt,
    [
      ```kotlin
        @Entity(name = "todoitem")
        @Table(name = "todoitem")
        class TodoItem (
          @Id
          @GeneratedValue(strategy = GenerationType.AUTO)
          val id: Long? = null,
          @Column(name = "name", nullable = false)
          val name: String = "",
        )
      ```
    ], [
      ```java
        @Entity(name = "todoitem")
        @Table(name = "todoitem")
        public class TodoItem {
          @Id
          @GeneratedValue(strategy = GenerationType.AUTO)
          private Long id;
          @Column(name = "name", nullable = false)
          private String name;
        }
      ```
    ]
  )
]

#slide[
  = Entities
  #set align(horizon)
  - Wenn aus der Datenbank mehrere Einträge aus einer Tabelle ausgelesen werden, wird eine Liste an passenden Entity-Instanzen zurückgegeben.
  - Jede Instanz enthält die Daten ihres jeweils passenden Tabelleneintrags.
  
  *Beispiel:* Abfrage von Todo Items
  - Es wird nach allen Todos vor einem bestimmten Datum gesucht
  - Jedes Todo Item, dessen Datum kleiner als das festgelegte Datum ist, wird als Entity Instanz als Teil einer Liste zurückgegeben 
]

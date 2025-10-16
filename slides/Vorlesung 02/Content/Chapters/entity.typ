#import "../../template/definitions.typ": *
#import "../../Components/chapter_titile_slide.typ": chapter-title-slide

#chapter-title-slide([Entities], [Entities])

#slide[
  = Entity
  #set align(horizon)
  ```kotlin
    @Entity(name = "entityName")
    @Table(name = "tableName")
    class Entity {
      @Id
      @GeneratedValue(strategy = GenerationType.IDENTITY)
      val id: Long? = null,
      // ...
    }
  ```
]

#slide[
  = `@Entity` Annotation
  #set align(horizon)
  - Klasse wird zu einer Entity, wenn sie mit `@Entity` annotated ist
  - Optionaler Name kann angegeben werden
  - Name wird in Queries verwendet
  - Wenn kein Name vorhanden ist, wird der Klassenname verwendet
  #set align(center)
  ```kotlin
    @Entity(name = "student")
  ```
]

#slide[
  = `@Table` Annotation
  #set align(horizon)
  - Erlaubt definierung der Tabelle in der Datenbank
  - Name und Schema können hier festgelegt werden
  - Wenn `@Table` nicht vorhanden ist, wird eine Tabelle mit dem Entity Namen erstellt
  #set align(center)
  ```kotlin
    @Table(name="STUDENT", schema="SCHOOL")
  ```
]

#slide[
  = `@Id` Annotation
  #set align(horizon)
  - Jede Entity benötigt einen Primary Key
  - Datenfeld mit `@Id` wird zum Primary Key
  - Die Id wird automatisch generiert
  - Strategie zur Generierung kann mit `@GeneratedValue` festgelegt werden
    - AUTO
    - TABLE
    - SEQUENCE
    - IDENTITY
  - Mit AUTO wird sich eine der anderen Strategien automatisch ausgewählt
]

#slide[
  = `@Id` Annotation
  #set align(horizon + center)
  #notice[Id einer Entity muss als *null* definiert sein][
    Eine Id muss nullable sein und als default Wert null besitzen. 
    Wenn das nicht der Fall ist, wird Spring beim Erstellen einer neuen Entity einen Error werfen. 
    Grund hierfür ist, dass eine definierte Id Spring davon ausgehen lässt, dass es diesen Eitrag bereits in der Datenbank gibt. 
    Wenn die Id null ist, weiß Spring, dass es sich hier um einen neuen Eintrag handelt.
  ]
]

#slide[
  = `@Id` Annotation
  #set align(horizon + center)
  ```kotlin
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long? = null
  ```
]

#slide[
  = `@Column` Annotation
  #set align(horizon)
  - Genauere Beschreibung von Datenfeldern
  - Folgende Informationen können angegeben werden
    - `name`: Name des Columns in der Datenbank
    - `length`: Maximale Länge des Datenfeldes. Beispiel: Maximale Anzahl an Zeichen in einem String
    - `nullable`: Definiert, ob das Datenfeld null sein darf oder immer einen Wert besitzen muss
    - `unique`: Definiert, ob dieses Datenfeld ein unique Key sein soll
  #set align(center)
  ```kotlin
    @Column(name = "dataField", nullable = false)
    val dataField: Long = 0,
  ```
]

#slide[
  = Referenzen auf andere Tables
  #set align(horizon)
  - Relationen zwschen Entities
  - Beispiel: User Entities und Roles Entities. Jedem User werden Roles zugewiesen
  - `@OneToMany`, `@ManyToMany`, `@ManyToMany`, `@OneToOne`
]

#slide[
  = `@OneToMany` und `@ManyToOne`
  #set align(horizon)
  - Ein User kann eine Role besitzen, aber eine Role kann auf mehrere User zugewiesen werden
  - User hier das Child und Role der Parent
  - Child ist der Besitzer der Relation
  - ID von der Role wird als Foreign Key im User gespeichert
]

#slide[
  =
  #set align(horizon + center)
  ```kotlin
    @Entity(name = "user")
    @Table(name = "user")
    class User (

      @ManyToOne
      @JsonBackReference
      @JoinColumn(name = "role_id", referencedColumnName = "id")
      var role: Role? = null

    )
  ```
]

#slide[
  =
  #set align(horizon + center)
  ```kotlin
    @Entity(name = "role")
    @Table(name = "role")
    class Role(

      @OneToMany(
        mappedBy = "role"
      )
      var users: List<User> = emptyList()

    )
  ```
]

#slide[
  = `@OneToMany` und `@ManyToOne`
  #set align(horizon)
  - Liste mit Usern wird mit `@OneToMany` annotated
  - `mappedBy` gibt Variable an, die in der User Klasse genutzt wird
  - `mappedBy` zeigt, dass hier keine Foreign Keys verwaltet werden
  Weitere Optionen:
  - `cascade`: Operationen angeben, die alle Child Objects betreffen. Wenn keine angegeben sind, werden Child Objects nicht gelöscht, wenn der Parent gelöscht wird. Kann zu Problemen mit übrigen Foreign Keys führen
  - `orphanRemoval`: Automatische Lösung von Child Objects, wenn sie von ihrem Parent getrennt werden.
  #set align(center)
  ```kotlin
    @OneToMany(
      mappedBy = "role"
    )
    var users: List<User> = emptyList()
  ```
]

#slide[
  = `@OneToMany` und `@ManyToOne`
  #set align(horizon) 
  - `rule` Variable in User Klasse wird mit `@ManyToOne` annotated 
  - `@ManyToOne` erschafft eine bidirektionale Relation
  - Auch in User Klasse können Daten über Role abgerufen werden
  - `@JoinColumn` auf der besitzenden Seite der Relation
  - `referencedColumnName` nicht zwingend nötig. Primary Key kann automatisch gesucht werden
  #set align(center)
  ```kotlin
    @ManyToOne
    @JsonBackReference
    @JoinColumn(name = "role_id", referencedColumnName = "id")
    var role: Role? = null
  ```
]

#slide[
  = `@OneToOne`
  #set align(horizon)
  - Verbindung zwischen zwei einzelnen Entities
  - `@JoinColumn` auf der besitzenden Seite der Relation
  - Nicht besitzende Seite besitzt `mappedBy` Attribute in `@OneToOne`
  #set align(center)
  ```kotlin
    class User (
      @OneToOne
      @JsonBackReference
      @JoinColumn(name = "address_id", referencedColumnName = "id")
      var address: Address? = null
    )
  ```

  ```kotlin
    class Address (
      @OneToOne(mappedBy = "address")
      var user: User? = null
    )
  ```
]

#slide[
  = `@ManyToMany`
  #figure(
    caption: [Aufbau einer Many to Many Relation mit einem Join Table]
  )[
    #let default-corner-radius = 2pt
    #diagram(
      node-stroke: 2pt,
      node-inset: 10pt,
      node(
        (0, 0),
        name: <Student>,
        fill: gray.lighten(90%),
        stroke: gray,
        corner-radius: default-corner-radius,
      )[
        #table(
          rows: (auto, auto),
          inset: 5pt,
          [student],
          [
            #table(
              columns: (auto, auto),
              inset: 5pt,
              [public_key], [id]
            )
          ]
        )
      ],
      edge("--", <Likes>),
      node(
        (0, 1),
        name: <Likes>,
        fill: gray.lighten(90%),
        stroke: gray,
        corner-radius: default-corner-radius,
      )[
        *Join Table*
        #table(
          rows: (auto, auto),
          inset: 5pt,
          [course_like],
          [
            #table(
              columns: (auto, auto),
              inset: 5pt,
              [public_key, foreign_key 1], [student_id],
              [public_key, foreign_key 2], [course_id]
            )
          ]
        )
      ],
      edge("--", <Course>),
      node(
        (0, 2),
        name: <Course>,
        fill: gray.lighten(90%),
        stroke: gray,
        corner-radius: default-corner-radius,
      )[
        #table(
          rows: (auto, auto),
          inset: 5pt,
          [course],
          [
            #table(
              columns: (auto, auto),
              inset: 5pt,
              [public_key], [id]
            )
          ]
        )
      ],
    )
  ]<manyToManyRelation>
]

#slide[
  =
  #set align(horizon + center)
  ```kotlin
  class Student (
    @ManyToMany
    @JoinTable(
      name = "course_like", 
      joinColumns = @JoinColumn(name = "student_id"), 
      inverseJoinColumns = @JoinColumn(name = "course_id")
    )
    val likedCourses: List<Course>
  )
  ```

  ```kotlin
  class Course (
    @ManyToMany(mappedBy = "likedCourses")
    val likes: List<Students>
  )
  ```
]

#slide[
  = `@ManyToMany`
  #set align(horizon)
  - Bei Many to Many Beziehungen muss ein neuer Table angelegt werden
  - Neuer Table enthält Foreign Keys aller Entities in der Relation
  - Neuer Table ist ein Join Table
  - Datenfelder auf beiden Seiten erhalten `@ManyToMany` Annotation
  - Besitzende Seite enthält Definition für den Join Table mit `@JoinTable`
  - Nicht besitzende Seite erhält `mappedBy` Attribut mit Variablennamen der besitzenden Seite
]

#slide[
  = `@ManyToMany` - `@JoinTable`
  #set align(horizon)
  - Enthält Name für den Join Table
  - `joinColumns` enthält Verbindung zu der besitzenden Seite mit `@JoinColumn` und dem Namen der ID
  - `inverseJoinColumns` definiert die nicht besitzende Seite der Relation mit `@JoinColumn` und dem Namen der ID
  - `@JoinColumn` und `@JoinTable` sind nicht zwingend notwending
  - JPA kann Verbindungen selbst herstellen
  - Namenskonventionen müssen dafür allerdings übereinstimmen und Strategie zur Verbidung kann nicht ausgesucht werden
]

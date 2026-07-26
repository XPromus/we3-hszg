#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": chapter-title-slide, subchapter-title-slide

#chapter-title-slide(
  section-name: [Spring Data JPA]
)

#slide[
  = Spring Data JPA
  #set align(horizon)
  - Erlaubt Implementierung von Repositories
  - Repositories basieren auf Java Persistence API
  - Verringerung von Boilerplate Code
  - Spring übernimmt das Erstellen von allen Aspekten im Hintergrund
]

#slide[
  = Repository
  #set align(horizon + center)
  #figure()[
    ```java
    @Entity
    class Person {

      @Id @GeneratedValue(strategy = GenerationType.AUTO)
      private Long id;
      private String name;

      // getters and setters omitted for brevity
    }

    interface PersonRepository extends Repository<Person, Long> {

      Person save(Person person);

      Optional<Person> findById(long id);
    }
    ```
  ]
]

#slide[
  = Konzepte
  #set align(horizon)
  - Basis für Repositories ist das `Repository`
  - Es benötigt Argumente einer Entity und ihrer ID
  - `Repository` ist dabei ein "Maker Interface" welches oft mit komplexeren Repositories erweitert wird
  - Beispiel: `CRUD Repository` welches auf `Repository` basiert und weitere Funktionalitäten hinzufügt
]

#slide[
  = CRUD Repository
  #set align(horizon + center)
  #figure()[
    ```java
    public interface CrudRepository<T, ID> extends Repository<T, ID> {

      <S extends T> S save(S entity);      
      Optional<T> findById(ID primaryKey); 
      Iterable<T> findAll();               
      long count();                        
      void delete(T entity);               
      boolean existsById(ID primaryKey);   

      // … more functionality omitted.
    }
    ```
  ]
  #set align(left)
  Die hier definierten Methoden decken alle CRUD Operationen ab. \
  - `save` zum Erstellen und aktualisieren
  - `findById`, `findAll`, `count` und `existsById` zum Auslesen von Datenbank
  - `delete` zum Löschen
]

#subchapter-title-slide(section-name: [Queries])

#slide[
  = Query Methoden
  == Methodengenerierung
  #set align(horizon)
  ```java
  public interface UserRepository extends <User, Long> {

    List<User> findByEmailAddressAndLastname(
      String emailAddress, 
      String lastname
    )

  }
  ```

  Funktion wird in folgende SQL Query generiert:
  ```sql
  select u from User u where u.emailAddress = ?1 and u.lastname = ?2
  ```
]

#slide[
  = Query Methoden
  #set align(horizon)
  Folgende Begriffe _(und weitere)_ werden unterstützt:
  #table(
    columns: (auto, auto , 1fr),
    align: horizon,
    table.header(
      [*Keyword*],[*Sample*],[*JPQL Snippet*]
    ),
    [`Distinct`],[`findDistinctByLastnameAndFirstname`],[```sql select distinct …​ where x.lastname = ?1 and x.firstname = ?2```],
    [`And`],[`findByLastnameAndFirstname`],[```sql … where x.lastname = ?1 and x.firstname = ?2```],
    [`Or`],[`findByLastnameOrFirstname`],[```sql … where x.lastname = ?1 or x.firstname = ?2```],
    [`Is`, `Equals`],[`findByFirstname`, \ `findByFirstnameIs`, \ `findByFirstnameEquals`],[```sql … where x.firstname = ?1``` oder ```sql … where x.firstname IS NULL```, wenn das Argument `null` ist],
    [`Like`],[`findByFirstnameLike`],[```sql … where x.firstname like ?1```],
    [`OrderBy`],[`findByAgeOrderByLastnameDesc`],[```sql … where x.age = ?1 order by x.lastname desc```],
  )
]

#slide[
  = Query Methoden
  #set align(horizon)
  Weitere Keywords können hier gefunden werden: \ #text(fill: blue)[#link("https://docs.spring.io/spring-data/jpa/reference/jpa/query-methods.html#jpa.query-methods.query-creation")[https://docs.spring.io/spring-data/jpa/reference/jpa/query-methods.html#jpa.query-methods.query-creation]]
]

#slide[
  = Entity Methoden
  #set align(horizon)
  Diese Methoden können auch auf Entity Ebene erstellt werden, über die `@NamedQuery` Annotation.

  ```java
  @Entity
  @NamedQuery(
    name = "User.findByEmailAddress",
    query = "select u from User u where u.emailAddress = ?1"
  )
  public class User {

  }
  ```
]

#slide[
  = JPA Named Queries
  == XML Queries
  #set align(horizon)
  Queries können über XML in `org.xml` in `META-INF` 

  ```xml
  <named-query name="User.findByLastname">
    <query>select u from User u where u.lastname = ?1</query>
  </named-query>
  ```
  Im Interface müssen diese Named Queries dann spezifiert werden.
  ```java
  public interface UserRepository extends JpaRepository<User, Long> {
    List<User> findByLastname(String lastname);
    User findByEmailAddress(String emailAddress);
  }
  ```
]

#slide[
  = JPA Named Queries
  == #text("@Query")
  #set align(horizon)
  - Funktionen in Interfaces können mit `@Query` ihre Funktionalität erhalten. 
  - `@NamedQuery` auf Entity Ebene wird von `@Query` im Interface überschrieben
]

#slide[
  = JPA Named Queries
  #set align(horizon)
  #codly(
    header: [*userEntity.java*],
    header-cell-args: (align: center)
  )
  ```java
  @Entity
  @NamedQuery(
    name = "User.findByEmailAddress",
    query = "select u from User u where u.emailAddress = ?1"
  )
  public class User { }
  ```

  #codly(
    header: [*userRepository.java*],
    header-cell-args: (align: center)
  )
  ```java
  public interface UserRepository extends JpaRepository<User, Long> {
    @Query("select u from User u where u.emailAddress = ?1")
    User findByEmailAddress(String emailAddress);
  }
  ```

  Hier würde die `findByEmailAddress` Funktion im Interface in `userRepository.java` aufgerufen werden. 
]

#slide[
  = JPA Named Queries
  #set align(horizon)
  *Weitere Möglichkeiten der Query Erstellung*:
  - Query Rewriter
  - Advanced LIKE Expressions
  - Native Queries
]

#subchapter-title-slide(section-name: [Sorting])

#slide[
  = Sorting
  #set align(horizon)
  Sorting kann über eine `PageRequest` geschehen oder direkt über `Sort`
  ```java 
  public interface UserRepository extends JpaRepository<User, Long> {
    @Query("select u from User u where u.lastname like ?1%")
    List<User> findByAndSort(String lastname, Sort sort);

    @Query(
      "select u.id, LENGTH(u.firstname) as fn_len from User u where u.lastname like ?1%"
    )
    List<Object[]> findByAsArrayAndSort(String lastname, Sort sort);
  }
  ```
]

#slide[
  = Sorting
  #set align(horizon)
  #codly(
    highlighted-lines: (
      (1, green.lighten(70%)),
      (2, red.lighten(70%)),
      (3, green.lighten(70%)),
      (4, green.lighten(70%)),
    )
  )
  ```java
  repo.findByAndSort("lannister", Sort.by("firstname"));
  repo.findByAndSort("stark", Sort.by("LENGTH(firstname)"));            
  repo.findByAndSort("targaryen", JpaSort.unsafe("LENGTH(firstname)")); 
  repo.findByAsArrayAndSort("bolton", Sort.by("fn_len"));   
  ```

  1. #text(fill: green, weight: "bold")[Valides] `Sort`. Zeigt auf eine Property im Modell
  2. #text(fill: red, weight: "bold")[Invalides] `Sort`. Enthält einen Funktionsaufruf. Wirft eine Exception.
  3. #text(fill: green, weight: "bold")[Valides] `Sort`. Durch `unsafe` kann die Funktion ausgeführt werden.
  4. #text(fill: green, weight: "bold")[Valides] `Sort`. Zeigt auf eine Funktion.
]

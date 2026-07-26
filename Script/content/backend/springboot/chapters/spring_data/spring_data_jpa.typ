#import "../../../../../template/definitions.typ": *

Spring Data JPA erlaubt das einfach Implementieren von Repositories, die auf der Java Persistence API basieren. 
Das Ziel ist es dabei die Menge an Boilerplate Code zu verringern und eine Schnelle Erstellung von Repository Interfaces zu ermöglichen. 
Spring soll dabei den Erstellung von allen Aufgaben im Hintergrund übernehmen. @springDataJpaOverview \

Ein beispiel Repository kann dabei wie folgt aussehen:
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

Hier kommt ein einfaches Repository zum Einsatz. 
Je nachdem, wie viele Funktionen benötigt werden, können auch auch komplexere Repositories, wie zum Beispiel `JpaReposiroty` genutzt werden. @springDataJpaGettingStarted

==== Konzepte
Das zentrale Interface hier ist das `Repository`. 
Es benötigt dafür als Argumente eine Domain-Klasse an, die es verwalten soll, zusammen mit dem Typ ihres Identifiers. 
Dieses Interface stellt dabei eine Basis dar. 
Es ist ein "Maker Interface", welches die angegebenen Typen erhalten soll und wird dann oft mit komplexeren Repositories erweitert. \

Ein Beispiel wäre hier das `CRUD Repository`, welches durch `Repository` erweitert wird und es mit mehr Funktionalitäten erweitert.

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

Die hier definierten Methoden decken alle CRUD Operationen ab. \
- `save` zum Erstellen und aktualisieren
- `findById`, `findAll`, `count` und `existsById` zum Auslesen von Datenbank
- `delete` zum Löschen

@springDataJpaCoreConcepts

==== Query Methoden Definieren
@springDataJpaDefiningQueryMethods

Beispiel für Methodengenerierung
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

Folgende Begriffe werden unterstützt:
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
@jpaQueryCreation

Weitere Keywords können hier gefunden werden: #link("https://docs.spring.io/spring-data/jpa/reference/jpa/query-methods.html#jpa.query-methods.query-creation")[https://docs.spring.io/spring-data/jpa/reference/jpa/query-methods.html#jpa.query-methods.query-creation]

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

===== JPA Named Queries
====== XML Queries
Queries können über XML in `org.xml` in `META-INF` 

```xml
<named-query name="User.findByLastname">
  <query>select u from User u where u.lastname = ?1</query>
</named-query>
```

====== Interfaces
Named Queries können in Interfaces als Funktionen deklariert werden.

```java
public interface UserRepository extends JpaRepository<User, Long> {

  List<User> findByLastname(String lastname);

  User findByEmailAddress(String emailAddress);
}
```

====== #text("@Query")
Funktionen in Interfaces können mit `@Query` ihre Funktionalität erhalten. 
Wenn auf Entity Ebene eine `@NamedQuery` vorhanden ist, und im Interface eine `@Query` mit dem gleichen Namen definiert wurde, nimmt die `@Query` im Repository Vorrang.

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
public class User {

}
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

====== Weitere Möglichkeiten
- Query Rewriter
- Advanced LIKE Expressions
- Native Queries

===== Sorting
Sorting kann über eine `PageRequest` geschehen oder direkt über `Sort`. 

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

#codly(
  highlighted-lines: (
    (1, green.lighten(70%)),
    (3, red.lighten(70%)),
    (4, green.lighten(70%)),
    (6, green.lighten(70%)),
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

==== Probleme in Anwendungsfällen und ihre Lösung
@jpaWithSpringBoot

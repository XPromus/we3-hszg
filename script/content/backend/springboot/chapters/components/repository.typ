#import "../../../../../template/definitions.typ": *

==== Repository <springboot_repository>

```kotlin
@Repository
interface EntityReposirory: JpaRepository<Entity, Long> {

}
```

Das Repository ist der Hauptinteraktionspunkt mit der Datenbank. 
Es wird als Interface erstellt, welches mit der Annotation `@Repository` versehen ist.
Die Art des Repositories wird durch Vererbung des gewählten Repository Typen festgelegt.
Unterschiedliche Repositories bringen dabei unterschiedliche Features. 
Die meisten sind dabei Erweiterungen von Repositories, die weniger Funktionen enthalten.
Neben dem Repository Typen muss auch angegeben werden, welche Entity hier verwaltet wird und welche Klasse die Id der Entity besitzt.
Für einen User mit einer id vom Typ `Long` würde ein JpaRepository wie folgt aussehen: 
```kotlin
@Repository
interface UserReposirory: JpaRepository<User, Long> {

}
```
Es stellt Funktionen bereit um auf der Datenbank einfache CRUD Operationen auszuführen. 
Dazu werden Möglichkeiten bereitgestellt, eigene SQL Queries zu verfassen oder sie automatisch generieren zu lassen:
- Definierung einer neuen Methode im Interface
- SQL Query bereitstellen über die `@Query` Annotation
- Nutzung von Querydsl
- Eigene Queries erstellen mit JPA Named Queries

Die Nutzung von Querydsl wird vor allem bei vielen kleinen Anfragen empfohlen, da diese reduziert werden können, auf eine kleinere Anzahl an Blöcken. 
JPA Names Queries werden nicht empfohlen, da sie das Schreiben von XML vorraussetzen.

===== Automatische Queries durch Methoden
Spring Data analysiert in jedem Repository alle vorhandenen Methoden und versucht aus den Methodennamen eine SQL Query zu generieren. 
Es folgt ein Beispiel, in einem Repository, welches Instanzen von Usern enthält, die ein Feld mit einem Namen besitzen.

```kotlin
@Repository
interface UserInterface : JpaRepository<User, Long> {
  fun findUserByName(name: String): MutableList<User>
}
```

===== Manuelle Queries
Mit der `@Query` Annotation kann eine eigene Query manuell erstellt werden.

```kotlin
@Query("SELECT u FROM User u WHERE LOWER(u.name) = LOWER(:name)")
fun retrieveUserByName(
  @Param("name") name: String
): User
```

@springDataJpaIntroduction
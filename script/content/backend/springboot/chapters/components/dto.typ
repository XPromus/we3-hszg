#import "../../../../../template/definitions.typ": *

==== DTO <springboot_dto>
Das DTO ist eine bündelung von mehreren Datenfeldern in ein Objekt.
Der Inhalt dieses Objekts richtet sich nach seinem jeweiligen Einsatzzweck. 
So könnte ein DTO, welches als Response zu einer GET Request #customref(<http_methods_get>) gehören soll, alle Felder der angesprochenen Entity enthalten. 
Sollten Verweise auf andere Tabellen vorhanden sein, könnten diese in Form einer ID übergeben werden oder direkt alle gewollten Daten aus der Entity enthalten. \

Ein DTO, welches zum Erstellen einer Entity genützt werden würde, also in einer POST Request #customref(<http_methods_post>), würde hingegen nur Daten enthalten, die zum Initialisieren benötigt werden. 
Bei einem User in einem Shop könnten das zum Beispiel Name, Addresse, Email, Passwort usw. sein. \

Grundsätzlich lässt sich sagen, dass der Inhalt eines DTO immer so gewählt werden sollte, dass er für den Anwendungsfall gut zugeschnitten ist. 
So wird es wahrscheinlich dazu führen, dass es zu einer Entity mehrere DTOs gibt, die zu unterschiedlichen Situationen im Anwendungsprozess passen.

Es folgen einige Beispiele für DTOs die zu einer Entity gehören:
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

```kotlin
data class PostEntityDto (
  val name: String,
  val age: Integer
)
```

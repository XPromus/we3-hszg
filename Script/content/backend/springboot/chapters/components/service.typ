#import "../../../../../template/definitions.typ": *

==== Service <springboot_service>
```kotlin
@Service
class EntityService (
  private val entityReposirory: EntityReposirory
) {
  // service functions
}
```

Der Service enthält die Business Logik der Anwendung. 
Um einen Service zu deklaieren wird die `@Service` Annotation genutzt.
Typischerweise sollte ein Service mindestens eine Funktion pro Controller Mapping enthalten. 
Diese Funktion sollte das einzige sein, was der Controller aufruft. \

===== Transactional Methoden

Für manche Funktionen im Service kann es sinnvoll sein, die `@Transactional` Annotation zu nutzen. 
Mit dieser Annotation wird das Spring Transaction Management genutzt, um Transaktionen durchzuführen. 
Ohne diese Annotation würde, zum Beispiel, Spring Data JPA oder Hibernate die Transaktion durchführen. \
@whenToUseTransactionalStackOverflow

Die `@Transactional` Annotation sollte in folgenden Situationen genutzt werden:
- *Datenbank Operation mit mehreren Schritten*: Wenn mehrere Operationen erfolreiche sein oder fehlschlagen müssen. Ein Beispiel hier wäre eine Transaktion in einem Banksystem. Beim Sender muss das Geld entfernt werden und beim Empfänger muss das Geld hinzugefügt werder. Durch `@Transactional` würde bei einem Fehlschlag einer dieser Operation die Datenbank konsistent bleiben und keine Änderungen commited werden.
- *Wenn die Operation kaskadierende Updates durchführt*: Wenn eine Operation Daten in einer oder mehrerer anderer Tabellen beeinflusst, sollte `@Transactional` verwendet. Ein Beispiel hier wäre das Entfernen eines Users, welches Löschungen in anderen Tabellen auslösen würde. `@Transactional` sorgt hier dafür, dass nur alle Änderungen zusammen angenommen werden. Bereits ein Fehler sorgt für den Abbruch aller Operationen. 
- *Wenn volatile Daten benutzt werden*: Wenn Fehler erwartet werden oder sehr wahrscheinlich sind. Durch `@Transactional` wird Korruption von Daten in solchen Situationen vermieden.
- *Wenn bei Daten parallelität bzw. concurrency erwartet wird*: Wenn mehrere Nutzer parallel an einer Datenbank arbeiten können, kann `@Transactional` genutzt werden, um Operationen voneinander zu isolieren. Änderungen werden erst sichtbar, wenn alle dazugehörigen Operationen erfolgreich beendet wurden.

Beispiel für eine Entity mit Funktion bei der `@Transactional` benutzt werden sollte.
```kotlin
@Entity(name = "user")
@Table(name = "user")
class User(
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  val id: Long? = null,
  @OneToMany(
      mappedBy = "user",
      cascade = [CascadeType.REMOVE]
  )
  val roles: List<Role> = emptyList()
)
```

```kotlin
@Transactional
fun deleteUser(id: Long) {
  val toDeleteUser = getUserById(id)
  userRepository.delete(toDeleteUser)
}
```

Wann wird `@Transactional` nicht benötigt:
- *Updates die nur einen Schritt enthalten und nicht kaskadieren*: Wenn nur eine Tabelle oder Record nacheinander geändert wird und keine Einflüsse auf andere Tabellen vorhanden sind und Daten nicht zwingend konsistent sein müssen wird `@Transactional` nicht benötigt.
- *Wenn strikte konsistenz nicht benötigt wird*
- *Methoden, die keine Daten modifizieren*
@transactions101
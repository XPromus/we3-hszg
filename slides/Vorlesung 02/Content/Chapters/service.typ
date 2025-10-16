#import "../../template/definitions.typ": *
#import "../../Components/chapter_title_slide.typ": chapter-title-slide

#chapter-title-slide(active-component: 3)

#slide[
  = Service
  #set align(horizon + left)
  - Wird erstellt mit der `@Service` Annotation an einer Klasse
  - Enthält Business Logik der Anwedung
  - Typischerweise enthält der Service eine Funktion pro Controller Mapping
  - Der Controller sollte nur diese Funktion aufrufen
  #set align(horizon + center)
  ```kotlin
    @Service
    class EntityService (
      private val entityReposirory: EntityReposirory
    ) {
      // service functions
    }
  ```
]

#slide[
  = Service Funktionen
  #set align(horizon + center)
  ```kotlin
    @RestController
    @RequestMapping("/path/to/controller")
    class Controller(
      private val entityService: EntityService
    ) {
      @GetMapping
      @ReponseStatus(HttpStatus.OK)
      fun getEntities(
        @RequestParam(required = false) id: Long?, 
        @RequestParam(required = false) name: String?
      ): List<GetEntityDto> {
        return entityService.getEntities(id, name);
      }
    }
  ```
]

#slide[
  = Service Funktionen
  #set align(horizon + center)
  ```kotlin
  @Service
  class EntityService (
    private val entityRepository: EntityRepository
  ) {
    fun getEntities(id: Long?, name: String?): List<Entity> {
      var entities = entityReposirory
        .getEntitiesByFields(id, name)
        .map{
          toGetEntityDto(it);
        };
      return entities;
    }
  }
  ```
]

#slide[
  = Transactional Methoden
  #set align(horizon + center)
  ```kotlin
    @Transactional
    fun deleteUser(id: Long) {
      val toDeleteUser = getUserById(id)
      userRepository.delete(toDeleteUser)
    }
  ```
]

#slide[
  = Transactional Methoden
  #set align(horizon + center)
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
]

#slide[
  = Transactional Methoden
  #set align(horizon)
  - Manche Funktionen im Service werden mit `@Transactional` annotiert
  - Annotation verlangt Nutzung des Spring Transaction Managements
  - Sonst würde würden andere Persitence Teile der Anwendung die Transaktion durchführen
  - `@Transactional` stellt sicher, dass alle Änderungen an der Datenbank erfolgreich waren, bevor die Änderungen eingefügt werden
]

#slide[
  = Wann sollte `@Transactional` genutzt werden
  #set align(horizon)
  - *Datenbank Operation mit mehreren Schritten*
    - Mehrere Schritte müssen Erfolgreich sein
    - Beispiel: Transaktion in einem Banksystem. Entferne Geld beim Sender und füge es beim Empfänger hinzu
  - *Wenn die Operation kaskadierende Updates durchführt*
    - Operation beeinflusst Daten in anderen Tabellen
    - Beispiel: Löschen eines Users, der Konten besitzt, die auch gelöscht werden müssten
  - *Wenn volatile Daten benutzt werden*
    - Fehler sind wahrscheinlich oder werden erwartet
  - *Wenn bei Daten parallelität bzw. concurrency erwartet wird*
    - Mehrere Nutzer arbeiten parallel an Datenbank
    - `@Transactional` isoliert Operationen voneinander
    - Änderungen werden erst nach Erfolg sichtbar
]

#slide[
  = Wann wird `@Transactional` nicht benötigt
  #set align(horizon)
  - Updates die nur einen Schritt enthalten und nicht kaskadieren
  - Wenn strikte konsistenz nicht benötigt wird
  - Methoden, die keine Daten modifizieren
]

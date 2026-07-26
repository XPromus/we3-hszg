#import "../../../template/definitions.typ": *

=== Überblick und Wiederholung zu Spring Anwendungen

==== Kontext der Spring Anwendung
Innerhalb einer Fullstack-Anwendung existiert die Spring-Anwendung im Backend. 
Das Frontend stellt Anfragen an das Spring-Backend. 
Das Backend verarbeitet die Anfragen und gibt bei Bedarf Daten an das Frontend zurück.

#figure(
  diagram(
    node-stroke: 1pt,
    node-inset: 10pt,
    node-shape: rect,
    node(
      (0, 0),
      name: <client>
    )[
      #image("../../../images/fa6-solid--computer.svg", fit: "contain", width: 50pt)
      Client bzw. Frontend
    ],
    node(
      (2, 0),
      name: <server>
    )[
      #image("../../../images/streamline-cyber--server.svg", fit: "contain", width: 50pt)
      Server bzw. Backend
    ],
    node(
      (4, 0),
      name: <database>
    )[
      #image("../../../images/streamline-plump--database-solid.svg", fit: "contain", width: 50pt)
      Database
    ],
    edge(<client>, "-|>", <server>, bend: 60deg)[
      Stellt Anfrage
    ],
    edge(<server>, "-|>", <client>, bend: 60deg)[
      Gibt erhaltene Daten zurück
    ],
    edge(<server>, "-|>", <database>, bend: 60deg)[
      Erstellen \
      Lesen \
      Updaten \
      Löschen von Daten
    ],
    edge(<database>, "-|>", <server>, bend: 60deg)[
      Daten aus Datenbank erhalten
    ],
  )
)

*Beispiel*: Ein Nutzer benutzt eine Finanz-App. 
Er möchte einen Teil seines Geldes zu einem Budget hinzufügen. 
Dafür füllt er in der App zwei Felder aus. 
Das Zielbudget und die Menge an Geld, die dem Budget zugewiesen werden soll. 
Nach Bestätigung der Eingaben wird eine Anfrage von der App an das Backend geschickt. 
Diese Anfrage enthält alle Informationen, die das Backend benötigt, um die Budgetanpassung zu verarbeiten. 
Dazu gehören zum Beispiel: User-ID, Konto-ID, Budget-ID, Wert.
All diese Werte werden im Backend genutzt, um in der Datenbank den passenden Nutzer, das Konto und das Budget zu finden. 
Danach kann überprüft werden, ob diese Transaktion stattfinden darf, und der Wert wird auf das Budget gutgeschrieben. 
Das Backend kann nun als Antwort auf die Anfrage den neuen Wert des Budgets an das Frontend zurückschicken, damit der Nutzer in der App sieht, dass sich der Wert des Budgets angepasst hat.

*Entity*: \
Die Entity ist die Beschreibung eines Tabelleneintrages in der Datenbank. 
Felder in der Tabelle werden dabei als Variable deklariert. 
Genauere Definitionen können durch `@Column` festgelegt werden. 
Jede Entity benötigt außerdem einen Primary Key, der mit der `@Id`-Annotation festgelegt werden kann. 
Wenn eine Menge an Daten aus dem Table ausgelesen wird, ist jeder Eintrag in der Tabelle eine Entity-Instanz. \

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

*Beispiel*: Ich frage in der Datenbank alle To-do-Items ab, die bis nächste Woche Freitag fertig sein sollen. 5 Todos wurden dabei gefunden. Ich erhalte vom Repository eine Liste mit 5 Elementen. Jedes Element ist dabei eine Instanz der TodoItems-Entity, die die Daten des jeweiligen Tabelleneintrages enthält.

*Repository*: \
Das Repository ist die Schnittstelle zur Datenbank. 
Es erlaubt das Erstellen und Suchen von Entities. 
Ein Repository kann sich immer nur um eine Art von Entity kümmern. 
Diese Entity wird beim Erstellen des Repositories angegeben, zusammen mit dem Typ der ID.

```kotlin
@Repository
interface TodoItemRepository : JpaReposiroty<TodoItem, Long> {

}
```

```java
@Repository
public interface TodoItemRepository extends JpaReposiroty<TodoItem, Long> {

}
```

==== Ablauf einer POST Request in Spring

1. *Request vom Client*

#codly(
  highlights: (
    (line: 1, start: 3, end: 6, fill: red),
    (line: 3, start: 17, end: none, fill: green),
  ),
  annotations: (
    (
      start: 1, end: 1,
      content: block(
        width: 2em,
        rotate(-90deg, reflow: true, align(center)[Request Line])
      )
    ),
    (
      start: 2, end: 3,
      content: block(
        width: 2em,
        rotate(-90deg, reflow: true, align(center)[Headers])
      )
    ),
    (
      start: 4, end: 11,
      content: block(
        width: 2em,
        rotate(-90deg, reflow: true, align(center)[JSON Body])
      )
    ),
  )
)
```
  POST http://localhost:8080/todos HTTP/1.1
  accept: */*
  Content-Type: application/json

  {
    "name": "todoItemName",
    "description": "newDescription",
    "done": true,
    "created": "2025-10-23T15:06:08.738Z",
    "shouldBeDoneBy": "2025-11-04T08:06:06.297Z",
  }
```

Es wird eine Anfrage an das Spring-Backend gestellt. 
Vom Frontend kommen folgende Daten in der Request: \
- Eine #text(fill: red, weight: "bold")[POST] Request an die url `http://localhost:8080/todos`
- Es wird Content in Form von #text(fill: green, weight: "bold")[JSON] mitgeschickt
- Der Content im Body der Request. Hier werden alle Daten für ein neues Todo-Item mitgeschickt.

```json
{
  "name": "todoItemName",
  "description": "newDescription",
  "done": true,
  "created": "2025-10-23T15:06:08.738Z",
  "shouldBeDoneBy": "2025-11-04T08:06:06.297Z",
}
```

2. *Annahme der Request am Controller im Backend*
Das Spring-Backend nimmt diese Request an der passenden Methode im Controller entgegen. Die passende Methode wird dabei wie folgt gefunden.\

Es werden alle Klassen in Betracht gezogen, die eine `@RestController`-Annotation besitzen. Danach wird der Pfad in der URL wichtig.

#codly(
  highlights: (
    (line: 1, start: 22, end: 27, fill: red),
  )
)
```
http://localhost:8080/todos
```

Der passende Controller muss dabei eine `@RequestMapping`-Annotation besitzen mit diesem Pfad. Ein Controller, der also wie folgt definiert ist, wird für diesen Request genutzt:

#codly(
  highlights: (
    (line: 2, start: 18, end: 23, fill: red),
  )
)
```kotlin
@RestController
@RequestMapping("/todos")
class TodoItemController {
  // Methoden
} 
```

In diesem Controller muss nun noch die passende Funktion gefunden werden. Da nach `/todos` kein weiterer Pfad kommt, wird hier nur die HTTP-Methode betrachtet. Es handelt sich hier um eine POST-Request. Die passende Methode muss also mit `@PostMapping` auf die POST-Methode gemappt sein. In dem Controller wird also die Methode genutzt, die wie folgt definiert ist:

```kotlin
@PostMapping
@ResponseStatus(HttpStatus.CREATED)
fun createTotoItem(
    @RequestBody createTodoItemDto: CreateTodoItemDto
): GetTodoItemDto {
    return todoItemService.createTodoItem(createTodoItemDto)
}
```

Diese Methode wird nun aufgerufen. Dabei nimmt sie ein DTO entgegen. Dieses DTO ist, praktisch gesehen, der JSON-Body der Request in Form eines Objekts in Java/Kotlin. \

Für jedes JSON-Feld wird dabei eine Variable in der Klasse bevölkert.

#grid(
  columns: (1fr, 1fr),
  inset: 5pt,
  [
    ```json
      {
        "name": "todoItemName",
        "description": "newDescription",
        "done": true,
        "created": "2025-10-23T15:06:08.738Z",
        "shouldBeDoneBy": "2025-11-04T08:06:06.297Z",
      }
    ```
  ],[
    ```kotlin
      data class CreateTodoItemDto(
        val name: String,
        val description: String,
        val done: Boolean,
        val created: Date,
        val shouldBeDoneBy: Date
      )
    ```
  ]
)

Aus dem JSON-Objekt muss nun ein DTO gemacht werden. 
Das DTO enthält dabei die gleichen Felder wie das JSON-Objekt, mit übereinstimmenden Variablennamen. \
Zu jeder Variable wird jetzt der Wert des zugehörigen JSON-Keys gemappt.
Damit diese Operation erfolgreich ist, muss das JSON-Objekt, welches vom Frontend geschickt wurde, den Spezifikationen des DTOs folgen. 
Hier bedeutet das einfach gesagt: Die JSON-Keys müssen den gleichen Namen haben wie die Variablen in der DTO-Klasse.

#let dataPairs = (
  (json: ```json "name": "todoItemName"```, kotlin: ```kotlin val name: String```),
  (json: ```json "description": "newDescription"```, kotlin: ```kotlin val description: String```),
  (json: ```json "done": true```, kotlin: ```kotlin val done: Boolean```),
  (json: ```json "created": "2025-10-23T15:06:08.738Z"```, kotlin: ```kotlin val created: Date```),
  (json: ```json "shouldBeDoneBy": "2025-11-04T08:06:06.297Z"```, kotlin: ```kotlin val shouldBeDoneBy: Date```)
)

#for (i, value) in dataPairs.enumerate() {
  figure(
    diagram(
      node-stroke: 1pt,
      node((0, 0))[
        #value.json
      ],
      edge("-|>"),
      node((1, 0))[
        #value.kotlin
      ]
    )
  )
}

Man kann es sich so vorstellen, dass ein Konstruktor aufgerufen wird, der einen Wert pro Feld im JSON-Objekt enthält und diesen Wert auf die passende Variable anwendet.

```kotlin
CreateTodoItemDto(
  name = "todoItemname",
  description = "newDescription",
  done = true,
  created = "2025-10-23T15:06:08.738Z",
  shouldBeDoneBy = "2025-11-04T08:06:06.297Z"
)
```

Dieses DTO wird als Parameter an die Controller-Funktion übergeben. 
Die Controller-Funktion ruft dann eine passende Methode im Service auf und übergibt das DTO. \

*3. Aufrufen der Logik im Service durch den Controller*

Der Service enthält die Logik der Anwendung. 
In den einfachsten Fällen sind das nur Funktionen, die CRUD-Operationen aufrufen, die zu einer Entity gehören.
Theoretisch könnte dieser Code auch direkt im Controller stehen, aber im Sinne der Ordnung, sollte der Controller nur eine Methode im Service aufrufen. \

Die Methode im Service, die hier benötigt wird, soll ein neues Todo-Item erstellen. 
Damit ein neues Todo-Item in der Datenbank gespeichert werden kann, muss das DTO in eine Instanz der Entity umgewandelt werden. 
Für dieses Umwandeln kommt ein Mapper zum Einsatz.

#figure(
  diagram(
    node-stroke: 1pt,
    node((0, 0))[
      CreateTodoItemDto
    ],
    edge("-|>"),
    node((1, 0))[
      CreateTodoItemDtoMapper
    ],
    edge("-|>"),
    node((2, 0))[
      TodoItem
    ]
  )
)

Dieser Mapper überführt alle Felder aus dem DTO in die passenden Felder der Entity. 

```kotlin
  fun fromCreateTodoItemDto(
      createTodoItemDto: CreateTodoItemDto
  ): TodoItem {
      return TodoItem(
          name = createTodoItemDto.name,
          description = createTodoItemDto.description,
          done = createTodoItemDto.done,
          created = createTodoItemDto.created,
          shouldBeDoneBy = createTodoItemDto.shouldBeDoneBy
      )
  }
```

Diese Mapper-Funktion wird im Service aufgerufen, um eine Instanz des neuen Todo-Items zu erhalten.

```kotlin 
val newTodoItem = fromCreateTodoItemDto(createTodoItemDto)
```

Damit diese neue Entity in der Datenbank gespeichert werden kann, wird die `save`-Funktion im Repository aufgerufen. 
Diese Funktion kann entweder einen neuen Eintrag in der Datenbank anlegen oder einen vorhandenen updaten. 
Welche dieser Funktionen aufgerufen wird, entscheidet die übergebene Entity. 
- Wenn die ID in der Entity `null` ist, wird ein neuer Eintrag in der Datenbank angelegt. 
- Hat die ID einen definierten Wert, wird in der Datenbank der Eintrag mit der passenden ID gesucht und mit den neuen Werten überschrieben.

```kotlin
val savedTodoItem = todoItemRepository.save(newTodoItem)
```

Nach einer POST-Request soll die neu erstellte Entity wieder in einer Response an das Frontend geschickt werden. 
Dazu muss die Entity in ein `GetTodoItemDto` überführt werden.

#figure(
  diagram(
    node-stroke: 1pt,
    node((0, 0))[
      TodoItem
    ],
    edge("-|>"),
    node((1, 0))[
      GetTodoItemDtoMapper
    ],
    edge("-|>"),
    node((2, 0))[
      GetTodoItemDto
    ]
  )
)

Dieses DTO wird an den Controller übergeben. 
Der Controller gibt das DTO als JSON-Objekt in der Response an das Frontend zurück.

#codly(
  annotations: (
    (
      start: 1, end: 5,
      content: block(
        width: 2em,
        rotate(-90deg, reflow: true, align(center)[Headers])
      )
    ),
    (
      start: 7, end: 15,
      content: block(
        width: 2em,
        rotate(-90deg, reflow: true, align(center)[JSON Body])
      )
    ),
  )
)
```
connection: keep-alive  
content-type: application/json  
date: Tue,04 Nov 2025 08:06:30 GMT  
keep-alive: timeout=60  
transfer-encoding: chunked 

{
  "id": 1,
  "name": "string",
  "description": "string",
  "done": true,
  "created": "2025-11-04T08:06:06.296+00:00",
  "shouldBeDoneBy": "2025-11-04T08:06:06.297+00:00",
  "userId": 1
}
```

Im Frontend kann der JSON-Body dann wieder ausgelesen werden, um die Daten in der UI darzustellen.

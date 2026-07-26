#import "../../Template/definitions.typ": *
#import "../../Components/post_request_diagram.typ": post-diagram

#slide[
  #toolbox.register-section([Ablauf von Spring])
  =
  #set align(horizon + center)
  #text(size: 30pt, weight: "bold")[
    Ablauf einer POST Request in Spring
  ]
]

// #slide[
//   =
//   #set align(horizon + center)
//   #post-diagram
// ]

#slide[
  #toolbox.register-section([Request])
  =
  #set align(horizon + center)
  #text(size: 30pt, weight: "bold")[
    POST Request vom Frontend
  ]
]

#slide[
  = Request an das Backend
  #set align(horizon + center)
  #codly(
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
]

// #slide[
//   = Request an das Backend
//   #set align(horizon + center)
//   #codly(
//     highlights: (
//       (line: 1, start: 3, end: 6, fill: red),
//       (line: 1, start: 8, end: 34, fill: blue),
//       (line: 3, start: 17, end: none, fill: green),
//     ),
//     annotations: (
//       (
//         start: 1, end: 1,
//         content: block(
//           width: 2em,
//           rotate(-90deg, reflow: true, align(center)[Request Line])
//         )
//       ),
//       (
//         start: 2, end: 3,
//         content: block(
//           width: 2em,
//           rotate(-90deg, reflow: true, align(center)[Headers])
//         )
//       ),
//       (
//         start: 4, end: 11,
//         content: block(
//           width: 2em,
//           rotate(-90deg, reflow: true, align(center)[JSON Body])
//         )
//       ),
//     )
//   )
//   ```
//     POST http://localhost:8080/todos HTTP/1.1
//     accept: */*
//     Content-Type: application/json

//     {
//       "name": "todoItemName",
//       "description": "newDescription",
//       "done": true,
//       "created": "2025-10-23T15:06:08.738Z",
//       "shouldBeDoneBy": "2025-11-04T08:06:06.297Z",
//     }
//   ```
// ]

#slide[
  = Request an das Backend
  #set align(horizon + center)
  #codly(
    highlights: (
      (line: 1, start: 3, end: 6, fill: red),
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
]


#slide[
  = Request an das Backend
  #set align(horizon + center)
  #codly(
    highlights: (
      (line: 1, start: 8, end: 34, fill: blue),
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
]

#slide[
  = Request an das Backend
  #set align(horizon + center)
  #codly(
    highlights: (
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
          rotate(-90deg, reflow: true, align(center)[#text(fill: green, weight: "bold")[JSON Body]])
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
]

#slide[
  = Content der Anfrage
  #set align(horizon + center)
  ```json
    {
      "name": "todoItemName",
      "description": "newDescription",
      "done": true,
      "created": "2025-10-23T15:06:08.738Z",
      "shouldBeDoneBy": "2025-11-04T08:06:06.297Z",
    }
  ```
]

#slide[
  #toolbox.register-section([Controller])
  =
  #set align(horizon + center)
  #text(size: 30pt, weight: "bold")[
    Annahme der Request im Backend
  ]
]

#slide[
  = Finden des Passenden Controllers
  #set align(horizon)
  - Die Anfrage muss auf einen Controller und danach auf eine Methode gemappt werden.
  - Entscheidung läuft wie folgt ab:
  - Jede Klasse mit `@RestController` wird betrachtet
  - URL wird mit den `@RequestMappings` der Controller abgeglichen
  #codly(
    highlights: (
      (line: 1, start: 24, end: none, fill: red),
    )
  )
  ```
    http://localhost:8080/todos
  ```
  - Der Controller mit dem passenden Request-Mapping wird für die Anfrage genutzt.
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
]

#slide[
  = Finden der passenden Methode
  #set align(horizon)
  - Im Controller muss die passende Methode gefunden werden
  - Im Beispiel kommt hinter `/todo` kein Pfad mehr
  - Es wird also die HTTP Methode abgeglichen
  - Die Methode mit dem passenden Mapping wird genommen
  #diagram(
    node-stroke: 1pt,
    node-inset: 10pt,
    node((0, 0), name: <request>)[
      POST Request
    ],
    node((5, 0), name: <getMapping>, shape: rect, stroke: red, fill: red.lighten(90%))[
      ```kotlin @GetMapping```
    ],
    node((5, 3), name: <postMapping>, shape: rect, stroke: green, fill: green.lighten(90%))[
      ```kotlin @PostMapping```
    ],
    node((5, 1), name: <putMapping>, shape: rect, stroke: red, fill: red.lighten(90%))[
      ```kotlin @PutMapping```
    ],
    node((5, 2), name: <deleteMapping>, shape: rect, stroke: red, fill: red.lighten(90%))[
      ```kotlin @DeleteMapping```
    ],
    edge(<request>, "-|>", <postMapping>, stroke: green, bend: -30deg),
    edge(<request>, "--X", <getMapping>, stroke: red),
    edge(<request>, "--X", <putMapping>, stroke: red, bend: -11deg),
    edge(<request>, "--X", <deleteMapping>, stroke: red, bend: -22deg),
  )
]

#slide[
  = Finden der passenden Methode
  #set align(horizon + center)
  ```kotlin
  @PostMapping
  @ResponseStatus(HttpStatus.CREATED)
  fun createTotoItem(
      @RequestBody createTodoItemDto: CreateTodoItemDto
  ): GetTodoItemDto {
      return todoItemService.createTodoItem(createTodoItemDto)
  }
  ```
]

#slide[
  = Controller Methode DTO
  #set align(horizon)
  - Die Methode nimmt ein DTO entgegen
  - Das DTO ist eine Repräsentation des JSON-Bodys in Form eines Objekts in Kotlin/Java
  - Jede Variable im DTO enthält dabei ein Datenfeld aus dem JSON-Body
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
]

#slide[
  = Controller Methode DTO
  #set align(horizon)
  - Das JSON-Objekt muss in das DTO überführt werden
  - Zu jeder Variable im DTO wird der passende Wert aus dem JSON-Body eingetragen
  - Folgende Spezifikation ist dabei wichtig: Die Keys in dem JSON-Objekt müssen den gleichen Namen haben wie die Variablen im DTO

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
]

#slide[
  = Controller Methode DTO
  #set align(horizon)
  *Praktische Vorstellung*: Es wird ein Konstruktor aufgerufen, der einen Wert pro Feld im JSON objekt enthält und diesen Wert auf die passende Variable anwendet.
  #figure(
    ```kotlin
    CreateTodoItemDto(
      name = "todoItemname",
      description = "newDescription",
      done = true,
      created = "2025-10-23T15:06:08.738Z",
      shouldBeDoneBy = "2025-11-04T08:06:06.297Z"
    )
    ```
  )
]

#slide[
  #toolbox.register-section([Service])
  = Service
  #set align(horizon)
  - Der Controller ruft eine Funktion im Service auf
  - Service enthält Logik der Anwendung
  - Im einfachsten Fall: Funktionen für die CRUD‑Operationen bzw. für die HTTP‑Methoden
  - Könnte auch direkt im Controller stehen aber Separierung ist besser
  - Methode soll hier ein neues Todo-Item erstellen

  *Folgende Schritte:*
  1. Umwandlung des DTOs zu einer Entity (Mapper)
  2. Speichern der Entity im Repository
  3. Umwandeln der neuen Entity in ein Get-DTO (Mapper)
  4. Rückgabe des Get‑DTOs an den Controller und zum Frontend
]

#slide[
  = Mapper für CreateTodoItemDto
  #set align(horizon)
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

  - Mapper überführt alle Felder des DTOs in eine Entity

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
]

#slide[
  = Aufruf des Mappers im Service
  #set align(horizon)
  - Mapper wird im Service aufgerufen um Instanz der neuen Entity zu erhalten
  ```kotlin 
  val newTodoItem = fromCreateTodoItemDto(createTodoItemDto)
  ```
]

#slide[
  #toolbox.register-section([Repository])
  = Speichern der Entity im Repository
  #set align(horizon)
  - `save` Funktion des Repositories erlaubt Speichern einer neuen Entity oder Updated einer vorhandenen
  *Welche Funktion wird genutzt?*:
  - Wenn die ID der Entity `null` ist, wird ein neuer Eintrag in der Datenbank erstellt
  - Wenn die ID der Entity einen Wert hat, wird die vorhandene Entity, mit dieser ID, geupdatet

  ```kotlin
  val savedTodoItem = todoItemRepository.save(newTodoItem)
  ```
]

#slide[
  #toolbox.register-section([Response])
  = Rückgabe der neuen Entity
  #set align(horizon)
  - Neu erstellte Entity soll wieder an das Frontend zurückgegeben werden
  - `save`-Methode gibt die neue Entity zurück
  - Es muss diese Instanz der Entity genutzt werden, da diese die ID enthält
  - Entity muss in ein DTO überführt werden - `GetTodoItemDto`
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
  - DTO wird an den Controller übergeben
  - Controller gibt das DTO als JSON-Objekt im Body der Response zurück
]

#slide[
  =
  #set align(horizon + center)
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
]

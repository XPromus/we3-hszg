//https://www.baeldung.com/spring-rest-openapi-documentation

#import "../../Template/template.typ": chapter-title-slide, subchapter-title-slide
#import "../../Template/definitions.typ": *

#chapter-title-slide(
  section-name: [API Dokumentation]
)

#subchapter-title-slide(
  section-name: "SpringDoc"
)

#slide[
  = Organisation mit Tags
  == Controller
  #set align(horizon + center)
  ```kotlin
  @Tag(
    name = "user_controller",
    description = "Controller for CRUD operations on the user"
  )
  @RestController
  @RequestMapping("/users")
  class UserController(
    private val userService: UserService
  ) {
    // Controller Methods
  }
  ```
]

#slide[
  = Organisation mit Tags
  == Controller
  #set align(horizon + center)
  #figure(
    image("../../Images/user_controller_with_tag.png", fit: "contain"),
    caption: [In der Swagger UI wird der User Controller mit den Werten aus `@Tag` angezeigt.]
  )
]

#slide[
  = Organisation mit Tags
  == Methoden
  #set align(horizon + center)
  ```kotlin
  @Tag(
    name = "getUsers",
    description = "Get a List of Users according to provided id and username."
  )
  @GetMapping
  @ResponseStatus(HttpStatus.OK)
  fun getUsers(
    @RequestParam id: Long?,
    @RequestParam username: String?
  ): List<GetUserDto> {
    return userService.getUsers(id, username)
  }
  ```
]

#slide[
  = Organisation mit Tags
  == Methoden
  #set align(horizon + center)
  #figure(
    image("../../Images/user_controller_method_with_tag.png", fit: "contain"),
    caption: [Methode wird mit Name und Beschreiung versehen. Sie wird dabei nicht mehr innerhalb des Controller Tags gerendert.]
  )
]

#slide[
  = Organisation mit Tags
  == Mehrere Tags
  #set align(horizon + center)
  ```kotlin
  @Tag(name = "...", description = "...")
  @Tag(name = "GET Methods")
  @GetMapping
  @ResponseStatus(HttpStatus.OK)
  fun getUsers(
    @RequestParam id: Long?,
    @RequestParam username: String?
  ): List<GetUserDto> {
    return userService.getUsers(id, username)
  }
  ```
]

#slide[
  = Organisation mit Tags
  == Mehrere Tags
  #set align(horizon + center)
  #figure(
    image("../../Images/get_users_tag_desc.png", fit: "contain"),
    caption: [Eintrag in Swagger mit Name und Beschreibung]
  )
  #figure(
    image("../../Images/get_users_tag_name.png", fit: "contain"),
    caption: [Eintrag in Swagger mit Name]
  )
]

#slide[
  = Organisation mit Tags
  == Mehrere gleiche Tags an Methoden
  #set align(horizon + center)
  #codly(
    highlights: (
      (line: 1, start: 0, end: none, fill: green),
    )
  )
  ```kotlin
  @Tag(name = "GET Methods")
  @GetMapping
  @ResponseStatus(HttpStatus.OK)
  fun getUsers(): List<GetUserDto> {
    // Method Body
  }
  ```
  #codly(
    highlights: (
      (line: 1, start: 0, end: none, fill: green),
    )
  )
  ```kotlin
  @Tag(name = "GET Methods")
  @GetMapping
  @ResponseStatus(HttpStatus.OK)
  fun getTodoItems(): List<GetTodoItemDto> {
      // Method Body
  }
  ```
]

#slide[
  = Organisation mit Tags
  == Mehrere gleiche Tags an Methoden
  #set align(horizon + center)
  #figure(
    image("../../Images/get_methods_tags.png", fit: "contain"),
    caption: [
      Methoden mit gleichen Tags werden in gemeinsame Gruppen gepackt.
    ]
  )
]

#slide[
  = Sortierung der Methoden
  #set align(horizon)
  - Auflistung anhand der HTTP Methoden:
    1. PUT
    2. POST
    3. GET
    4. DELETE
  - `@Tag` fügt ein Feld bei `openAPI.tags` hinzu
  - Wenn Felder wie `description` oder `externalDocs` hinzugefügt werden, wird die Sortierung beeinflusst
  - Wenn ein `@Tag` auf mehrere Operationen zutrifft, wird wieder auf die HTTP Methoden zurückgegriffen
]

#slide[
  = Sortierung der Methoden
  == `tagsSorter` Property
  #set align(horizon)
  #codly(
    header: [
      #set align(center)
      #text(weight: "bold")[application.properties]
    ],
    footer: [
      Alphabetische Sortierung der Tag Gruppen 
    ]
  )
  ```properties
  springdoc.swagger-ui.tagsSorter=alpha
  ```

  #codly(
    header: [
      #set align(center)
      #text(weight: "bold")[application.properties]
    ],
    footer: [
      Sortierung nach Pfaden. Tags werden aber priorisiert.
    ]
  )
  ```properties
  springdoc.writer-with-order-by-keys=true
  ```
]

#slide[
  = Sortierung der Methoden
  == `tags` in `openapi.yaml `
  #set align(horizon)
  #codly(
    header: [
      #set align(center)
      #text(weight: "bold")[openapi.yml]
    ]
  )
  ```yaml
  tags:
  - name: books
    description: Everything about your books
    externalDocs:
      url: http://docs.my-api.com/books.htm
  - name: create
    description: Add a book to the inventory 
    externalDocs:
      url: http://docs.my-api.com/add-book.htm
  ```
  Das `books` Tag wird zuerst gerendert. Danach folgt das `create` Tag.
]

#slide[
  = Sortierung der Methoden
  == `@OpenAPIDefinition`
  #set align(horizon)
  ```kotlin
  @OpenAPIDefinition(
    tags = {
      @Tag(
        name = "create", 
        description = "Add book to inventory"
      ),
      @Tag(
        name = "delete", 
        description = "Delete book from inventory"
      ),
    }
  )
  class BooksController_2 { ... }
  ```
]

// #slide[
//   = `@Operation` und `@ApiResponses`
//   #set align(horizon)
//   ```java
//   @Operation(
//     summary = "Get a book by its id"
//   )
//   @ApiResponses(
//     value = { 
//       @ApiResponse(
//         responseCode = "200", 
//         description = "Found the book", 
//         content = { 
//           @Content(
//             mediaType = "application/json", 
//             schema = @Schema(
//               implementation = Book.class
//             )
//           ) 
//         }
//       ),
//       @ApiResponse(
//         responseCode = "400", 
//         description = "Invalid id supplied", 
//         content = @Content
//       ), 
//       @ApiResponse(
//         responseCode = "404", 
//         description = "Book not found", 
//         content = @Content
//       ) 
//     }
//   )
//   @GetMapping("/{id}")
//   public Book findById(@Parameter(description = "id of book to be searched") 
//     @PathVariable long id) {
//       return repository.findById(id).orElseThrow(() -> new BookNotFoundException());
//   }
//   ```
// ]

#slide[
  = `@Operation`
  #set align(horizon + center)

  ```java
  @Operation(
    summary = "Get a book by its id"
  )
  public Book findById(
    @PathVariable long id
  ) {
    return repository.findById(id).orElseThrow(() -> new BookNotFoundException());
  }
  ```

  #diagram(
    edge(
        (0, 0), 
        "-|>", 
        (0, 1), 
        stroke: stroke(paint: black, thickness: 2pt)
      ),
  )

  #figure(
    image("../../Images/books_operation.png", fit: "contain", width: 100%)
  )
]

#slide[
  = `@ApiResponses`
  #set align(horizon + center)

  ```java
  @ApiResponses(
    value = { 
      @ApiResponse(
        responseCode = "200", 
        description = "Found the book", 
        content = { 
          @Content(
            mediaType = "application/json", 
            schema = @Schema(implementation = Book.class)
          ) 
        }
      )
    }
  )
  public Book findById() {}
  ```
]

#slide[
  = `@ApiResponses`
  #set align(horizon + center)

  #figure(
    image("../../Images/books_api_response_1.png", fit: "contain", width: 75%)
  )
]

#slide[
  = `@ApiResponses`
  #set align(horizon + center)

  ```java
  @ApiResponses(
    value = { 
      ...
      @ApiResponse(
        responseCode = "400", 
        description = "Invalid id supplied", 
        content = @Content
      ), 
    }
  )
  public Book findById() {}
  ```
]

#slide[
  = `@ApiResponses`
  #set align(horizon + center)

  #figure(
    image("../../Images/books_api_response_full.png", fit: "contain", width: 65%)
  )
]

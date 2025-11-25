#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": subchapter-title-slide
#import "../../Components/chapter_titile_slide.typ": chapter-title-slide

#chapter-title-slide(
  section-name: [Integrations-Tests],
  title-text: "Integrations-Tests"
)

#slide[
  = Integrations-Tests
  #set align(horizon)
  - Tests, die mehrere Bestandteile des Gesamtsystems testen
  - Bestandteile müssen in Tests zusammen funktionieren
  - Unterschiedliche Module eines Systems sollen sich so verhalten wie erwartet
  - Kommen meist nach Unit Tests und vor End-To-End Tests

  *Beispiel Integrations-Tests in Spring*:
  - Testing von allen API Endpunkten auf Funktionalität
]

#let integrationTestExampleTitle = [
  Integration Test Beispiel
]
#subchapter-title-slide(
  section-name: integrationTestExampleTitle
)

#slide[
  = #integrationTestExampleTitle
  #set align(horizon + center)
  ```kotlin
  @SpringBootTest
  @AutoConfigureMockMvc
  class UserIntegrationTest {
    @Autowired
    lateinit var mockMvc: MockMvc
    val mapper = jacksonObjectMapper()

    /*
    Test Methoden
    */

  }
  ```
]

#subchapter-title-slide(
  section-name: [GET Request Test]
)

#slide[
  = #integrationTestExampleTitle
  == GET Request Test
  #set align(horizon + center)
  ```kotlin
  @Test
  fun `get users returns success`() {
    mockMvc.get("/users")
      .andDo { MockMvcResultHandlers.print() }
      .andExpect { status { isOk() } }
  }
  ```
]

#slide[
  = #integrationTestExampleTitle
  == GET Request Test
  #set align(horizon + center)
  #codly(
    highlights: (
      (line: 3, start: 3, end: none, fill: green),
    )
  )
  ```kotlin
  @Test
  fun `get users returns success`() {
    mockMvc.get("/users")
      .andDo { MockMvcResultHandlers.print() }
      .andExpect { status { isOk() } }
  }
  ```
  #codly(
    highlights: (
      (line: 2, start: 17, end: 24, fill: green),
    )
  )
  ```kotlin
  @RestController
  @RequestMapping("/users")
  class UserController
  ```
  #set align(left)
  - GET Funktion wird mit der `/users` URL aufgerufen
]

#slide[
  = #integrationTestExampleTitle
  == GET Request Test
  #set align(horizon + center)
  #codly(
    highlights: (
      (line: 4, start: 5, end: none, fill: green),
    )
  )
  ```kotlin
  @Test
  fun `get users returns success`() {
    mockMvc.get("/users")
      .andDo { MockMvcResultHandlers.print() }
      .andExpect { status { isOk() } }
  }
  ```
  #set align(left)
  - Ausgabe der Ergebnisse des MockMVC nach der Anfrage (Optional)
]

#slide[
  = #integrationTestExampleTitle
  == GET Request Test
  #set align(horizon + center)
  #codly(
    highlights: (
      (line: 5, start: 5, end: none, fill: green),
    )
  )
  ```kotlin
  @Test
  fun `get users returns success`() {
    mockMvc.get("/users")
      .andDo { MockMvcResultHandlers.print() }
      .andExpect { status { isOk() } }
  }
  ```
  #set align(left)
  - Überprüfung der Request
  - Status Code wird abgeglichen
  - `.isOk()` überprüft auf Code 200
]

#subchapter-title-slide(
  section-name: [POST Request Test]
)

#slide[
  = #integrationTestExampleTitle
  == POST Request Test
  #set align(horizon + center)
  ```kotlin
  @Test
  fun `post users returns success`() {
    val newUser = CreateUserDto(username = "New User")

    mockMvc.post("/users") {
      contentType = MediaType.APPLICATION_JSON
      content = jsonMapper().writeValueAsString(newUser)
      accept = MediaType.APPLICATION_JSON
    }.andExpect {
      status { isCreated() }
    }
  }
  ```
]

#slide[
  = #integrationTestExampleTitle
  == POST Request Test
  #set align(horizon + center)
  ```kotlin
  val newUser = CreateUserDto(username = "New User")
  ```
  #set align(left)
  - POST Request benötigt ein CreateUserDto
  - DTO wird mit einem Username erstellt
]

#slide[
  = #integrationTestExampleTitle
  == POST Request Test
  #set align(horizon + center)
  #codly(
    highlights: (
      (line: 1, start: 8, end: 22, fill: green),
    )
  )
  ```kotlin
  mockMvc.post("/users") {
    contentType = MediaType.APPLICATION_JSON
    accept = MediaType.APPLICATION_JSON
    content = jsonMapper().writeValueAsString(newUser)
  }.andExpect {
    status { isCreated() }
  }
  ```
  #set align(left)
  - `.post` Funktion wird mit der passenden URL als Parameter aufgerufen
  - Content Typen werden festgelegt
  - DTO wird mit einem JSON Mapper zu einem String umgewandelt
  - `.andExpect` überprüft nach der Request ob die angegebenen Bedingungen erfüllt wurden
]

#slide[
  = #integrationTestExampleTitle
  == POST Request Test
  #set align(horizon + center)
  #codly(
    highlights: (
      (line: 1, start: 8, end: 22, fill: green),
    )
  )
  ```kotlin
  mockMvc.post("/users") {
    contentType = MediaType.APPLICATION_JSON
    accept = MediaType.APPLICATION_JSON
    content = jsonMapper().writeValueAsString(newUser)
  }.andExpect {
    status { isCreated() }
  }
  ```
  #set align(left)
  - `.post` Funktion wird mit der passenden URL als Parameter aufgerufen
]

#slide[
  = #integrationTestExampleTitle
  == POST Request Test
  #set align(horizon + center)
  #codly(
    highlights: (
      
      (line: 2, start: 3, end: 13, fill: green.darken(60%)),
      (line: 2, start: 17, end: none, fill: green),
      (line: 3, start: 3, end: 8, fill: green.darken(60%)),
      (line: 3, start: 12, end: none, fill: green),
    )
  )
  ```kotlin
  mockMvc.post("/users") {
    contentType = MediaType.APPLICATION_JSON
    accept = MediaType.APPLICATION_JSON
    content = jsonMapper().writeValueAsString(newUser)
  }.andExpect {
    status { isCreated() }
  }
  ```
  #set align(left)
  - `.post` Funktion wird mit der passenden URL als Parameter aufgerufen
  - Content Typen werden festgelegt
]

#slide[
  = #integrationTestExampleTitle
  == POST Request Test
  #set align(horizon + center)
  #codly(
    highlights: (
      
      (line: 4, start: 3, end: 9, fill: green.darken(60%)),
      (line: 4, start: 13, end: none, fill: green),
    )
  )
  ```kotlin
  mockMvc.post("/users") {
    contentType = MediaType.APPLICATION_JSON
    accept = MediaType.APPLICATION_JSON
    content = jsonMapper().writeValueAsString(newUser)
  }.andExpect {
    status { isCreated() }
  }
  ```
  #set align(left)
  - `.post` Funktion wird mit der passenden URL als Parameter aufgerufen
  - Content Typen werden festgelegt
  - DTO wird mit einem JSON Mapper zu einem String umgewandelt
]

#slide[
  = #integrationTestExampleTitle
  == POST Request Test
  #set align(horizon + center)
  #codly(
    highlights: (
      (line: 5, start: 2, end: 11, fill: green.darken(60%)),
      (line: 6, start: 3, end: none, fill: green),
    )
  )
  ```kotlin
  mockMvc.post("/users") {
    contentType = MediaType.APPLICATION_JSON
    accept = MediaType.APPLICATION_JSON
    content = jsonMapper().writeValueAsString(newUser)
  }.andExpect {
    status { isCreated() }
  }
  ```
  #set align(left)
  - `.post` Funktion wird mit der passenden URL als Parameter aufgerufen
  - Content Typen werden festgelegt
  - DTO wird mit einem JSON Mapper zu einem String umgewandelt
  - `.andExpect` überprüft nach der Request ob die angegebenen Bedingungen erfüllt wurden
]

#subchapter-title-slide(
  section-name: [Erweiterter POST Request Test]
)

// #slide[
//   = #integrationTestExampleTitle
//   == Erweiterter POST Request Test
//   #set align(horizon + center)
//   ```kotlin
//   @Test
//   fun `post todoItems returns success`() {
//     val newUserGetDto: GetUserDto = createNewUser()

//     val newTodoItem = CreateTodoItemDto(
//       name = "Test Todo Name",
//       description = "Test Todo Description",
//       done = false,
//       created = Date(),
//       shouldBeDoneBy = Date(),
//       userId = newUserGetDto.id
//     )

//     mockMvc.post("/todos") {
//       contentType = MediaType.APPLICATION_JSON
//       content = mapper.writeValueAsString(newTodoItem)
//       accept = MediaType.APPLICATION_JSON
//     }.andExpect {
//       status { isCreated() }
//     }
//   }
//   ```
// ]

#slide[
  = #integrationTestExampleTitle
  == Erweiterter POST Request Test
  #set align(horizon + center)
  ```kotlin
  @Test
  fun `post todoItems returns success`() {
    val newUserGetDto: GetUserDto = createNewUser()
    val newTodoItem = CreateTodoItemDto(/* Values */)

    mockMvc.post("/todos") {
      contentType = MediaType.APPLICATION_JSON
      content = mapper.writeValueAsString(newTodoItem)
      accept = MediaType.APPLICATION_JSON
    }.andExpect {
      status { isCreated() }
    }
  }
  ```
]

#slide[
  = #integrationTestExampleTitle
  == Erweiterter POST Request Test
  #set align(horizon)
  Integrations Test für ein Todo Item. Todo Item braucht einen User. Der Test muss diesen User erstellen. \

  *Test-Schritte:*
  1. Erstellung eines Users mit `mockMvc.post("/users")`
  2. Erstellung eines `CreateTodoItemDto` mit der User ID
  3. Ausführen von `mockMvc.post("/todos")` mit dem DTO als JSON String im Content
  4. Überprüfung des Status Codes der POST Request
]

#slide[
  = #integrationTestExampleTitle
  == Erweiterter POST Request Test
  1. Erstellung eines Users mit `mockMvc.post("/users")`
  #set align(horizon + center)
  ```kotlin
  fun createNewUser(): GetUserDto {
    val newUser = CreateUserDto(username = "New User")
    val postUserResult = mockMvc.post("/users") {
      contentType = MediaType.APPLICATION_JSON
      content = mapper.writeValueAsString(newUser)
      accept = MediaType.APPLICATION_JSON
    }.andExpect {
      status { isCreated() }
    }.andReturn()
    val newUserAsString = postUserResult.response.contentAsString
    return mapper.readValue<GetUserDto>(newUserAsString)
}
  ```
]

#slide[
  = #integrationTestExampleTitle
  == Erweiterter POST Request Test
  1. Erstellung eines Users mit `mockMvc.post("/users")`
  #set align(horizon + center)
  #codly(
    highlights: (
      (line: 7, start: 2, end: none, fill: green),
    )
  )
  ```kotlin
  val postUserResult = mockMvc.post("/users") {
    contentType = MediaType.APPLICATION_JSON
    content = mapper.writeValueAsString(newUser)
    accept = MediaType.APPLICATION_JSON
  }.andExpect {
    status { isCreated() }
  }.andReturn()
  ```
  #set align(left)
  - `.andReturn()` gibt das Ergebnis der Request als Result aus
  - Content vom Result kann als String ausgelesen werden
]

#slide[
  = #integrationTestExampleTitle
  == Erweiterter POST Request Test
  1. Erstellung eines Users mit `mockMvc.post("/users")`
  #set align(horizon + center)
  ```kotlin
  val newUserAsString = postUserResult
    .response
    .contentAsString
  ```
  #set align(left)
  - Mit `.response.contentAsString` kann der Content als JSON String erhalten werden
  - JSON String kann mit JSON Mapper zu einem `GetUserDto` umgewandelt werden um die ID auszulesen
  ```kotlin 
  mapper.readValue<GetUserDto>(newUserAsString)
  ```
]

#slide[
  = #integrationTestExampleTitle
  == Erweiterter POST Request Test
  2. Erstellung eines `CreateTodoItemDto` mit der User ID
  #set align(horizon + center)
  ```kotlin 
  val newTodoItem = CreateTodoItemDto(
    name = "Test Todo Name",
    description = "Test Todo Description",
    done = false,
    created = Date(),
    shouldBeDoneBy = Date(),
    userId = newUserGetDto.id
  )
  ```
]

#slide[
  = #integrationTestExampleTitle
  == Erweiterter POST Request Test
  3. Ausführen von `mockMvc.post("/todos")` mit dem DTO als JSON String im Content
  #set align(horizon + center)
  ```kotlin 
  mockMvc.post("/todos") {
    contentType = MediaType.APPLICATION_JSON
    content = mapper.writeValueAsString(newTodoItem)
    accept = MediaType.APPLICATION_JSON
  }
  ```
]

#slide[
  = #integrationTestExampleTitle
  == Erweiterter POST Request Test
  4. Überprüfung des Status Codes der POST Request
  #set align(horizon + center)
  ```kotlin 
  .andExpect {
    status { isCreated() }
  }
  ```
]

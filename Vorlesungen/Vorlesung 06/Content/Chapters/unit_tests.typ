#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": subchapter-title-slide
#import "../../Components/chapter_titile_slide.typ": chapter-title-slide

#chapter-title-slide(
  section-name: [Unit-Tests],
  title-text: "Unit-Tests"
)

#slide[
  = Unit-Tests
  #set align(horizon)
  - Tests von einzelnen Komponenten
  *Was machen gute Unit Tests aus?*
  - sind isoliert: Sie sind voneinander unabhängig, sodass die Reihenfolge ihrer Ausführung das Testergebnis nicht beeinflusst. Schlägt ein Test fehl, so führt dies nicht dazu, dass weitere Tests fehlschlagen.
  - sichern jeweils genau eine Eigenschaft ab. Ein Problem äußert sich immer in genau einem fehlschlagenden Test.
  - sind vollständig automatisiert, damit sie auch bei erhöhtem Projektdruck noch häufig ausgeführt werden.
  - sind leicht verständlich und kurz.
  ...
]

#slide[
  = Unit Testing in Spring
  #set align(horizon)
  - Springs Architektur macht isoliertes Testen sehr einfach
  - Genutzt werden: _Mock Objects_
  - _Mock Objects_ ersetzen alle Objekte, die nicht direkt getestert werden sollen
  - Ermöglichen zum Beispiel Tests für Service Layer die Repositories benötigen
  - Repositories müssen nicht auf persistente Daten zugreifen
  - Es wird keine laufende Datenbank benötigt
]

#slide[
  = Unit Testing in Spring
  #set align(horizon)
  - Unit Tests brauchen nicht zwingend Funktionalitäten, die Spring bereitstellt
  - Spring bringt Features mit, die Testing vereinfachen
  *Vorteile von Unit Tests:*
  - Schnelle ausführung bei richtiger Konfiguration
  - Es wird keine Laufzeit Infrastruktur benötigt
]

#slide[
  = Spring Testing Komponenten
  #set align(horizon)
  *Mocking:*
  - Environment
  - Servlet API
  - Spring Web Reactive
]

#chapter-title-slide(
  section-name: [Mocking],
  title-text: "Mocking"
)

#slide[
  = Mocking
  == Environment
  #set align(horizon)
  - `org.springframework.mock.env` Package bringt Implementation für `Environment` und `PropertySource`
  - `MockEnvironment` und `MockPropertySource` können genutzt werden
  - Genutzt für _out-of-container_ Tests die Environment spezifische Werte benötigen
]

#slide[
  = Mocking
  == Servlet API
  #set align(horizon)
  - `org.springframework.mock.web` Package enthält Mock Servlet API Objekte
  - Testing von Web Context, Controller und Filter
  - Nutzung in Kombination mit Spring Web MVC
  - Praktischer als dynamische Mock Objekte
  - `MockMVC` als Erweiterung für Integrations-Tests für Spring MVC
]

#slide[
  = Mocking
  == Spring Web Reactive
  #set align(horizon)
  - `org.springframework.mock.http.server.reactive` Package enthält mock Implementationen für:
    - `ServerHttpRequest`
    - `ServerHttpResponse`
  - Nutzung in WebFlux Anwendungen
  - `org.springframework.mock.web.server` Package mit Mock Implementation von `ServerWebExchange`
]

// #slide[
//   = Unit Tests in Springboot & Kotlin
//   #set align(horizon + center)
//   ```kotlin
//   class UserService {
//     fun combineNames(
//       firstName: String, 
//       lastName: String
//     ): String {
//         return "$firstName $lastName"
//     }
//   }
//   ```
// ]

// #slide[
//   = Unit Tests in Springboot & Kotlin
//   #set align(horizon + center)
//   ```kotlin
//     class UserServiceTest {
//       private val userService = UserService()

//       fun testCombineNames() {
//           val firstName = "John"
//           val lastName = "Doe"
//           val expected = "John Doe"

//           val actual = userService.combineNames(firstName, lastName)

//           assertEquals(expected, actual)
//       }
//     }
//   ```
// ]

// #slide[
//   = Erweiterung mit Mockk
//   #set align(horizon + center)
//   ```kotlin
//   @Service
//   class UserService(
//     private val userIntegrationService: UserIntegrationService
//   ) {
//     fun combineNames(
//       firstName: String, 
//       lastName: String
//     ): String {
//       val fullName = "$firstName $lastName"
//       userIntegrationService.integrateUser(
//         firstName, 
//         lastName
//       )
//       return fullName
//     }
//   }
//   ```
// ]

#let exampleMockkTitle = [
  Mockk Beispiel
]

#subchapter-title-slide(section-name: exampleMockkTitle)

#slide[
  = #exampleMockkTitle
  #set align(horizon + center)
  ```kotlin
  class UserServiceTest {
    private val userRepository: UserRepository = mockk()
    private val userService = UserService(userRepository)
    @Test
    fun testCreateUser() {
      val newUserDto = CreateUserDto(
          username = "New User"
      )
      every { userRepository.save(any()) } returns User(
          username = "New User"
      )
      val actual = userService.createUser(newUserDto)
      assertEquals(newUserDto.username, actual.username)
    }
  }
  ```
]

#slide[
  = #exampleMockkTitle
  #set align(horizon + center)
  ```kotlin
  private val userRepository: UserRepository = mockk()
  private val userService = UserService(userRepository)
  ```
  #set align(left)
  - Repository wird gemocked
  - Funktionen im Repository haben keine direkten Funktionen und müssen später definiert werden
  - Mock Repository wird an Service übergeben
]

#slide[
  = #exampleMockkTitle
  #set align(horizon + center)
  #codly(
    annotations: (
      (
        start: 3, 
        end: 5, 
        content: block(
          width: 2em,
          rotate(-90deg, reflow: true)[]
        )
      ),
    ),
  )
  ```kotlin
  @Test
  fun testCreateUser() {
    val newUserDto = CreateUserDto(
        username = "New User"
    )
    every { userRepository.save(any()) } returns User(
        username = "New User"
    )
    val actual = userService.createUser(newUserDto)
    assertEquals(newUserDto.username, actual.username)
  }
  ```
  #set align(left)
  - Zu erstellender User wird mit einem DTO erstellt
]

#slide[
  = #exampleMockkTitle
  #set align(horizon + center)
  #codly(
    annotations: (
      (
        start: 6, 
        end: 8, 
        content: block(
          width: 2em,
          rotate(-90deg, reflow: true)[]
        )
      ),
    ),
  )
  ```kotlin
  @Test
  fun testCreateUser() {
    val newUserDto = CreateUserDto(
        username = "New User"
    )
    every { userRepository.save(any()) } returns User(
        username = "New User"
    )
    val actual = userService.createUser(newUserDto)
    assertEquals(newUserDto.username, actual.username)
  }
  ```
  #set align(left)
  - `save` Funktion im Repository wird definiert
  - Erstellung eines neuen Users mit passendem Username
]

#slide[
  = #exampleMockkTitle
  #set align(horizon + center)
  #codly(
    annotations: (
      (
        start: 9, 
        end: 9, 
        content: block(
          width: 2em,
          rotate(-90deg, reflow: true)[]
        )
      ),
    ),
  )
  ```kotlin
  @Test
  fun testCreateUser() {
    val newUserDto = CreateUserDto(
        username = "New User"
    )
    every { userRepository.save(any()) } returns User(
        username = "New User"
    )
    val actual = userService.createUser(newUserDto)
    assertEquals(newUserDto.username, actual.username)
  }
  ```
  #set align(left)
  - Aufruf der `createUser` Funktion im Service
  - `save` Funktion, die definiert wurde wird genutzt zur User Erstellung
]

#slide[
  = #exampleMockkTitle
  #set align(horizon + center)
  #codly(
    annotations: (
      (
        start: 10, 
        end: 10, 
        content: block(
          width: 2em,
          rotate(-90deg, reflow: true)[]
        )
      ),
    ),
  )
  ```kotlin
  @Test
  fun testCreateUser() {
    val newUserDto = CreateUserDto(
        username = "New User"
    )
    every { userRepository.save(any()) } returns User(
        username = "New User"
    )
    val actual = userService.createUser(newUserDto)
    assertEquals(newUserDto.username, actual.username)
  }
  ```
  #set align(left)
  - Abgleichen vom gewollten Username und dem Username vom erstellen User
  - Wenn beide Namen gleich sind, war der Test erfolgreich
]

// #slide[
//   = #exampleMockkTitle
//   #set align(horizon + center)
//   ```kotlin
//   class UserServiceTest {

//       private val userIntegrationService = mockk<UserIntegrationService>()
//       private val userService = UserService(userIntegrationService)

//       @Test
//       fun testCombineNames() {
//           val firstName = "John"
//           val lastName = "Doe"
//           val expected = "John Doe"

//           every { 
//               userIntegrationService
//                   .integrateUser(firstName, lastName) 
//           } returns Unit

//           val actual = userService.combineNames(firstName, lastName)

//           assertEquals(expected, actual)
//           verify(exactly = 1) { 
//               userIntegrationService.integrateUser(firstName, lastName) 
//           }
//       }
//   }
//   ```
// ]

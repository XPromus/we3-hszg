#import "../../../../template/definitions.typ": *

== Unit Tests <backend_unit_tests>

In Spring wird Unit Testing durch einige Features gut unterstützt. 
Wenn man dabei den Architektur Empfehlungen folgt, sollte sich eine Anwendungsstruktur ergeben, die das isolierte Testing von Komponenten sehr einfach möglich macht. 
Eine Methode dafür sind _Mock Objects_.
Diese erlauben, zum Beispiel, das Testing von Service Layern, die Repositories benötigen. 
Diese Repositories müssen bei den Tests nicht auf persistente Daten zugreifen. 
Also muss, zum Beispiel, keine weitere Datenbank im Hintergrund laufen. \

Ein weiterer Vorteil von Unit Tests ist, dass sie bei richtiger Konfiguration extrem schnell laufen und keine Laufzeit Infrastruktur benötigen. 
Gute Unit Tests können dabei auch ohne die Möglichkeiten, die Spring bietet, geschrieben werden. 
Für einige Use Cases bietet Spring allerdings schon Funktionalitäten an, die den Prozess vereinfachen. @springUnitTesting

=== Mock Objects <backend_unit_tests_mock_objects>
Spring enthält folgende Packages für Mocking:
- Environment
- Servlet API
- Spring Web Reactive

*Environment*: Das `org.springframework.mock.env` Package bringt Implementationen für die `Environment` und `PropertySource` Abstraktionen. 
`MockEnvironment` und `MockPropertySource` können dabei genutzt werden, um out-of-container Tests zu schreiben, die Environment spezifische Werte benötigen. \

*Servlet API*: Das `org.springframework.mock.web` Package enthält eine Menge an Mock Servlet API Objekten. 
Diese können genutzt werden, um Web Context, Controller und Filter zu testen. 
Sie sollen zusammen mit Spring Web MVC genutzt werden, da sie praktischer sind als dynamische Mock Objekte. 
Als Erweiterung existiert noch `MockMvc`, welches auf der mock Servlet API aufbaut und Integrations Tests für Spring MVC anbietet. \

*Spring Web Reactive*: Das `org.springframework.mock.http.server.reactive` Package enthält Mock Implementationen für `ServerHttpRequest` und `ServerHttpResponse`, die in WebFlux Anwendungen genutzt werden. 
Dazu enthält das `org.springframework.mock.web.server` Package eine Mock Implementation von `ServerWebExchange`.

=== Unit Tests in Springboot & Kotlin <backend_unit_tests_springboot_kotlin> 

```kotlin
class UserService {
    fun combineNames(firstName: String, lastName: String): String {
        return "$firstName $lastName"
    }
}
```

```kotlin
class UserServiceTest {
    private val userService = UserService()

    fun testCombineNames() {
        val firstName = "John"
        val lastName = "Doe"
        val expected = "John Doe"

        val actual = userService.combineNames(firstName, lastName)

        assertEquals(expected, actual)
    }
}
```

Erweiterung mit Mockk: \

```kotlin
@Service
class UserService(
    private val userIntegrationService: UserIntegrationService
) {
    fun combineNames(firstName: String, lastName: String): String {
        val fullName = "$firstName $lastName"
        userIntegrationService.integrateUser(firstName, lastName)
        return fullName
    }
}
```

```kotlin
class UserServiceTest {

    private val userIntegrationService = mockk<UserIntegrationService>()
    private val userService = UserService(userIntegrationService)

    @Test
    fun testCombineNames() {
        // Given
        val firstName = "John"
        val lastName = "Doe"
        val expected = "John Doe"

        every { 
            userIntegrationService
                .integrateUser(firstName, lastName) 
        } returns Unit

        // When
        val actual = userService.combineNames(firstName, lastName)

        // Then
        assertEquals(expected, actual)
        verify(exactly = 1) { 
            userIntegrationService.integrateUser(firstName, lastName) 
        }
    }
}
```

Es wird überprüft, ob die `integrateUser` Methode innerhalb der `combineNames` Methode aufgerufen wird. 
Diese Überprüfung wird mit `verify` ausgeführt. 
Durch die Spezifizierung von ```kotlin exactly = 1``` innerhalb von `verify` wird überprüft, dass die Methode nur einmal aufgerufen wird. 
Sollte sie mehrfach aufgerufen werden wird der Test nicht erfolgreich laufen. \

Dazu wird noch eine "gemockte" Klasse `UserIntegrationService` hinzugefügt. 
Das Ziel hier ist es, die `UserService` Klasse, die das Ziel unserer Tests ist, von ihren Abhängigkeiten zu isolieren. \

Die `combineNames` Methode wird nun durch eine mögliche Exception erweitert.

```kotlin
@Service
class UserService(
    private val userIntegrationService: UserIntegrationService
) {
    fun combineNames(firstName: String, lastName: String): String {
        if (firstName.isBlank() || lastName.isBlank()) {
            throw IllegalArgumentException(
                "firstName or lastName are empty."
            )
        }
        val fullName = "$firstName $lastName"
        userIntegrationService.integrateUser(firstName, lastName)
        return fullName
    }
}
```

Der Test muss nun erweitert werden, damit diese Exception behandelt werden kann.

```kotlin
class UserServiceTest {

    private val userIntegrationService = mockk<UserIntegrationService>()
    private val userService = UserService(userIntegrationService)

    @Test
    fun testCombineNames() {
        // Given
        val firstName = "John"
        val lastName = "Doe"
        val expected = "John Doe"

        every { 
            userIntegrationService.integrateUser(firstName, lastName) 
        } returns Unit

        // When
        val actual = userService.combineNames(firstName, lastName)

        // Then
        assertEquals(expected, actual)
        verify(exactly = 1) { 
            userIntegrationService.integrateUser(firstName, lastName) 
        }
    }

    @Test
    fun testCombineNames_WithEmptyName() {
        // Given
        val firstName = ""
        val lastName = "Doe"

        // When - Then
        assertThrows(IllegalArgumentException::class.java) {
            userService.combineNames(firstName, lastName)
        }
    }
}
```

Mit dem neuen Test, der hinzugefügt wurde, wird die Exception geworfen, da der Vorname leer ist. 
Wenn diese Exception geworfen wurde, ist der Test ein Erfolg. 
@backendUnitTestsKotlinSpringboot

==== Mockk <mockk>
Beispiel @mockkExample:
```kotlin
val car = mockk<Car>()

every { car.drive(Direction.NORTH) } returns Outcome.OK

car.drive(Direction.NORTH) // returns OK

verify { car.drive(Direction.NORTH) }

confirmVerified(car)
```

== JUnit5 <junit5>
JUnit5 wird in Spring Boot direkt mitgeliefert. 
Es bringt einige Features mit, die für die Entwicklung mit Kotlin sehr hilfreich sind. 
Zum Beispiel: Autowiring von Contructor und Method Parametern. 
Dadurch können non-nullable `val` Variablen und `@BeforeAll` und `@AfterAll` genutzt werden. \

Beispiel eines Integrations Tests: \
```kotlin
@SpringBootTest(
    webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT
)
class IntegrationTests(
    @Autowired val restTemplate: TestRestTemplate
) {
  @Test
  fun `Assert blog page title, content and status code`() {
    val entity = restTemplate.getForEntity<String>("/")
    assertThat(entity.statusCode).isEqualTo(HttpStatus.OK)
    assertThat(entity.body).contains("<h1>Blog</h1>")
  }
}
```

Folgende Konzepte sind hier wichtig:
- Es werden volle Sätze als Funktionsnamen benutzt
- JUnit 5 erlaubt es Konstruktor und Methoden Parameter zu injecten
- Im Beispiel hier wird `getForObject` und `getForEntity` genutzt, die separat importiert werden müssen.

=== Lifecycle <junit5_lifecycle>
Manche Methoden sollen vor oder nach allen Tests ausgeführt werden. 
Wenn man in der `src/test/resources/junit-platform.properties` folgende Änderung durchführt:

```properties
junit.jupiter.testinstance.lifecycle.default = per_class
```

kann man die `@BeforeAll` und `@AfterAll` Annotationen an normalen Methoden benutzen.

```kotlin
@SpringBootTest(
    webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT
)
class IntegrationTests(
    @Autowired val restTemplate: TestRestTemplate
) {
  @BeforeAll
  fun setup() {
    println(">> Setup")
  }

  @Test
  fun `Assert blog page title, content and status code`() {
    println(">> Assert blog page title, content and status code")
    val entity = restTemplate.getForEntity<String>("/")
    assertThat(entity.statusCode).isEqualTo(HttpStatus.OK)
    assertThat(entity.body).contains("<h1>Blog</h1>")
  }

  @Test
  fun `Assert article page title, content and status code`() {
    println(">> TODO")
  }

  @AfterAll
  fun teardown() {
    println(">> Tear down")
  }
}
```

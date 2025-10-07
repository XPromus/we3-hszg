#import "../../../../template/definitions.typ": *

=== OpenAPI UI
```kotlin
// build.gradle.kts
dependencies {
  implementation("org.springdoc:springdoc-openapi-starter-webmvc-ui:2.8.4")
}
```
*URL:* #link("http://localhost:8080/swagger-ui/index.html?configUrl=/v3/api-docs/swagger-config")[http://localhost:8080/swagger-ui/index.html?configUrl=/v3/api-docs/swagger-config]

#figure(
  image("../../../../images/swagger_ui.png", fit: "contain", width: 50%),
  caption: "Swagger UI zum Darstellen und Testen der REST Endpunkte"
)

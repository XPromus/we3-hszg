#import "../../../../../template/definitions.typ": *

==== Application Konfiguration

```yaml
# application.yml

server:
  port: 8080

spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/database
    username: database_username
    password: database_password
  jpa:
    hibernate:
      ddl-auto: create-drop
    show-sql: true
    properties:
      hibernate:
        format_sql: true
```
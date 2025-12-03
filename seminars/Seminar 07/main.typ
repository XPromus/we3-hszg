#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

#show: codly-init.with()
#codly(languages: codly-languages)

= Seminar 07

== Container für die Spring Anwendung
1. Definiere die Main Klasse der Anwendung in `built.gradle.kts`
#codly(
  header: [
    #set align(center) 
    build.gradle.kts
  ]
)
```kts
plugins {
  ...
  application
}

application {
    mainClass.set("com.hszg.todolist.TodoListApplicationKt")
}
```

2. Schreibe ein Dockerfile für die Spring Anwendung in das Projekt Root-Directory
#codly(
  header: [
    #set align(center) 
    Dockerfile
  ]
)
```Dockerfile
FROM gradle:8-jdk21 AS build

ARG APP_VERSION

WORKDIR /build

COPY ../../ ./

RUN gradle assemble

WORKDIR /dist
RUN tar --strip-components 1 -xf "/build/build/distributions/todo-list-$APP_VERSION.tar"

FROM eclipse-temurin:21-alpine

WORKDIR /app

COPY --from=build /dist/ ./

EXPOSE 8080

ENTRYPOINT ["/app/bin/todo-list"]
```

#pagebreak()

3. Erweitere die docker-compose.yml für den neuen Container
#codly(
  header: [
    #set align(center) 
    docker-compose.yml
  ]
)
```yml
services:
  todo_list_backend:
    build:
      context: .
      dockerfile: ./Dockerfile
      args:
        APP_VERSION: "0.0.1-SNAPSHOT"
    container_name: todo_list_backend
    depends_on:
      - db
    environment:
      - SPRING_DATASOURCE_URL=jdbc:postgresql://todo_list_db:5432/todo_db
      - SPRING_DATASOURCE_USERNAME=todo
      - SPRING_DATASOURCE_PASSWORD=todo
      - SPRING_JPA_HIBERNATE_DDL_AUTO=create-drop
    networks:
      - todo_network
    ports:
      - "8080:8080"
```

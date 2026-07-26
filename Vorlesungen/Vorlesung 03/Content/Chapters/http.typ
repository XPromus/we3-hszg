#import "../../Template/definitions.typ": *

#slide[
  #toolbox.register-section([HTTP])
  =
  #set align(horizon + center)
  #let defaultNode(
    x: int,
    y: int,
    shape: fletcher.shapes,
    name: label,
    content
  ) = {
    node(
      (x, y),
      name: name,
      fill: gray.lighten(90%),
      stroke: black,
      shape: shape,
    )[
      #content
    ]
  }

  #diagram(
    node-stroke: 1pt,
    node-inset: 10pt,
    defaultNode(x: 5, y: 0, shape: rect, name: <Frontend>)[Frontend],
    defaultNode(x: 0, y: 0, shape: rect, name: <Backend>)[Backend],
    edge(<Frontend>, "-|>", <Backend>, bend: -30deg)[1. HTTP Request],
    edge(<Backend>, "-|>", <Frontend>, bend: -30deg)[2. HTTP Response],
  )
]

#slide[
  =
  #set align(horizon + center)
  #let defaultNode(
    x: int,
    y: int,
    shape: fletcher.shapes,
    name: label,
    content
  ) = {
    node(
      (x, y),
      name: name,
      fill: gray.lighten(90%),
      stroke: black,
      shape: shape,
    )[
      #content
    ]
  }

  #diagram(
    node-stroke: 1pt,
    node-inset: 10pt,
    defaultNode(x: 5, y: 0, shape: rect, name: <Frontend>)[Frontend],
    defaultNode(x: 0, y: 0, shape: rect, name: <Backend>)[Backend],
    edge(<Frontend>, "-|>", <Backend>, bend: -30deg, stroke: red)[#text(fill: red, weight: "bold")[1. HTTP Request]],
    edge(<Backend>, "-|>", <Frontend>, bend: -30deg)[2. HTTP Response],
  )
]

#slide[
  = HTTP Request
  #set align(horizon)
  *Bestandteile*
  - Ein *HTTP Verb*, dass die Art der Operation definiert
  - Einen *Header*, der Informationen über die Request enthält
  - Einen *Pfad* zu einer Ressource
  - Einen optionalen *Body*, der weitere Daten enthält
]

#slide[
  = HTTP Request
  == Header
  #set align(horizon)
  - `accept` Feld: Welche Ressource nimmt der Client an
  - Art der Ressource über MIME Types
  *MIME Type*:
  ```
    type/subtype;parameter=value
  ```
  - `parameter` ist optional
  - *Beispiele*: `image/png`, `audio/wav`, `application/json`
]

#slide[
  = HTTP Request
  == Pfad
  #set align(horizon)
  - Definiert, auf welcher Ressource die Operation ausgeführt werden soll
  - Erster Teil sollte die Pluralform der Ressource sein
  *Beispiel*: `store.com/customers/223/orders/12`
  #guideline[Lesbarkeit der Pfade][
    Gute Lesbarkeit der Pfade in der API, auch wenn man nicht mit der API vertraut ist
  ]
]

#let httpRequestExample = {
  ```
    POST http://localhost:8080/todos HTTP/1.1
    accept: */*
    Content-Type: application/json

    {
      "name": "todoItemName",
      "description": "newDescription",
      "done": true,
      "created": "2025-10-23T15:06:08.738Z",
    }
  ```
}

#slide[
  = HTTP Request
  #set align(horizon + center)
  #httpRequestExample
]

#slide[
  = HTTP Request
  #set align(horizon + center)
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
        start: 4, end: 10,
        content: block(
          width: 2em,
          rotate(-90deg, reflow: true, align(center)[JSON Body])
        )
      ),
    )
  )
  #httpRequestExample
]

#slide[
  =
  #set align(horizon + center)
  #let defaultNode(
    x: int,
    y: int,
    shape: fletcher.shapes,
    name: label,
    content
  ) = {
    node(
      (x, y),
      name: name,
      fill: gray.lighten(90%),
      stroke: black,
      shape: shape,
    )[
      #content
    ]
  }

  #diagram(
    node-stroke: 1pt,
    node-inset: 10pt,
    defaultNode(x: 5, y: 0, shape: rect, name: <Frontend>)[Frontend],
    defaultNode(x: 0, y: 0, shape: rect, name: <Backend>)[Backend],
    edge(<Frontend>, "-|>", <Backend>, bend: -30deg)[1. HTTP Request],
    edge(<Backend>, "-|>", <Frontend>, bend: -30deg, stroke: red)[#text(fill: red, weight: "bold")[2. HTTP Response]],
  )
]

#slide[
  = HTTP Response
  #set align(horizon)
  - Datentyp angeben wenn Daten zurückgegeben werden sollen
  - Content Type im Header wie bei Request
  - Status Code anhängen für Informationen über Ausgang der Request
]

#let httpResponseExample = {
  ```
    HTTP/1.1 200 OK
    connection: keep-alive
    content-type: application/json
    date: Thu,23 Oct 2025 16:45:09 GMT
    keep-alive: timeout=60
    transfer-encoding: chunked

    [
      {
        "id": 0,
        // Mehr Daten
      }
    ]
  ```
}

#slide[
  = HTTP Response
  #set align(horizon + center)
  #httpResponseExample
]

#slide[
  = HTTP Response
  #set align(horizon + center)
  #codly(
    highlights: (
      (line: 1, start: 12, end: 17, fill: red),
      (line: 3, start: 17, end: none, fill: green),
    ),
    annotations: (
      (
        start: 1, end: 1,
        content: block(
          width: 2em,
          rotate(-90deg, reflow: true, align(center)[Status Code])
        )
      ),
      (
        start: 2, end: 6,
        content: block(
          width: 2em,
          rotate(-90deg, reflow: true, align(center)[Header])
        )
      ),
      (
        start: 7, end: 13,
        content: block(
          width: 2em,
          rotate(-90deg, reflow: true, align(center)[JSON Body])
        )
      ),
    )
  )
  #httpResponseExample
]

#slide[
  =
  #set align(horizon + center)
  ```kotlin
    @GetMapping
    fun getEntities() {}

    @PostMapping
    fun createEntity() {}

    @PutMapping
    fun updateEntity() {}

    @DeleteMapping
    fun deleteEntity() {}
  ```
]

#slide[
  = HTTP Methoden
  #set align(horizon)
  - HTTP definiert Verben, die Ziele von Request genauer beschreiben
  #table(
    columns: (1fr, 1fr),
    stroke: white,
    inset: 10pt,
    [*Häufige Verben:*],
    [*Weitere Verben:*],
    [GET],[HEAD],
    [POST],[CONNECT],
    [PUT],[OPTIONS],
    [DELETE],[TRACE],
    [],[PATCH],
  )
]

#slide[
  = HTTP Methoden
  == GET
  #set align(horizon)
  - Stellt Anfrage an Server eine Ressource zu transferieren
  - Sollten immer gleiche Ergebnisse bei gleichen Parametern erziehlen
  - Content sollte nie mit einer GET Request erstellt werden
  - Caching ist möglich
  #notice[Informationen in der UI][
    Es ist zu beachten, dass wenn Ressourcen nur über URIs angefragt werden, potentiell sicherheitskritische Informationen in dieser URI landen können. 
    Wenn es nicht möglich ist, diese Informationen in weniger kritische zu transformieren wird das Nutzen einer POST Request mit den Daten im Request Content empfohlen.
  ]
]

#slide[
  = HTTP Methoden
  == POST
  #set align(horizon)
  - Wird genutzt um transferierte Daten nach Server Sezifikation zu verarbeiten
  - Beispiel:
    - Daten in Inputfeldern übergeben
    - Nachrichten Posten (Foren, Social Media usw.)
    - Erstellen von neuen Ressourcen
    - Daten an vorhandene Ressourcen anhängen
  - Server kommuniziert mit Status Codes das Ergebnis der POST Request
  - Bei Erfolg: 206 (Partial Content)
  - Bei erfolgreichem Erstellen einer neuen Ressource: 201 mit Pfad zur neuen Ressource
]

#slide[
  = HTTP Methoden
  == PUT
  #set align(horizon)
  - Editieren von vorhandenen Ressource oder Erstellung von neuen Ressourcen
  - Anfrage basiert auf mitgeschickten Daten
  - Wenn Ressource nicht vorhanden ist wird sie neu erstellt
  - Status Code 201 nach Erstellen neuer Ressource
  - Wenn kein neuer Eintrag erstellt wurde: Status Code 200 oder 204
  - Server sollte Daten in der PUT Request validieren
  - Wenn Fehler in den Daten: Selbst Versuchen Daten in passendes Format zu bringen oder 409/415 zurückgeben
]

#slide[
  = HTTP Methoden
  == DELETE
  #set align(horizon)
  - Request an den Server Ressource zu löschen
  - Entweder Entfernen von Referenzen oder komplettes Löschen der Ressource
  - DELETE sollte nur bei Ressourcen erlaubt sein, die definierte Löschvorgänge besitzen 
  - Bei Erfolg einer der folgenden Codes:
    - *202 (Accepted)* wenn das Löschen wahrscheinlich erfolgreich sein wird, aber noch nicht durchgeführt wurde
    - *204 (No Content)* Löschen wurde ausgeführt und keine weiteren Informationen sind nötig
    - *200 (OK)* Löschen war erfolgreich und die Response enthält noch Informationen über den aktuellen Status
]

#slide[
  = HTTP Methoden
  == idempotente Methoden
  #set align(horizon)
  - Mutiple Ausführung hat den gleichen Effekt auf dem Server
  - Wichtig bei automatischen Anfragen (z.B.: Wiederholung bei Fehlschlag)
  - PUT und DELETE sind automatisch idempotent
  - _safe request methods_ sind idempotent
  - Server kann trotzdem Nebeneffekte einfügen (z.B.: Logs)
  - Nebeneffekte dürfen Ergebnis nicht verändern 
  - Nicht idempotente Methoden sollten nicht automatisch wiederholt werden (Außer Implementation ist idempotent)
]

#slide[
  = HTTP Status Codes
  #set align(horizon)
  - Status Code gehört zu jeder HTTP Response
  - Zwischen 100 und 599
  - Erste Ziffer gibt Klasse der Response an
    - *1xx (Informational)*: Die Request wurde erhalten und wird verarbeitet
    - *2xx (Successful)*: Die Request wurde erfolgreich erhalten, verstanden und akzeptiert
    - *3xx (Rediraction)*: Es müssen weitere Schritte durchgeführt werden, damit die Request verarbeitet werden kann
    - *4xx (Client Error)*: Die Request enthält falschen Syntax oder kann nicht erfüllt werden
    - *5xx (Server Error)*: Der Server konnte eine eigentlich valide Request nicht erfüllen
]

#slide[
  = HTTP Status Codes
  #set align(horizon + center)
  #table(
    columns: (1fr, 1fr),
    inset: 10pt,
    align: horizon,
    table.header(
      [*Status Code*], [*Bedeutung*]
    ),
    [200 (OK)], [Standard Antwort Erfolg],
    [201 (CREATED)], [Standard Antwort für neue Ressource],
    [204 (NO CONTENT)], [Standard Antwort für Erfolg ohne Daten im Response Body],
    [400 (BAD REQUEST)], [Die Request konnte nicht verarbeitet werden],
    [403 (FORBIDDEN)], [Der Client hat keine Rechte auf diese Ressource zuzugreifen],
    [404 (NOT FOUND)], [Die Gewünschte Ressource konnte nicht gefunden werden],
    [500 (INTERNAL SERVER ERROR)], [Die generische Antwort für einen unerwarteten Fehler],
  )
]

// LTeX: enabled=true language=de-DE
#import "../../src/hszg_template.typ": *

= Lehrveranstaltungsübersicht
<ch_lecture_overview>

#let startDate = datetime(
  year: 2026,
  month: 10,
  day: 9,
)
#let duration = duration(
  days: 7
)
#let dateDisplay = "[day].[month].[year]"

#set table.cell(breakable: false)

#table(
  columns: (auto, auto, 1fr, 1fr),
  fill: (x, y) => {
    if (y == 0) {
      return hszg_main_color
    } else {
      return hszg_main_color.lighten(90%)
    }
  },
  table.header(
    [\#], [Datum], [Vorlesung], [Seminar]
  ),
  [01], 
  [#startDate.display(dateDisplay)], 
  [
    Organisation & Prüfungsanforderungen; 
    Grundbegriffe (Client/Server, API, REST, MVC, DTO, CRUD, ORM); 
    Full-Stack-Struktur; 
    Datenbank-Überblick; 
    Backend-Überblick (Spring Boot, Kotlin);  
    Frontend-Überblick (SvelteKit, TailwindCSS, Vite);  
    Containerisierung-Überblick; 
    Git-Grundlagen;
  ], 
  [-],

  [02], [#{startDate + duration}.display(dateDisplay)], [Spring-Komponentenmodell; Entity; Repository; Controller; Service; DTO; Mapper], [Todo-REST-API aufbauen: Entity, Repository, Controller (GET/POST), Service; optional PUT/DELETE; Test über Swagger UI],
  [03], [#{startDate + duration * 2}.display(dateDisplay)], [HTTP-Requests & -Responses; HTTP-Methoden; Inversion of Control; Dependency Injection; IoC-Container; Spring Framework; Spring Beans; Singleton- & Prototype-Pattern], [PUT/DELETE für Todos abschließen; Backend um User-Entity erweitern; DTOs & Mapper; vollständiger CRUD-Controller & Service], 
  [04], [#{startDate + duration * 3}.display(dateDisplay)], [Spring-Anwendungskontext; Ablauf in der Spring-Anwendung; Entity & Repository (Wiederholung); POST-Requests in Spring], [User-Entity, DTOs, Mapper, Repository, Service und vollständigen CRUD-Controller implementieren], 
  [05], [#{startDate + duration * 4}.display(dateDisplay)], [Spring Data JPA; Spring-Konfiguration (`application.yml`, Profile); Einführung Docker (Dockerfile, Compose); Prüfungs-/Projektanforderungen], [Entity-Relationen (User ↔ Todo, Many-to-One); Spring-PostgreSQL-Konfiguration; Docker Compose für PostgreSQL],
  [06], [#{startDate + duration * 5}.display(dateDisplay)], [Spring Testing-Überblick; Unit Tests (JUnit 5, Mockito); Integrationstests (`@SpringBootTest`, MockMvc); Projektbeispiele (Finanzapp, Notensoftware, externe APIs)], [Backend-Tests schreiben],
  [07], [#{startDate + duration * 6}.display(dateDisplay)], [Error Handling in Spring (`@ControllerAdvice`, eigene Fehlermodelle, HTTP-Statuscodes); API-Dokumentation (OpenAPI, Swagger/Scalar)], [Error Handling in der Todo-App; Spring-Anwendung als Container bauen & starten],
  [08], [#{startDate + duration * 7}.display(dateDisplay)], [SvelteKit vertieft: Routing, Layouts, Load Functions; client- vs. serverseitiges Data Fetching; Formulare & Validierung; State Management (Stores); API-Fehler- & Ladezustände; Komponentenkomposition (Tailwind, shadcn-svelte)], [Todo-List-Frontend erweitern: CRUD-UI an alle API-Endpunkte anbinden], 
  [09], [#{startDate + duration * 8}.display(dateDisplay)], [Authentifizierung vs. Autorisierung; Passwort-Hashing; JWT & Refresh Tokens; Spring Security; CORS, CSRF, Security Headers; RBAC; optional OAuth2/OIDC-Überblick], [Login & Registrierung; geschützte API- und Frontend-Routen], 
  [10], [#{startDate + duration * 9}.display(dateDisplay)], [JPA-Relationen vertieft (One-to-Many, Many-to-Many, Cascade, Fetch-Typen); `@Transactional`; Datenbankmigrationen (Flyway/Liquibase); Query-Optimierung (N+1, Pagination)], [Mehrschichtiges Domänenmodell mit Migrationen und transaktionalen Services], 
  [11], [#{startDate + duration * 10}.display(dateDisplay)], [Externe API-Integration; BFF mit SvelteKit; Resilience (Timeouts, Retries, Circuit Breaker); optional asynchrone Verarbeitung (Queues/Events); GraphQL als REST-Alternative (Überblick)], [Öffentliche externe API integrieren (z. B. Wetter, Flüge)],
  [12], [#{startDate + duration * 11}.display(dateDisplay)], [Testing-Pyramide; Testcontainers für PostgreSQL; API-/Contract-Tests (REST Assured); Frontend-Komponententests (Vitest); E2E-Tests (Cypress/Playwright); Testdaten-Management], [E2E-Testsuite gegen laufenden Docker-Compose-Stack], 
  [13], [#{startDate + duration * 12}.display(dateDisplay)], [Production Docker (Multi-Stage-Builds, Health Checks); Docker-Compose-Netzwerke & Secrets; Reverse Proxy (Nginx/Caddy); CI/CD mit GitHub Actions; strukturiertes Logging & Health Endpoints; Umgebungstrennung (Dev/Prod-Profile)], [Vollständiger Production-Compose-Stack; einfache CI-Pipeline (Build + Test bei Push)],
  [14], [#{startDate + duration * 13}.display(dateDisplay)], [Architektur-Review: Schichten- vs. Hexagonal-Architektur; Modular Monolith vs. Microservices; nicht-funktionale Anforderungen; Caching & Rate Limiting; Frontend-Performance (Core Web Vitals); Fehlerbehandlung & Graceful Degradation], [Projektarchitektur refaktorisieren oder erweitern; Designentscheidungen für den Beleg dokumentieren], 
  [15], [#{startDate + duration * 14}.display(dateDisplay)], [Prüfungsvorbereitung & Q&A; Projektkomplexitätsstufen; Aufbau von Präsentation & Beleg; optionale Vertiefungsthemen (WebSockets, File Upload, i18n, Barrierefreiheit, AI/LLM-Backend-Integration)], [Abschlussarbeit am Projekt; Probedurchläufe der Präsentation]

)

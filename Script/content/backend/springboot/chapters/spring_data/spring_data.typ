#import "../../../../../template/definitions.typ": *

=== Spring Data & Spring Data JPA

Das Ziel von Spring Data ist es, ein auf Spring basierendes Programmiermodell bereitzustellen, mit dem man auf Daten zugreifen kann. 
Neben diesem Zugriff sollen auch die Eigenschaften des Data Stores erhalten bleiben. \

Der Fokus liegt dabei auf die einfache Nutzen von Datenbanken, Cloud basierten Datendiensten, Map-Reduce Frameworks und Zugriffstechnologien. 
Spring Data selbst ist dabei ein übergreifendes Projekt, welches viele Subprojekte besitzt, die zum Beispiel auf eine bestimmte Datenbank zugeschnitten sind. \

Folgende Features stellt Spring Data bereit:
- Repositories und Object-Mapping-Abstraktionen
- Dynamische Query Generierung basierend auf Methoden Namen
- Support für `Auditing` mit Informationen über `created` und `last changed`
- Integrierung von eigenem Repository-Code ist möglich

@springDataOverviewDocs

#include "spring_data_jpa.typ"

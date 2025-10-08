#import "../../template/definitions.typ": *

== HTTP

=== Request
Die Request vom Client hat einige Bestandteile:
- Ein *HTTP Verb*, dass die Art der Operation definiert
- Einen *Header*, der Informationen über die Request enthält
- Einen *Pfad* zu einer Ressource
- Einen optionalen *Body*, der weitere Daten enthält

==== Header
Der Header wird angegeben, welche Art von Ressource der Client akzeptiert. 
Definiert wird das im `accept` Feld. 
Diese Ressourcen werden über MIME Types (Multipurpose Internet Mail Extensions) definiert. 
Der Grundaufbau eines MIME Types ist wie folgt: `type/subtype;parameter=value`.
Das `parameter` Feld ist dabei optional. \
Eingie Beispiele für MIME Types: `image/png`, `audio/wav`, `application/json`

==== Pfad
Der Pfad definiert, auf welcher Ressource die Operation ausgeführt werden soll. 
Es ist dabei anzustreben, dass in den APIs diese Pfade so gesetzt werden, dass sie gut vom Client lesbar sind. 
So sollte der erste Teil des Pfades die Pluralform der Ressource sein. \

Beispiel: `store.com/customers/223/orders/12` \

Dieses Format erlaubt einfache Lesbarkeit des Pfades, auch wenn man selbst nicht mit der API vertraut ist.

=== Response
Wenn der Server mit einer Menge an Daten antworten will muss er einen Content Type in den Header seiner Antwort packen. 
Auch hier werden wieder MIME Types genutzt. \
Dazu wird auch noch ein Status Code angehangen.

=== Methoden <http_methods>
HTTP definiert eine Menge an Verben, damit das Ziel einer Request einfacher zu erkennen ist und auch direkt klar ist, was das zu erwartende Ergebnis der Anfrage ist.
Die folgenden vier HTTP Verben kommen dabei am häufigsten zum Einsatz kommen: *GET*, *POST*, *PUT*, *DELETE*

==== GET
Die GET Methode stellt eine Anfrage an den Server, eine Ressource zu transferieren.
GET Anfragen auf die gleiche Ressource sollten immer die gleichen Ergebnisse liefern. 
Damit stellt GET den Hauptmechanismus zum Ressourcen Erhalten dar. \

Der Client sollte nie Content mit einer GET Request generieren. \

GET Requests haben die Möglichkeit gecached zu werden. 
Dieser Cache kann dann genutzt werden, um zukünftige Requests zu erfüllen. \

Es ist zu beachten, dass wenn Ressourcen nur über URIs angefragt werden, potentiell sicherheitskritische Informationen in dieser URI landen können. 
Wenn es nicht möglich ist, diese Informationen in weniger kritische zu transformieren wird das Nutzen einer POST Request mit den Daten im Request Content empfohlen. @httpSpecsGET

==== POST
Die POST Methode wird genutzt, um die transferierten Daten in der Request nach den Spzifikationen des Servers zu verarbeiten. 
Einige Beispiele hier sind:
- Daten, die in Input Felder eingetragen wurden, zu übergeben
- Nachrichten Posten, zum Beispiel in Foren, Social Media usw.
- Erstellen einer neuen Ressource
- Daten an eine bereits existierende Ressource anhängen

Der Server gibt dann mit Status Codes an, was das Ergebnis der POST Request ist.
Die erwarteten Status Codes sind hier: 206 (Partial Content), 304 (Not Modified), 416 (Range Not Satisfiable) \

Wenn durch die POST Request eine neue Ressource erstellt wurde, sollte der Server mit 201 (Created) antworten und den Ort der neuen Ressource in die Response packen. @httpSpecsPOST

==== PUT
Die PUT Methode erstellt eine Anfrage an den Server, eine bereits vorhandene Ressource zu ersetzen oder neu zu erstellen, basierend auf den Daten in der Anfrage. 
Wenn die angesprochene Ressource noch nicht existiert, wird sie neu erstellt. 
Nach dem Erstellen einer neuen Ressource muss der Server den Client darüber mit dem Status Code 201 (Creted) informieren. \

Wurde kein neuer Eintrag angelegt, muss der Server den Client über den Erfolg der Request mit dem Status Code 20 (OK) oder 204 (No Content) informieren. 
Der Server sollte die Daten in der PUT Request validieren.
Hier ist vor allem das Ziel zu überprüfen, ob die bereitgestellen Daten mit der ausgewählten Ressource übereinstimmen. 
Sollte dies nicht der Fall sein, kann der Server versuchen diese Daten in das richtige Format zu bringen, oder er informiert den Client über das fehlerhafte Datenformat.
Die Status Codes für Fehler in diesen Daten sind 409 (Conflict) und 415 (Unsupported Media Type). @httpSpecsPUT 

==== DELETE
Die DELETE Methode erstellt eine Request an den Server, eine Ressource zu entfernen. 
Je nachdem, wie das Löschen im Server definiert wurde, werden nur Referenzen auf die Ressource gelöscht oder auch die Ressource selbst entfernt. 
DELETE Requests sollten nur auf Ressourcen zugelassen werden, die ein definierten Ablauf für das Löschen besitzen. \

Wenn die DELETE Methode erfolgreich war, sollte der Server mit einem der folgenden Status Codes antworten:
- 202 (Accepted) wenn das Löschen wahrscheinlich erfolgreich sein wird, aber noch nicht durchgeführt wurde
- 204 (No Content) Löschen wurde ausgeführt und keine weiteren Informationen sind nötig
- 200 (OK) Löschen war erfolgreich und die Response enthält noch Informationen über den aktuellen Status
@httpSpecsDELETE

==== Idempotente Methoden
Eine Methode wird dann als idempotent angesehen, wenn sie bei multipler Ausführung den gleichen Effekt auf dem Server haben. 
Diese multiple Ausführung ist vor allem dann wichtig, wenn man automatisch Anfragen erneut ausführen möchte. 
Zum Beispiel, wenn eine Anfrage fehlschlägt und automatisch eine Neue versucht wird. \

PUT und DELETE sind dabei automatisch idempotent. 
Außerdem sind _safe request methods_ idempotent. \

Die Definition von idempotent ist dabei nur wichtig für den Inhalt, den der Nutzer angefragt hat. Der Server kann immer noch Logs über Anfragen führen oder andere Nebeneffekte implementieren, die den idempotenten Status nicht gefährden. \

Der Client sollte Requets mit nicht idempotenten Methoden nicht automatisch erneut ausführen, außer es ist bekannt, dass die Implementation dieser Methode doch idempotent ist. @idempotentMethods

=== Status Codes
Wenn der Server eine Response an den Client schickt wird auch immer ein Response Code mitgeliefert. 
Diese geben Informationen über den Erfolg der Operation. 
Der Status Code ist immer ein drei stelliger Integer und reicht von 100 bis 599. \

Die erste Ziffer gibt dabei die Klasse der Response an. Die letzten beiden haben keine Kategorisierung.
Folgende Bedeutungen sind den ersten Ziffern zuzuweisen:
- 1xx (Informational): Die Request wurde erhalten und wird verarbeitet
- 2xx (Successful): Die Request wurde erfolgreich erhalten, verstanden und akzeptiert
- 3xx (Rediraction): Es müssen weitere Schritte durchgeführt werden, damit die Request verarbeitet werden kann
- 4xx (Client Error): Die Request enthält falschen Syntax oder kann nicht erfüllt werden
- 5xx (Server Error): Der Server konnte eine eigentlich valide Request nicht erfüllen
@httpStatusCodes

Hier sind einige der meist genutzen Status Codes: 
#table(
  columns: (1fr, 1fr),
  inset: 5pt,
  align: horizon,
  table.header(
    [*Status Code*], [*Bedeutung*]
  ),
  [200 (OK)], [Die standard Antwort für eine erfolgreiche Request],
  [201 (CREATED)], [Die standard Antwort für eine erfolgreiche Request, die eine neue Ressource anlegen sollte.],
  [204 (NO CONTENT)], [Die standard Antwort für eine erfolgreiche Request, die keine Daten in ihrem Body zurückschickt],
  [400 (BAD REQUEST)], [Die Request konnte nicht verarbeitet werden. Gründe könnten sein: falscher Syntax, zu große Datenmengen usw.],
  [403 (FORBIDDEN)], [Der Client hat keine Rechte auf diese Ressource zuzugreifen],
  [404 (NOT FOUND)], [Die Gewünschte Ressource konnte nicht gefunden werden],
  [500 (INTERNAL SERVER ERROR)], [Die generische Antwort für einen unerwarteten Fehler, wenn es keine weiteren Informationen über die Art des Fehlers gibt.],
)

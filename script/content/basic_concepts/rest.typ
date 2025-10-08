#import "../../template/definitions.typ"

== REST
#text(weight: "bold")[RE]presentational #text(weight: "bold")[S]tate #text(weight: "bold")[T]ransfer ist ein Architektur Stil um Standards zwischen Computer Systemen im Web zu etablieren, die Kommunikation zwischen diesen Systemen vereinfachern.
RESTful Systeme zeichnen sich vor allem dadurch aus, dass sie keinen State besitzen und die Angelegenheiten von Server und Client separieren. @whatIsREST \

=== Unabhängigkeit
Die Implementation von Server und Client sollte unabhängig voneinander sein. 
Änderungen im Code bei einer der beiden Komponenten sollte nicht die Funktionalität des jeweils anderen beeinflussen. 
Nur das Nachrichtenformat muss beiden Seiten bekannt sein. 
Wenn dieses Format durchgehend eingehalten wird, können Änderungen ohne Probleme gemacht werden. \

=== Stateless
Weder der Server noch der Client wissen etwas über den Zustand des jeweils anderen. 
Damit können beide alle Nachrichten, die sie empfangen, verstehen ohne Kontext dafür zu besitzen. 
Erreicht wird das durch das Nutzen von Ressourcen.

=== Kommunikation zwischen Client und Server
Die Kommunikation zwischen Client und Server findet über Requests und Responses statt. 
Der Client sendet Requests an den Server um Daten zu erhalten, erstellen oder modifizieren. 
Der Server antwortet mit einer Response. \

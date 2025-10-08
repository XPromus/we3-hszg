#import "../../template/definitions.typ": *

= Grundbegriffe

== Client Side
Alles, womit der Nutzer interagiert, ist Client Side. 
Damit es für den Nutzer so einfach wie möglich ist, die Anwendung zu bedienen wird eine gute UI mit guter UX benötigt. 
All das gehört zum Frontend.

== Server Side
Alles, was auf dem Server passiert ist Backend Programmierung. 
Hier werden Funktionalitäten für das Frontend bereitgestellt.
Dazu gehören zum Beispiel Daten verarbeiten und bereitstellen oder Authorisation. 

== API
Das Frontend und Backend kommunizieren über APIs. 
Sie können Anfragen vom Client an den Server and umgekehrt verarbeiten. 
Des weiteren dienen sie dazu, Anwendungen in Schichten zu unterteilen aber dennoch Kommunikation zwischen diesen Schichten zu ermöglichen. \

APIs und andere Funktionen können dem Oberbegriff der Middleware zugeordnet werden.

#include "rest.typ"
#pagebreak()

#include "http.typ"
#pagebreak()

== MVC <mvc>
#text(weight: "bold")[M]odel-#text(weight: "bold")[V]iew-#text(weight: "bold")[C]ontroller ist eine Design Pattern, welches genutzt wird um User Interfaces, Daten und Kontroll Logik zu implementieren.
Ein großer Fokus ist dabei die Separierung von der Business Logik und der visuellen Darstellung.
Durch diese Separierung soll das Arbeiten mit mehreren Team Mitgliedern erleichtert werden und die Wartbarkeit der Software erhöht werden. \

MVC besteht aus drei Komponenten deren Aufgaben wie folgt definiert sind:
- Model: Verwaltet Daten und Business Logik
- View: Übernimmt Layout und Darstellung
- Controller: Leitet Befehle zum Model und View weiter

@modelViewControllerMdn

== CRUD <crud>
CRUD beschreibt die vier Grundoperationen, die benötigt werden, um mit persistenten Daten zu interagieren.
- *Create*: Neute Daten Einträge werden gespeichert.
- *Read*: Existierende Daten werden ausgelesen
- *Update*: Existierende Daten werden aktualisiert
- *Delete*: Daten werden gelöscht
@codecademyCRUD

== ORM <orm>
#text(weight: "bold")[O]bject-#text(weight: "bold")[R]elational-#text(weight: "bold")[M]apping ist eine Technik, die es erlaubt Daten von einer relationalen Datenbank zu Objekten in einer Programmiersprache zu konvertieren.
Damit wird eine virtuelle Objekt Datenbank erstellt, die innerhalb eines Programms genutzt werden kann. @ormWikipedia \
Mithilfe von ORM Frameworks können so auch CRUD Operationen ausgeführt werden. 
Dabei ist es nicht notwendig, SQL-Befehle selbst zu schreiben, da sie vom Framework selbst generiert werden. @ormItSchulung

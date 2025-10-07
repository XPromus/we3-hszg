#import "../../template/definitions.typ"

== Spring Übersicht
Spring ist, vereinfacht gesagt, ein Framework, welches Infrastruktur bereitstellt, die das Entwickeln von Java basierten Anwendungen vereinfachen soll.
Um das zu erreichen kommt es mit einigen Features daher wie zum Beispiel Dependency Injection und einer Liste an Modulen wie zum Beispiel:
- Spring JDBC
- Sping MVC
- Sping Security
- Spring Test
...

Diese Module sollen die Entwicklungszeit von oft gewollten Funktionalitäten stark verringern. @springAndSpringBootComparison \
Durch den Modularen Aufbau des Spring Frameworks ist es Entwicklern auch offen gestellt, welche Module sie wirklich in ihr Projekt mit übernehmen wollen.
Die Kern Module sind dabei alle Module um den IoC Container.
Dazu gehören Dependency Injection Module und ein Konfigurations Modell. \

Über die Kernfunktionen hinaus werden noch weitere Architekturen wie Messaging, Daten Austausch, Persistenz und Web untersützt.
Für Web bietet Spring auch noch das, auf Servlet basierende, Spring MVC Framework an.
Als Alternative für Web gibt es auch noch Spring WebFlux. @springFrameworkOverview

=== Geschichte von Spring
Spring wurde im Jahre 2003 als Antwort auf die hohe Komplexität von J2EE Spezifikationen erschaffen.
Heutzutage existiert es komplementär neben Jakarta EE und seinem Vorgängner Java EE.
Spring hat sich dabei eingige Spezifikationen von Java EE angeeignet.
Dazu gehören:
- Servlet API
- WebSocket API
- Concurrency Utilities 
- JSON Binding API
- Bean Validation
- JPA
- JMS

Neben diesen Spezifikationen untersützt Spring auch Dependency Injection und Common Annotations.
Diese basierten früher `javax` Packages. \

Seit Spring 6.0 wurden die Spezifikationen auf das Level von Jakarta EE 9 gehoben.
Damit wurde auch die `javax` Packages als Basis ausrangiert und durch den `jakarta` Namespace ersetzt.
Kompatiblität mit EE 10 wurde auch bereits hergestellt. \

Auch die Anwendungsbereicht von Spring Applikationen hat sich über die Zeit verändert.
Früher wurden Anwendungen entwickelt um auf einem Application Server eingetzt zu werden.
Heute wird mit Springboot eher in einer Devops- und Cloud-Freundlichen Weise entwickelt.
Dafür wurde der Servlet Container in das Programm eingebettet und sein Austauschen trivialisiert.
Seit Spring 5 können so auch WebFlux Applikationen ohne die Servlet API laufen und somit auch auf Serven eingesetzt werden, die keine Servlet Container sind (zum Beispiel Netty). @springFrameworkHistory

=== Springboot
Springboot ermöglicht die Erstellung von Spring Anwendungen, die mit minimaler Konfiguration lauffähig sind.
Es ist dabei eine Erweiterung des Spring Frameworks. @springAndSpringBootComparison
Dazu werden Webserver, wie zum Beispiel Tomcat, direkt mitgeliefert.
Um den Start der Entwicklung zu vereinfachen werden außerdem _Starter Dependencies_ bereitgestellt.
Durch Springboot wird außerdem die Konfiguration durch XML, wie sie öfter bei Spring benötigt wird, komplett umgangen.
Somit stellt Springboot eine Abstraktion des Spring Frameworks dar und vereinfacht damit dessen Nutzung. @springbootOverview

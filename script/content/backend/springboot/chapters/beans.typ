#import "../../../../template/definitions.typ": *

=== Beans
#definition[Beans][
  Jedes Objekt, welches Teil der Anwendung ist und von dem Spring IoC Container verwaltet wird, ist eine Bean. Eine Bean kann instantiated, assembled oder anderweitig von dem Spring IoC container gemanaged werden. @baeldungBean
]

==== Spring Inversion of Control (IoC) Container
Ein Objekt definiert seine Abhängigkeiten, ohne diese zu erstellen. 
Der gesamte Lebenszyklus der Abhängigkeiten wird an den IoC Container ausgelagert. @geeksForGeeksSpringDependencyInjection \

Dieser Ansatz wird dann wichtig, wenn in einem großen Projekt nur bestimmte Instanzen von Klassen benötigt werden oder eine Instanz im gesamten Projekt genutzt werden soll. 
Das Verwalten solcher Abhängigkeiten wird schnell kompliziert und Fehleranfällig. \

Der Spring IoC Container löst dieses Problem. 
Wir als Entwickler müssen nur korrekte Metadaten zur Konfiguration bereitstellen. 
Der Container erledigt den Rest. @baeldungBean \ \

*Beispiel* \
```java
public class Company {
  private Address address;

  public Company(Address address) {
    this.address = address;
  }
}
```

```java
public class Address {
  private String street;
  private int number;

  public Address(String street, int number) {
    this.street = street;
    this.number = number;
  }
}
```

Traditionelle Erstellung der Abhängigkeiten:
```java
Address address = new Address("High Street", 1000);
Company company = new Company(address);
```

Herangehensweise mit Beans
```java
@Component
public class Company {
    // this body is the same as before
}
```

Konfiguration des IoC Containers mit Metadaten zu den Address Beans:
```java
@Configuration
@ComponentScan(basePackageClasses = Company.class)
public class Config {
    @Bean
    public Address getAddress() {
        return new Address("High Street", 1000);
    }
}
```

Die `Config` Klasse erstellt eine Bean vom Typ `Address`. 
Mit der ```java @ComponentScan``` Annotation wird auch schon nach Beans im Container geschaut, die vom gleichen Typ sind, hier `Company`. \

Um den IoC Container zu erschaffen, wird eine Instanz von `AnnotationConfigApplicationContext` benötigt.
```java
ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
```

Die Funktionalität der Beans kann wie folgt verifiziert werden:
```java
Company company = context.getBean("company", Company.class);
assertEquals("High Street", company.getAddress().getStreet());
assertEquals(1000, company.getAddress().getNumber());
```

==== Annotationen für Beans @geeksForGeeksSpringDependencyInjection
- ```java @Component```: Eine generelle Angabe, die eine Klasse als Spring Bean markiert
- ```java @Service```: Eine Klasse, die einen Service darstellt
- ```java @Repository```: Eine Klasse, die ein Repository darstellt, welches mit der Persistence-Layer interagiert
- ```java @Controller```: Eine Klasse, die einen Controller, im Spring Model-Veiew-Controller darstellt

==== Scoping 
===== Singleton
Eine einzelne Instanz einer Bean, die in der gesamten Anwendung geteilt wird @geeksForGeeksSpringDependencyInjection. Diese Instanz wird in einem Cache aus Singleton Beans gespeichert. Jede zukünftige Anfrage und Referenz auf diese Bean gibt dieses Objekt aus dem Cache zurück. Der Singleton Scope ist der standard Scope für eine Bean. Keine spezielle Annotation ist notwendig @springBeanScopes. \

#figure(
  image("../../../../images/singleton_bean_diagram.png"),
  caption: "Funktionalität des Singleton Scopes"
)

```xml
<bean 
  id="accountService" 
  class="com.something.DefaultAccountService"
/>
```

#guideline[Einsatz von Singleton Beans][
Singleton Beans sollten für stateless Beans eingesetzt werden.
]

===== Prototype
Eine neue Instanz der Bean wird bei jeder Anfrage erstellet @geeksForGeeksSpringDependencyInjection. Diese Anfrage kann durch Injection in eine andere Bean oder durch eine Anfrage durch ```kt getBean()``` geschehen @springBeanScopes. \

Spring verwaltet, anders als bei anderen Beans, nicht den kompletten Lebenszyklus einer Prototype Bean. Das Löschen einer Prototype Bean muss manuel durch den Client geschehen. Ein eigens definierter Bean Post-Processor kann genutzt werden, damit der Container Ressourcen, die von Prototype Beans gehalten werden, freigibt @springBeanScopes.

#figure(
  image("../../../../images/prototype_bean_diagram.png"),
  caption: "Funktionalität des Prototype Scopes"
)

```xml
<bean 
  id="accountService" 
  class="com.something.DefaultAccountService" 
  scope="prototype"
/>
```

#guideline[Einsatz von Prototype Beans][
  Prototype Beans sollten für stateful Beans eingesetzt werden.
]

===== Request
Eine einzelne Instanz wird für jede HTTP Anfrage erstellt @geeksForGeeksSpringDependencyInjection. 
Die Erstellte Bean existiert nur so lange, wie die HTTP Anfrage bearbeitet wird. 
Andere Beans, vom gleichen Typ, die aber zu anderen HTTP Anfragen gehören, werden die Änderungen nicht sehen. 
Sobald die Anfrage abgearbeitet wurde, wird die Bean, die zu der Anfrage gehört, entfernt @springBeanScopes.

```xml
<bean 
  id="loginAction" 
  class="com.something.LoginAction" 
  scope="request"
/>
```

```kotlin
@RequestScope
@Component
class LoginAction {
	// ...
}
```

===== Session
Eine einzelne Instanz wird für jede HTTP Session erstellt @geeksForGeeksSpringDependencyInjection. 
Die erstelle Bean wird praktisch auf die HTTP Session gescoped. 
Der State der Bean kann so lange beliebig geändert werden, die die Session aktiv ist. 
Andere Beans, vom gleichen Typ, die aber zu anderen HTTP Sessions gehören, werden die Änderungen nicht sehen. 
Wenn die HTTP Session beendet wird, wird auch die dazugehörige Bean entfernt @springBeanScopes.

```xml
<bean 
  id="userPreferences" 
  class="com.something.UserPreferences" 
  scope="session"
/>
```

```kotlin
@SessionScope
@Component
class UserPreferences {
	// ...
}
```

===== Application
Ähnlich wie beim Singleton Scope, wird hier eine Bean für die gesamte Web Anwendung erstellt. Diese Bean wird auf die `ServletContext` Ebene gescoped und als Attribut von `ServletContext` gespeichert.  
Folgende Unterschiede sind im Vergleich zu Singletons zu finden: 
- Es existiert eine Bean pro `ServletContext`
- Es wird exposed als Attribut von `ServletContext`
@springBeanScopes

```xml
<bean 
  id="appPreferences" 
  class="com.something.AppPreferences" 
  scope="application"
/>
```

```kotlin
@ApplicationScope
@Component
class AppPreferences {
	// ...
}
```

===== WebSocket
Der WebSocket Scope ist an den Lebenszyklus einer WebSocket gekoppelt @springBeanScopes. \
Weitere Informationen: #link("https://docs.spring.io/spring-framework/reference/web/websocket/stomp/scope.html")[https://docs.spring.io/spring-framework/reference/web/websocket/stomp/scope.html] @springWebSocketScope

#text(fill: red)[TODO:] WebSocket Scope Kapitel ausbauen.

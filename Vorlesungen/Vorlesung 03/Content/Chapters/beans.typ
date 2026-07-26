#import "../../Template/definitions.typ": *

#slide[
  #toolbox.register-section([Beans])
  =
  #set align(horizon + center)
  #image("../../Images/beans.png", fit: "contain", width: 400pt)
]

#slide[
  = Beans
  #set align(horizon + center)
  #definition[Beans][
    Jedes Objekt, welches Teil der Anwendung ist und von dem Spring IoC Container verwaltet wird, ist eine Bean. Eine Bean kann instantiated, assembled oder anderweitig von dem Spring IoC container gemanaged werden.
  ]
]

#slide[
  = Bean Annotationen
  #set align(horizon)
  - ```java @Component```: Eine generelle Angabe, die eine Klasse als Spring Bean markiert
  - ```java @Service```: Eine Klasse, die einen Service darstellt
  - ```java @Repository```: Eine Klasse, die ein Repository darstellt, welches mit der Persistence-Layer interagiert
  - ```java @Controller```: Eine Klasse, die einen Controller, im Spring Model-Veiew-Controller darstellt
]

#slide[
  = Bean Scopes
  #set align(horizon)
  - Singleton
  - Prototype
  - Request
  - Session
  - Application
  - WebSocket
]

#include "singleton_pattern.typ"

#slide[
  = Bean Scopes - Singleton
  #set align(horizon)
  - Eine Instanz einer Bean wird in gesamter Anwendung genutzt
  - Wird in Chache aus Singleton-Beans gespeichert
  - Jede Anfrage oder Referent auf diese Bean wird auf Cache verwiesen
  - Singleton ist Standard für Beans

  ```xml
    <bean 
      id="accountService" 
      class="com.something.DefaultAccountService"
    />
  ```
]

#slide[
  = Bean Scopes - Singleton
  #set align(horizon + center)
  #image("../../Images/singleton_bean_diagram.png")
]

#slide[
  = Bean Scopes - Singleton
  #set align(horizon + center)
  #guideline[Einsatz von Singleton Beans][
    Singleton Beans sollten für stateless Beans eingesetzt werden.
  ]
]

#include "prototype_pattern.typ"

#slide[
  = Bean Scopes - Prototype
  #set align(horizon)
  - Eine neue Instanz wird bei jeder Anfrage erstellt
  - Anfrage kann durch Injection in eine andere Bean oder durch Funktionsaufruf geschehen
  ```kotlin 
    getBean()
  ```
  ```xml
    <bean 
      id="accountService" 
      class="com.something.DefaultAccountService" 
      scope="prototype"
    />
  ```
]

#slide[
  = Bean Scopes - Prototype
  #set align(horizon)
  - Spring verwaltet nicht kompletten Lebenszyklus
  - Löschen muss durch Nutzer geschehen
  - Selbst geschriebener Bean Post-Processor kann genutzt werden um Ressourcen freizugeben
]

#slide[
  = Bean Scopes - Prototype
  #set align(horizon + center)
  #image("../../Images/prototype_bean_diagram.png")
]

#slide[
  = Bean Scopes - Request
  #set align(horizon)
  - Eine einzelne Instanz für jede HTTP Anfrage
  - Bean existiert nur  so lange, wie die HTTP Anfrage beantwortet wird
  - Andere Beans vom gleichen Typ sehen Änderungen nicht
  - Sobald die Anfrage bearbeitet wurde, wird die Bean entfernt
  ```xml
    <bean 
      id="loginAction" 
      class="com.something.LoginAction" 
      scope="request"
    />
  ```
]

#slide[
  = Bean Scopes - Request
  #set align(horizon + center)
  ```kotlin
    @RequestScope
    @Component
    class LoginAction {
      // ...
    }
  ```
]

#slide[
  = Bean Scopes - Session
  #set align(horizon)
  - Eine einzelne Instanz für jede HTTP Session
  - Bean wird auf Session gescoped 
  - State der Bean kann nur geändert werden, wenn die Session aktiv ist
  - Andere Beans vom gleichen Typ sehen Änderungen nicht
  - Beim Ende der Session wird die Bean entfernt
  ```xml
    <bean 
      id="userPreferences" 
      class="com.something.UserPreferences" 
      scope="session"
    />
  ```
]

#slide[
  = Bean Scopes - Session
  #set align(horizon + center)
  ```kotlin
    @SessionScope
    @Component
    class UserPreferences {
      // ...
    }
  ```
]

#slide[
  = Bean Scopes - Application
  #set align(horizon)
  - Eine Bean für die gesamte Web Anwendung
  - Bean wird auf `ServletContext` gescoped
  - Bean wird als Attribut von `ServletContext` gespeichert
  - Unterschiede zu Singleton Beans:
    - Es existiert eine Bean pro `ServletContext`
    - Es wird exposed als Attribut von `ServletContext`
  ```xml
    <bean 
      id="appPreferences" 
      class="com.something.AppPreferences" 
      scope="application"
    />
  ```
]

#slide[
  = Bean Scopes - Application
  #set align(horizon + center)
  ```kotlin
    @ApplicationScope
    @Component
    class AppPreferences {
      // ...
    }
  ```
]

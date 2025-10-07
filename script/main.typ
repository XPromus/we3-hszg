#import "template/definitions.typ": *
#show: codly-init.with()
#codly(languages: codly-languages)
#show: frame-style(styles.boxy)

#set heading(numbering: "1.")

#include "template/titlepage.typ"
#pagebreak()

#outline(
  title: [Inhaltsverzeichnis]
)
#pagebreak()

#set page(footer: context [
  Hochschule Zittau/Görlitz
  #h(1fr)
  #counter(page).display(
    "1",
  )
])

#include "content/planning.typ"
#pagebreak()

#include "content/overview.typ"
#pagebreak()

#include "content/technologies.typ"
#pagebreak()

#include "content/user_stories.typ"
#pagebreak()

// BACKEND
#include "content/backend/backend.typ"
#pagebreak()

// FRONTEND
#include "content/frontend/frontend.typ"
#pagebreak()

= Debugging
- Lesen von Dokumentation und Stack Traces
- Intelligentes Nutzen von Google
- Logging: Print von unterschiedlichen Daten um Funktionalität sicherzustellen
- Debuggers in IDEs: Pausieren der Ausführung, Durchschreiten von Codestücken
- Reproduzieren des Problems in einer minimalen Umgebung, die im schlimmsten Fall auch mit anderen geteilt werden kann
- Test Driven Development als Strategie Probleme früher zu finden
- Nutzen von Sprachen mit expliziten Types (z.B.: TypeScript statt JavaScript)

== Frontend
=== Browser DevTools
#link("https://firefox-source-docs.mozilla.org/devtools-user/")[Firefox DevTools User Docs]
==== HTML/CSS Inspection
- Live HTML und CSS anpassen um Änderungen zu sehen
- Visuelle Darstellungen von Parametern wie Padding, Margins usw.
==== JavaScript Console
- Log output lesen
- Interagieren mit der Website durch JavaScript
==== JavaScript Debugger
- Durchschreiten von JavaScript auf der Website
===== Source Map
- Wichtig für minified JavaScript (zum Beispiel erstellt durch Frameworks)
- Originaler Code bleibt erhalten und kann für das Debugging genutzt werden
- Source Map muss generiert werden
- In der transformierten Datei muss mit einem Kommentar auf die Source Map verwiesen werden

```javascript
//# sourceMappingURL=http://example.com/path/sourcemap.map
```

*Generierung:* \
- *Svelte* generiert SourceMaps automatisch. Früher wurde eine Compiler Option benötigt.
```javascript
// svelte.config.js
const config = {
  compilerOptions: {
    enableSourcemap: true
  },
}
```
*React* und *Vue* generieren SourceMaps automatisch. Sie können durch Compiler Option explizit aktiviert oder deaktiviert werden
```json
/* tsconfig.node.json */
{
  "compilerOptions": {
    "sourceMap": true
  }
}
```
*Angular* generiert SourceMaps automatisch. Es wird durch eine Compiler Option aktiviert.
```json
/* angular.json */
"projects": {
  "vite-project": {
    "architect": {
      "build": {
        "configuration": {
          "development": {
            "sourceMap": true
          }
        }
      }
    }
  }
}
```

==== Network Operations
- Auflistung aller Netzwerk Anfragen der Website
- Genaue Untersuchung aller Daten, die zu den einzelnen Anfragen gehören
=== IDE Debugging
=== Debugging Extensions

#pagebreak()
#bibliography("sources.yml", title: "Quellenverzeichnis")

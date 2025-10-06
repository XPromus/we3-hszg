#import "definitions.typ": *

#slide[
  = Frontend
  #set align(horizon)
  - Interaktion durch den Nutzer
  - Darstellung der vom Backend erhaltenen Daten
  - Input für neue Daten
]

#slide[
  = Frontend - Bestandteile
  #set align(horizon)
  - Framework oder Vanilla
  - CSS 
  - Build Tool
  - Package Manager
  - Weitere Dependencies für unterschiedliche Funktionalitäten
]

#slide[
  = Frontend - Frameworks
  #set align(center + horizon)
  In dieser Vorlesung kommt Svelte mit TypeScript zum Einsatz.
  Andere Frameworks werden auch kurz beleuchtet.
  
  #grid(
    columns: (1fr, 1fr),
    grid.cell(
      colspan: 1,
      image("Diagrams/icons/devicon--svelte.svg", fit: "contain", width: 75pt)
    ),
    grid.cell(
      colspan: 1,
      image("Diagrams/icons/devicon--ts.svg", fit: "contain", width: 75pt)
    )
  )
]

#slide[
  = Frontend - Frameworks
  #set align(horizon + center)
  #toolbox.side-by-side[
    #image("Diagrams/icons/devicon--svelte.svg")
  ][
    - React
    - Vue
    - Angular
  ]
]

#slide[
  = Frontend - Styling
  #figure(
    image("Images/state_of_css.png", fit: "contain"),
    caption: "Ergebnisse des State of CSS 2025"
  )
  
]

#slide[
  = Frontend - Styling
  #set align(horizon)
  - Tailwind CSS als Framework für das Styling
  - Es stellt keine Komponenten sondern nur kleine Klassen bereit
  - Näher an Vanilla CSS als Frameworks wie Bootstrap
  ```html
    <div class="flex flex-col bg-slate-500">
      <!-- Content -->
    </div>
  ```
]

#slide[
  = Frontend - Build Tools
  #set align(horizon)
  - Überführen den geschriebenen Code in eine ausführbare Version für den Browser
  - Viele Features von Frameworks werden nicht von Browsern unterstützt
  - Build Tools überführen diesen Code in brauchbaren Code für den Browser
]

#slide[
  = Frontend - Build Tools
  #set align(horizon)
  ```jsx
    const App = () => <h1>Hello, World!</h1>;
  ```
  wird zu 
  ```javascript
    const App = () => React.createElement(
      'h1', null, 'Hello, World!'
    );
  ```
]

#slide[
  = Frontend - Build Tools
  #set align(horizon)
  *Bundling*
  - Zusammenführen von einzelnen Modulen für effizienteres Ausführen im Browser
  *Transpilieren*
  - Kompatiblität zu älteren Browsern herstellen
]

#slide[
  = Frontend - Build Tools
  #set align(horizon + center)
  #figure(
    image("Diagrams/icons/devicon--vitejs.svg", fit: "contain", width: 200pt),
    caption: "Vite"
  )
]

#include "package_manager.typ"

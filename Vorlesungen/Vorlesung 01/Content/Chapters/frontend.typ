#import "../../Template/definitions.typ": *

#import "../../Components/structure_diagram.typ": structure-diagram
#slide[
  =
  #toolbox.register-section[Frontend]
  #structure-diagram(
    false,
    false,
    true,
    false
  )
]

#slide[
  = Frontend
  #set align(horizon)
  - Interaktion durch den Nutzer
  - Darstellung der vom Backend erhaltenen Daten
  - Input für neue Daten
  - Durchdachtes User-Interface mit guter User-Experience
  #set align(center)
  #image("../../Images/hszg_webpage.png", fit: "contain", width: 65%)
]

#slide[
  =
  #set align(horizon + center)
  #image("../../Images/javascript-framework-meme.jpg", fit: "contain", width: 100%)
]

#slide[
  = Frameworks
  #set align(horizon + center)
  #let icon-width = 100pt
  #grid(
    columns: (1fr, 1fr),
    inset: 20pt,
  )[
    #image("../../Images/Icons/devicon--angular.svg", fit: "contain", width: icon-width)
    *Angular*
  ][
    #image("../../Images/Icons/logos--vue.svg", fit: "contain", width: icon-width)
    *VueJS*
  ][
    #image("../../Images/Icons/devicon--react.svg", fit: "contain", width: icon-width)
    *ReactJS*
  ][
    #image("../../Images/Icons/devicon--svelte.svg", width: icon-width)
    *SvelteKit*
  ]
]

#slide[
  = Frameworks
  #set align(center + horizon)
  In dieser Vorlesung kommt SvelteKit mit TypeScript zum Einsatz.
  Andere Frameworks werden auch kurz beleuchtet.
  
  #grid(
    columns: (1fr, 1fr),
    grid.cell(
      colspan: 1,
      image("../../Images/Icons/devicon--svelte.svg", fit: "contain", width: 75pt)
    ),
    grid.cell(
      colspan: 1,
      image("../../Images/Icons/devicon--ts.svg", fit: "contain", width: 75pt)
    )
  )
]

#slide[
  = Svelte
  #set align(horizon)
  - Framework zum Bauen von User-Interfaces für das Web
  - Deklarative Erstellung von Komponenten mit HTML, CSS und JavaScript
  - Nutzen eines Compilers, um die Komponenten in imperatives JavaScript, für den Browser, zu überführen
  - Erweiterung mit SvelteKit für:
    - Server-Side-Rendering
    - Routing
    - Code Splitting
]

#slide[
  = CSS Frameworks
  Nutzungsdaten von CSS Frameworks nach dem State of CSS 2025

  #set align(horizon + center)
  #let usage_data = (
    (name: "shadcn", usage: 19),
    (name: "Custom", usage: 24),
    (name: "Bootstrap", usage: 30),
    (name: "TailwindCSS", usage: 51)
  )

  #lq.diagram(
    yaxis: (
      ticks: usage_data.map(element => element.name)
        .enumerate(),
      subticks: none
    ),
    xaxis: (
      label: [Nutzung in %]
    ),
    width: 100%,
    height: 80%,
    lq.hbar(
      usage_data.map(element => element.usage),
      range(4),
    ),
  )
]

#slide[
  =
  #set align(horizon + center)
  #image("../../Images/Icons/devicon--tailwindcss.svg", fit: "contain", width: 50%)
  *TailwindCSS*
]

#slide[
  = TailwindCSS
  #set align(horizon)
  - TailwindCSS als Framework für das Styling
  - Es stellt keine Komponenten, sondern nur kleine Klassen bereit
  - Näher an Vanilla-CSS als Frameworks wie Bootstrap
  ```html
    <div class="flex flex-col bg-slate-500">
      <!-- Content -->
    </div>
  ```
]

#slide[
  = Build-Tools
  #set align(horizon)
  - Überführen den geschriebenen Code in eine ausführbare Version für den Browser
  - Viele Features von Frameworks werden nicht von Browsern unterstützt
  - Build-Tools überführen diesen Code in brauchbaren Code für den Browser
]

#slide[
  = Build-Tools
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
  = Build-Tools
  #set align(horizon)
  *Bundling*
  - Zusammenführen von einzelnen Modulen für effizienteres Ausführen im Browser
  *Transpilieren*
  - Kompatibilität zu älteren Browsern herstellen
]

#slide[
  = Build-Tools
  #set align(horizon + center)
  #image("../../Images/Icons/devicon--vitejs.svg", fit: "contain", width: 200pt)
  *Vite*
]

#include "package_manager.typ"

#let hszg_main_color = rgb("#88bd21")

#let supplementDictionary = (
  (key: image, supplement: [Abbildung]),
  (key: table, supplement: [Tabelle]),
  (key: math.equation, supplement: [Formel]),
  (key: "graph", supplement: [Graph]),
)

#let page_formatting(doc) = {
  set page(
    paper: "a4",
    margin: auto
  )
}

#let conf(
  subtitle: [],
  authors: (),
  additional: [],
  type_of_document: [],
  logo: image,
  glossary_entries: (),
  sources: str,
  doc
) = {
  let tableRules(docc) = {
    set table(
      inset: 10pt,
      stroke: hszg_main_color,
      fill: (x, y) => {
        if y == 0 {
          return hszg_main_color
        } else {
          return hszg_main_color.lighten(90%)
        }
      }
    )

    show table.cell: it => {
      if it.y == 0 {
        set text(black)
        strong(it)
      } else {
        it
      }
    }

    docc
  }

  let getSupplement(it) = {
    if it.func() == figure {
      for (key, supplement) in supplementDictionary {
        if it.kind == key {
          return supplement
        }
      }

      return it.supplement
    }
  }

  set text(size: 11pt)
  set heading(numbering: "1.")
  set math.equation(numbering: "1")
  set figure(gap: 15pt)
  show: tableRules 

  show ref: it => {
    let el = it.element
    if el == none { return it }

    if el.func() == figure {
      if el.kind == "glossarium_entry" {
        return text(weight: "bold", it)
      } else {
        return link(
          el.location(), 
          [
            \[
              #getSupplement(el) #numbering(el.numbering, ..counter(figure).at(el.location))  
            \]
          ]
        )
      }
    } else {
      return it
    }
  }

  show figure: it => block(width: 100%)[
    #align(center)[
      #it.body
      #if it.caption != none {
        [
          #getSupplement(it)
          #it.counter.display(it.numbering): #it.caption.body
        ]
      }
    ]
  ]

  page[
    #align(center)[
      #v(0.5fr)
      #logo
      #v(1fr)

      #text(size: 20pt, weight: "bold")[
        #title()
      ]

      #text(size: 15pt, style: "oblique")[
        // #subtitle
      ]
      
      #text(size: 18pt, style: "italic")[
        #type_of_document
      ]

      #v(1fr)

      #grid(
        columns: (1fr),
        ..authors.map(author => text(size: 14pt)[
          #author.name \
          // Matr.-Nr.: #author.matrNr
        ]),
      )

      #v(1fr)

      #additional
    ]
  ]

  outline(title: [Inhaltsverzeichnis])

  set page(
    numbering: "1",
    footer: context [
      #grid(
        columns: (1fr, 1fr),
        align(left + horizon)[
          //#logo
        ], align(right + horizon)[
          #counter(page).get().first()
        ] 
      )
    ]
  )

  doc

  outline(
    title: [Abbildungsverzeichnis],
    target: figure.where(kind: image)
  )
}

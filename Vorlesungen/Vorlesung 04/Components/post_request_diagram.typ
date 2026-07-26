#import "../Template/definitions.typ": *

#let post-diagram = [
  #diagram(
    node-inset: 5pt,
    node((0,0), name: <frontend>)[
      Frontend
    ],
    node((1, 0), name: <controller>)[
      Controller
    ],
    node((2, 0), name: <service>)[
      Service
    ],
    node((3, 0), name: <repository>)[
      Repository
    ],
    node((1, 1), name: <postDto>)[
      PostDto
    ],
    node((2, 1), name: <postDtoMapper>)[
      PostDtoMapper
    ],
    node((1, 3), name: <getDto>)[
      GetDto
    ],
    node((2, 2), name: <getDtoMapper>)[
      GetDtoMapper
    ],
    node((3.5, 2), name: <todoItem>)[
      TodoItem
    ],
    edge(<frontend>, "-|>", <controller>, bend: 30deg)[
      Request
    ],
    edge(<controller>, "-|>", <postDto>)[
      Request to DTO
    ],
    edge(<postDto>, "-|>", <service>)[
      Aufruf der Funktion
    ],
    edge(<service>, "-|>", <postDtoMapper>)[
      DTO zu Entity
    ],
    edge(<postDtoMapper>, "-|>", <repository>, bend: -30deg)[
      Speichern der Entity
    ],
    edge(<repository>, "-|>", <todoItem>)[
      Neue Entity
    ],
    edge(<todoItem>, "-|>", <getDtoMapper>, bend: 30deg)[
      Mapping der \ 
      neuen Entity
    ],
    edge(<getDtoMapper>, "-|>", <getDto>, bend: 30deg)[
      Get DTO der neuen Entity
    ],
    edge(<getDto>, "-|>", <controller>)[
      Rückgabe des DTOs
    ],
    edge(<controller>, "-|>", <frontend>, bend: 30deg)[
      Response mit dem DTO
    ]
  )
]

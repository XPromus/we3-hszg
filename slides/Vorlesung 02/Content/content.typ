#import "../template/definitions.typ": *

#include "agenda.typ"

#slide[
    = Letzte Woche
    #set align(center + horizon)
    #import "../Components/structure_diagram.typ": structure-diagram
    #structure-diagram(false, false, false, false)
]

#slide[
    =
    #set align(center + horizon)
    #import "../Components/structure_diagram.typ": structure-diagram
    #structure-diagram(false, true, false, false)
]

#include "Chapters/components.typ"

#include "Chapters/entity.typ"

#include "Chapters/repository.typ"

#include "Chapters/controller.typ"

#include "Chapters/service.typ"

#include "Chapters/dto.typ"

#include "Chapters/mapper.typ"

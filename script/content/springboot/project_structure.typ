#import "../../definitions.typ": *

=== Struktur für ein Projekt
#table(
  columns: 3,
  [module], [], [],
  [], [dtos], [],
  [], [], [`CreateEntityDto`],
  [], [], [`EditEntityDto`],
  [], [], [`GetEntityDto`],
  [], [mapper], [],
  [], [], [`CreateEntityDtoMapper`],
  [], [], [`EditEntityDtoMapper`],
  [], [], [`GetEntityDtoMapper`],
  [], [`Controller`], [],
  [], [`Entity`], [],
  [], [`Repository`], [],
  [], [`Service`], [],
  [`Application`], [], [],
)
- module
- - dtos
- - mapper
- - `Controller`, `Entity`, `Repository`, `Service`
- `Application`

#notice[Disclaimer][
  Hier handelt sich um Richtlinien. 
  Die wirkliche Situation kann von diesen abweichen, sollte sich die Anpassung besser für das Erreichen der Ziele eignen.
]

Jeder Controller sollte idealerweise einen Mapping für jede HTTP Operation enthalten: GET, POST, PUT, DELETE \ \
Es sollten keine weiteren Pfade in den Mappings vorhanden sein, außer IDs in PUT und DELETE \ \
Parameter sollten als DTO im Request Body übergeben werden. Nur bei GET müssen es einzelne Request Parameter sein. \ \
Die Funktionen im Controller sollten keine eigene Logik enthalten. Sie sollen nur eine Funktion im zugehörigen Service aufrufen. \ \
Mappings im Controller sollten durch die ```kotlin @ReponseStatus``` Annotation einen Http Status zurückgeben. \ \
Die Rückgabewerte von Mappings sollte fast immer ein Dto sein. \ \
Sowohl PUT, POST als auch UPDATE sollten die betroffenen oder erlangten Entities als DTO zurückgeben.

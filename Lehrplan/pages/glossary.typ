#import "../packages/packages.typ": *

#let glossary_entries = (
  (
    key: "test1", 
    long: "Test"
  ),
)

#let print_glossary(
  glossary_entries
) = [
  = Glossar
  <ch_glossary>

  #print-glossary(glossary_entries)
]

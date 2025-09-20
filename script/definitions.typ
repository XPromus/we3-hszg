#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

#import "@preview/frame-it:1.2.0": *
#let (notice, definition, guideline) = frames(
  notice: ("Wichtig", red),
  definition: ("Definition"),
  guideline: ("Richtlinie"),
)

#show link: underline
#show link: set text(fill: blue)

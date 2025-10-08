#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

#import "@preview/glossarium:0.5.9": make-glossary, register-glossary, print-glossary, gls, glspl

#import "@preview/frame-it:1.2.0": *
#let (notice, definition, guideline) = frames(
  notice: ("Wichtig", red),
  definition: ("Definition"),
  guideline: ("Richtlinie"),
)

#import "@preview/showybox:2.0.4": showybox

#import "@preview/lilaq:0.5.0" as lq

#let customref(label) = {
  [(#ref(label, form: "normal"))]
}

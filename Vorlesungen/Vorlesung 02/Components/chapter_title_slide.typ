#import "../template/definitions.typ": *
#import "../template/colors.typ": hszg-green

#let components = (
  "Entities",
  "Repositories",
  "Controllers",
  "Services",
  "DTOs",
  "Mapper"
)

#let activeColor = red
#let activeBackgroundColor = red.lighten(90%)

#let doneColor = hszg-green
#let doneBackgroundColor = hszg-green.lighten(90%)

#let defaultColor = gray
#let defaultBackgroundColor = gray.lighten(90%)

#let getColor(
  index: int,
  activeSlideIndex: int
) = {
  if (index == activeSlideIndex) {
    return activeColor
  } else if (index < activeSlideIndex) {
    return doneColor
  } else {
    return defaultColor
  }
}

#let getBackgroundColor(
  index: int,
  activeSlideIndex: int
) = {
  if (index == activeSlideIndex) {
    return activeBackgroundColor
  } else if (index < activeSlideIndex) {
    return doneBackgroundColor
  } else {
    return defaultBackgroundColor
  }
}

#let chapter-title-slide(
  active-component: int
) = [
  #slide[
    #toolbox.register-section(
      [#components.at(active-component)]
    )
    = 
    #set align(horizon + center)

    #for (i, c) in components.enumerate() [
      #block(
        fill: getBackgroundColor(
          index: i, 
          activeSlideIndex: active-component
        ), 
        stroke: stroke(
          paint: getColor(
            index: i, 
            activeSlideIndex: active-component
          ), 
          thickness: 2.5pt
        ), 
        width: 100%, 
        inset: 10pt,
        radius: 2.5pt,
      )[
        #set align(center)
        #text(
          weight: "bold", 
          fill: getColor(
            index: i, 
            activeSlideIndex: active-component
          )
        )[
          #c
        ]
      ]
    ]
  ]
]
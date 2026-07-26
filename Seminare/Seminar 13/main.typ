#import "@preview/grape-suite:4.0.0": exercise
#import exercise: hint, project, solution, subtask, task

#let task = task.with(numbering-format: (..n) => numbering("1", ..n))
#let subtask = subtask.with(markers: ("a)", "1)"))

#show: project.with(
  no: 13,
  type: "Seminar",
  suffix-title: "Vorbereitung der Entwicklungsumgebung",

  university: [Hochschule Zittau/Görlitz],
  //faculty: [Fakultät Elektrotechnik & Informatik],
  seminar: [Seminar: Web Engineering 3],
  
  task-type: [Aufgabe],

  text-font: "libertinus serif",
  math-font: "New Computer Modern Math",
  
  date: datetime(year: 2026, month: 10, day: 9),
)

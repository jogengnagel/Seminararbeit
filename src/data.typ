#import "@preview/glossy:0.8.0": *
#import "@preview/colorful-boxes:1.1.0": stickybox
#import "@preview/wrap-it:0.1.1": wrap-content
#import "@preview/drafting:0.2.0" : *
#let today = datetime.today().display("[month repr:long] [day], [year]");

#let info = (
  title: [Comparison of metric collection and visualization tools for cloud applications],
  author: "Jo Gengnagel",
  type: "Seminararbeit",
  matr: "3634028",
  firstexaminer: "Samuel Sarholz",
  secondexaminer: "Prof. Dr. Hans-Joachim Pflug",
)

#let bib_state = state(
  "bib_state",
  bibliography("../ext/sources.bib", 
  style: "harvard-cite-them-right", 
  title: auto),
)


#let setupTodo() = {
  set-page-properties()
  let default-rect(stroke: none, fill: none, width: 0pt, content) = {
    set text(0.8em)
    set par(justify: false)
    stickybox(rotation: 20deg, width: width, content)
  }
  set-margin-note-defaults(rect: default-rect, stroke: yellow, side: right)
}
#let todo(str) = margin-note(dy: -6em)[#str]
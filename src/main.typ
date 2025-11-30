#import "@preview/grape-suite:2.0.0": seminar-paper, german-dates
#import "@preview/wrap-it:0.1.1": wrap-content
#import "@preview/glossy:0.8.0": *
//#show: make-glossary

#import "data.typ": info, bib_state
#bib_state.update(none)

#set page(numbering: none)

#set text(lang: "de")

#set page(
  paper: "a4",
  margin: 30mm,
  numbering: "I",
  header: context [#if  here().page() > 2 {
        set text(11pt)
        if query(heading.where(level: 1))
          .find(h => h.location().page() == here().page()) == none {
            // Filter headers that come after the current page
            let smh = query(heading.where(level: 1)).filter(h => h.location().page() <= here().page())
            smh.last().body // last element in array is newest level 1 headline
          } else {
            let onPageHeading = query(heading.where(level: 1)).filter(h => h.location().page() == here().page())
            onPageHeading.first().body
          }
        v(2mm, weak: true)
        line(length: 100%)
    }
  ],
  footer: context [#if  here().page-numbering() != none {
    set text(11pt)
    line(length: 100%)
    v(2mm, weak: true)
    
    grid(
      columns: (2fr, 1fr, 1fr),
      align: (left, center, right),
      [#info.author, CAE GmbH Stolberg], [], [#counter(page).display(here().page-numbering())],
    )
  }],
)
#set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
#set text(font: "Arial", size: 12pt, hyphenate: false)
//#set text(size: 11.8pt)
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with();

#show raw: set text(font:"Droid Serif")
//#set raw(theme: "../ext/Oasis.tmTheme")
#show raw.where(block: true): it => block(
  inset: 12pt,
  radius: 2pt,
  text(it, size: 7pt)
)


#show raw.where(block: false): box.with(
  fill: luma(89.51%),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)


//#show raw: it => sourcecode[it]

//#set par(spacing: 0.55em)
#show heading: set block(above: 1.4em, below: 1em)
#show link: set text(fill: blue.darken(60%))

#set page(numbering: none)

#include "meta/terms.typ"
#include "splash.typ"
#include "formal/eidesstattlicheerklaerung.typ"
//#include "formal/sperrvermerk.typ"
#set page(numbering: "I")
#counter(page).update(1)
//#include "chapters/0_abstract.typ"

#pagebreak()
#outline(indent: auto, target: heading.where(outlined: true), title: [Inhaltsangabe])
#pagebreak()


#import "meta/terms.typ" : *
#let emph-term(term-body) = { text(term-body, fill: color.linear-rgb(2.22%, 4.52%, 19.46%)) }

#show: init-glossary.with(
  entry-list,
  show-term: emph-term
)

#include "formal/glossary.typ"



#set heading(numbering: none)


#set figure(kind: image)
#show figure.caption: emph

#set page(numbering: "1")
#counter(page).update(1)

#import "data.typ": *

#include "chapters/0_Abstract.typ"
#set heading(numbering: "1.1.1 -")
#include "chapters/1_Introduction.typ"
#include "chapters/2_Basics.typ"
#include "chapters/3_Methodology_of_Comparison.typ"
#include "chapters/4_Monitoring_Tools_Overview.typ"
#include "chapters/5_Alternative_Ansätze.typ"
#include "chapters/6_Vergleich.typ"
#include "chapters/7_Fazit.typ"
#include "chapters/8_Ausblick.typ"


#let subhead(title, question) = block[
  = [#title]
  _Leitfrage:_ #question
]

#show outline.entry: it => {
  it
}
#set heading(numbering: none)

//#bibliography("../ext/sources.bib", style: "american-institute-of-physics", title: auto, full: true)
#bibliography("../ext/sources.bib", style: "institute-of-electrical-and-electronics-engineers", title: [Bibliography])   


//#pagebreak()
//#let fn = footnote
//= Liste der Diagramme
//#outline(title: none , target: figure.where(kind: image).or(figure.where(kind: raw)))
//#show super: none
//#pagebreak()
//= Liste der Tabellen
//#outline(title: none, target: figure.where(kind: table))

#import "@preview/glossy:0.8.0": *
#import "@preview/glossy:0.8.0": *
#import "../meta/terms.typ": *

#let fullEntries = ()
#let other = ()

#let my-theme = (
  section: (title, body) => {
    heading(level: 1, title)
    body
  },

  group: (name, index, total, body) => {
    if name != "" and total > 1 {
      heading(level: 2, name)
    }

    table(columns: 3,
      stroke: none,
      inset: (x, y) => {
        if (x == 0) {
          (left: 0pt, rest: 5pt)
        } else if (x == 3) {
          (right: 0pt, rest: 5pt)
        } else {
          5pt
        }
      },
      table.header([*Abbreviation*], [*Full Name*], [*Pages*]),
      ..body
    )
  },

  entry: (entry, index, total) => {
    if entry.long == none {
      // skip non-acronyms
    } else {
      (entry.short + entry.label, entry.long, entry.pages)
    }
  }
)


#glossary(theme: theme-basic, title: [Glossar])



#pagebreak()
#import "../data.typ" : *

#heading(outlined: false)[Eidesstattliche Erklärung]

Hiermit versichere ich, dass ich die #info.type mit dem Thema #info.title selbstständig verfasst und keine anderen als die
angegebenen Quellen und Hilfsmittel benutzt habe, alle Ausführungen, die anderen Schriften wörtlich oder sinngemäß
entnommen wurden, kenntlich gemacht sind und die Arbeit in gleicher oder ähnlicher
Fassung noch nicht Bestandteil einer Studien- oder Prüfungsleistung war.

#v(5cm)

//#show par: set block(spacing: 0.1em)
#grid(
  columns: (1fr, 1fr),
  align(start)[Stolberg, #today],
  align(center)[\
		#overline(stroke: (dash: "dotted", thickness: 0.5mm), extent: 60pt, offset: -0.46cm)[#info.author]
  ]
)

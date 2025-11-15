#import "data.typ" : info

#[
  #set page(margin: (top: 2.5cm, x: -0.1cm))
  #set text(font: "Open Sans", )
  #show heading: set block(above: 1.4em, below: 1em)

  #place(center, dy: 0%,
   image("../img/CAE_rgb_bright_blue.svg", width: 35%)
   )

  #place(
    end, dy: -2%,
    image("../img/fhac.png", height: 48mm)
  )
  
  #v(4cm)
  #v(3cm)

  #[
    #set align(center)
    #set text(size: 20pt, weight: "light")
    #smallcaps("Fachhochschule Aachen, Campus Jülich")
    #v(5mm)
    #set text(size: 14pt)
    #smallcaps("Fachbereich 09 - Medizintechnik und Technomathematik")\
    #smallcaps("Studiengang Angewandte Mathematik und Informatik")
    #v(15mm)
    #smallcaps(info.type)
  ]

  #v(4mm)

  #[
    #line(start: (15%, 0%), end: (85%, 0%), stroke: (0.5mm))
    #align(center, 
      box(width: 60%,
        text(weight: "bold", size: 20pt)[#info.title]
      )
    )
    #line(start: (15%, 0%), end: (85%, 0%), stroke: (0.5mm))
  ]

  #v(1.8cm)

  #align(start, 
    move(dx: 15%,
    [
      #emph("Autor:")\
      #info.author, #info.matr\
      \
      #emph("Betreuer:")\
      #info.firstexaminer\
      #info.secondexaminer\
    ])
    )
  
  #align(center + bottom)[Stolberg, #datetime.today().display(" [day]. [month repr:long] [year]")]
]

#pagebreak()
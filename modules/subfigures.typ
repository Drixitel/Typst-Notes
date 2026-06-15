// see patrick-kidger's comment on github https://github.com/typst/typst/issues/246

#import "@preview/typsy:0.2.1": tree-counter

#let _figure-counter = tree-counter(figure, numbering: "")
#let _subfigure-counter = (_figure-counter.subcounter)(() => {}, numbering: "(a)")
#let sub-figure(body, caption: none, gap: 0.65em) = {body
  if caption != none [#v(gap - 1em)#(_subfigure-counter.take)() #caption]
}


// Example usage
#import "../illustrations/physics/arcLengthRad.typ": radian, angle-theta
#set heading(numbering: "1.1.1")
= A heading
#figure(caption: [Baz],
  grid(
    rows: 3,
    column-gutter: 10pt,
    sub-figure(caption: [Foo], radian()),
    sub-figure(caption: [Angle $theta$], angle-theta()),
    sub-figure(caption: [Bar], radian()),
  )
)
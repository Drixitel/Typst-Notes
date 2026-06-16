// Document-wide presentation rules.
/* Contians:
 applyConfig
 noIndent
 makeTitleAndHeader
 makeOutline
*/

// Reqyuired for flexCaption & Outline show rule
#let inOutline = state("in-outline", false)
#let flex-caption(long, short) = context if inOutline.get() { short } else { long }

// Applies the document-wide configuration.
#let apply-config(
  //parameters:
  title: [Untitled Notes],
  paper: "a4",
  margin: (x: 1.8cm, y: 1.5cm),
  text-font: "New Computer Modern Math",
  text-size: 10pt,
  body,
  ) = {

    set page(
      paper:paper,
      margin: margin,
      numbering: "1",
      header: align(right + horizon, context document.title),
    )

    set text(
      font: text-font,
      size: text-size,
    )

    set par(
      justify: true,
      leading: 0.52em,
      first-line-indent: 1.5em,
    )

    set list(indent:1.1em, body-indent: 4pt)

    show heading: set align(center)
    show heading: set text(size: 17pt, weight: "bold")

    show figure: set block(above: 1.2em, below: 1.2em)

    show outline: it => {
      inOutline.update(true)
      it
      inOutline.update(false)
    }

    show outline.entry.where(
      level:1,
    ): set block(above: 1.2em)
    show outline.entry.where(
      level:2
    ): set block(above: 1.1em)
    show outline.entry.where(
      level:3
    ): set block(above: 1.1em)

    // cardinal red links
    let link-color = rgb("#8C1515")
    show link: set text(fill: link-color, weight:"bold")
    show ref: set text(fill: link-color, weight:"bold")

    set math.equation(numbering: "(1)")
    set math.mat(row-gap: 1em)
    set math.mat(column-gap: 1em)
    set math.mat(delim:"(")


    body
  }

// remove your fist line indent
// Usage: no-indent { ... }
#let no-indent(body) = {
  set par(first-line-indent: 0pt)
  body
}


#let make-title-and-header(body) = {
  v(29em)
  align(center,
    text(size: 25pt, weight: "bold", body)
    )
  pagebreak()

}

#let make-outlines = {
  outline(
    title: "Contents")
  outline(
    title: "List of Tables",
    target: figure.where(kind: table))
  outline(
    title: "List of Figures",
    target: figure.where(kind: image))
  }


// math numbering see example link provided
/*
https://forum.typst.app/t/how-can-i-have-a-temporary-local-counter-for-equations/3466/5
*/
#let eq(body, numbering: "(i)", number-align: right + horizon) = {
  let eq-counter = counter("eq")
  eq-counter.step()
  context {
    let sub-counter = counter("eq/" + str(eq-counter.get().first()))
    let sub-eq-total = sub-counter.final().first()
    let value = context std.numbering(numbering, ..sub-counter.get())
    set math.equation(
      numbering: (..) => sub-counter.step() + value,
      number-align: number-align,
    )
    body
    counter(math.equation).update(n => n - sub-eq-total)
  }
}



// Approved colors hexa:
// #8C1515 (cardinal red) for links and references
// #e3d9ff80 (light purple with transparency) for fills in illustrations
// #F1D3D0 (light pink) block background
// #4FB24F (green) for highlights in illustrations

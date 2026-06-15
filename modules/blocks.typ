#import "../config.typ": eq

// Congigurable text blocks
/*Contains:
simpleBlock
questionBlock
knowledgeBlock
givenBlock
solutionBlock
*/

#let simple-block(
  // parameters for block function:
  body,
  fill: none,
  textcolor: black,
  inset: 20pt,
  width: 100%,
  body-align: left,
  radius: 4pt,
  breakable: false,
  stroke: 1pt + rgb("#F1D3D0"),
  ) = block(
    fill:fill,
    inset: inset,
    width: width,
    radius: radius,
    breakable: breakable,
    stroke: stroke,
    )[
      #set text(fill: textcolor)
      #align(body-align)[
        #body
      ]
    ]

#let question-block(
  // parameters for block function:
  body,
  fill: rgb("#F1D3D0"),
  textcolor: black,
  inset: 12pt,
  width: 100%,
  body-align: left,
  radius: 4pt,
  breakable: false,
  stroke: none,
  ) = block(
    fill:fill,
    inset: inset,
    width: width,
    radius: radius,
    breakable: breakable,
    stroke: stroke,
    )[
      #set text(fill: textcolor)
      #align(body-align)[
        #body
      ]
    ]

#let knowledge-block(
  // parameters for block function:
  body,
  fill: rgb("#BBBBDD"),
  textcolor: black,
  inset: 15pt,
  width: 100%,
  body-align: left,
  radius: 4pt,
  breakable: false,
  stroke: none,
  ) = block(
    fill:fill,
    inset: inset,
    width: width,
    radius: radius,
    breakable: breakable,
    stroke: stroke,
    )[
      #set text(fill: textcolor)
      #align(body-align)[
        *Expected knowledge and equations:*\
        #body
      ]
    ]

#let given-block(
  // parameters for block function:
  body,
  fill: rgb("#CEDECE"),
  textcolor: black,
  inset: 15pt,
  width: 100%,
  body-align: left,
  radius: 4pt,
  breakable: false,
  stroke: none,
  ) = block(
    fill:fill,
    inset: inset,
    width: width,
    radius: radius,
    breakable: breakable,
    stroke: stroke,
    )[
      #set text(fill: textcolor)
      #align(body-align)[
        *Given:*\
        #body
      ]
    ]


#let solution-block(
  // parameters for block function:
  body,
  fill: none,
  textcolor: black,
  inset: 15pt,
  width: 100%,
  body-align: left,
  radius: 4pt,
  breakable: true,
  stroke: none,
  qed-symbol: $qed$,
  numbering: "(i)",
  ) = block(
        fill:fill,
        inset: inset,
        width: width,
        radius: radius,
        breakable: breakable,
        stroke: stroke,
      )[
        #set text(fill: textcolor)

        // *Worked Solution:*\
        #eq[#body]
        #box(width: 1pt) // necessary to prevent the qed symbol from being placed on the next page when the solution is breakable
        #h(1fr)
        #sym.wj
        #sym.space.nobreak
        #qed-symbol
      ]


// #let solutionBlock(
//   // parameters for block function:
//   body,
//   fill: none,
//   textcolor: black,
//   inset: 15pt,
//   width: 100%,
//   body-align: left,
//   radius: 4pt,
//   breakable: true,
//   stroke: none,
//   qed-symbol: $qed$,
//   numbering: "(i)",
//   ) = context{
//     // save number counter state
//     let saved = counter(math.equation).get()
//     [
//       // set math counter to 0 w/in block
//       #counter(math.equation).update(0)

//       #block(
//         fill:fill,
//         inset: inset,
//         width: width,
//         radius: radius,
//         breakable: breakable,
//         stroke: stroke,
//       )[
//         #set text(fill: textcolor)
//         #set math.equation(numbering: numbering)

//         // *Worked Solution:*\
//         #body
//         #box(width: 1pt) // necessary to prevent the qed symbol from being placed on the next page when the solution is breakable
//         #h(1fr)
//         #sym.wj
//         #sym.space.nobreak
//         #qed-symbol
//       ]
//       // restore the prev. number counter state
//       #counter(math.equation).update(saved)
//     ]
//   }



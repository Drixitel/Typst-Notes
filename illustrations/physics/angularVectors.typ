#import "@preview/cetz:0.5.0"
// modules
#import "../../modules/math.typ": vecB, color
// page setup
#set page(width: auto, height: auto, margin: .5cm)
#show math.equation: block.with(fill: white, inset: 1pt)


#let angular-vectors-posacc() = cetz.canvas({
  import cetz.draw: *
  set-style(
    content: (padding: 1pt),
  )


  line((0,-1.5), (0,0),
  stroke: (thickness:.1, paint:gray, dash:"dashed"),
    )

  circle((0,0), radius:(2,1),
  fill: rgb("#F1D3D0"), stroke: none)
  circle((0,.3), radius:(2,1),
  fill: rgb("#F1D3D0"))

  line((0,0), (0,2),
    stroke: (thickness:.1, paint:blue),
    mark: (end: "stealth", scale: 1, fill: black))
  line((0,2), (0,4),
    stroke: (thickness:.1, paint:black),
    mark: (end: "stealth", scale: 1, fill: black))

  arc((-2.3,0),
    start: 180deg,
    stop: 230deg,
    stroke: (thickness:.1, paint:black),
    radius: (2,1),
    mark: (end: "stealth", scale: 1, fill: black))


  content((-.5,1.6), $color(vecB(omega), fill: #blue)$)
  content((-.5,3), $vecB(alpha)$)

})

#let angular-vectors-negacc() = cetz.canvas({
  import cetz.draw: *
  set-style(
    content: (padding: 1pt),

  )

  line((0,-1.5), (0,0),
  stroke: (thickness:.1, paint:gray, dash:"dashed"),
  )

  circle((0,0), radius:(2,1),
  fill: rgb("#F1D3D0"), stroke: none)
  circle((0,.3), radius:(2,1),
  fill: rgb("#F1D3D0"))

  line((0,0), (0,2),
    stroke: (thickness:.1, paint:blue),
    mark: (end: "stealth", scale: 1, fill: black))
  line((0,2), (0,4),
    stroke: (thickness:.1, paint:black),
    mark: (start: "stealth", scale: 1, fill: black))

  arc((-2.3,0),
    start: 180deg,
    stop: 230deg,
    stroke: (thickness:.1, paint:black),
    radius: (2,1),
    mark: (end: "stealth", scale: 1, fill: black))

  content((-.5,1.6), $color(vecB(omega), fill: #blue)$)
  content((-.5,3), $vecB(alpha)$)

})

#angular-vectors-posacc()
#angular-vectors-negacc()

// Static CeTZ diagram
#import "@preview/cetz:0.5.0"
// page setup
#set page(width: auto, height: auto, margin: .5cm)
#show math.equation: block.with(fill: white, inset: 1pt)

#let inelastic-collision() = cetz.canvas({
  import cetz.draw: *
  set-style(
    mark:(fill:black),
    content: (padding: 1pt),
  )
  // vector 2i+0j
  line((0,0), (2,0), stroke: (thickness: .8pt), mark: (start: "o" , end: ">", scale: .5))
  content((1,.5), "0.5 kg, 2 m/s")
  // vector 0i+1j
  line((2,-1), (2,0), stroke: (thickness: .8pt), mark: (start: "o" , end: ">", scale: .5))
  content((3,-.5), "1 kg, 1 m/s")
  // Xy axes for reference
  line((3,1), (3,2), stroke: (thickness: 1pt, cap: "round"), mark: (end: ">", scale: .5))
  content((3,2.25), $y$)
  line((3,1), (4,1), stroke: (thickness: 1pt, cap: "round"), mark: (end: ">", scale: .5))
  content((4.2,1.05), $x$)
})


#inelastic-collision()

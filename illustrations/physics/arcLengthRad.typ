#import "@preview/cetz:0.5.0"
// modules
#import "../../modules/math.typ": color
// page setup
#set page(width: auto, height: auto, margin: .5cm)
#show math.equation: block.with(fill: white, inset: 1pt)



#let radian() = cetz.canvas({
  import cetz.draw: *
  set-style(
    content: (padding: 1pt),

  )
  // unit circle
  circle((0,0), radius:2)

  line((0,0),
    (angle:25deg, radius:2),
    stroke:blue,
    )
  line((0,0),
    (angle:90deg, radius:2),
    stroke:black,
    )
  circle((0,0), radius:.02, fill: black)
  arc((0,1),
    start:90deg,
    stop: 25deg,
    stroke: black,
    mark: (
      scale: .5, start: ">",
      fill:black))
  arc((0,2),
    start:90deg,
    stop: 25deg,
    stroke: red,
    radius: 2,
    mark: (end: ">",
      scale: .5, start: ">",
      fill:red))
  content((1.2,2.1), $s=r$)
  content((.7,1.2), $1 "rad"$)
  content((.6,0), $color(r, fill:blue)$)

})

#let angle-theta() = cetz.canvas({
  import cetz.draw: *
  set-style(
    content: (padding: 1pt),

  )
  // unit circle
  circle((0,0), radius:2)

  line((0,0),
    (angle:-20deg, radius:2),
    stroke:blue,
    )
  line((0,0),
    (angle:90deg, radius:2),
    stroke:black,
    )
  circle((0,0), radius:.02, fill: black)
  arc((0,.6),
    start:90deg,
    stop: -20deg,
    stroke: black,
    radius:.6,
    mark: (
      scale: .5, start: ">",
      fill:black))
  arc((0,2),
    start:90deg,
    stop: -20deg,
    stroke: red,
    radius: 2,
    mark: (end: ">",
      scale: .5, start: ">",
      fill:red))
  content((1.2,2.1), $s=r theta$)
  content((.9,.7), $theta = s/r$)
  content((.6,-.5), $color(r, fill:blue)$)

})



#radian() #angle-theta()
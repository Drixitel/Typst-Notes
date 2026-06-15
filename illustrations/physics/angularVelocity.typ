#import "@preview/cetz:0.5.0"
// modules
#import "../../modules/axes.typ": draw-axes-2d
#import "../../modules/math.typ": vecB, color
#import "../../modules/rotationTransform.typ": *

// page setup
#set page(width: auto, height: auto, margin: .5cm)
#show math.equation: block.with(fill: white, inset: 1pt)


#let angular-velocity() = cetz.canvas({
  import cetz.draw: *
  set-style(
    content: (padding: 1pt),

  )
  let theta_rad = calc.pi/6 // 30 deg
  let radius = 4
  // Po (x0,y0) = (rcos(30 deg), rsing(30 deg))
  let b1 = radius*calc.cos(theta_rad)
  let b2 = radius*calc.sin(theta_rad)

  draw-axes-2d(x_scale: 2, y_scale:1.7)
  // Position vector r
  line((0,0),(b1,b2),
  stroke: black,
  mark: (end: "stealth", scale: .5, fill: black))
  // lable vector r
  content((b1*1.07,b2*1.06), $vecB(r)$)
  // Tip of vector r
  circle((b1,b2), radius:.06, fill: black)

  // Draw arc for angle theta_1
  arc((1,0),
  start:0deg,
  stop: 30deg,
  stroke: black,
  radius: 1,
  mark: (end: "stealth",
    scale: .5,
    fill:black))
  content((1.4,0.3), $theta_1$)

  //////////////////////////////////////////////////////

  // Tip of rotated vector r'
  let phi_rad =  calc.pi/6 // 30 deg
  let rotated_point_r = rotation-transform((b1,b2), phi_rad)
  circle(rotated_point_r, radius:.06, fill:black)

  // Rotated vector r' see vectorRotation.typ for details
  line((0,0),rotated_point_r,
    stroke: blue,
    mark: (end: "stealth", scale: .5, fill: blue))
  // Label vector r'
  content((2.2,3.7), $vecB(r)_r$)

  // Origin O
  circle((0,0), radius:.06, fill: black)

  // Draw arc for angle Delta theta
  arc((((calc.sqrt(3)/2)*3,(1/2)*3)),
    start: 30deg,
    stop: 60deg,
    stroke: purple,
    radius:3,
    mark: (end: "stealth",
      scale: .5,
      fill:purple))
  content((3, 2.7), $color(Delta theta = theta_2 - theta_1, fill:purple)$)

  // Draw arc for angle theta_2
  arc((2,0),
  start:0deg,
  stop: 60deg,
  stroke: black,
  radius: 2,
  mark: (end: "stealth",
    scale: .5,
    fill:black))
  content((2.3,0.3), $theta_2$)



})


#angular-velocity()
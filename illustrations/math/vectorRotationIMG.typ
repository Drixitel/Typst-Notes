#import "@preview/cetz:0.5.0"
// modules
#import "../../modules/axes.typ": draw-axes-2d
#import "../../modules/rotationTransform.typ": *
#import "../../modules/math.typ": vecB, color
// page setup
#set page(width: auto, height: auto, margin: .5cm)
#show math.equation: block.with(fill: white, inset: 1pt)


#let vector-2d() = cetz.canvas({
  import cetz.draw: *
  set-style(
    content: (padding: 1pt),
  )
  let arrow-style = (mark: (end: "stealth", fill: black, scale: 0.5))

  draw-axes-2d(x_scale: 2, y_scale:1.5)
  // Vector v
  let theta_rad = calc.pi/6 // 30 deg
  let radius = 5
  // Po (x0,y0) = (rcos(30 deg), rsing(30 deg))
  let b1 = radius*calc.cos(theta_rad)
  let b2 = radius*calc.sin(theta_rad)

  line((0,0),(b1,b2),
  stroke: blue,
  mark: (end: "stealth", scale: .5, fill: blue))
  content((1.8,1.5), $|vecB(v)|$)

  // Origin O
  circle((0,0), radius:.06, fill: black)

  // Tip of vector v
  circle((b1,b2), radius:.06, fill: black)
  content((b1+0.25,b2+0.2), $vecB(v)$)

  // vector components
  line((0,0),(b1,0),
    stroke: (paint:gray, dash:"dashed"))
  line((b1,0),(b1,b2),
    stroke: (paint:gray, dash:"dashed"))

  // Braces for vector components
  cetz.decorations.brace(
    (0,0), (b1,0),
    flip:true,
    amplitude:.5)
  cetz.decorations.brace(
    (b1,0), (b1,b2),
    flip:true,
    amplitude:.5)

  // Component labels
  content((b1/2,-.8), $color(x_1= |vecB(v)| cos theta, fill:blue)$)
  content((b1+1.7, b2/2), $color(y_1 = |vecB(v)| sin theta, fill:blue)$)

  // Draw arc for angle theta
  arc((b1/2,0),
  start:0deg,
  stop: 26deg,
  stroke: black,
  radius: radius/2,
  mark: (end: "stealth",
    scale: .5,
    fill:black))
  content((b1/2+0.2,0.5), $theta$)
 })

//////////////////////////////////////////////////


#let vector-2d-rotated() = cetz.canvas({
  import cetz.draw: *
  set-style(
    content: (padding: 1pt),
  )

  draw-axes-2d(x_scale: 2, y_scale:1.7)
  // Vector v
  let theta_rad = calc.pi/6 // 30 deg
  let radius = 5
  // Po (x0,y0) = (rcos(30 deg), rsing(30 deg))
  let b1 = radius*calc.cos(theta_rad)
  let b2 = radius*calc.sin(theta_rad)
  // vector v
  line((0,0),(b1,b2),
  stroke: black,
  mark: (end: "stealth", scale: .5, fill: black))

  // Origin O
  circle((0,0), radius:.06, fill: black)
  // Tip of vector v
  circle((b1,b2), radius:.06, fill: black)
  content((b1+0.2,b2+0.2), $vecB(v)$)

  // Draw arc for angle theta
  arc((b1/2,0),
  start:0deg,
  stop: 26deg,
  stroke: black,
  radius: radius/2,
  mark: (end: "stealth",
    scale: .5,
    fill:black))
  content((b1/2+0.2,0.5), $theta$)

  ////////////////////////////////////////////////

  // Rotate vector v by phi
  let phi_rad = (calc.pi/6)*(.5) // 15 deg
  let rotated_point_v = rotation-transform((b1,b2), phi_rad)
  // Tip of rotated vector v'
  circle(rotated_point_v, radius:.06, fill: black)

  // Rotated vector v'
  line((0,0),(rotated_point_v),
    stroke: blue,
    mark: (end: "stealth", scale: .5, fill: blue))
  content((rotated_point_v.at(0)+0.2, rotated_point_v.at(1)+0.3), $vecB(v)_r (x_2, y_2)$)
  // magnitude label
  content((1, 2), $|vecB(v)_r| = |vecB(v)|$)

  // Dashed lines for components of v'
  line((0,0),(rotated_point_v.at(0),0),
    stroke: (paint:gray, dash:"dashed"))
  line((rotated_point_v.at(0),0),(rotated_point_v.at(0),rotated_point_v.at(1)),
    stroke: (paint:gray, dash:"dashed"))

  // Braces for components of v'
  cetz.decorations.brace(
    (0,0),(rotated_point_v.at(0),0),
    flip:true,
    amplitude:.5)
  cetz.decorations.brace(
    (rotated_point_v.at(0),0),
    (rotated_point_v.at(0),rotated_point_v.at(1)),
    flip:true,
    amplitude:.5)
  content((rotated_point_v.at(0)/2,-.8), $color(x_2= |vecB(v)| cos (theta + phi), fill:blue)$)
  content((rotated_point_v.at(0)+2.15, rotated_point_v.at(1)/2), $color(y_2 = |vecB(v)| sin (theta + phi), fill:blue)$)

  // Draw arc for angle phi
  arc((b1/2,b2/2),
    // plus or minus 2 deg, but this should be a phi of about 15deg
    start: 30deg,
    stop: 45deg,
    stroke: purple,
    radius: radius/2,
    mark: (end: "stealth",
      scale: .5,
      fill:purple))
  content((b1/2,b2/2+0.5), $phi$)

})

#vector-2d() #vector-2d-rotated()
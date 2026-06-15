#import "@preview/cetz:0.5.0"
// modules
#import "../../modules/axes.typ": draw-axes-3d
#import "../../modules/math.typ": vecB, color
// page setup
#set page(width: auto, height: auto, margin: .5cm)
#show math.equation: block.with(fill: white, inset: 1pt)



#let parametric-line() = cetz.canvas({
  import cetz.draw: *
  set-style(
    content: (padding: 1pt),
  )
  let arrow-style = (mark: (end: "stealth", fill: black, scale: 0.5))

  draw-axes-3d(x_scale: 1.6, y_scale: 2, z_scale: 2)

  //Origin
  content((-.3, -.3, -.1), $O$)
  let O = (0,0,0)

  // Construct the line L ------------------------

  // lines and content are in (y,x,z)
  let p0 = (-1,1,1)
  let p1 = (4,4,4)
  line(p0, p1)
  content((-.8,1,1.26), $L$)
  // parallel vector v to line L (5,3,3)
  let v = (
    p1.at(0) - p0.at(0), // x1-x0
    p1.at(1) - p0.at(1), // y1-y0
    p1.at(2) - p0.at(2)) // z1-z0
  // magnitude of vector v, |v| : sqrt(x^2 + y^2 + z^2)
  let v_mag = calc.sqrt(
    calc.pow(v.at(0), 2) + calc.pow(v.at(1), 2) + calc.pow(v.at(2), 2)
    )
  // unit vector in direction of v : v/|v|
  let v_unit = (
    v.at(0)/v_mag,
    v.at(1)/v_mag,
    v.at(2)/v_mag
    )

  line((0,0,0),(v_unit), stroke: green, ..arrow-style)
  // label for unit vector v
  let v_unit_label_pos = (
    v_unit.at(0) + .3,
    v_unit.at(1) + .3,
    v_unit.at(2) + .25
  )
  content((v_unit_label_pos), $color(vecB(v), fill:#green)$)

  // from L obtain 2 new points then obtain a new vector v
  // parametric line: L(t') = p0 + t'*v 0<t'<1
  // were t0'  give p0 and t1' gives p1
  // let's use t2' = 2/4 and t3' = 5/6

  let t2 = 2/4
  let t3 = 5/6
  let p2 = (
    p0.at(0) + t2*v.at(0), // x = 3/2
    p0.at(1) + t2*v.at(1), // y = 5/2
    p0.at(2) + t2*v.at(2)  // z = 5/2
  )
  let p3 = (
    p0.at(0) + t3*v.at(0), // x = 19/6
    p0.at(1) + t3*v.at(1), // y = 21/6
    p0.at(2) + t3*v.at(2)  // z = 21/6
  )

  // vector p2 or r0
  line(O, p2, stroke: red, ..arrow-style)
  let r0_label_pos = (
    p2.at(0) + .3,
    p2.at(1) + .3,
    p2.at(2) + -.1
  )
  content((r0_label_pos),
    $color(vecB(r_0), fill: red)$)

  // vector p3 or r
  line(O, p3, stroke: blue, ..arrow-style)
  let r1_label_pos = (
    p3.at(0) + .1,
    p3.at(1) + .9,
    p3.at(2) + -.1
  )
  content((r1_label_pos),
    $color(vecB(r), fill: blue)$)

  // vecotr a = r - r0
  line(
    // shifted z values for better visualizatoin
    (p2.at(0), p2.at(1), p2.at(2) + .1),
    (p3.at(0), p3.at(1), p3.at(2) + .1),
    stroke: (thickness: 1.5pt, paint: purple), .. arrow-style
    )
  let a_label_pos = (
    (p2.at(0) + p3.at(0))/2,
    (p2.at(1) + p3.at(1))/2 + .1,
    (p2.at(2) + p3.at(2))/2 + .3
  )
  content((a_label_pos), $color(vecB(a), fill: purple)$)

  // points on line L
  on-xz(y:(5/2), circle((3/2,5/2), radius:1pt, fill:black))
  on-xz(y:(21/6), circle((19/6,21/6), radius:1pt, fill:black))

  content((.75,1,1.95), $P_0$)
  content((3.55,4,4.05), $P$)



})
#parametric-line()
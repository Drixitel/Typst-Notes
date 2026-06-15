#import "@preview/cetz:0.5.0"
// modules
#import "../../modules/axes.typ": draw-axes-2d
#import "../../modules/math.typ": vecB, color, drdt
// page setup
#set page(width: auto, height: auto, margin: .5cm)


#let linear-speed-rotation() = cetz.canvas({
  import cetz.draw: *
  set-style(
    content: (padding: 1pt),

  )
  draw-axes-2d(x_scale: 2, y_scale:2, axis_pad_x:2.5*2, axis_pad_y:2.5*2, label_gap:.27)

  let radius = 4
  let theta_rad = calc.pi/6 // 30 deg
  let a1 = radius*calc.cos(theta_rad)
  let a2 = radius*calc.sin(theta_rad)

  circle((0,0), radius: radius, stroke:(dash:"dashed", paint:blue))

  // hobby curve
  let a = (3, 1)
  let b = (1, 2)
  let c = (6, 1)
  let d = (1, -2)
  let e = (1, -1)
  let f = (2, -1)

  hobby(
    a,
    b,
    c,
    d,
    e,
    f,
    close: true,
    fill: rgb("#e3d9ff80"),
    stroke: (paint:white)
  )

   // Position vector r
  line((0,0),(a1,a2),
  stroke: black,
  )
  content((a1/2,a2/2), box(fill: white, inset: 5pt)[$r$])
  // lable vector r
  content((a1+.2,a2+.3), $P$)
  // arc for arc length s
  arc((radius,0),
  start:0deg,
  stop: 30deg,
  stroke: (thickness:3pt, paint:blue),
  radius: radius,
  )
  // Tip of vector r
  circle((a1,a2), radius:3pt, fill: black)

  // Draw arc for angle theta
  arc((1,0),
  start:0deg,
  stop: 30deg,
  stroke: black,
  radius: 1,
  mark: (end: "stealth",
    scale: .5,
    fill:black))
  content((1.4,0.3), $theta$)


  arc((-.3,4.3),
  start:90deg,
  stop: 140deg,
  stroke: (thickness:3pt, paint:gray),
  radius: 4,
  mark:(end: "stealth")
  )
  arc((.3,-4.3),
  start:270deg,
  stop: 315deg,
  stroke: (thickness:3pt, paint:gray),
  radius: 4,
  mark:(end: "stealth")
  )

  content((1.4,0.3), $theta$)

  // Find the Tangent vector v at point P
  // v = dr/dtheta = (-r sin(theta), r cos(theta))
  // v = d/dtheta (a1,a2)
  let tangent_vector_v = (- radius*calc.sin(theta_rad), radius*calc.cos(theta_rad))

  // Find a point P' to form a line segment
  // useing r = r0 + tv , r0 = (a1,a2)
  let t = .5
  let point_P_prime = (a1 + t*tangent_vector_v.at(0), a2 + t*tangent_vector_v.at(1))

  // uncomment to check
  // circle(point_P_prime, radius:3pt, fill: black)

  // Line segment from P to P'
  line((a1,a2), point_P_prime,
    stroke: (thickness:2pt, paint: green),
    mark: (end: "stealth", scale: .5))
  circle((a1,a2), radius:3pt, fill: black)

  content((4.6,1), $color(s=r theta, fill:#blue)$)
  content((-2,4.2), $omega$)
  content((2,-4.2), $omega$)
  content((3.8,3.4), $lr(|drdt(color(s,fill: #blue),t)|) &= color(r, fill: #blue) lr(|drdt(color(theta, fill:#blue),t)|)\ color(v &= r omega, fill:rgb("#4FB24F"))$)



})

#linear-speed-rotation()
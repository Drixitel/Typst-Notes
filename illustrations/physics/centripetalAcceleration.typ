#import "@preview/cetz:0.5.0"
// modules
#import "../../modules/axes.typ": draw-axes-2d
// page setup
#set page(width: auto, height: auto, margin: .5cm)
#show math.equation: block.with(fill: white, inset: 1pt)

// Content
#let centripetal-acceleration() = cetz.canvas({
  import cetz.draw: *
  set-style(
    content: (padding: 1pt),
  )
  draw-axes-2d(x_scale: 2, y_scale:2, axis_pad_x:2.5*2, label_gap:.27)

  let radius = 4
  let theta_rad_1 = (calc.pi)*5/6
  let theta_rad_2 = (calc.pi)*4/6
  let a1 = radius*calc.cos(theta_rad_1)
  let a2 = radius*calc.sin(theta_rad_1)
  let b1 = radius*calc.cos(theta_rad_2)
  let b2 = radius*calc.sin(theta_rad_2)

  arc((4,0),
      start:0deg,
      stop:180deg,
      radius:radius,
      stroke:(dash:"dashed", paint:blue)
      )

  line((0,0),(a1,a2))
  circle((a1,a2), radius:0.1, fill: black)
  line((0,0),(b1,b2))
  circle((b1,b2), radius:0.1, fill: black)

  let v1x = (-radius*calc.sin(theta_rad_1))
  let v1y = (radius*calc.cos(theta_rad_1))

  let v2x = (-radius*calc.sin(theta_rad_2))
  let v2y = (radius*calc.cos(theta_rad_2))

  let t = -1
  let a11 = a1 + t*v1x
  let a22 = a2 + t*v1y
  let b11 = b1 + t*v2x
  let b22 = b2 + t*v2y

  line((a1,a2),(a11,a22),
        stroke: ( paint:purple, thickness:2pt),
        mark:(end:"stealth", scale: 0.7))

  line((b1,b2),(b11,b22),
        stroke:( paint: rgb("#4FB24F"), thickness:2pt),
        mark:(end:"stealth", fill: rgb("#4FB24F"), scale: 0.7))


  let v_t1x = a11 - a1
  let v_t1y = a22 - a2

  let v_t2x = b11 - b1
  let v_t2y = b22 - b2

  line((0,0),(v_t1x,v_t1y),
        stroke:( paint: purple, thickness:2pt),
        mark:(end:"stealth", scale: 0.7))
  line((0,0),(v_t2x,v_t2y),
        stroke:( paint: rgb("#4FB24F"), thickness:2pt),
        mark:(end:"stealth", fill: rgb("#4FB24F"), scale: 0.7))



})

#centripetal-acceleration()
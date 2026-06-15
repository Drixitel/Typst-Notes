// REQUIRES calls to be within a CETZ canvas
#import "@preview/cetz:0.5.0"

// page setup
#set page(width: auto, height: auto, margin: .5cm)
#show math.equation: block.with(fill: white, inset: 1pt)

//////////////////////////////////////////////////
#let draw-axes-2d(

  x_scale: 1,
  y_scale: 1,
  axis_pad_x: .3,
  axis_pad_y: .3,
  label_gap: .2,
  origin_label_pos: (-.2, -.2),
  arrow_style: (mark: (end: "stealth", fill: black, scale: 0.5))) = {

  let arrow-style = (mark: (end: "stealth", fill: black, scale: 0.5))

  cetz.draw.line((-axis_pad_x, 0), (2.5 * x_scale, 0), ..arrow-style)
  cetz.draw.line((0, -axis_pad_y), (0, 2.5 * y_scale), ..arrow-style)

  cetz.draw.content((2.5 * x_scale + label_gap, .06), $x$)
  cetz.draw.content((0, 2.5 * y_scale + label_gap), $y$)
  cetz.draw.content(origin_label_pos, $O$)
}

//////////////////////////////////////////////////

#let draw-axes-3d(
  x_scale: 1.5,
  y_scale: 1.5,
  z_scale: 1.5,

  axis_pad: 0,
  label_gap: .2,

  x_label: [$x$],
  y_label: [$y$],
  z_label: [$z$],

  arrow_style: (mark: (end: "stealth", fill: black, scale: 0.5)),

) = {

  // Rotate the scene
  cetz.draw.set-transform(
    cetz.matrix.transform-rotate-dir(
      // perspective rotation
      (1, 1, -1.3),
      (0, 1, .1))
      )

  // Flip axis if needed
  cetz.draw.scale(
    x: y_scale,
    y:-x_scale,
    z: z_scale -.5
    )

  cetz.draw.line(
    (0, -axis_pad, 0),
    (0,  x_scale, 0),
    ..arrow_style)
  cetz.draw.line(
    (-axis_pad, 0, 0),
    ( y_scale, 0, 0),
    ..arrow_style)
  cetz.draw.line(
    (0, 0, -axis_pad),
    (0, 0, z_scale),
    ..arrow_style)

  cetz.draw.content((0,x_scale+label_gap,0), x_label)
  cetz.draw.content((y_scale+label_gap -.01 ,0,0), y_label)
  cetz.draw.content((0,0,z_scale+label_gap), z_label)

}


// Example usage
#let draw-axes-example = cetz.canvas({
  import cetz.draw: *

  // draw-axes-2d()

  group({

    draw-axes-3d( y_scale: 2)
      // Point
      circle((1,1,1), radius:(2pt,2pt), stroke: (paint:blue), fill: blue)
      // Point
      on-xz(y:1, circle((5/3,5/3), radius: 2pt, fill: red))

    })

  // 2D does not align with 3D canvas
  circle((1,1), radius:2pt, fill: black)


})


#draw-axes-example

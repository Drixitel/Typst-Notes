#let rotation-transform(point,angle) = {
  // Rotaion matrix for a counterclockwise rotation by angle phi
  let (x, y) = point
  let cosine = calc.cos(angle)
  let sine = calc.sin(angle)

  (
    cosine * x - sine * y,
    sine * x + cosine * y,
  )

}

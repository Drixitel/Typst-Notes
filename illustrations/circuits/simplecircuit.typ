#import "@preview/zap:0.5.0"
#set page(width: auto, height: auto, margin: .5cm)
#show math.equation: block.with(fill: white, inset: 1pt)


#let simple-circuit() = zap.circuit({
      import zap: *

      // Here is a minimalist example
      node("B", (0, 0))
      resistor("r1", "B", (rel: (0, 4)), i: $1 Omega$, variant: "ieee")
  })

#simple-circuit()
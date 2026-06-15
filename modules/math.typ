// Math-specific helpers and defaults.

#let Bhat(symbol) = $hat(bold(#symbol))$
#let i = Bhat($i$)
#let j = Bhat($j$)
#let k = Bhat($k$)

#let vecB(symbol) = $arrow(bold(#symbol))$

#let color(x, fill:red) = {
  // call example: $ color(x, fill: #blue)$
  set text(fill: fill)
  x
}

#let drdt(dep_var, ind_var) = math.frac(
  // dependent variable ~ y what is changing due to changes in the independent variable ~x
  // independent variable ~ x
    [$d$ #dep_var],
    [$d$ #ind_var]
  )
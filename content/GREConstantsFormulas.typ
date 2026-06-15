#import "@preview/fancy-units:0.1.1": unit, num
// modules
#import "../config.typ": flex-caption


// Content
#let GRE-constants-formulas = [
  = Information Station
  #v(1em)
  #align(center)[Information provided by GRE practice materials]
  #v(2em)
  #figure(
  grid(
    columns: 2,
    gutter: 10mm,
    align: (left, left),

    table(
      columns: 4,
      stroke: none,
      align: (right, right, left, center),
      [Rest mass of the electron], [$m_e=$], [#num[9.11e-31]], [kg],
      [Magnitude of the electron charge ], [$e=$], [#num[1.60e-19]], [C],
      [Avagadro's number ], [$N_A=$], [#num[6.022e23]], [#unit[1/mol]],
      [Universal gas constant ], [$R=$], [#num[8.31]], [J/(mol$dot$K)],
      [Boltzmann's constant ], [$k=$], [#num[1.38e-23]], [J/k],
      [Speed of light ], [$c=$], [#num[3.00e8]], [m/s],
      [Planck's constant ], [$h=$], [#num[6.63e-34]], [J$dot$s],
      [], [$=$], [#num[4.14e-15]], [eV$dot$s],
      [], [ħ =], [$h/(2pi)$],[],
      [], [hc =], [#num[1240]], [eV$dot$nm],
      [Vacuum permittivity ], [$ε_0=$], [#num[8.85e-12]], [#unit[C^2]/(N$dot$ #unit[m^2])],
      [Vacuum permeability], [$μ_0=$], [$4 pi times 10^(-7)$] , [T$dot$(m/A)],
      [Universal gravitational constant ], [$G=$], [#num[6.67e-11]], [#unit[m^3]/(kg$dot$#unit[s^2])],
      [Acceleration due to gravity ], [$g=$], [#num[9.80]], [m/#unit[s^2]],
      [Standard temperature and pressure], [STP:], [0°C and 1 atm], [],
      [], [1 atm =], [#num[1.0e5]], [N/#unit[m^2]],
      [], [], [], [Pa],
      [1 angstrom ], [Å =], [#num[1e-10]], [m],
      [], [Å =], [#num[0.1]], [nm],
    ),
    table(
      columns:3,
      stroke: none,
      align: (left, left, left, center),

      [$10^(-15)$] , [femto], [f],
      [$10^(-12)$] , [pico], [p],
      [$10^(-9)$] , [nano], [n],
      [$10^(-6)$] , [micro], [μ],
      [$10^(-3)$] , [milli], [m],
      [$10^(-2)$] , [centi], [c],
      [$10^(-1)$] , [deci], [d],
      [$10^3$] , [kilo], [k],
      [$10^6$] , [mega], [M],
      [$10^9$] , [giga], [G],
      [$10^(12)$] , [tera], [T],
      [$10^(15)$] , [peta], [P],
    )
  ),
  caption: "Constants and prefixes for powers of 10",
)

#figure(
  table(
    columns: 2,
    stroke: none,
    align: (left,right),
    [*Rod* of mass M and length L], [$I = 1/12 M L^2$],
    [*Disk* of mass M and radius R], [$I = 1/2 M R^2$],
    [*Solid* sphere of mass M and radius R], [$I = 2/5 M R^2$],
  ),
  caption: flex-caption(
  [Rotational inertia about center of mass for common shapes],
  [Rotational inertia formulas],
  )

)


]// end of GREConstantsFormulas


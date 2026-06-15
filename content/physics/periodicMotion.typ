#import "@preview/fancy-units:0.1.1": unit
#import "../../config.typ": no-indent
// modules
#import "../../modules/blocks.typ": simple-block, knowledge-block
#import "../../modules/math.typ": vecB


#let periodic-motion = [
  == Periodic Motion
  #simple-block(breakable:true)[
    #no-indent[
    *Oscillation*: can only occur/always occurs when there is a *restoring force ($vecB(F_r)$)* tending to return the sysem to equilibrium. \

    Key Words: \
    - Amplitude *$A$*
    - Cycle
    - Period *$T$* , time to complete one cycle
    - Frequency *$f$*, number of cycles per second $"cycle"/s$
      $
      f = 1/T equiv "Hz" = "1 cycle"/s
      $<frequency-equation>

    - Angular Frequency *$omega$*
      $
        omega = 2 pi f = ( 2 pi )/ T equiv "rad-cycle"/s
      $<angular-frequency-equation>


    *Simple Harmonic Motion (SHM)* \
    Conditions:
    - Displacement is sufficiently small $vecB(r)(x,y,z)$ or $vecB(r)(r,theta)$ aka small angles
    - Amplitude is sufficiently small
    - Uniform circular motion
    The simplest kind of oscillation occurs when the restoring force is directly proportional to the displacement ($vecB(r)$) from equilibrium. \
    $
    vecB(F_r) = -k vecB(r)
    $<hookes-law-equation>
    where $k > 0$ with units of N/m = kg / #unit[s^2], assuming no friction.

    * Harmonic Oscillator*: a system that undergoes SHM. Examples include a mass on a spring and a pendulum (*for small angles*). \

    \

    *Use cases - to approximate*: \
    - vibration of tuning forks
    - electric curent in AC circuits
    - oscillations of atoms in molecules and solids

    \

    * Hooke's Law*:
    - Conditions similar to SHM
    - The restoring force is proportional to the displacement from equilibrium #cite(<young_sears_2016>, supplement: "Chapter 6.3, p.184") \
    - The proportionality of stress and strain in elastic deformations #cite(<young_sears_2016>, supplement: "Chapter 11.4-11.5")
    - In elastic deformations, stress (force per unit area) is proportional to strain (fractional deformation), the proportionality constant is called the elastic modulus
    $
    "Stress"/"Strain" = "Elastic Modulus"
    $<elastic-modulus-equation>
    ]

    #align(right)[
      #set text()
      #cite(<young_sears_2016>, supplement: "Chapter 14")
    ]

  ]
]
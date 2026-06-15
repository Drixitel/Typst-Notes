#import "../../config.typ": flex-caption
// modules
#import "../../modules/blocks.typ": simple-block, knowledge-block, solution-block
#import "../../modules/math.typ": vecB, drdt
#import "../../modules/subfigures.typ": *

// illustrations
#import "../../illustrations/physics/arcLengthRad.typ": radian, angle-theta
#import "../../illustrations/physics/angularVelocity.typ": *
#import "../../illustrations/physics/angularVectors.typ": angular-vectors-posacc, angular-vectors-negacc
#import "../../illustrations/physics/linearSpeedRotation.typ": *
#import "../../illustrations/physics/rigidBody.typ": *



// Content
#let rotation-rigid-bodies = [
 == Rotation of Rigid Bodies
 #simple-block(breakable:true)[
  Radian
  - *1 radian* is the angle at which the *arc length $s$* has the same length as the *radius $r$*
  - An *angle $theta$* in radians is the ratio of the *arc length $s$* to the *radius $r$*
  $
  s = r theta
  $<arc-length-equation>

  #figure(caption: [Measuring angles in radians],
    grid(
      columns: 2,
      gutter: 10mm,
      sub-figure(caption: [Radian], radian()),
      sub-figure(caption: [Angle $theta$], angle-theta()),
    )
    )<arc-length-figure>

  #simple-block(body-align: center, radius:3mm, inset:9pt, fill:rgb("#F1D3D0"))[
    "Always use radians when relating linear and angular quantiites i.e. $s = r theta$" \ #cite(<young_sears_2016>, supplement: "Chapter 9.3, p.281")
    ]
  Degrees
  $
    1 "radian" = (360°) / (2 pi) = (180°)/(pi) = 57.2958°
  $<1-radian-degree-equation>
  Revolutions
  $
    1 "radian" = (1 "revolution") / (2 pi) <=> 1 "revolution" = 2 pi "radian"
  $<radian-revolution-equation>
  Similarly
  $
    1 "rev"/"min" = 1"rpm" = (2 pi) / 60 "rad"/s = (2pi "rad")/min
  $<rpm-equation>

  Average Angular Velocity $vecB(omega)_"av"$\
        - where av-z represents *"av" average*, *"z"* for the z-component of Angular Velocity $vecB(omega)$ of a rigid body rotating *about the z-axis*, and *$t$* for *time*

  #simple-block(breakable:false, stroke:none)[
    #grid(
      columns: 2,
      gutter: 10mm,
      figure(
        caption: flex-caption([Average angular velocity of a rigid body with position vector $vecB(r)$ at time $t_1$ and its rotated position vector $vecB(r)_r$ at time $t_2$],[Average angular velocity of a rigid body]),
        angular-velocity(),
        ),
      [
        #v(4em)
        $
          omega_("av-z") = (theta_2 - theta_1)/(t_2 - t_1) = (Delta theta)/(Delta t)
        $<average-angular-velocity-equation>
        Instantaneous Angular Velocity $vecB(omega)$
        $
          omega_z = lim_(Delta t -> 0) (Delta theta)/(Delta t) = (d theta)/(d t)
        $<instantaneous-angular-velocity-equation>
      ]
    )

  ]


  #simple-block(body-align: center, radius:3mm, inset:9pt, fill:rgb("#F1D3D0"))[
    #grid(
      columns:2,
      gutter:10mm,
      figure(caption: [Angular velocity $omega$ as an attribute of the entire rigid body], rigid-body()),
      [ #v(8em)
    "Angular velocity is an attibute of the entire rigid body, not any one part" \ #cite(<young_sears_2016>, supplement: "Chapter 9.1, p.276")
      ]
    )
    ]

  Average Angular Acceleration $vecB(alpha)_"av"$
  $
    alpha_"av-z" = (omega_"2z" - omega_"1z")/(t_2 - t_1) = (Delta omega_z)/(Delta t)
  $<average-angular-acceleration-equation>
  Instantaneous Angular Acceleration $vecB(alpha)$
  $
    alpha_z = lim_(Delta t -> 0) (Delta omega_z)/(Delta t) = (d omega_z)/(d t) = (d^2 theta)/(d t^2)
  $<instantaneous-angular-acceleration-equation>


  #figure(caption: [Angular acceleration and angular velocity vectors of a rigid body],
    grid(
      columns: 2,
      gutter: 10mm,
      sub-figure(caption: [$vecB(alpha)$ and $vecB(omega)$ in the same direction:\ Rotation speeding up], angular-vectors-posacc()),
      sub-figure(caption: [$vecB(alpha)$ and $vecB(omega)$ in the opposite direction:\ Rotation slowing down], angular-vectors-negacc()),
      )
    )<angular-acceleration-direction-figure>

  #simple-block(breakable: false, stroke:none, inset:0pt, radius:0pt)[
  *Linear Speed in Rigid-Body Rotation*

  #figure(
    caption: flex-caption([A rigid body rotating about a fixed axis through point $O$ with linear speed $v$.],[Linear speed of a point on a rigid body in counterclockwise rotation]),
    linear-speed-rotation()
    )<linear-speed-rotation-figure>
    ]

  *Linear Speed*
  #simple-block(breakable: false, stroke:none, inset:10pt, body-align:center, fill:rgb("#F1D3D0"))[

    #grid(
      columns:2,
      gutter:0mm,
      [
        "The farther a point is from the axis. the greater its linear speed." \ #cite(<young_sears_2016>, supplement: "Chapter 9.3, p.281")
      ],
      [
        #v(1em)
        $
          v = r omega
        $<linear-speed-rotating-object-equation>
       ]
     )
    ]

    #align(right)[
      #set text()
      #cite(<young_sears_2016>, supplement: "Chapter TBD")
      ]


  ]

  #solution-block(breakable: true)[
    *Proof of @linear-speed-rotating-object-equation*\
    At any time $t$, @arc-length-equation relates the angle $theta$ (in radians) and the arc length $s$:
    $
      s(t) = r dot theta (t) equiv m dot "rad"
    $
    We take the derivative of bothe sides with respect to time $t$, and take the absolute value of both sides:
    $
      lr(|drdt(s,t)|) = r lr(|drdt(theta,t)|)
    $
    Now, $lr(|drdt(s,t)|)$ is the absolute value of the rate of change of the arc length i.e. equal to the instantaneous _linear_ speed $v$ of a particle.
    $
      lr(|drdt(s,t)|) = v equiv (m dot "rad")/s
    $
    Similarly, recalling @instantaneous-angular-velocity-equation
    $
      lr(|drdt(theta,t)|) = omega equiv "rad"/s
    $
    Thus, we have
    $
      v = r omega equiv m dot "rad"/s
    $
  ]
  #simple-block(breakable:true)[
    *Linear Acceleration* \
    Acceleration $vecB(a)$ of a particle moving in a circle can be decomposed into two components: \
    - Tangential acceleration $vecB(a)_"tan"$

    - Centripetal acceleration $vecB(a)_"rad"$

    - Note: @tangential-acceleration-rotating-obj-equation is representing scalar quantities, not vectors
    *Tangential Acceleration*
    - Tangent to the path
    $
       color(drdt(v,t), fill:#blue) &= r color(drdt(omega,t), fill:#purple) \
       \
       \
       color(a_"tan", fill:#blue) &= r color(alpha, fill:#purple) \
    $<tangential-acceleration-rotating-obj-equation>
    *Centripetal Acceleration*
    - Always points toward the axis of rotation
    $
      a_"rad" = v^2/r = omega^2 r
    $<centripetal-acceleration-rotating-obj-equation>
  ]

  #solution-block()[
    *Proof of @centripetal-acceleration-rotating-obj-equation*:\
    \



  ]



]// end of rotationRigidBodies

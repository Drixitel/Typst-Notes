// modules
#import "../../modules/blocks.typ": *
#import "../../modules/math.typ": vecB, i, j, k, color
// illustrations
#import "../../illustrations/questions/inelasticCollision.typ": *


// Content
#let question-001 =[
  #question-block()[
    1. Two objects sliding on a frictionless surface, as represented below, collide and stick together. How much kinetic energy is converted to heat during the collision? #cite(<educational_testing_service_practice_2024>, supplement: "Question 1")

    #figure(
      inelastic-collision(),
      kind:image,
      caption: [Collision of two objects on a frictionless surface],
      )<inelastic-collision>
  ]

  #knowledge-block()[

    "In an isolated system ... momentum is _always_ conserved, whether the collisoin is elastic or not."\

    #align(center)[
      #figure(
        table(
        columns: (1fr,1fr,1fr),
        stroke: 1pt,
        align: (auto, auto, auto),
        inset: (x: 18pt, y: 9pt),
        table.header(
        [*Energy*] , [*Momentum*], [*Collision Classification*],
        ),
        // row 1
        [
          Kinetic Energy (KE)\
          for mass $m$ \
          moving at speed $v$
        ],
        [
          Momentum ($vecB(P)$)\
          for mass $m$ \
          moving at velocity $vecB(v)$
        ],
        [
          Elastic, Inelastic, Perfectly Inelastic
        ],
        // row 2
        [
          #align(center)[
            $"KE" = 1/2 m v^2$ \

            $"KE" = 1/2 m dot(arrow(bold(v)))$
          ]
        ],
        [$vecB(P) = m vecB(v)$],
        [],

        ),
        caption: "Energy, momentum, and collision classifications",
        kind: table,
      )<energy_momentum_collisions_table>
    ]

    The KE lost in an Inelastic/Perfectly Inelastic collision is converted to other forms of energy, such as heat and sound.

    #align(center)[
      #figure(
        table(
        columns:(1fr, 1fr),
        stroke: 1pt,
        align: (auto, auto),
        inset: (x: 33pt, y: 9pt),
        table.header(
          [*Collision*], [*Equations*, where 1: before collision, 2: after collision],
        ),
          [Elastic ],
          [KE is conserved \  $"KE"_1$ = $"KE"_2$\ Momentum is conserved \ $vecB(P)_1$ = $vecB(P)_2$],

          [Inelastic ],
          [KE is not conserved\ $"KE"_1 > "KE"_2$\ Momentum is conserved\  $vecB(P)_1$ = $vecB(P)_2$\ Converted Energy ($"E"_"C"$) = $"KE"_1$ - $"KE"_2$
          ],

          [Perfectly Inelastic ],
          [KE is not conserved\ $"KE"_1 > "KE"_2$\ Momentum is conserved and objects stick together\ Converted Energy ($"E"_"C"$) = $"KE"_1$ - $"KE"_2$
          ],
        ),
        caption: "Collision classifications and their corresponding equations",
        kind: table,
      )<collision_equations_table>
    ]

    #align(right)[
      #set text()
      #cite(<young_sears_2016>, supplement: "Chapter 8.2, p.248-250")
    ]
  ]

  #given-block()[

    Mass (kg), Velocity (m/s), let $x$ be the $#i$ direction and $y$ be the $#j$ direction\

    (Mass  of object $alpha$, velocity of object $alpha$)= $(m_alpha, vecB(v_alpha)) =$ $(0.5, 2#i + 0#j) = (1/2, 2#i + 0#j)$\

    (Mass of object $beta$, velocity of object $beta$)= $(m_beta, vecB(v_beta)) =$ $(1, 0#i + 1#j) $\
  ]

  #solution-block(breakable: true)[
    *Worked Solution:*\
    Assumptions: "stick" $=>$ Perfectly Inelasitic collision $=>$ Kinetic Energy (KE) is not conserved i.e. $"E"_"C"$ exists and objects stick together i.e. the combined mass after the collision is $m_alpha + m_beta$.\

    $
      m_alpha + m_beta = 1/2 + 1 = 3/2
    $

    The KE converted to heat ($"E"_"C"$) during the collision of two objects on a frictionless surface is as follows,\

    $
      "E"_"C" &= "KE"_1 - "KE"_2\
      &= ((1/2)m_alpha dot(vecB(v_alpha)) + (1/2)m_beta dot(vecB(v_beta))) - ((1/2)(m_alpha + m_beta) dot(vecB(v_f)))\
    $

    where $vecB(v_f)$ is the final velocity of the combined mass after the collision and, \

    $
      dot(vecB(v_alpha)) &= vecB(v_alpha) dot vecB(v_alpha) \
      &= <2#i + 0#j> dot <2#i + 0#j> \
      &= 2 dot 2 + 0 dot 0 \
      &= 4\
    $
    similarly, \
    $
      dot(vecB(v_beta)) &= vecB(v_beta) dot vecB(v_beta) \
      &= <0#i + 1#j> dot <0#i + 1#j> \
      &= 0 dot 0 + 1 dot 1 \
      &= 1\
    $
    Using the conservation of momentum we can find $vecB(v_f)$

    $
      vecB(P)_1 &= vecB(P)_2\
      m_alpha vecB(v_alpha) + m_beta vecB(v_beta) &= (m_alpha + m_beta)vecB(v_f)\
      (m_alpha vecB(v_alpha) + m_beta vecB(v_beta))/((m_alpha + m_beta)) &= vecB(v_f) ", where" m_alpha + m_beta != 0 \
      (1/2 dot <2#i + 0#j> + 1 dot <0#i + 1#j>)/(1/2 + 1) &= vecB(v_f)\
      (<#i + 0#j> + <0#i + 1#j>)/(3/2) &= vecB(v_f)\
      2/3<#i + #j> &= vecB(v_f)
    $

    it follows that, \
    $
      dot(vecB(v_f)) &= vecB(v_f) dot vecB(v_f) \
      &= <2/3#i + 2/3#j> dot <2/3#i + 2/3#j> \
      &= 2/3 dot 2/3 + 2/3 dot 2/3 \
      &= 8/9\
    $

    therefore, \
    $
      "E"_"C" &= ((1/2)m_alpha dot(vecB(v_alpha)) + (1/2)m_beta dot(vecB(v_beta))) - ((1/2)(m_alpha + m_beta) dot(vecB(v_f)))\
      &= ((1/2)(1/2)(4) + (1/2)(1)(1)) - ((1/2)(3/2)(8/9))\
      &= (1 + 1/2) - 3/4 dot 8/9 \
      &= 3/2 - 2/3 \
      &= 3/2 dot color(3/3, fill:#blue) - 2/3 dot color(2/2, fill:#blue) \
      &= 9/6 - 4/6\
      &= 5/6 J
    $
  ]

]// end of question001
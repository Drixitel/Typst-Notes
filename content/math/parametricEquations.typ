// Modules
#import "../../modules/blocks.typ": simple-block, solution-block
#import "../../modules/math.typ": *
// Illustrations
#import "../../illustrations/math/parametricLine.typ": *

// Content
#let parametric-equations =[
  #simple-block(breakable: true)[
  == Parametric Equations

  #simple-block(breakable: false, inset:0pt, radius:0pt, stroke:none)[
  Lines \

  #figure(caption: [Parametic Line in $RR^3$], parametric-line())<parametic-line-figure>
  ]


  Let $P(x,y,z)$ be an arbitrary point in $RR^3$ on line $L$ with a parallel unit vector $vecB(v)$ (does not need a unit vector), and let $vecB(r)_0$ ad $vecB(r)$ be the position vectors of $P_0$ and $P$ respectively. If $vecB(a)$ is the vector representation $vecB(P_0P)$, as shown in @parametic-line-figure, then the Triangle Law for vector addition gives us,
  $
    vecB(a) = vecB(r) - vecB(r)_0 <=>
    vecB(r) = vecB(r)_0 + vecB(a)\
  $<vector-lineinR3-equation>
  But, since $vecB(a)$ and $vecB(v)$ are parallel vectors, there is a scalar $t$ such that,

  $
    vecB(a) = t vecB(v)
  $<vector-parallel-equation>

  By substituting @vector-parallel-equation into @vector-lineinR3-equation, we get the vector equation of a line in $RR^3$ as,

  $
    vecB(r) = vecB(r)_0 + t vecB(v)
  $<vector-line-equation>

  The parametic form of a line through the point $P_0(x_0, y_0, z_0)$ with a parallel vector $vecB(v) = chevron.l v_x, v_y, v_z chevron.r$ is given by:
  $
    vecB(r)(t) = mat(x;y;z) = mat(x_0;y_0;z_0) + t mat(v_x;v_y;v_z)
  $

  A *line segment* from $vecB(r)_0$ to some new $vecB(r)_1$ is given by,

  $
    vecB(r)(t) = (1-t) vecB(r)_0 + t vecB(r)_1 "for" 0<=t<=1
  $<line-segment-equation>

  #align(right)[
      #set text()
      #cite(<stewart_calculus_2016>, supplement: "Chapter 12.5")
    ]
  ]

  #solution-block()[
    *Proof of @line-segment-equation*:\
    Using @vector-line-equation,
    $
      vecB(r) &= vecB(r)_0 + t vecB(v) \
    $
    Let $vecB(v) = vecB(r)_1 - vecB(r)_0$ (see @parametic-line-figure). Then, we obtain a line segment equation from $vecB(r)_0$ to $vecB(r)_1$ \

    $
      vecB(r)(t) &= vecB(r)_0 + t (vecB(r)_1 - vecB(r)_0)\
      &=vecB(r)_0 + t vecB(r)_1 - t vecB(r)_0\
      &= vecB(r)_0 - t vecB(r)_0 + t vecB(r)_1\
      &=(1-t) vecB(r)_0 + t vecB(r)_1 "for" 0<=t<=1\
    $
    For a visual example see: #link("https://www.desmos.com/calculator/iqwpscv7cn")[Drixit's Desmos Graph of a Line Segment]
    ]

  #solution-block()[
    *Worked Example of Parametic Lines:*\
    The following was used to create @parametic-line-figure. Note ($'$) is not used as a derivative here. \
    \
    For a line $L$ with starting point $P'_0(-1,1,1)$ and end point $P'_1(4,4,4)$ we'll calculate the parallel vector $vecB(v)'$.
    $
      vecB(v)' &= chevron.l x_1-x_0, y_1-y_0, z_1-z_0 chevron.r \
                &= chevron.l 4-(-1), 4-1, 4-1 chevron.r \
                &= chevron.l 5,3,3 chevron.r
    $

    As the unit vector $color(vecB(v), fill:#green)$:
    $
      vecB(v) &= vecB(v)' / (|vecB(v)'|) \
      &= (chevron.l 5,3,3 chevron.r)/sqrt(5^2 + 3^2 + 3^2) \
    $

    Using @vector-line-equation we obtain our parametic line $L$,

    $
      mat(x;y;z) = mat(-1;1;1) + t' mat(5;3;3)
    $
    For $0<t'<1$ where $t'_0 = 0$ gives $P'_0$ and $t'_1 = 1$ gives $P'_1$.\
    \
    Next we want to find 2 points on $L$ which are asthetic and provide enough space for labels. We can choose $t'_2 = 1/2$ and $t'_3 = 5/6$. These values were choosen with guess and check. \
    \
    For $t'_2 = 1/2$, we obtain @parametic-line-figure's $P_0$ as,
    $
      P_0 equiv
      mat(x;y;z)&= mat(-1;1;1) + 1/2 dot mat(5;3;3)\
                  &= mat(-1;1;1) +
                  mat(display(5/2);display(3/2);display(3/2))\
                  &= mat(display(3/2);display(5/2);display(5/2))\
                  &= color(vecB(r)_0, fill:#red)
    $

    For $t'_3 = 5/6$, we obtain @parametic-line-figure's $P$ as,

    $
      P equiv
      mat(x;y;z)&= mat(-1;1;1) + 5/6 dot mat(5;3;3)\
                &= mat(-1;1;1) +
                mat(display(25/6);display(15/6);display(15/6))\
                &= mat(display(19/6);display(21/6);display(21/6))\
                &= color(vecB(r), fill:#blue)
    $

    Lastly we can obtain the vector $vecB(a)$ as,
    $
      color(vecB(a), fill:#purple) &= color(vecB(r), fill:#blue) - color(vecB(r)_0, fill:#red)\
      &= mat(display(19/6);display(21/6);display(21/6)) - mat(display(3/2);display(5/2);display(5/2))\
      &= mat(display(5/3);display(1);display(1))
    $
    Though to plot with Typst we need to shift the z-values as follows,
    $
      P_0"z+" = mat(display(3/2);display(5/2);display(5/2 + 0.1))\
      P"z+" = mat(display(19/6);display(21/6);display(21/6 + 0.1)) \
    $
  ]

  #simple-block(breakable:true)[
    === Derivatives of Parametric Lines
    *Derivative*
    $
     #drdt(vecB($r$), $t$) = vecB(r)'(t) = lim_(h->0) (vecB(r)(t+h) - vecB(r)(t))/h
    $<formal-derivative-parametric-equation>

    *Theorem*: If $vecB(r)(t) = chevron.l f(t), g(t), h(t) chevron.r = f(t) i + g(t) j + h(t) k$, where $f,g, "and" h$ are differentiable functions, then
    $
      vecB(r)'(t) = chevron.l f'(t), g'(t), h'(t) chevron.r = f'(t) i + g'(t) j + h'(t) k
    $<derivative-parametric-equation>

    #align(right)[
      #set text()
      #cite(<stewart_calculus_2016>, supplement: "Chapter 13.2")
    ]


  ]

  #solution-block()[
    *Worked Example: Derivative of a Parametric Circle*\
    \
    The equations of a circle of radius $r$ centered at the origin in $RR^2$ are given by:
    $
      r^2 &= x^2 + y^2\
      x &= r cos (theta)\
      y &= r sin (theta)\
    $
    Our parametic representation of the circle is then,
    $
      vecB(r)(theta) = chevron.l r cos(theta), r sin(theta) chevron.r
    $
    Taking the derivative with respect to $theta$ using @derivative-parametric-equation, we get,
    $
      vecB(r)'(theta) &= chevron.l -r sin(theta), r cos(theta) chevron.r\
    $

    If we were to take this further and apply what we know about parametric lines we can construct a tangent line to the circle at a point $P_0$. \
    \
    Using @vector-line-equation we let $vecB(r)_0 = vecB(r)(theta)$ and $vecB(v) = vecB(r)'(theta)$, now our equation of the tangent line is,
    $
      vecB(r)_"tangent" &= vecB(r)_0 + t vecB(v) \
                 &= vecB(r) + t vecB(r)' \
    $
    For a visual example see: #link("https://www.desmos.com/calculator/9cyvuqjkpc")[Drixit's Desmos Graph of Tangent Line to a Parametric Circle]

  ]

]// end of parametricEquations


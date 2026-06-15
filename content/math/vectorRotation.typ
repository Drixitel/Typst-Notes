// Modules
#import "../../modules/blocks.typ": simple-block
#import "../../modules/math.typ": vecB, color

// illustrations
#import "../../illustrations/math/vectorRotationIMG.typ": vector-2d, vector-2d-rotated


// Content
#let vector-rotation = [
  #simple-block(breakable:true)[
  == Vector Transformation $RR^2$

  Rotation of a vector in 2D\

  #figure(caption: [Vector $vecB(v)$],
    vector-2d(),
    kind:image,
    )<2D-vector>

  For a vector $vecB(v)(x,y)$ with coordinates,

  $
  vecB(v)(x,y) = mat(x_1; y_1)  = mat(|vecB(v)| cos theta; |vecB(v)| sin theta)
  $<vector-components-equation>

  where $ |vecB(v)| = sqrt((x_1)^2+(y_1)^2) $ is the magnitude of $vecB(v)$ and $theta$ is the angle between the vector and the positive x-axis. We can rotate $vecB(v)$ by an angle $phi$ using the angle sum rule.

  $
    cos( alpha + beta )  = cos alpha cos beta - sin alpha sin beta \
    sin( alpha + beta )  = cos alpha sin beta + sin alpha cos beta
  $<angle-sum-equations>


  #figure(caption:[Vector $vecB(v)$ after a rotation by angle $phi$],
    vector-2d-rotated(),
    kind:image,
    )<2D-vector-rotated>

  Applying the angle sum rule to the components of rotated vector $vecB(v)_r$, we get:

  $
    vecB(v)_r = mat(x_2; y_2) &= mat(|vecB(v)| cos(theta + phi) ; |vecB(v)| sin(theta + phi)) \

    &= mat(|vecB(v)| (cos theta cos phi - sin theta sin phi) ;  |vecB(v)| (cos theta sin phi + sin theta cos phi))\

    &= mat(color(|vecB(v)| cos theta, fill:#blue) cos phi - color(|vecB(v)| sin theta, fill:#red) sin phi; color(|vecB(v)| cos theta, fill:#blue) sin phi + color(|vecB(v)| sin theta, fill:#red) cos phi)\

    &= mat(color(x_1, fill:#blue) cos phi - color(y_1, fill:#red) sin phi ; color(x_1, fill:#blue) sin phi + color(y_1, fill:#red) cos phi)
  $

  Similarly, we can write $vecB(v)_r$ in matrix form:

  $
    vecB(v)_r &= mat(x_1 cos phi - y_1 sin phi; x_1 sin phi + y_1 cos phi)\
                &= mat(cos phi, -sin phi; sin phi, cos phi ) mat(x_1; y_1)\
                &= mat(cos phi, -sin phi; sin phi, cos phi ) vecB(v)\
                &= A vecB(v)
  $<CCW-rotation-matrix-equation>

  Where $A$ is our rotation matrix for a counterclockwise rotation by angle $phi$. Note, for a clockwise rotation, we would use $phi_(-) = -phi$ in the rotation matrix, which would give us:
  $
    A' &= mat( cos phi_(-) , -sin phi_(-); sin phi_(-), cos phi_(-)) \
       &= mat(cos (-phi), -sin(-phi); sin(-phi), cos(-phi))\
       &= mat(cos phi, sin phi; -sin phi, cos phi)
  $<CW-rotation-matrix-equation>

  For a visual example see: #link("https://www.desmos.com/calculator/tbr6wdhvre")[Drixit's Desmos Graph of Vector Rotation in 2D]


  ]
]// end of vectorRotation

#vector-rotation
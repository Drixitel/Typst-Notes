// Support
#import "config.typ": *

// Content Questions
#import "content/questions/question001.typ": *
#import "content/questions/question002.typ": *
// Content Supplemental Pages
#import "content/GREConstantsFormulas.typ": *
// Conent Math
#import "content/math/vectorRotation.typ": *
#import "content/math/parametricEquations.typ":*
// Content Physics
#import "content/physics/uniformCircularMotion.typ": *
#import "content/physics/rotationRigidBodies.typ":*
#import "content/physics/periodicMotion.typ": *

// Apply the document-wide presentation rules
#show: apply-config

// Set the document title
#set document(
  title: [Drixit's GRE Notes],
)
// Call the document title and header
#make-title-and-header(context document.title)

#make-outlines


#pagebreak()

#GRE-constants-formulas

#pagebreak()

= Practice Questions

#question-001
#question-002

#pagebreak()
= Block Examples
// // note this doesn't require block.typ import bc other files have the functions already imported
#simple-block()[simple block]
#question-block()[question block]
#knowledge-block()[knowledge block]
#given-block()[given block]
#solution-block()[*Worked Solution:*\ solution block]

#pagebreak()
= Supplemental Math Content
#vector-rotation
#parametric-equations
#pagebreak()
= Supplemental Physics Content
#uniform-circular-motion
#rotation-rigid-bodies
#periodic-motion
#pagebreak()
#bibliography("PhysicsLit.bib", style: "apa")


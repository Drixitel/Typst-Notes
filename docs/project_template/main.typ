// Support
#import "config.typ": *
// modules
#import "blocks.typ": *
#import "subfigures.typ": *

// Apply the document-wide presentation rules
#show: apply-config

// Set the document title
#set document(
  title: [Document Title],
)
// Call the document title and header
#make-title-and-header(context document.title)

#make-outlines

= Blocks, Numbering, Citation Examples
#simple-block()[This is a simple block. Exampele citation:  #cite(<young_sears_2016>, supplement: "Chapter 14")
$
  a = 1\
$
]
#question-block()[This is a question block. It is designed to highlight questions or prompts that require attention.]
#knowledge-block()[This is a knowledge block. It is intended for important information or key concepts that you want to emphasize.
$
  b=2\
$
]
#given-block()[This is a given block. It is useful for presenting given information or assumptions in a clear and organized manner.]
#solution-block()[*Worked Solution:* This is a solution block.

The equation numbering is automatically generated. equations within the solution block will be numbered according to the specified numbering format, which defaults to "(i)", "(ii)", etc.
$
  x = 3\
$
$
  y = 4
$
 ]
#simple-block()[This is a simple block. Note that the equation numbering is independent across blocks.\
$
  c = 5\
$
]

#solution-block()[*Worked Solution:* \
Notice the number does not interfere with the previous blocks equation numbering.\
$
  x = 3\
$
$
  y = 4
$
 ]
== Subheading 1
=== Subheading 1.1
= Figure Examples

#simple-block()[

   #figure(
        table(
            columns: 2,
              [ a], [ b ]
        ),
        caption: flex-caption([long caption...], [short caption]),
        kind: table,
    )

   #figure(kind:image,
      grid(
        columns:2,
        gutter:10mm,
        sub-figure(caption: [Subfigure 1], table(columns:2, [a], [b])),
        sub-figure(caption: [Subfigure 2], table(columns:2, [a], [b]))
      ),
      caption: "subfigure example")
]

== Subheading 2
=== Subheading 2.1

#bibliography("refLiterature.bib", style: "apa")
## Store Hero

**Store Hero is a stackable box in various widths and lengths that are multiples of 49 mm. So the boxes are compatible to the "Tanos Systainer Insetbox" system.**

This design is heavily inspired by https://www.thingiverse.com/thing:4812321 and Alexandre Chappel's Boxes (https://www.thingiverse.com/chappel/designs). I wanted them to be compatible to Tanos Systainer Insetboxes, and be able to customize arbitrary grid sizes, so I designed a box myself using OpenSCAD.

### Components and Variations

Store Hero consists of boxes and a grid in arbitrary sizes limited only by your printer's maximum build size.

- **Store Hero - Box Display**: STL files beginning with this title are the standard boxes including a display where you can put on labels.
- **Store Hero - Box No Display**: STL files beginning with this title are the standard boxes without a display.
- **Store Hero - Grid**: STL files beginning with this title are the grids you can use as a base for the boxes. The grid is optional. It's main purpose is, to fix the boxes, e.g., in a drawer. If you put the boxes in a drawer without the grid, they will move around when you open or close the drawer. See "Customization" on how to fit the grids into your specific drawer.


### Customization

Store Hero is designed in OpenSCAD and all source files are provided in a ZIP file. You can customize the box and the grid to fit your needs.

- **Boxes:** Open "Store Hero - Box.scad" in OpenSCAD and set the parameters in the OpenSCAD Customizer. The parameters are commented and self explaining. You can download all variations from 1x1 up to 6x6 and 1 to 3 height units directly. If you need another height or a box larger than 6x6, this is the way to go.
- **Grid:** Open "Store Hero - Grid.scad" in OpenSCAD and set the parameters in the OpenSCAD Customizer. The parameters are commented and self explaining. You can download all variations from 1x1 up to 6x6 directly. If you need a larger grid, or fit the grid exactly into a drawer or some kind of frame, play with the SPACER A/B/C/D parameters, which will add a spacer grid on the sides, so you can compensate for spaces that aren't an exact multiple of 49 mm.


### Printing

Every part can be printed without supports and around standard settings. Layer heights of 0.2 to 0.3 work well, you should probably go for the latter, if you plan to print a lot of boxes and grids. Print two or three walls, then there is hardly any infill, so you can leave this also to 20% or whatever your slicer of choice uses as a standard.

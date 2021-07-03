////////////////////////////////////////////////////////////////////////////////
// ### CUSTOMIZABLE VARIABLES
////////////////////////////////////////////////////////////////////////////////
// Length factor: The length will be 49 x LENGTH_UNITS
LENGTH_UNITS = 1;
// Width factor: The width will be 49 x WIDTH_UNITS
WIDTH_UNITS = 1;
// Height factor: The height will be 33.75 * HEIGHT_UNITS + 3.5
HEIGHT_UNITS = 1;
// Override HEIGHT_UNITS and give a custom numeric value for the total height; if left blank HEIGHT_UNITS is used
HEIGHT_TOTAL_OVERRIDE = "";
// Add a display?
ADD_DISPLAY = true;

module __Customizer_Limit__() {}


////////////////////////////////////////////////////////////////////////////////
// ### OPENSCAD SPECIAL VARIABLES
////////////////////////////////////////////////////////////////////////////////
$fn = 24;


////////////////////////////////////////////////////////////////////////////////
// ### GLOBAL VARIABLES
////////////////////////////////////////////////////////////////////////////////
include <includes/Store Hero Variables.scad>


////////////////////////////////////////////////////////////////////////////////
// ### UTILITY MODULES
////////////////////////////////////////////////////////////////////////////////
include <includes/Store Hero Utilities.scad>
include <includes/Store Hero Raw Box.scad>


////////////////////////////////////////////////////////////////////////////////
// ### CALCULATION FUNCTIONS
////////////////////////////////////////////////////////////////////////////////
include <includes/Store Hero Calculations.scad>


////////////////////////////////////////////////////////////////////////////////
// ### MAIN RENDERING
////////////////////////////////////////////////////////////////////////////////
main();


////////////////////////////////////////////////////////////////////////////////
// ### MODULES
////////////////////////////////////////////////////////////////////////////////
module main() {
    union() {
        raw_box();
        if (ADD_DISPLAY) {
            display($fn = 50);
        }
    }
}

module display() {
    x_offset = length_inner() + WALL_THICKNESS;
    y_offset = width_inner() + WALL_THICKNESS - DISPLAY_SPACING;
    z_offset = height_total() - DISPLAY_HEIGHT - DISPLAY_Z_INSET;
    translate([x_offset, y_offset, z_offset])
        rotate([0, - 90, 0])
            rotate([90, 0, 0])
                linear_extrude(display_width())
                    hull() {
                        translate([DISPLAY_DEPTH + 1.5 * DISPLAY_ROUNDING_RADIUS, DISPLAY_DEPTH, 0])
                            circle(r = DISPLAY_ROUNDING_RADIUS);
                        square([DISPLAY_HEIGHT, 0.01]);
                    }
}

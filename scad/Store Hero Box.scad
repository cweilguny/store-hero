////////////////////////////////////////////////////////////////////////////////
// ### CUSTOMIZABLE VARIABLES
////////////////////////////////////////////////////////////////////////////////
// Length factor: The length will be 49 x LENGTH_UNITS
LENGTH_UNITS = 1;
// Width factor: The width will be 49 x WIDTH_UNITS
WIDTH_UNITS = 1;
// Height factor: The height will be 33.75 * HEIGHT_UNITS + 3.5
HEIGHT_UNITS = 2;
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
    translate([length_inner() + WALL_THICKNESS, width_inner() + WALL_THICKNESS, height_total() - DISPLAY_HEIGHT - DISPLAY_Z_INSET])
        difference() {
            display_body();
            display_edge_cutouts();
        }
}

module display_body() {
    rotate([0, - 90, 0])
        rotate([90, 0, 0])
            linear_extrude(width_inner())
                hull() {
                    translate([DISPLAY_DEPTH + 1.5 * DISPLAY_ROUNDING_RADIUS, DISPLAY_DEPTH, 0])
                        circle(r = DISPLAY_ROUNDING_RADIUS);
                    square([DISPLAY_HEIGHT, 0.01]);
                }
}

module display_edge_cutouts() {
    display_edge_cutout();
    translate([0, - width_inner(), 0])
        mirror([0, 1, 0])
            display_edge_cutout();
}

module display_edge_cutout() {
    r = WALL_CORNER_ROUNDING_RADIUS;
    d = r * 2;
    translate([- DISPLAY_DEPTH - d, - d, - r]) {
        rounded_cube([DISPLAY_DEPTH + d, d + r, DISPLAY_HEIGHT + d], r);
        difference() {
            translate([DISPLAY_ROUNDING_RADIUS, - DISPLAY_ROUNDING_RADIUS, d])
                cube([DISPLAY_ROUNDING_RADIUS, DISPLAY_ROUNDING_RADIUS, DISPLAY_HEIGHT]);
            translate([DISPLAY_ROUNDING_RADIUS * 2, - DISPLAY_ROUNDING_RADIUS, d])
                cylinder(r = DISPLAY_ROUNDING_RADIUS, h = DISPLAY_HEIGHT);
        }
    }
}

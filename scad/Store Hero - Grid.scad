////////////////////////////////////////////////////////////////////////////////
// ### CUSTOMIZABLE VARIABLES
////////////////////////////////////////////////////////////////////////////////
// Length factor: The length will be 49 x LENGTH_UNITS
LENGTH_UNITS = 3;
// Width factor: The width will be 49 x WIDTH_UNITS
WIDTH_UNITS = 3;
// Spacer side A
SPACER_A = 0;
// Spacer side B
SPACER_B = 0;
// Spacer side C
SPACER_C = 0;
// Spacer side D
SPACER_D = 0;

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


////////////////////////////////////////////////////////////////////////////////
// ### CALCULATION FUNCTIONS
////////////////////////////////////////////////////////////////////////////////
include <includes/Store Hero Calculations.scad>

function length_grid() = BASE_SIZE_LENGTH * LENGTH_UNITS + SPACER_B + SPACER_D;
function width_grid() = BASE_SIZE_WIDTH * WIDTH_UNITS + SPACER_A + SPACER_C;


////////////////////////////////////////////////////////////////////////////////
// ### MAIN RENDERING
////////////////////////////////////////////////////////////////////////////////
main();


////////////////////////////////////////////////////////////////////////////////
// ### MODULES
////////////////////////////////////////////////////////////////////////////////
module main() {
    difference() {
        base_plate();
        cutouts();
    }
//    translate([0, 0, 3]) cutouts_spacers();
}

module base_plate() {
    cube([length_grid(), width_grid(), GRID_FLOOR_THICKNESS + GRID_WALL_HEIGHT]);
}

module cutouts() {
    cutouts_cells();
    cutouts_spacers();
}

module cutouts_cells() {
    translate([SPACER_D, SPACER_C, 0]) {
        for (i = [0 : LENGTH_UNITS - 1]) {
            for (j = [0 : WIDTH_UNITS - 1]) {
                translate([i * BASE_SIZE_LENGTH, j * BASE_SIZE_WIDTH, 0])
                    cutouts_cell();
            }
        }
    }
}

module cutouts_cell() {
    translate([(BASE_SIZE_LENGTH - length_grid_cell()) / 2, (BASE_SIZE_WIDTH - width_grid_cell()) / 2, GRID_FLOOR_THICKNESS])
        cube([length_grid_cell(), width_grid_cell(), GRID_WALL_HEIGHT + RENDER_HELPER]);
    translate([grid_cell_hole_inset_length(), grid_cell_hole_inset_width(), 0])
        rounded_cube([BASE_SIZE_LENGTH - GRID_HOLE_SIZE_SPACING, BASE_SIZE_WIDTH - GRID_HOLE_SIZE_SPACING, GRID_FLOOR_THICKNESS], GRID_HOLE_ROUNDING_RADIUS);
}

module cutouts_spacers() {
    if (SPACER_A >= spacer_min_width())
        translate([0, width_grid() - SPACER_A, 0])
            cutouts_spacer(length_grid(), SPACER_A);
    if (SPACER_B >= spacer_min_width())
        translate([length_grid() - spacer_spacing(), SPACER_C, 0])
            rotate([0, 0, 90])
                cutouts_spacer(width(), SPACER_B);
    if (SPACER_C >= spacer_min_width())
        translate([0, spacer_spacing(), 0])
            cutouts_spacer(length_grid(), SPACER_C);
    if (SPACER_D >= spacer_min_width())
        translate([SPACER_D, SPACER_C, 0])
            rotate([0, 0, 90])
                cutouts_spacer(width(), SPACER_D);
}

module cutouts_spacer(l, w) {
    nr_spacers = floor((l - spacer_spacing()) / BASE_SIZE);
    spacer_length = (l - spacer_spacing()) / nr_spacers - spacer_spacing();
    spacer_width = w - spacer_spacing();
    translate([spacer_spacing(), 0, - RENDER_HELPER])
        linear_extrude(GRID_FLOOR_THICKNESS + GRID_WALL_HEIGHT + 2 * RENDER_HELPER)
            for (i = [0 : nr_spacers - 1]) {
                translate([i * (spacer_length + spacer_spacing()), 0, 0])
                    rounded_square([spacer_length, spacer_width], SPACER_ROUNDING_RADIUS);
            }
}
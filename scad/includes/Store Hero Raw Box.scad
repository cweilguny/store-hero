module raw_box() {
    raw_box_main();

    module raw_box_main() {
        difference() {
            union() {
                feet();
                base_floor();
                wall();
            }
            feet_cutout();
            wall_cutout();
        }
    }

    module feet() {
        for (i = [0 : LENGTH_UNITS - 1]) {
            for (j = [0 : WIDTH_UNITS - 1]) {
                translate([i * BASE_SIZE, j * BASE_SIZE, 0]) {
                    union() {
                        foot();
                        foot_to_wall();
                    }
                }
            }
        }
    }

    module foot() {
        hull() {
            translate([FOOT_TO_WALL_XY_SIZE + FOOT_CHAMFER_SIZE, FOOT_TO_WALL_XY_SIZE + FOOT_CHAMFER_SIZE, 0])
                linear_extrude(FOOT_CHAMFER_SIZE)
                    rounded_square([length_foot() - 2 * FOOT_CHAMFER_SIZE, width_foot() - 2 * FOOT_CHAMFER_SIZE], FOOT_CORNER_ROUNDING_RADIUS);
            translate([FOOT_TO_WALL_XY_SIZE, FOOT_TO_WALL_XY_SIZE, FOOT_CHAMFER_SIZE])
                linear_extrude(FOOT_HEIGHT - FOOT_CHAMFER_SIZE)
                    rounded_square([length_foot(), width_foot()], FOOT_CORNER_ROUNDING_RADIUS);
        }
    }

    module foot_to_wall() {
        hull() {
            translate([FOOT_TO_WALL_XY_SIZE, FOOT_TO_WALL_XY_SIZE, FOOT_HEIGHT])
                linear_extrude(FOOT_TO_WALL_Z_SIZE)
                    rounded_square([length_foot(), width_foot()], FOOT_CORNER_ROUNDING_RADIUS);
            translate([0, 0, FOOT_HEIGHT + FOOT_TO_WALL_Z_SIZE])
                linear_extrude(FLOOR_THICKNESS)
                    rounded_square([BASE_SIZE, BASE_SIZE], WALL_CORNER_ROUNDING_RADIUS_OUTER);
        }
    }

    module feet_cutout() {
        for (i = [0 : LENGTH_UNITS - 1]) {
            for (j = [0 : WIDTH_UNITS - 1]) {
                translate([i * BASE_SIZE, j * BASE_SIZE, 0]) {
                    foot_cutout();
                    foot_to_wall_cutout();
                }
            }
        }
    }

    module foot_cutout() {
        xy_offset = FOOT_TO_WALL_XY_SIZE + WALL_THICKNESS;
        translate([xy_offset, xy_offset, FLOOR_THICKNESS]) {
            linear_extrude(FOOT_HEIGHT - FLOOR_THICKNESS)
                rounded_square([length_foot() - 2 * WALL_THICKNESS, width_foot() - 2 * WALL_THICKNESS], FOOT_CORNER_ROUNDING_RADIUS);
        }
    }

    module foot_to_wall_cutout() {
        hull() {
            translate([WALL_THICKNESS, WALL_THICKNESS, FOOT_HEIGHT + FOOT_TO_WALL_Z_SIZE])
                linear_extrude(FLOOR_THICKNESS)
                    rounded_square([BASE_SIZE - 2 * WALL_THICKNESS, BASE_SIZE - 2 * WALL_THICKNESS], WALL_CORNER_ROUNDING_RADIUS_INNER);
            translate([FOOT_TO_WALL_XY_SIZE + WALL_THICKNESS, FOOT_TO_WALL_XY_SIZE + WALL_THICKNESS, FOOT_HEIGHT])
                linear_extrude(FOOT_TO_WALL_Z_SIZE)
                    rounded_square([length_foot() - 2 * WALL_THICKNESS, width_foot() - 2 * WALL_THICKNESS], FOOT_CORNER_ROUNDING_RADIUS);
        }
    }

    module base_floor() {
        translate([0, 0, FOOT_HEIGHT + FOOT_TO_WALL_Z_SIZE])
            linear_extrude(FLOOR_THICKNESS)
                rounded_square([length(), width()], WALL_CORNER_ROUNDING_RADIUS_OUTER, false);
    }

    module wall() {
        translate([0, 0, wall_z()])
            linear_extrude(height_wall())
                rounded_square([length(), width()], WALL_CORNER_ROUNDING_RADIUS_OUTER);
    }

    module wall_cutout() {
        translate([WALL_THICKNESS, WALL_THICKNESS, wall_z() + FLOOR_THICKNESS])
            linear_extrude(height_wall())
                rounded_square([length_inner(), width_inner()], WALL_CORNER_ROUNDING_RADIUS_INNER);
    }
}


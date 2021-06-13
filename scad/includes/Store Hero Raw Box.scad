module raw_box() {
    union() {
        base();
        wall();
    }

    module base() {
        difference() {
            union() {
                feet();
                feet_to_wall();
            }
            feet_cutouts();
        }
    }

    module feet() {
        for (i = [0 : LENGTH_UNITS - 1]) {
            for (j = [0 : WIDTH_UNITS - 1]) {
                translate([i * BASE_SIZE, j * BASE_SIZE, 0])
                    foot();
            }
        }
    }

    module foot() {
        translate([FOOT_TO_WALL_SIZE, FOOT_TO_WALL_SIZE, 0]) {
            translate([0, 0, FOOT_CHAMFER_SIZE])
                linear_extrude(FOOT_HEIGHT - FOOT_CHAMFER_SIZE)
                    rounded_square([length_foot(), width_foot()], FOOT_CORNER_ROUNDING_RADIUS);
            bottom = [length_foot() - 2 * FOOT_CHAMFER_SIZE, width_foot() - 2 * FOOT_CHAMFER_SIZE];
            top = [length_foot(), width_foot()];
            rounded_chamfered_cube(bottom, top, FOOT_CORNER_ROUNDING_RADIUS, FOOT_CORNER_ROUNDING_RADIUS, FOOT_CHAMFER_SIZE);
        }
    }

    module feet_to_wall() {
        bottom = [length() - 2 * FOOT_TO_WALL_SIZE, width() - 2 * FOOT_TO_WALL_SIZE];
        top = [length(), width()];
        translate([0, 0, FOOT_HEIGHT])
            rounded_chamfered_cube(bottom, top, FOOT_CORNER_ROUNDING_RADIUS, WALL_CORNER_ROUNDING_RADIUS, FOOT_TO_WALL_SIZE);
    }

    module feet_cutouts() {
        for (i = [0 : LENGTH_UNITS - 1]) {
            for (j = [0 : WIDTH_UNITS - 1]) {
                translate([i * BASE_SIZE, j * BASE_SIZE, 0])
                    foot_cutout();
            }
        }
    }

    module foot_cutout() {
        xy_offset = FOOT_TO_WALL_SIZE + WALL_THICKNESS;
        translate([xy_offset, xy_offset, FLOOR_THICKNESS]) {
            linear_extrude(FOOT_HEIGHT - FLOOR_THICKNESS)
                rounded_square([length_foot() - 2 * WALL_THICKNESS, width_foot() - 2 * WALL_THICKNESS], FOOT_CORNER_ROUNDING_RADIUS);
        }
        top_base_size = BASE_SIZE - 2 * WALL_THICKNESS;
        top_bottom_dimensions = [top_base_size - 2 * FOOT_TO_WALL_SIZE, top_base_size - 2 * FOOT_TO_WALL_SIZE];
        top_top_dimensions = [top_base_size, top_base_size];
        translate([WALL_THICKNESS, WALL_THICKNESS, FOOT_HEIGHT])
            rounded_chamfered_cube(top_bottom_dimensions, top_top_dimensions, FOOT_CORNER_ROUNDING_RADIUS, WALL_CORNER_ROUNDING_RADIUS, FOOT_TO_WALL_SIZE);
    }

    module wall() {
        translate([0, 0, wall_z()])
            difference() {
                linear_extrude(height_wall())
                    rounded_square([length(), width()], WALL_CORNER_ROUNDING_RADIUS);
                translate([WALL_THICKNESS, WALL_THICKNESS, 0])
                    linear_extrude(height_wall())
                        rounded_square([length_inner(), width_inner()], WALL_CORNER_ROUNDING_RADIUS);
            }
    }
}


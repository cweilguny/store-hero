module raw_box() {
    union() {
        foot();
        foot_to_wall();
        wall();
    }

    module foot() {
        difference() {
            linear_extrude(FOOT_HEIGHT)
                rounded_square([length_foot(), width_foot()], FOOT_CORNER_ROUNDING_RADIUS, true);
            tz(FLOOR_THICKNESS)
            linear_extrude(FOOT_HEIGHT - FLOOR_THICKNESS)
                rounded_square([length_foot() - 2 * WALL_THICKNESS, width_foot() - 2 * WALL_THICKNESS], FOOT_CORNER_ROUNDING_RADIUS, true);
        }
    }

    module foot_to_wall() {
        tz(FOOT_HEIGHT) difference() {
            foot_to_wall_body(0);
            foot_to_wall_body(- 2 * WALL_THICKNESS);
        }
    }

    module foot_to_wall_body(size_offset) {
        hull() {
            tz(FOOT_TO_WALL_SIZE - 0.01)
            linear_extrude(0.01)
                rounded_square([BASE_SIZE + size_offset, BASE_SIZE + size_offset], WALL_CORNER_ROUNDING_RADIUS, true);
            linear_extrude(0.01)
                rounded_square([length_foot() + size_offset, width_foot() + size_offset], FOOT_CORNER_ROUNDING_RADIUS, true);
        }
    }

    module wall() {
        tz(wall_z()) difference() {
            linear_extrude(height_wall())
                rounded_square([length(), width()], WALL_CORNER_ROUNDING_RADIUS, true);
            linear_extrude(height_wall())
                rounded_square([length_inner(), width_inner()], WALL_CORNER_ROUNDING_RADIUS, true);
        }
    }
}


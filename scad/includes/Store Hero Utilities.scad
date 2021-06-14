module rounded_square(dimensions, r, center = false) {
    x = dimensions[0];
    y = dimensions[1];
    translate([center ? 0 : r, center ? 0 : r, 0])
        minkowski() {
            square([x - 2 * r, y - 2 * r], center);
            circle(r = r);
        }
}

module rounded_cube(dimensions, r, center = false) {
    x = dimensions[0];
    y = dimensions[1];
    z = dimensions[2];
    translate([center ? - x / 2 : 0, center ? - y / 2 : 0, center ? - z / 2 : 0])
        hull() {
            translate([r, r, r]) sphere(r = r);
            translate([x - r, r, r]) sphere(r = r);
            translate([x - r, y - r, r]) sphere(r = r);
            translate([r, y - r, r]) sphere(r = r);
            translate([r, r, z - r]) sphere(r = r);
            translate([x - r, r, z - r]) sphere(r = r);
            translate([x - r, y - r, z - r]) sphere(r = r);
            translate([r, y - r, z - r]) sphere(r = r);
        }
}

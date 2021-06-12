module tx(value) translate([value, 0, 0]) children();
module ty(value) translate([0, value, 0]) children();
module tz(value) translate([0, 0, value]) children();
module rx(value) rotate([value, 0, 0]) children();
module ry(value) rotate([0, value, 0]) children();
module rz(value) rotate([0, 0, value]) children();
module sx(value) scale([value, 1, 1]) children();
module sy(value) scale([1, value, 1]) children();
module sz(value) scale([1, 1, value]) children();

module rounded_square(dimensions, r, center = false) {
    x = dimensions[0];
    y = dimensions[1];
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

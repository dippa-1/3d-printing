stem_radius_mm = 15;
plate_radius_mm = 220;
water_hole_radius_mm = 5;
water_hole_distance_mm = 30;
water_hole_angle_step = 30;
plate_thickness_mm = 1;
offset = 0;

module plate() {
    cylinder(h=plate_thickness_mm, r=plate_radius_mm);
}

module stem_hole() {
    translate([offset, 0, 0]) {
        cylinder(h=plate_thickness_mm, r=stem_radius_mm);
    }
}

module shaft_to_stem_hole() {
    translate([offset - stem_radius_mm, 0, 0]) {
        cube([stem_radius_mm*2, plate_radius_mm, plate_thickness_mm]);
    }
}

module water_holes() {
    for (radius = [0:water_hole_distance_mm:plate_radius_mm]) {
        for (phi = [0:water_hole_angle_step:359]) {
            translate([radius*cos(phi), radius*sin(phi), 0]) {
                cylinder(h=plate_thickness_mm, r=water_hole_radius_mm);
            }
        }
    }
}

module main() {
    difference() {
        plate();
        stem_hole();
        shaft_to_stem_hole();
        water_holes();
    }
}

main();

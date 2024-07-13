stem_radius_mm = 15;
stem_shaft_width_mm = 3;
plate_radius_mm = 110;
water_hole_radius_mm = 3;
num_water_holes_cross_axis = 9;
plate_thickness_mm = 0.4;
offset = 10;

module plate() {
    cylinder(h=plate_thickness_mm, r=plate_radius_mm);
}

module stem_hole() {
    translate([offset, 0, 0]) {
        cylinder(h=plate_thickness_mm, r=stem_radius_mm);
    }
}

module shaft_to_stem_hole() {
    translate([offset - stem_shaft_width_mm/2, 0, 0]) {
        cube([stem_shaft_width_mm, plate_radius_mm, plate_thickness_mm]);
    }
}

module water_holes() {
    water_hole_distance_mm = (plate_radius_mm*2) / num_water_holes_cross_axis;
    for (x = [-plate_radius_mm+water_hole_distance_mm/2:water_hole_distance_mm:plate_radius_mm-water_hole_distance_mm/2]) {
        for (y = [-plate_radius_mm+water_hole_distance_mm/2:water_hole_distance_mm:plate_radius_mm-water_hole_distance_mm/2]) {
            translate([x, y, 0]) {
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

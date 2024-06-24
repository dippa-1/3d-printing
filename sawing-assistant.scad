inner_height = 30;
inner_width = 25;
depth = 100;
wall_thickness = 5;
blade_thickness = 2;

outer_width = inner_width + wall_thickness*2;
outer_height = inner_height + wall_thickness;

module outer_cube() {
    cube([outer_width, depth, outer_height]);
}

module inner_cube() {
    translate([wall_thickness, 0, wall_thickness]) {
        cube([inner_width, depth, inner_height]);
    }
}

module blade_gap() {
    translate([0, depth/2, wall_thickness]) {
        cube([outer_width, blade_thickness, inner_height]);
    }
}

difference() {
    outer_cube();
    inner_cube();
    blade_gap();
}

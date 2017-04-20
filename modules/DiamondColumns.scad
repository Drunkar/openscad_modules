// parameters
NUM_X = 4;
NUM_Y = 6;
H = 3;
R_HOLE_MAX = 3;

module DiamondColumnsCorner(num_x, num_y, h, r_hole_max) {
    num_min = min(num_x, num_y);
    for ( i = [1 : num_x] ) {
        for ( j = [1 : num_y] ) {
            r = r_hole_max * (1.0/num_min)*min(i, j);
            if (r > r_hole_max) {
                r = r_hole_max;
            }
            translate([r_hole_max*1.2*2*i+(j%2)*r_hole_max*1.2, r_hole_max*1.2*j, 0])
                cylinder(r=r, h=h, $fn=4);
        }
    }
}

module DiamondColumns(num_x, num_y, h, r_hole_max) {
    translate([-r_hole_max*1.2, 0, 0]) {
        DiamondColumnsCorner(num_x, num_y, h, r_hole_max);

        translate([r_hole_max*1.2*num_x*2*2, 0, 0])
            mirror([1, 0, 0])
                DiamondColumnsCorner(num_x, num_y, h, r_hole_max);

        translate([0, r_hole_max*1.2*num_y*2, 0])
            mirror([0, 1, 0])
                DiamondColumnsCorner(num_x, num_y, h, r_hole_max);

        translate([r_hole_max*1.2*num_x*2*2, r_hole_max*1.2*num_y*2, 0])
            mirror([1, 0, 0])
                mirror([0, 1, 0])
                    DiamondColumnsCorner(num_x, num_y, h, r_hole_max);

    }
}

// main
DiamondColumns(num_x=NUM_X, num_y=NUM_Y, h=H, r_hole_max=R_HOLE_MAX);

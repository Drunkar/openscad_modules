// parameters for cylinder circle
NUM_CYLINDER = 6;
R_CIRCLE = 14;
R_CYLINDER = 1;
H_CYLINDER = 5;

module CylinderCircle(num_cylinder, r_circle, r_cylinder, h_cylinde) {
    for ( i = [0 : num_cylinder] ) {
        rotate( i * 360 / num_cylinder, [0, 0, 1])
            translate([0, r, 0])
                cylinder(r=r_cylinder, h=h_cylinder);
    }
}

// main
CylinderCircle(NUM_CYLINDER, R_CIRCLE, R_CYLINDER, H_CYLINDER);
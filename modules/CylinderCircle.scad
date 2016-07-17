// parameters for cylinder circle
NUM_CYLINDER = 6;
R_CIRCLE = 14;
R_CYLINDER = 1;
H_CYLINDER = 5;

module CylinderCircle(num_cylinder=6, r=14, r_cylinder=1, h_cylinder=5) {
    for ( i = [0 : num_cylinder] ) {
        rotate( i * 360 / num_cylinder, [0, 0, 1])
            translate([0, r, 0])
                cylinder(r=r_cylinder, h=h_cylinder);
    }
}

// main
CylinderCircle(
    num_cylinder=NUM_CYLINDER,
    r=R_CIRCLE,
    r_cylinder=R_CYLINDER,
    h_cylinder=H_CYLINDER
);
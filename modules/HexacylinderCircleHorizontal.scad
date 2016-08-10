// parameters for cylinder circle
NUM_CYLINDER = 6;
R_CIRCLE = 14;
R_HONEYCOMB = 1;
H_HONEYCOMB = 5;

module HexaCylinderCircleHorizontal(num_cylinder=6, r=14, r_honeycomb=1, h_honeycomb=5) {
    for ( i = [0 : num_cylinder] ) {
        rotate( i * 360 / num_cylinder, [0, 0, 1])
            rotate(90, [0, 1, 0])
                translate([0, 0, r])
                    cylinder(r=r_honeycomb, h=h_honeycomb, $fn=6);
    }
}

// main
HexaCylinderCircleHorizontal(
    num_cylinder=NUM_CYLINDER,
    r=R_CIRCLE,
    r_honeycomb=R_CYLINDER,
    h_honeycomb=H_CYLINDER
);
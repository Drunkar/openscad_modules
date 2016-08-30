// parameters
NUM_CYLINDER = 6;
R_CIRCLE = 14;
R_HONEYCOMB = 1;
H_HONEYCOMB = 5;

module HexaCylinderCircleHorizontal(num_cylinder, r_circle, r_honeycomb, h_honeycomb) {
    for ( i = [0 : num_cylinder] ) {
        rotate( i * 360 / num_cylinder, [0, 0, 1])
            rotate(90, [0, 1, 0])
                translate([0, 0, r_circle])
                    cylinder(r=r_honeycomb, h=h_honeycomb, $fn=6);
    }
}

// main
HexaCylinderCircleHorizontal(NUM_CYLINDER, R_CIRCLE, R_HONEYCOMB, H_HONEYCOMB);
// parameters
X = 70;
Y = 50;
THICKNESS = 2;
PADDING = 3;
R_HONEYCOMB = 3;
MARGIN_HONEYCOMB = 0.5;


module HoneyCombPlate(x, y, thickness, padding, r_honeycomb, margin_honeycomb) {
    num_row = y / (r_honeycomb+margin_honeycomb);
    num_column = x / (r_honeycomb+margin_honeycomb);
    difference() {
        cube([x, y, thickness]);

        for (i=[0: num_row]) {
            for (j=[0: num_column]) {
                translate([
                    j*2*(r_honeycomb+margin_honeycomb)+(i%2)*(r_honeycomb+margin_honeycomb),
                    1.15*sin(45)*2*(r_honeycomb+margin_honeycomb)*i,
                    0
                ])
                rotate([0, 0, 90])
                    cylinder(r=r_honeycomb, h=5, $fn=6);
            }
        }
    }

    // frame
    if (padding > 0) {
        difference() {
            cube([x, y, thickness]);
            translate([padding/2, padding/2, 0])
                cube([x-padding, y-padding, thickness]);
        }
    }
}


HoneyCombPlate(X, Y, THICKNESS, PADDING, R_HONEYCOMB, MARGIN_HONEYCOMB);
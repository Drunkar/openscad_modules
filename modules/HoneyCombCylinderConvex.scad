use <HexaCylinderCircleHorizontal.scad>;

// parameters for cylinder circle
NUM_ROW_OF_HEX = 8;
NUM_HEX_IN_ROW = 8;
R_CYLINDER = 10;
H_CYLINDER = 30;
R_HONEYCOMB = 3;
H_HONEYCOMB = 5;
OFFSET_TOP = 3;
OFFSET_BOTTOM = 5;

module HoneyCombCylinderConvex(
    num_row_of_hex=10,
    num_hex_in_row=6,
    r_cylinder=14,
    h_cylinder=30,
    r_honeycomb=1,
    h_honeycomb=5,
    offset_top=3,
    offset_bottom=5
) {
    difference() {
        union() {
            cylinder(r=r_cylinder, h=h_cylinder);
            for ( i = [0 : num_row_of_hex] ) {
                offset_rotation = 0;
                if (i % 2 == 0) {
                    translate([0, 0, i*r_cylinder/1.8])
                        HexaCylinderCircleHorizontal(
                            num_cylinder=num_hex_in_row,
                            r=r_cylinder-2,
                            r_honeycomb=r_honeycomb,
                            h_honeycomb=h_honeycomb
                        );
                } else {
                    offset_rotation = (i * 360 / num_hex_in_row)/2;
                    translate([0, 0, i*r_cylinder/1.8])
                        rotate(offset_rotation, [0, 0, 1])
                            HexaCylinderCircleHorizontal(
                                num_cylinder=num_hex_in_row,
                                r=r_cylinder-2,
                                r_honeycomb=r_honeycomb,
                                h_honeycomb=h_honeycomb
                            );
                }
            }
        }
        // offset
        translate([0, 0, -(1000)/2])
            cube([1000, 1000, 1000+offset_bottom], center=true);
        translate([0, 0, (H_CYLINDER+1000/2)])
            cube([1000, 1000, (1000+offset_top)], center=true);
    }
}

// main
HoneyCombCylinderConvex(
    num_row_of_hex=NUM_ROW_OF_HEX,
    num_hex_in_row=NUM_HEX_IN_ROW,
    r_cylinder=R_CYLINDER,
    h_cylinder=H_CYLINDER,
    r_honeycomb=R_HONEYCOMB,
    h_honeycomb=H_HONEYCOMB,
    offset_top=OFFSET_TOP,
    offset_bottom=OFFSET_BOTTOM
);
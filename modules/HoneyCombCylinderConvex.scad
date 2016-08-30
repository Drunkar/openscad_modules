use <HexaCylinderCircleHorizontal.scad>;

// parameters
NUM_ROW_OF_HEX = 8;
NUM_HEX_IN_ROW = 8;
R_CYLINDER = 10;
H_CYLINDER = 30;
R_HONEYCOMB = 3;
H_HONEYCOMB = 5;
OFFSET_TOP = 3;
OFFSET_BOTTOM = 5;

module HoneyCombCylinderConvex(num_row_of_hex, num_hex_in_row,
                               r_cylinder, h_cylinder, r_honeycomb, h_honeycomb,
                               offset_top, offset_bottom) {
    difference() {
        union() {
            cylinder(r=r_cylinder, h=h_cylinder);
            for ( i = [0 : num_row_of_hex] ) {
                offset_rotation = 0;
                if (i % 2 == 0) {
                    translate([0, 0, i*r_cylinder/1.8])
                        HexaCylinderCircleHorizontal(
                            num_cylinder=num_hex_in_row,
                            r_circle=r_cylinder-2,
                            r_honeycomb=r_honeycomb,
                            h_honeycomb=h_honeycomb
                        );
                } else {
                    offset_rotation = (i * 360 / num_hex_in_row)/2;
                    translate([0, 0, i*r_cylinder/1.8])
                        rotate(offset_rotation, [0, 0, 1])
                            HexaCylinderCircleHorizontal(
                                num_cylinder=num_hex_in_row,
                                r_circle=r_cylinder-2,
                                r_honeycomb=r_honeycomb,
                                h_honeycomb=h_honeycomb
                            );
                }
            }
        }
        // offset
        translate([0, 0, -(1000)/2])
            cube([1000, 1000, 1000+offset_bottom*2], center=true);
        translate([0, 0, (h_cylinder+1000/2)])
            cube([1000, 1000, (1000+offset_top*2)], center=true);
    }
}

// main
HoneyCombCylinderConvex(NUM_ROW_OF_HEX, NUM_HEX_IN_ROW, R_CYLINDER, H_CYLINDER,
                        R_HONEYCOMB, H_HONEYCOMB, OFFSET_TOP, OFFSET_BOTTOM);
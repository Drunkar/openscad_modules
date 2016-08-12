use <HoneyCombCylinderConvex.scad>;

// parameters for cylinder circle
NUM_ROW_OF_HEX = 8;
NUM_HEX_IN_ROW = 8;
R_CYLINDER = 10;
H_CYLINDER = 30;
CHICKNESS = 1;
R_HONEYCOMB = 3;
H_HONEYCOMB = 5;
OFFSET_TOP = 3;
OFFSET_BOTTOM = 3;

module HoneyCombCylinder(num_row_of_hex, num_hex_in_row, r_cylinder, h_cylinder,
                         chickness, r_honeycomb, h_honeycomb, offset_top, offset_bottom) {
    difference() {
        cylinder(r=r_cylinder, h=h_cylinder);
        HoneyCombCylinderConvex(num_row_of_hex, um_hex_in_row, r_cylinder-chickness,
                                h_cylinder, r_honeycomb, h_honeycomb,
                                offset_top, offset_bottom);
    }
}

// main
HoneyCombCylinder(NUM_ROW_OF_HEX, NUM_HEX_IN_ROW, R_CYLINDER, H_CYLINDER,
                  CHICKNESS, R_HONEYCOMB, H_HONEYCOMB, OFFSET_TOP, OFFSET_BOTTOM);
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

module HoneyCombCylinder(
    num_row_of_hex=10,
    num_hex_in_row=6,
    r_cylinder=14,
    h_cylinder=30,
    chickness=2,
    r_honeycomb=1,
    h_honeycomb=5,
    offset_top=3,
    offset_bottom=5
) {
    difference() {
        cylinder(r=r_cylinder, h=h_cylinder);
        HoneyCombCylinderConvex(
            num_row_of_hex=num_row_of_hex,
            num_hex_in_row=num_hex_in_row,
            r_cylinder=r_cylinder-chickness,
            h_cylinder=h_cylinder,
            r_honeycomb=r_honeycomb,
            h_honeycomb=h_honeycomb,
            offset_top=offset_top,
            offset_bottom=offset_bottom
        );
    }
}

// main
HoneyCombCylinder(
    num_row_of_hex=NUM_ROW_OF_HEX,
    num_hex_in_row=NUM_HEX_IN_ROW,
    r_cylinder=R_CYLINDER,
    h_cylinder=H_CYLINDER,
    chickness=CHICKNESS,
    r_honeycomb=R_HONEYCOMB,
    h_honeycomb=H_HONEYCOMB,
    offset_top=OFFSET_TOP,
    offset_bottom=OFFSET_BOTTOM
);


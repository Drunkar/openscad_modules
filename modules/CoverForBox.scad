// parameters for box covered by this module
X_OUTER = 321;
Y_OUTER = 101;
X_INNER = 316;
Y_INNER = 95.5;

// parameters for cover
PLATE_CHICKNESS = 3;
WALL_CHICKNESS = 2;
WALL_HEIGHT = 10;


module Frame(x_outer, y_outer, x_inner, y_inner, chickness) {
    difference() {
        cube([x_outer, y_outer, chickness]);
        translate([(x_outer-x_inner)/2, (y_outer-y_inner)/2, 0])
            cube([x_inner, y_inner, chickness]);
    }
}

module CoverForBox(x_outer, y_outer, x_inner, y_inner, top_plate_chickness,
                   wall_chickness, wall_height) {
    difference() {
        cube([x_outer, y_outer, top_plate_chickness]);
        
        // groove for box wall
        translate([0, 0, -1]) {
            Frame(
                x_outer=x_outer,
                y_outer=y_outer,
                x_inner=x_inner,
                y_inner=y_inner,
                chickness=top_plate_chickness
            );
        }
    }

    // vertical wall
    translate([
        -wall_chickness,
        -wall_chickness,
        -wall_height+top_plate_chickness
    ])
    Frame(
        x_outer=x_outer+wall_chickness*2,
        y_outer=y_outer+wall_chickness*2,
        x_inner=x_outer,
        y_inner=y_outer,
        chickness=wall_height
    );
}

// main
CoverForBox(X_OUTER, Y_OUTER, X_INNER, Y_INNER, PLATE_CHICKNESS,
            WALL_CHICKNESS, WALL_HEIGHT);
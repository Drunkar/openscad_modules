// parameters for box covered by this module
X_OUTER = 321;
Y_OUTER = 101;
X_INNER = 316;
Y_INNER = 95.5;

// parameters for cover
PLATE_CHICKNESS = 3;
WALL_CHICKNESS = 2;
WALL_HEIGHT = 10;


module Frame(x_outer=20, y_outer=10, x_inner=18, y_inner=8, chickness=1) {
    difference() {
        cube([x_outer, y_outer, chickness]);
        translate([(x_outer-x_inner)/2, (y_outer-y_inner)/2, 0])
            cube([x_inner, y_inner, chickness]);
    }
}

module CoverForBox(
    x_outer=20,
    y_outer=10,
    x_inner=18,
    y_inner=8,
    top_plate_chickness=3,
    wall_chickness=2,
    wall_height=10
) {
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
CoverForBox(
    x_outer=X_OUTER, 
    y_outer=Y_OUTER,
    x_inner=X_INNER,
    y_inner=Y_INNER,
    top_plate_chickness=PLATE_CHICKNESS,
    wall_chickness=WALL_CHICKNESS,
    wall_height=WALL_HEIGHT
);
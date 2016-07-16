// parameters for box covered by this module
X_OUTER = 321;
Y_OUTER = 101;
X_INNER = 316;
Y_INNER = 95.5;

// parameters for cover
PLATE_CHICKNESS = 3;
VERTICAL_WALL_CHICKNESS = 3;
VERTICAL_WALL_HEIGHT = 10;


module Frame(x_outer=20, y_outer=10, x_inner=18, y_inner=8, chickness=1) {
    difference() {
        cube([x_outer, y_outer, chickness]);
        translate([(x_outer-x_inner)/2, (y_outer-y_inner)/2, 0])
            cube([x_inner, y_inner, chickness]);
    }
}

// main
difference() {
    cube([X_OUTER, Y_OUTER, PLATE_CHICKNESS]);
    
    Frame(
        x_outer=X_OUTER,
        y_outer=Y_OUTER,
        x_inner=X_INNER,
        y_inner=Y_INNER,
        chickness=2
    );
}

// vertical wall
translate([
    -VERTICAL_WALL_CHICKNESS,
    -VERTICAL_WALL_CHICKNESS,
    -VERTICAL_WALL_HEIGHT+PLATE_CHICKNESS
])
    Frame(
        x_outer=X_OUTER+VERTICAL_WALL_CHICKNESS*2,
        y_outer=Y_OUTER+VERTICAL_WALL_CHICKNESS*2,
        x_inner=X_OUTER,
        y_inner=Y_OUTER,
        chickness=VERTICAL_WALL_HEIGHT
    );
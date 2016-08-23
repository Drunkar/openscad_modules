// parameters for box covered by this module
X_OUTER = 321;
Y_OUTER = 101;
X_INNER = 316;
Y_INNER = 95.5;

// parameters for cover
PLATE_THICKNESS = 3;
WALL_THICKNESS = 2;
WALL_HEIGHT = 10;


module Frame(x_outer, y_outer, x_inner, y_inner, thickness) {
    difference() {
        cube([x_outer, y_outer, thickness]);
        translate([(x_outer-x_inner)/2, (y_outer-y_inner)/2, 0])
            cube([x_inner, y_inner, thickness]);
    }
}

module CoverForBox(x_outer, y_outer, x_inner, y_inner, top_plate_thickness,
                   wall_thickness, wall_height) {
    difference() {
        cube([x_outer, y_outer, top_plate_thickness]);
        
        // groove for box wall
        translate([0, 0, -1]) {
            Frame(
                x_outer=x_outer,
                y_outer=y_outer,
                x_inner=x_inner,
                y_inner=y_inner,
                thickness=top_plate_thickness
            );
        }
    }

    // vertical wall
    translate([
        -wall_thickness,
        -wall_thickness,
        -wall_height+top_plate_thickness
    ])
    Frame(
        x_outer=x_outer+wall_thickness*2,
        y_outer=y_outer+wall_thickness*2,
        x_inner=x_outer,
        y_inner=y_outer,
        thickness=wall_height
    );
}

// main
CoverForBox(X_OUTER, Y_OUTER, X_INNER, Y_INNER, PLATE_THICKNESS,
            WALL_THICKNESS, WALL_HEIGHT);
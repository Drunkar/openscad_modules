use <TrussBeamTwoDimensions.scad>;

// parameters
X = 320;
Y = 50;
THICKNESS = 3;
ROD_HEIGHT = 5;
TRUSS_WIDTH = 2;
TRUSS_ANGLE = 70;

module SpaceFrameTrussBeam(x, y, thickness, rod_height,
                           truss_width, truss_angle)  {
    // bottom plate
    truss_length = y / sin(truss_angle);
    interval = 2 * truss_length * cos(truss_angle);
    num_of_truss = floor(x / (interval / 2) );
    difference() {
        cube([x, y, thickness]);
        translate([0, rod_height, 0])
            cube([x, y-2*rod_height, thickness]);
    }
    for (i = [0 : round(num_of_truss/2)-1]) {
        translate([i*interval, 0, 0])
            cube([truss_width, y, thickness]);
    }

    rotate([60, 0, 0])
        TrussBeamTwoDimensions(x, y, thickness, rod_height, truss_width, truss_angle);
    translate([0, y-1, 0])
        rotate([120, 0, 0])
            TrussBeamTwoDimensions(x, y, thickness, rod_height, truss_width, truss_angle);
}

// main
SpaceFrameTrussBeam(X, Y, THICKNESS, ROD_HEIGHT, TRUSS_WIDTH, TRUSS_ANGLE);
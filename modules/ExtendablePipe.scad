use <ArcOfCylinder.scad>;

// parameters
HEIGHT_BODY = 10;
HEIGHT_JOINT = 5;
R_OUTER = 3;
R_INNER = 2;
NUM_GROOVE = 10;
DEPTH_OF_GROOVE = 0.5;
WIDTH_OF_GROOVE = 0.5;

module ExtendablePipe(h, h_joint, r_outer, r_inner, num_groove,
                      depth_of_groove, width_of_groove) {
    difference() {
        cylinder(r=r_outer, h=h);
        cylinder(r=r_inner, h=h);
        
        // groove
        for ( i = [0 : num_groove] )
        {
            rotate( i * 360 / num_groove, [0, 0, 1])
                translate([0, r_outer-depth_of_groove, 0])
                    cube([width_of_groove, depth_of_groove, h]);
        }
    }

    // joint
    translate([0, 0, h]) {
        translate([0, 0, -2])
            cylinder(r=r_inner, h=2);
        ArcOfCylinder(r_outer=r_inner-0.2, r_inner=0, height=h_joint, angle=300);
    }
    ArcOfCylinder(r_outer=r_inner, r_inner=1, height=h_joint, angle=50);
}

// main
ExtendablePipe(HEIGHT_BODY, HEIGHT_JOINT, R_OUTER, R_INNER, NUM_GROOVE,
               DEPTH_OF_GROOVE, width_of_groove=WIDTH_OF_GROOVE);
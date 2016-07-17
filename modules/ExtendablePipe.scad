use <ArcOfCylinder.scad>;

// parameters for extendable pipe
HEIGHT_BODY = 10;
HEIGHT_JOINT = 5;
R_OUTER = 3;
R_INNER = 2;
NUM_GROOVE = 10;
DEPTH_OF_GROOVE = 0.5;
WIDTH_OF_GROOVE = 0.5;


module ExtendablePipe(
    h=100,
    h_joint=20,
    r_outer=30,
    r_inner=28,
    num_groove=20,
    depth_of_groove=1,
    width_of_groove=2
) {
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
ExtendablePipe(
    h=HEIGHT_BODY,
    h_joint=HEIGHT_JOINT,
    r_outer=R_OUTER,
    r_inner=R_INNER,
    num_groove=NUM_GROOVE,
    depth_of_groove=DEPTH_OF_GROOVE,
    width_of_groove=WIDTH_OF_GROOVE
);
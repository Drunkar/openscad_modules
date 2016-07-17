// parameters for extendable pipe
HEIGHT_BODY = 100;
HEIGHT_JOINT = 20;
R_OUTER = 30;
R_INNER = 28;
NUM_GROOVE = 20;
DEPTH_OF_GROOVE = 1;
WIDTH_OF_GROOVE = 2;


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
    difference() {
        cylinder(r=r_inner, h=h+h_joint);
        cylinder(r=r_inner-2, h=h+h_joint);
        cylinder(r=r_inner, h=h_joint);
        
        translate([-r_inner, 0, h+h_joint/2])
            cube([5, 10, h_joint], center=true);
    }
    intersection() {
        difference() {
            cylinder(r=r_inner, h=h_joint);
            cylinder(r=r_inner-2, h=h_joint);
        }
        
        translate([-r_inner, 0, h_joint/2])
            cube([5, 10, h_joint], center=true);
    }

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
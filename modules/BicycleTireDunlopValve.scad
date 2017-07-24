RESOLUTION = 100;

module BicycleTireDunlopValve($fn=50) {
    
    R = 3.8;
    H = 12;
    
    // basement
    difference() {
      cylinder(r=R+2, h=3, $fn=$fn);
      cylinder(r=R-0.9, h=3, $fn=$fn);
    }
    
    translate([0, 0, 3])
        difference() {
            union() {
                cylinder(r=R, h=H, $fn=$fn);

                translate([0, 0, H])
                    thread(0.8, R*2, 4, 6);
            }
            
            cylinder(r=R-0.9, h=H*2, $fn=$fn);
            
            translate([0, 0, H+3.5])
                cube([R*3, 1.2, 7], center=true);
    }

    module screwthread_triangle(P) {
        difference() {
            translate([-sqrt(3)/3*P+sqrt(3)/2*P/8,0,0])
            rotate([90,0,0])
            cylinder(r=sqrt(3)/3*P,h=0.00001,$fn=3,center=true);

            translate([0,-P/2,-P/2])
            cube([P,P,P]);
        }
    }

    module screwthread_onerotation(P,D_maj,step) {
        H = sqrt(3)/2*P;
        D_min = D_maj - 5*sqrt(3)/8*P;

        for(i=[0:step:360-step])
        hull()
            for(j = [0,step])
            rotate([0,0,(i+j)])
            translate([D_maj/2,0,(i+j)/360*P])
            screwthread_triangle(P);

        translate([0,0,P/2])
        cylinder(r=D_min/2,h=2*P,$fn=$fn,center=true);
    }

    module thread(P,D,step,rotations) {
        // added parameter "rotations"
        // as proposed by user bluecamel
        for(i=[0:rotations])
        translate([0,0,i*P])
        screwthread_onerotation(P,D,step);
    }
}


BicycleTireDunlopValve($fn=RESOLUTION);




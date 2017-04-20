// parameters
RESOLUTION = 50;

module BananaJackMounter($fn) {
    r_screw = 2.05;
    r_outer_screw = 3.5;
    r_washer = 5;
    d_fixhole = 10.9;
    r_fixhole = 0.75;
    r_outer_fixhole = 2.2;

    difference() {
    cylinder(r=r_washer, h=2, $fn=RESOLUTION);
    cylinder(r=r_screw, h=4, $fn=RESOLUTION);
}

    difference() {
        difference() {
            hull() {
                cylinder(r=r_outer_screw*1.4, h=4, $fn=$fn);
                translate([d_fixhole, 0, 0])
                    cylinder(r=r_outer_fixhole*1.6, h=4, $fn=$fn);
            }
        
            hull() {
                translate([0, 0, 2])
                cylinder(r=r_outer_screw, h=2, $fn=$fn);
                translate([d_fixhole, 0, 2])
                    cylinder(r=r_outer_fixhole, h=2, $fn=$fn);
            }
        }

        cylinder(r=r_washer, h=4, $fn=RESOLUTION);
    }

}

// main
BananaJackMounter($fn=RESOLUTION);
// parameters
X = 20;
Y = 20;
Z_BOX = 10;
Z_CAP = 5;
THICKNESS = 1;
// ["bottom", "cap", "both"]
TYPE = "both";

module SnapHook(x, y, z_box, z_cap, thickness, type="both") {
    module SH_Hook(w, h) {
        // half circle
        translate([-w/2+1, 0, 0]) {
            difference() {
                rotate([-90, 0, 0])
                    translate([w/2, -w/2, 0])
                        cylinder(r=w/2, h=h, $fn=50);
                translate([-w/2, 0, 0])
                    cube([w, h, w]);
            }
        }

        // arm
        cube([1, h, 2*w]);
    }

    if (type == "bottom" || type == "both") {
        // box
        difference() {
            cube([x, y, z_box]);
            translate([thickness, thickness, 0])
                cube([x-2*thickness, y-2*thickness, z_box]);

            // holes
            h_hole = 1.5*thickness;
            translate([0, 0, z_box]) {
                translate([x-thickness, thickness+1-0.5, -x/6+h_hole/4])
                    cube([thickness, x/4+1, h_hole]);
                translate([x-thickness, y-(thickness+1+x/4)-0.5, -x/6+h_hole/4])
                    cube([thickness, x/4+1, h_hole]);

                translate([0, thickness+1-0.5, -x/6+h_hole/4])
                    cube([thickness, x/4+1, h_hole]);
                translate([0, y-(thickness+1+x/4)-0.5, -x/6+h_hole/4])
                    cube([thickness, x/4+1, h_hole]);
            }
        }
    }

    if (type == "cap" || type == "both") {
        // cap
        // for printing -----------------------------------------------------
        rotate([0, 180, 0])
            translate([-2*x-4*thickness, 0, -z_box-z_cap]) {
        // ------------------------------------------------------------------
        translate([0, 0, z_box]) {
            difference() {
                cube([x, y, z_cap]);
                translate([thickness, thickness, 0])
                    cube([x-2*thickness, y-2*thickness, z_cap]);
            }

            // hook
            translate([x-thickness-1, thickness+1, -x/6])
                SH_Hook(2.2*thickness, x/4);
            translate([x-thickness-1, y-(thickness+1+x/4), -x/6])
                SH_Hook(2.2*thickness, x/4);
            mirror([1, 0, 0]) {
                translate([-thickness-1, thickness+1, -x/6])
                    SH_Hook(2.2*thickness, x/4);
                translate([-thickness-1, y-(thickness+1+x/4), -x/6])
                    SH_Hook(2.2*thickness, x/4);
            }
        }
        // for printing -----------------------------------------------------
        }
        // ------------------------------------------------------------------
    }
}

// main
SnapHook(X, Y, Z_BOX, Z_CAP, THICKNESS, type=TYPE);
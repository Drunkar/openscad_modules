use <Prism.scad>;

// parameters
X = 20;
Y = 20;
Z_BOX = 4;
Z_CAP = 5;
THICKNESS = 1;
H_MOUNT = 0.6;
// ["bottom", "cap", "both"]
TYPE = "both";

module SnapCap(x, y, z_box, z_cap, thickness, h_mount, type="both") {
    module SC_Hook(w, h) {
        // prism hook
        rotate([90, 0, 0])
            translate([0, 0, -h])
                Prism(x=2*w, y=w, h=h);

        // arm
        cube([1, h, 4*w+1]);

        // mounter
        translate([-w, 0, 4*w+1-w])
        cube([w, h, w]);
    }

    if (TYPE == "bottom" || TYPE == "both") {
        // box
        difference() {
            cube([x, y, z_box]);
            translate([thickness, thickness, 0])
                cube([x-2*thickness, y-2*thickness, z_box]);
        }
        // mount
        translate([-h_mount, -h_mount, z_box-h_mount-0.8]) {
            difference() {
                cube([x+2*h_mount, y+2*h_mount, 1]);
            translate([h_mount, h_mount, 0])
                cube([x, y, 1]);
            }
        }
    }

    if (TYPE == "cap" || TYPE == "both") {
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
            translate([x+h_mount, thickness+1, -3*h_mount-1])
                SC_Hook(h_mount, x/4);
            translate([x+h_mount, y-(thickness+1+x/4), -3*h_mount-1])
                SC_Hook(h_mount, x/4);
            mirror([1, 0, 0]) {
                translate([h_mount, thickness+1, -3*h_mount-1])
                    SC_Hook(h_mount, x/4);
                translate([h_mount, y-(thickness+1+x/4), -3*h_mount-1])
                    SC_Hook(h_mount, x/4);
            }
        }
        // for printing -----------------------------------------------------
        }
        // ------------------------------------------------------------------
    }
}

// main
SnapCap(X, Y, Z_BOX, Z_CAP, THICKNESS, H_MOUNT, type=TYPE);
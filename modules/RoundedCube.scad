// parameters
X = 10;
Y = 10;
Z = 10;
R = 2;
RESOLUTION = 45;

module RoundedCubeGuideEdge(l, r) {
    difference() {
        cube([l, r+1, r+1]);
        rotate(a=[0, 90, 0])
            cylinder(r=r, h=l,$fn=$fn);
    }
}

module RoundedCubeGuideCorner(r) {
    difference() {
        cube([r+1, r+1, r+1]);
        sphere(r=r, $fn=$fn);
    }
}

module RoundedCube(x, y, z, r, $fn) {
    difference() {
        cube([x, y, z]);

        // edges
        translate([0, y-r, z-r])
            RoundedCubeGuideEdge(x, r);

        translate([0, y-r, r])
            rotate([270, 0, 0])
                RoundedCubeGuideEdge(x, r);

        translate([0, r, r])
            rotate([180, 0, 0])
                RoundedCubeGuideEdge(x, r);

        translate([0, r, z-r])
            rotate([90, 0, 0])
                RoundedCubeGuideEdge(x, r);

        translate([x, 0, 0])
            rotate([0, 0, 90]) {
                translate([0, x-r, z-r])
                RoundedCubeGuideEdge(y, r);

            translate([0, x-r, r])
                rotate([270, 0, 0])
                    RoundedCubeGuideEdge(y, r);

            translate([0, r, r])
                rotate([180, 0, 0])
                    RoundedCubeGuideEdge(y, r);

            translate([0, r, z-r])
                rotate([90, 0, 0])
                    RoundedCubeGuideEdge(y, r);
        }

        translate([0, 0, z])
            rotate([0, 90, 00]) {
                translate([0, y-r, x-r])
                RoundedCubeGuideEdge(x, r);

            translate([0, y-r, r])
                rotate([270, 0, 0])
                    RoundedCubeGuideEdge(x, r);

            translate([0, r, r])
                rotate([180, 0, 0])
                    RoundedCubeGuideEdge(x, r);

            translate([0, r, x-r])
                rotate([90, 0, 0])
                    RoundedCubeGuideEdge(x, r);
        }

        // corners
        translate([x-r, y-r, z-r])
            RoundedCubeGuideCorner(r);

        translate([r, y-r, z-r])
            rotate([0, 0, 90])
                RoundedCubeGuideCorner(r);

        translate([x-r, r, z-r])
            rotate([0, 0, 270])
                RoundedCubeGuideCorner(r);

        translate([r, r, z-r])
            rotate([0, 0, 180])
                RoundedCubeGuideCorner(r);

        mirror([0, 0, 1]) {
        translate([x-r, y-r, -r])
            RoundedCubeGuideCorner(r);

        translate([r, y-r, -r])
            rotate([0, 0, 90])
                RoundedCubeGuideCorner(r);

        translate([x-r, r, -r])
            rotate([0, 0, 270])
                RoundedCubeGuideCorner(r);

        translate([r, r, -r])
            rotate([0, 0, 180])
                RoundedCubeGuideCorner(r);
        }
    }
}

// main
RoundedCube(x=X, y=Y, z=Z, r=R, $fn=RESOLUTION);
// parameters
R_OUTER = 8;
R_INNER = 6;
HEIGHT = 10;

module Pipe(r_outer, r_inner, h) {
    difference() {
        cylinder(r=r_outer, h=h);
        cylinder(r=r_inner, h=h);
    }
}

// main
Pipe(R_OUTER, R_INNER, HEIGHT);
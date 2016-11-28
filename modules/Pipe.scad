// parameters
R_OUTER = 8;
R_INNER = 6;
HEIGHT = 10;

module Pipe(r_outer, r_inner, h, $fn=0, $fa=12, $fs=2) {
    difference() {
        cylinder(r=r_outer, h=h, $fn=$fn, $fa=$fa, $fs=$fs);
        cylinder(r=r_inner, h=h, $fn=$fn, $fa=$fa, $fs=$fs);
    }
}

// main
Pipe(R_OUTER, R_INNER, HEIGHT);
// parameters for arc of cylinder
R_OUTER = 5;
R_INNER = 4;
HEIGHT = 10;
ANGLE1 = 120;
ANGLE2 = 330;

module Pipe(r_outer, r_inner, height) {
    difference() {
        cylinder(r=r_outer, h=height);
        cylinder(r=r_inner, h=height);
    }
}

module Prism(l, w, h) {
    polyhedron(
       points=[[0,0,0], [l,0,0], [0,w,0], [0,w,h], [l,0,h], [0,0,h]],
       faces=[[0,1,2],[0,5,4,1],[1,4,3,2],[2,3,5,0],[3,4,5]]
   );
}

module EquilateralPrism(a, h){
    union() {
        Prism(l=sqrt(3)/2*a, w=a/2, h=h);
        mirror([0, 1, 0])
            Prism(l=sqrt(3)/2*a, w=a/2, h=h);
    }
}

/*
 * defference in pipe, prism and cube.
*/
module ArcOfCylinder(r_outer=5, r_inner=4, height=10, angle=280) {

    prism_angle = angle>=180? 360 - angle: angle;
    bottom_edge_length = 2 * r_outer * sin(prism_angle / 2);
    r_ircumscribed_circle = sqrt(3) / 4 * bottom_edge_length;
    triangle_height = (sqrt(3) / 2 * bottom_edge_length);
    target_trinangle_height = (r_outer * cos(prism_angle / 2));
    x_scale = target_trinangle_height / triangle_height;

    // if angle is over 180 then get difference in pipe, prism and cube.
    // else, get intersection in pipe and (prism and cube).
    if (angle >= 180) {

        difference() {
            Pipe(r_outer=r_outer, r_inner=r_inner, height=height);
            translate([-target_trinangle_height, 0, 0])
                scale([x_scale, 1, 1])
                    EquilateralPrism(a=bottom_edge_length, h=height);
            translate([-(target_trinangle_height+r_outer/2), 0, height/2])
                cube([r_outer, bottom_edge_length, height], center=true);
        }

    } else {
    
        intersection() {
            Pipe(r_outer=r_outer, r_inner=r_inner, height=height);
            union() {
                translate([-target_trinangle_height, 0, 0])
                    scale([x_scale, 1, 1])
                        EquilateralPrism(a=bottom_edge_length, h=height);
                translate([-(target_trinangle_height+r_outer/2), 0, height/2])
                    cube([r_outer, bottom_edge_length, height], center=true);
            }
        }

    }   
}

// main
ArcOfCylinder(
    r_outer=R_OUTER,
    r_inner=R_INNER,
    height=HEIGHT,
    angle=ANGLE1
);
translate([20, 0, 0])
    ArcOfCylinder(
        r_outer=R_OUTER,
        r_inner=R_INNER,
        height=HEIGHT,
        angle=ANGLE2
    );
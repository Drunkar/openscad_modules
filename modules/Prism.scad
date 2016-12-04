// parameters
X = 10;
Y = 5;
H = 30;

module Prism(x, y, h){
    rotate([0, 270, 0]) {
         polyhedron(
             points=[[0,0,0], [h,0,0], [h,x,0], [0,x,0], [0,x,y], [h,x,y]],
             faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
             );
    }
}

// main
Prism(X, Y, H);
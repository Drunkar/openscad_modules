use <Pipe.scad>;

// parameters
NUM_CYLINDER = 6;
R_CIRCLE = 14;
R_PIPE_OUTER = 2;
R_PIPE_INNER = 1;
H_PIPE = 5;

module PipeCircle(num_cylinder, r_circle, r_pipe_outer, r_pipe_inner, h_pipe) {
    for ( i = [0 : num_cylinder] ) {
        rotate( i * 360 / num_cylinder, [0, 0, 1])
            translate([0, r_circle, 0])
                Pipe(r_outer=r_pipe_outer, r_inner=r_pipe_inner, h=h_pipe);
    }
}

// main
PipeCircle(NUM_CYLINDER, R_CIRCLE, R_PIPE_OUTER, R_PIPE_INNER, H_PIPE);
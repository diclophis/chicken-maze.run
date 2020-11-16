// maze parts

outer_size = 1.0;
cut_size = outer_size * 0.0;
inner_size = outer_size * 1.0;
path_size = outer_size * 0.25;
inner_path_size = path_size * 0.75;
fudge = 0.162 * outer_size;
fudgeg = 0.125 * outer_size;

inner_intersection_size = 1.5;
quarter_slice_size = 0.5;
outer_fudge_smidge = (outer_size+fudge)*1.02;


module pathwayy(direction_in) {
    //
    direction = (direction_in == 0) ? 15 : ((direction_in == 15 ) ? 0 : direction_in);

    intersection() {
        if (direction == 8) {
            translate([-cut_size*inner_intersection_size,0,0]) {
                cube(size=[inner_size, path_size, inner_size], center=true);
            }
        }

        if (direction == 4) {
            translate([cut_size*inner_intersection_size,0,0]) {
                cube(size=[inner_size, path_size, inner_size], center=true);
            }
        }

        if (direction == 2) {
            translate([0,-cut_size*inner_intersection_size,0]) {
                cube(size=[path_size, inner_size, inner_size], center=true);
            }
        }

        if (direction == 1) {
            translate([0,cut_size*inner_intersection_size,0]) {
                cube(size=[path_size, inner_size, inner_size], center=true);
            }
        }

        if (direction == 3) {
            cube(size=[path_size, inner_size, inner_size], center=true);
        }

        if (direction == 12) {
            cube(size=[inner_size, path_size, inner_size], center=true);
        }

        if (direction == 6) {
            union() {
                translate([cut_size*inner_intersection_size,0,0]) {
                    cube(size=[inner_size, path_size, inner_size], center=true);
                }

                translate([0,-cut_size*inner_intersection_size,0]) {
                    cube(size=[path_size, inner_size, inner_size], center=true);
                }
            }
        }
        
        if (direction == 5) {
            union() {
                translate([cut_size*inner_intersection_size,0,0]) {
                    cube(size=[inner_size, path_size, inner_size], center=true);
                }
                
                translate([0,cut_size*inner_intersection_size,0]) {
                    cube(size=[path_size, inner_size, inner_size], center=true);
                }
            }
        }

        if (direction == 9) {
            union() {
                translate([-cut_size*inner_intersection_size,0,0]) {
                    cube(size=[inner_size, path_size, inner_size], center=true);
                }

                translate([0,cut_size*inner_intersection_size,0]) {
                    cube(size=[path_size, inner_size, inner_size], center=true);
                }
            }
        }

        if (direction == 10) {
            union() {
                translate([-cut_size*inner_intersection_size,0,0]) {
                    cube(size=[inner_size, path_size, inner_size], center=true);
                }

                translate([0,-cut_size*inner_intersection_size,0]) {
                    cube(size=[path_size, inner_size, inner_size], center=true);
                }
            }
        }

        difference() {
            union() {
                cube(size=[path_size, outer_size, path_size], center=true);
                cube(size=[outer_size, path_size, path_size], center=true);
            }

            translate([0,0,path_size * 0.5]) {
                if (direction == 0) {
                    cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                }

                if (direction == 13) {
                    translate([0,outer_size*0.5,0]) {
                        cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    }
                    cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                }

                if (direction == 14) {
                    translate([0,-outer_size*0.5,0]) {
                        cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    }
                    cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                }

                if (direction == 7) {
                    cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    translate([outer_size*0.5,0,0]) {
                       cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                    }
                }

                if (direction == 11) {
                    cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    translate([-outer_size*0.5,0,0]) {
                        cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                    }
                }

                if (direction == 8) {
                    translate([-outer_size*quarter_slice_size,0,0]) {
                        cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                    }
                }

                if (direction == 4) {
                    translate([outer_size*quarter_slice_size,0,0]) {
                        cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                    }
                }

                if (direction == 2) {
                    translate([0,-outer_size*quarter_slice_size,0]) {
                        cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    }
                }

                if (direction == 1) {
                    translate([0, outer_size*quarter_slice_size,0]) {
                        cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    }
                }

                if (direction == 3) {
                    cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                }

                if (direction == 12) {
                    cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                }

                if (direction == 6) {
                    union() {
                        translate([outer_size*quarter_slice_size,0,0]) {
                            cube(size=[outer_fudge_smidge, inner_path_size, inner_path_size], center=true);
                        }

                        translate([0,-outer_size*quarter_slice_size,0]) {
                            cube(size=[inner_path_size, outer_fudge_smidge, inner_path_size], center=true);
                        }
                    }
                }

                if (direction == 5) {
                    union() {
                        translate([outer_size*quarter_slice_size,0,0]) {
                            cube(size=[outer_fudge_smidge, inner_path_size, inner_path_size], center=true);
                        }

                        translate([0, outer_size*quarter_slice_size,0]) {
                            cube(size=[inner_path_size, outer_fudge_smidge, inner_path_size], center=true);
                        }
                    }
                }

                if (direction == 9) {
                    union() {
                        translate([-outer_size*quarter_slice_size,0,0]) {
                            cube(size=[outer_fudge_smidge, inner_path_size, inner_path_size], center=true);
                        }

                        translate([0, outer_size*quarter_slice_size,0]) {
                            cube(size=[inner_path_size, outer_fudge_smidge, inner_path_size], center=true);
                        }
                    }
                }

                if (direction == 10) {
                    union() {
                        translate([-outer_size*quarter_slice_size,0,0]) {
                            cube(size=[outer_fudge_smidge, inner_path_size, inner_path_size], center=true);
                        }

                        translate([0,-outer_size*quarter_slice_size,0]) {
                            cube(size=[inner_path_size, outer_fudge_smidge, inner_path_size], center=true);
                        }
                    }
                }
            }

            translate([0,0,-path_size*0.75]) {
                union() {
                    cube(size=[path_size+fudge, outer_size+fudge, path_size+fudgeg], center=true);
                    cube(size=[outer_size+fudge, path_size+fudge, path_size+fudgeg], center=true);
                }
            }
        }
    }
}

//for (offset=[0:15]) {
//    translate([(offset*(outer_size+0)),0,0]) {
//        pathwayy(offset);
//    }
//}

pathwayy(shape);
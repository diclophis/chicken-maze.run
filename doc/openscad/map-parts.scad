// maze parts

outer_size = 1.0;
cut_size = outer_size * 0.4;
inner_size = outer_size * 1.0;
path_size = outer_size * 0.25;
inner_path_size = path_size * 0.75;
fudge = 0.05 * outer_size;
inner_intersection_size = 0.75;
quarter_slice_size = 0.35;
outer_fudge_smidge = (outer_size+fudge)*0.845;


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
                    cube(size=[path_size+fudge, outer_size+fudge, path_size+fudge], center=true);
                    cube(size=[outer_size+fudge, path_size+fudge, path_size+fudge], center=true);
                }
            }
        }
    }
}








module pathwayx(direction_in) {
    //
    direction = (direction_in == 0) ? 15 : ((direction_in == 15 ) ? 0 : direction_in);

    intersection() {
        if (direction == 12) {
            translate([-cut_size*inner_intersection_size,0,0]) {
                cube(size=[inner_size, path_size, inner_size], center=true);
            }
        }

        if (direction == 11) {
            translate([cut_size*inner_intersection_size,0,0]) {
                cube(size=[inner_size, path_size, inner_size], center=true);
            }
        }

        if (direction == 3) {
            translate([0,-cut_size*inner_intersection_size,0]) {
                cube(size=[path_size, inner_size, inner_size], center=true);
            }
        }

        if (direction == 5) {
            translate([0,cut_size*inner_intersection_size,0]) {
                cube(size=[path_size, inner_size, inner_size], center=true);
            }
        }

        if (direction == 13) {
            cube(size=[path_size, inner_size, inner_size], center=true);
        }

        if (direction == 14) {
            cube(size=[inner_size, path_size, inner_size], center=true);
        }

        if (direction == 4) {
            union() {
                translate([cut_size*inner_intersection_size,0,0]) {
                    cube(size=[inner_size, path_size, inner_size], center=true);
                }

                translate([0,-cut_size*inner_intersection_size,0]) {
                    cube(size=[path_size, inner_size, inner_size], center=true);
                }
            }
        }
        
        if (direction == 10) {
            union() {
                translate([cut_size*inner_intersection_size,0,0]) {
                    cube(size=[inner_size, path_size, inner_size], center=true);
                }
                
                translate([0,cut_size*inner_intersection_size,0]) {
                    cube(size=[path_size, inner_size, inner_size], center=true);
                }
            }
        }

        if (direction == 1) {
            union() {
                translate([-cut_size*inner_intersection_size,0,0]) {
                    cube(size=[inner_size, path_size, inner_size], center=true);
                }

                translate([0,cut_size*inner_intersection_size,0]) {
                    cube(size=[path_size, inner_size, inner_size], center=true);
                }
            }
        }

        if (direction == 2) {
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

                if (direction == 8) {
                    translate([0,outer_size*0.5,0]) {
                        cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    }
                    cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                }

                if (direction == 7) {
                    translate([0,-outer_size*0.5,0]) {
                        cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    }
                    cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                }

                if (direction == 9) {
                    cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    translate([outer_size*0.5,0,0]) {
                       cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                    }
                }

                if (direction == 6) {
                    cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    translate([-outer_size*0.5,0,0]) {
                        cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                    }
                }

                if (direction == 12) {
                    translate([-outer_size*quarter_slice_size,0,0]) {
                        cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                    }
                }

                if (direction == 11) {
                    translate([outer_size*quarter_slice_size,0,0]) {
                        cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                    }
                }

                if (direction == 3) {
                    translate([0,-outer_size*quarter_slice_size,0]) {
                        cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    }
                }

                if (direction == 5) {
                    translate([0, outer_size*quarter_slice_size,0]) {
                        cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    }
                }

                if (direction == 13) {
                    cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                }

                if (direction == 14) {
                    cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                }

                if (direction == 4) {
                    union() {
                        translate([outer_size*quarter_slice_size,0,0]) {
                            cube(size=[outer_fudge_smidge, inner_path_size, inner_path_size], center=true);
                        }

                        translate([0,-outer_size*quarter_slice_size,0]) {
                            cube(size=[inner_path_size, outer_fudge_smidge, inner_path_size], center=true);
                        }
                    }
                }

                if (direction == 10) {
                    union() {
                        translate([outer_size*quarter_slice_size,0,0]) {
                            cube(size=[outer_fudge_smidge, inner_path_size, inner_path_size], center=true);
                        }

                        translate([0, outer_size*quarter_slice_size,0]) {
                            cube(size=[inner_path_size, outer_fudge_smidge, inner_path_size], center=true);
                        }
                    }
                }

                if (direction == 1) {
                    union() {
                        translate([-outer_size*quarter_slice_size,0,0]) {
                            cube(size=[outer_fudge_smidge, inner_path_size, inner_path_size], center=true);
                        }

                        translate([0, outer_size*quarter_slice_size,0]) {
                            cube(size=[inner_path_size, outer_fudge_smidge, inner_path_size], center=true);
                        }
                    }
                }

                if (direction == 2) {
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
                    cube(size=[path_size+fudge, outer_size+fudge, path_size+fudge], center=true);
                    cube(size=[outer_size+fudge, path_size+fudge, path_size+fudge], center=true);
                }
            }
        }
    }
}


module pathway(direction) {
    intersection() {
        if (direction == 5) {
            translate([-cut_size*inner_intersection_size,0,0]) {
                cube(size=[inner_size, path_size, inner_size], center=true);
            }
        }

        if (direction == 6) {
            translate([cut_size*inner_intersection_size,0,0]) {
                cube(size=[inner_size, path_size, inner_size], center=true);
            }
        }

        if (direction == 7) {
            translate([0,-cut_size*inner_intersection_size,0]) {
                cube(size=[path_size, inner_size, inner_size], center=true);
            }
        }

        if (direction == 8) {
            translate([0,cut_size*inner_intersection_size,0]) {
                cube(size=[path_size, inner_size, inner_size], center=true);
            }
        }

        if (direction == 9) {
            cube(size=[path_size, inner_size, inner_size], center=true);
        }

        if (direction == 10) {
            cube(size=[inner_size, path_size, inner_size], center=true);
        }

        if (direction == 11) {
            union() {
                translate([cut_size*inner_intersection_size,0,0]) {
                    cube(size=[inner_size, path_size, inner_size], center=true);
                }

                translate([0,-cut_size*inner_intersection_size,0]) {
                    cube(size=[path_size, inner_size, inner_size], center=true);
                }
            }
        }
        
        if (direction == 12) {
            union() {
                translate([cut_size*inner_intersection_size,0,0]) {
                    cube(size=[inner_size, path_size, inner_size], center=true);
                }
                
                translate([0,cut_size*inner_intersection_size,0]) {
                    cube(size=[path_size, inner_size, inner_size], center=true);
                }
            }
        }

        if (direction == 13) {
            union() {
                translate([-cut_size*inner_intersection_size,0,0]) {
                    cube(size=[inner_size, path_size, inner_size], center=true);
                }

                translate([0,cut_size*inner_intersection_size,0]) {
                    cube(size=[path_size, inner_size, inner_size], center=true);
                }
            }
        }

        if (direction == 14) {
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

                if (direction == 1) {
                    translate([0,outer_size*0.5,0]) {
                        cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    }
                    cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                }

                if (direction == 2) {
                    translate([0,-outer_size*0.5,0]) {
                        cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    }
                    cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                }

                if (direction == 3) {
                    cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    translate([outer_size*0.5,0,0]) {
                       cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                    }
                }

                if (direction == 4) {
                    cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    translate([-outer_size*0.5,0,0]) {
                        cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                    }
                }

                if (direction == 5) {
                    translate([-outer_size*quarter_slice_size,0,0]) {
                        cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                    }
                }

                if (direction == 6) {
                    translate([outer_size*quarter_slice_size,0,0]) {
                        cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                    }
                }

                if (direction == 7) {
                    translate([0,-outer_size*quarter_slice_size,0]) {
                        cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    }
                }

                if (direction == 8) {
                    translate([0, outer_size*quarter_slice_size,0]) {
                        cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                    }
                }

                if (direction == 9) {
                    cube(size=[inner_path_size, outer_size+fudge, inner_path_size], center=true);
                }

                if (direction == 10) {
                    cube(size=[outer_size+fudge, inner_path_size, inner_path_size], center=true);
                }

                if (direction == 11) {
                    union() {
                        translate([outer_size*quarter_slice_size,0,0]) {
                            cube(size=[outer_fudge_smidge, inner_path_size, inner_path_size], center=true);
                        }

                        translate([0,-outer_size*quarter_slice_size,0]) {
                            cube(size=[inner_path_size, outer_fudge_smidge, inner_path_size], center=true);
                        }
                    }
                }

                if (direction == 12) {
                    union() {
                        translate([outer_size*quarter_slice_size,0,0]) {
                            cube(size=[outer_fudge_smidge, inner_path_size, inner_path_size], center=true);
                        }

                        translate([0, outer_size*quarter_slice_size,0]) {
                            cube(size=[inner_path_size, outer_fudge_smidge, inner_path_size], center=true);
                        }
                    }
                }

                if (direction == 13) {
                    union() {
                        translate([-outer_size*quarter_slice_size,0,0]) {
                            cube(size=[outer_fudge_smidge, inner_path_size, inner_path_size], center=true);
                        }

                        translate([0, outer_size*quarter_slice_size,0]) {
                            cube(size=[inner_path_size, outer_fudge_smidge, inner_path_size], center=true);
                        }
                    }
                }

                if (direction == 14) {
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
                    cube(size=[path_size+fudge, outer_size+fudge, path_size+fudge], center=true);
                    cube(size=[outer_size+fudge, path_size+fudge, path_size+fudge], center=true);
                }
            }
        }
    }
}

//for (offset=[0:15]) {
//    translate([(offset*(outer_size+0)),0,0]) {
//        pathwayx(offset);
//    }
//}
//
//offy = 2.0;
//
//for (offset=[0:15]) {
//    translate([(offset*(outer_size+0)),offy,0]) {
//        pathway(offset);
//    }
//}
//
//for (offset=[0:15]) {
//    translate([(offset*(outer_size+0)),-offy,0]) {
//        pathwayy(offset);
//    }
//}

//
//
//offy = -2.0;
//translate([(0*(outer_size+0)),offy,0]) {
//    pathway(15);
//}
//
//translate([(1*(outer_size+0)),offy,0]) {
//    pathway(13);
//}
//
//translate([(2*(outer_size+0)),offy,0]) {
//    pathway(14);
//}
//
//translate([(3*(outer_size+0)),offy,0]) {
//    pathway(7);
//}
//
//translate([(4*(outer_size+0)),offy,0]) {
//    pathway(11);
//}
//
//translate([(5*(outer_size+0)),offy,0]) {
//    pathway(8);
//}
//
//translate([(6*(outer_size+0)),offy,0]) {
//    pathway(4);
//}
//
//translate([(7*(outer_size+0)),offy,0]) {
//    pathway(2);
//}
//
//translate([(8*(outer_size+0)),offy,0]) {
//    pathway(1);
//}
//
//translate([(9*(outer_size+0)),offy,0]) {
//    pathway(3);
//}
//
//translate([(10*(outer_size+0)),offy,0]) {
//    pathway(12);
//}
//
//translate([(11*(outer_size+0)),offy,0]) {
//    pathway(6);
//}
//
//translate([(12*(outer_size+0)),offy,0]) {
//    pathway(5);
//}
//
//translate([(13*(outer_size+0)),offy,0]) {
//    pathway(9);
//}
//
//translate([(14*(outer_size+0)),offy,0]) {
//    pathway(10);
//}
//
//translate([(15*(outer_size+0)),offy,0]) {
//    pathway(0);
//}

pathwayy(shape);




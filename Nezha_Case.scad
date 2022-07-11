// Grundplatte 56 86
// Lochdurchmesser 2.5 
// Lochabstand 48.6 57.75
// 46.1 51.1
// 60.4 55.1
// 80 mm für MUX

$fn = 100;

module bhole(x, y) {
    translate([x, y, 0]) {
        cylinder(h = 20, r = 1.5, center = true);
    }
}
module board() {
    color(c = [.7, .3, .7, .5]) {
        difference () {
            translate([0, 0, -1.5]) {
                cube(size = [56, 85, 1.5]);
            };

            union() {
                bhole(3.7, 82.3);
                bhole(52.3, 82.3);
                bhole(3.7, 24.55);
                bhole(52.3, 24.55);
            }
        }

        // Ethernet
        translate([3.5, -1, 0]) {
            cube(size = [16, 21, 13.3]);
        }

        // USB
        translate([26.4, -.7, 0]) {
            cube(size = [13.2, 10, 6.9]);
        }

        // OTG
        translate([44.2, -.7, 0]) {
            cube(size = [9, 7.5, 3.4]);
        }

        // Power
        translate([-.7, 68, 0]) {
            cube(size = [7.5, 9, 3.4]);
        }

        // Audio
        translate([3, 34, 2.5]) {
            rotate([0, 90, 0]) {
                cylinder(h = 10, r = 2.55, center = true);
            }
        }

        // Video
        translate([-2, 49, 0]) {
            cube(size = [12, 15, 6.2]);
        }

        // UART
        translate([51.6, 11.38, 0]) {
            cube(size = [2.54, 7.62, 29]);
        }
    }
}

module holes() {
    color(c = [.3, .3, .7, .5]) {
        // Ethernet
        translate([2.5, -10, -1]) {
            cube(size = [18, 31, 15.3]);
        }

        // USB
        translate([25.4, -10, -1]) {
            cube(size = [15.2, 20, 8.9]);
        }

        // OTG
        translate([43.2, -10, -1]) {
            cube(size = [11, 20, 5.4]);
        }

        // Power
        translate([-10, 67, -1]) {
            cube(size = [20, 11, 5.4]);
        }

        // Audio
        translate([3, 34, 2.5]) {
            rotate([0, 90, 0]) {
                cylinder(h = 20, r = 3.5, center = true);
            }
        }

        // Video
        translate([-10, 48, -1]) {
            cube(size = [20, 17, 8.2]);
        }

        // UART
        translate([50.6, 10.38, -1]) {
            cube(size = [4.54, 9.62, 35]);
        }
    
        // SD-Mux
        translate([28, 170, 0]) {
            rotate([90, 0, 0]) {
                cylinder(h = 20, r = 2.5, center = true);
            }
        }
        // SD-Mux
        translate([28, 170, 20]) {
            cube([5, 20, 40], center = true);
        }
    }
}

module support(x, y) {
    translate([x, y, -3.75]) {
        difference() {
            cylinder(h = 4.5, r = 3.5, center = true);
            cylinder(h = 5, r = 1.25, center = true);
        }
    }
}

module shole(x, y) {
    translate([x, y, -3.75]) {
        cylinder(h = 5, r = 1.2, center = true);
    }
}

module support1() {
    polyhedron(
        points = [
            [0, 0, 0],
            [1, 0, 0],
            [1, 0, -12.38],
            [0, 0, -12.38],
            [0, 12.38, 0],
            [1, 12.38, 0],
        ],
        faces = [
            [0, 1, 2, 3],
            [0, 4, 5, 1],
            [0, 3, 4],
            [1, 5, 2],
            [3, 2, 5, 4]
        ]
    );
};

module case () {
    color(c = [.3, .3, .3, 1]) {
        difference() {
            union() {
                translate([-3, -2, -6]) {
                    cube(size = [62, 89, 25]);
                }
            }
            union() {
                translate([-1.5, -0.5, -4.5]) {
                    cube(size = [59, 86, 25]);
                };
                translate([-2, -1, 17]) {
                    cube(size = [60, 87, 1]);
                };
                shole(3.7, 82.3);
                shole(52.3, 82.3);
                shole(3.7, 24.55);
                shole(52.3, 24.55);
                holes();

            translate([20.5, 84, -14])
                cube([15, 6, 13.5]);            }
        }
        support(3.7, 82.3);
        support(52.3, 82.3);
        support(3.7, 24.55);
        support(52.3, 24.55);

        // UART
        translate([51.1, -2, 19]) {
            cube(size = [3.54, 12.38, 2]);
        }
        translate([51.5, -2, 19.0]) {
            support1();
        }
        translate([53.24, -2, 19]) {
            support1();
        }
    }
}

module hook(x, y) {
    translate([x - .4, y, 17.5]) {
        rotate([90, 0, 0]) {
            cylinder(h = 20, r = .5, center = true);
        }
    }
    translate([x, y, 17.5]) {
        rotate([90, 45, 0]) {
            cube([sqrt(1.6), sqrt(1.6), 20], center = true);
        }
    }
    translate([x + .4, y, 17.5]) {
        rotate([90, 0, 0]) {
            cylinder(h = 20, r = .5, center = true);
        }
    }
}


module cover() {

    color(c = [1, .5, 0, 1]) {
        hook(-1.0, 20);
        hook(57.0, 20);
        hook(-1.0, 65);
        hook(57.0, 65);
        rotate([0,0,90])
            hook(0, -28);
        rotate([0,0,90])
            hook(85, -28);
        difference () {
            union() {
                translate([-3, -2, 19]) {
                    cube(size = [62, 89, 2]);
                }
                difference () {
                    translate([-1, 0, 16]) {
                        cube(size = [58, 85, 4]);
                    }
                    translate([.5, 1.5, 15]) {
                        cube(size = [55, 82, 4]);
                    }
                }
                translate([14, 25, 15]) {
                    cube(size = [30, 50, 6]);
                }
            }
            union () {
                // SD-Mux
                translate([28, 170, 0]) {
                    rotate([90, 0, 0]) {
                        cylinder(h = 20, r = 2.5, center = true);
                    }
                }
                // UART
                translate([50.6, -12, -1]) {
                    cube(size = [4.54, 32, 35]);
                }            }

                translate([16, 27, 14]) {
                    cube(size = [5, 46, 8]);
                }
                translate([23, 27, 14]) {
                    cube(size = [5, 46, 8]);
                }
                translate([30, 27, 14]) {
                    cube(size = [5, 46, 8]);
                }
                translate([37, 27, 14]) {
                    cube(size = [5, 46, 8]);
                }


        }
    }
}

board();
case ();
cover();
rotate([0, 180, 0]) {
    // cover();
}

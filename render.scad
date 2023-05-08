
torender = "Whole"; // Valid options include 'Quad', 'Hemi', 'Whole'
radius = 120;
posterior_curvature = 0.5;
anterior_curvature = 0.333;
grooves = 2; 

$fs = 1; // set to 1 for fast rendering, 0.05 for rendering to print

// DO NOT CHANGE ANYTHING BELOW THIS LINE
$fa = 1.0;

module mlens() {
    difference() {
        resize(newsize=[radius, radius, radius * posterior_curvature]) sphere(r=10);
        translate([-radius,-radius,0]) cube([radius * 2,radius * 2, radius * 2]);
    }
    resize(newsize=[radius, radius, radius * anterior_curvature]) sphere(r=10);
}

module lens() {
    difference() {
        mlens();
        if (grooves > 0) {
            translate([-0.35 * radius, -radius / 20, -radius * 0.25 * posterior_curvature]) cube([radius * 0.35 * 2, radius / 10, radius * 2]);
        }
        if (grooves > 1) {
            rotate([0,0,90]) translate([-0.35 * radius, -radius / 20, -radius * 0.25 * posterior_curvature]) cube([radius * 0.35 * 2, radius / 10, radius * 2]);
        }
    }
}

module hemi() {
    difference() {
        lens();
        translate([-2 * radius,-2 * radius, -1 * radius]) cube([2 * radius, 3 * radius, 2 * radius]);
    }
}


module quad() {
    difference() {
        lens();
        translate([-2 * radius,-2 * radius, -1 * radius]) cube([2 * radius, 3 * radius, 2 * radius]);
        translate([-0.1,0,-1 * radius]) cube([radius * 2, radius * 2,radius * 2]);
    }
}



if (torender == "Quad") {
    quad();
} else if (torender == "Hemi") {
    hemi();
} else if (torender == "Whole") {
    lens();
    
}

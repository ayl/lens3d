$fn = 200;

module lens() {
    difference() {
        resize(newsize=[60,60,30]) sphere(r=10);
        translate([-50,-50,0]) cube([100,100,100]);
    }
    resize(newsize=[60,60,20]) sphere(r=10);
}

module hemi() {
    difference() {
        lens();
        translate([-100,-100,-50]) cube([100,200,100]);
    }
}


module quad() {
    difference() {
        lens();
        translate([-100,-100,-50]) cube([100,200,100]);
        translate([-0.1,0,-50]) cube([100,200,100]);
    }
}

//quad();
lens();
//hemi();

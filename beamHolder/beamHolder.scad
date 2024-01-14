// width x, depth y, height z
// mm

sy=20; //strength in y
sz=20; //strenght in z (test with 2)
by=20; //block y
e=100; //extra for substraction

module main(sy,sz,by,e){
    difference(){
        cube([120+(2*sy),50+sy+by,sz]);
        union(){
            translate([35+sy,sy,-e/2]){ // SA
                cube([120-35,50+by+e,sz+e]);
            }
            translate([sy,sy,-e/2]){ // SB
                cube([120,30,sz+e]);
            }
            translate([sy,sy+30,-sz+e/2]){ //SC
                rotate([180,0,45]){
                    cube([60,40,sz+e]);
                }
            }
            translate([0,sy+30,-sz-e/2]){ //SD
                rotate([0,0,45]){
                    translate([-e/2,0,0]){
                        cube([60+e,40,sz+e]);
                    }
                }
            }
            translate([-e,50+sy,-e/2]){ // SE
                cube([e+e+sy,e,sz+e]);
            }
        }
    }
}

module block(sy,sz,by,e){
    difference(){
        cube([20,20+by,sz]);
        translate([0,20,0]){
            rotate([180,0,-45]){
                translate([-e/2,0,-e/2]){
                    cube([60+e,40,e]);
                }
            }
        }
    }
}

d=6; //diametre forat pern
f=10; //costat femella pern
ff=3; //fondaria femella pern
difference(){
    union(){
        main(sy,sz,by,e);
        translate([120+sy-35,30+sy,0]){
            block(sy,sz,by,e);
        }
    }
    translate([120+sy-25-1,50+sy+by/2,sz/2]){ // Forat pern
        rotate([0,90,0]){
            cylinder(35+sy+e, d/2, d/2,false);
        }
    }
    translate([120+sy-25-1,50+sy+(by-d)/2,(sz-d)/2]){ // Forat tope pern
        cube([2,e,d]);
    }
    translate([120+sy-1,50+sy+(by-f)/2,(sz-f)/2]){ // Forat femella pern
        cube([ff,f,f]);
    }
}
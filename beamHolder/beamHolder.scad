// width x, depth y, height z
// mm

sy=20; //strength in y
sz=20; //strenght in z (test with 2)
by=20; //block y
e=100; //extra for substraction

module main(sy,sz,by,e){
    difference(){
        cube([120+(2*sy),50+sy+by,sz]);
        union(){ // Substractor
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
        translate([0,20,0]){ //SD
            rotate([180,0,-45]){
                translate([-e/2,0,-e/2]){
                    cube([60+e,40,e]);
                }
            }
        }
    }
}

main(sy,sz,by,e);
translate([120+sy-35,30+sy,0]){
    block(sy,sz,by,e);
}
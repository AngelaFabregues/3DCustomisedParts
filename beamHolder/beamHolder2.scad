// width x, depth y, height z
// mm

$fn=50;

sy=20; //strength in y
sz=20; //strenght in z (test with 2)
by=20; //block y
e=100; //extra for substraction

module main(sy,sz,by,e,l){
    difference(){
        cube([l+sy,50+sy,sz]);
        union(){
            translate([sy+35,sy,-e/2]){ // SA
                cube([l-30,60,sz+e]);
            }
            translate([sy,sy,-e/2]){ // SB
                cube([l,30,sz+e]);
            }
            translate([sy,sy+30,-sz+e/2]){ //SC
                rotate([180,0,45]){
                    cube([l,42.5,sz+e]);
                }
            }
            translate([0,sy+30,-sz-e/2]){ //SD
                rotate([0,0,45]){
                    translate([-e/2,0,0]){
                        cube([l+e,40,sz+e]);
                    }
                }
            }
        }
    }
}
p=4; //power, intersection of the cylinder
module mainM(sy,sz,by,e,p){
    l=45;
    difference(){
        union(){
            main(sy,sz,by,e,l);
            translate([l+sy+p,sy/2,sz/2]){
                cylinder(sz,sy/3-0.2,sy/3-0.2,true);
            }
        }
        vd=3.1; // Varilla refuerzo
        translate([e/2,sy/2,sz-vd*2]){
            rotate([0,90,0]){
                cylinder(2*e,vd/2,vd/2,true);
            }
        }
    }
}

module mainF(sy,sz,by,e,p){
    l=65;
        difference(){
            main(sy,sz,by,e,l);
            translate([l+sy-p,sy/2,-sz/2]){
                cylinder(e,sy/3,sy/3,true);
            }
            hd=4; // Forat per a penjar
            translate([l+sy/3,sy/2,sz/3]){
                rotate([90,0,0]){
                    cylinder(2*e,hd/2,hd/2,true);
                }
            }
            vd=3.1; // Varilla refuerzo
            translate([e/2,sy/2,vd*2]){
                rotate([0,90,0]){
                    cylinder(2*e,vd/2,vd/2,true);
                }
            }
        }
}

//TEST
translate([-0.2,0,0]){
    mainM(sy,sz,by,e,p);
}
translate([45+65+2*sy,0,sz]){
    rotate([0,180,0]){
        mainF(sy,sz,by,e,p);
    }
}

//PRINT
//mainM(sy,sz,by,e,p);
//translate([sy+25,sy+5,0]){
//    mainF(sy,sz,by,e,p);
//}

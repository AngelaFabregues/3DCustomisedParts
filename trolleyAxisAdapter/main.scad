width=25; // x
depth=80; // y
height=60; // z
hole=20; // 25 i 20
extra=0.5;
extraHole=5;
limit=2;
roundCorner=5;

difference(){
    union(){
        intersection(){
            translate([-width/2,0,-height/2]){ // Main block 
                cube([width,depth,height]);
            }
            union(){ // Round corners
                n=0;
                translate([0,0,height/3]){
                    rotate([90,90,180]){
                        cylinder(depth+limit+(2*extraHole), (height-n)/4,(height-n)/4);
                    }
                }
                translate([0,0,-height/3]){
                    rotate([90,90,180]){
                        cylinder(depth+limit+(2*extraHole), (height-n)/4,(height-n)/4);
                    }
                }
                translate([-width/2,0,-(height-roundCorner)/2]){
                    cube([width,depth,height-roundCorner]);
                }
            }
        }
        translate([-(width/2+limit),-extraHole,-(height/2+limit)]){ // Block limit
            cube([width+(2*limit),extraHole,height+(2*limit)]);
        }
            
    }
    translate([0,-(extraHole+limit), 0]){ // Hole
        rotate([90,90,180]){
            cylinder(depth+limit+(2*extraHole), hole/2+extra,hole/2+extra);
        }
    }
 }

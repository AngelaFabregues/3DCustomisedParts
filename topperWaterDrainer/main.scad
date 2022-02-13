width=100; // x ????? amplada forat blanc
depth=11; // y wireffame plus extra infill depth
holeDepth=3; // Wireframe  depth
height=48; // z
holeWidth=width-(5+0.8+0.6); //???? 
holeHeight=28;
extra=0.5; //hole
extraDeep=20; //hole
holeDiameter=5+2*extra;

difference(){
    union(){
        difference(){
            union(){
                //wireframe
                cube([width,depth,height],true);
            }
            // screw holes
            union(){
                translate([-width/2,0,0]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([width/2,0,0]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([width/2,0,height/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([-width/2,0,-height/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([width/2,0,-height/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([-width/2,0,height/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([width*1/6,0,height/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([-width*1/6,0,height/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([width*1/6,0,-height/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([-width*1/6,0,-height/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
            }
        }
        // Whireframe extra Infill
        translate([0,holeDepth,0]){
            cube([width+holeDiameter-extra,depth-holeDepth,height+holeDiameter-extra],true);
        }
    }
    // Main hole
    translate([1,0,0]){
        cube([holeWidth+(2*extra),depth+extraDeep,holeHeight+2*extra], true);
    }
}
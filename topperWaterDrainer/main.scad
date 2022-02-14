width=100; // x ????? wireframe width
depth=11; // y wireframe plus extra infill depth
holeDepth=4; // Wireframe  depth 3 + broken screws
height=48; // z Wireframe height
holeWidth=width-(5+0.8+0.6); //???? 
holeHeight=28;
extra=0.5; // to help adjusting pieces
extraDeep=20; //hole to help with differences
holeDiameter=5+2*extra; // screw supports diameter with help adjusting

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
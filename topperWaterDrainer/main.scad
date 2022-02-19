whiteHoleWidth=93;
wireframeWidth=86;
holeWidth=72;
whiteHoleHeight=47;
wireframeHeight=40;
holeHeight=28;
holeRightBias=5;

depth=11; // y wireframe plus extra infill depth
holeDepth=4; // Wireframe  depth 3 + broken screws

extra=0.5; // to help adjusting pieces
extraDeep=20; //hole to help with differences
holeDiameter=5+2*extra; // screw supports diameter with help adjusting

difference(){
    union(){
        difference(){
            union(){
                //black hole wireframe
                cube([wireframeWidth,depth,wireframeHeight],true);
            }
            union(){
                // screw holes
                translate([-wireframeWidth/2,0,0]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([wireframeWidth/2,0,0]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([wireframeWidth/2,0,wireframeHeight/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([-wireframeWidth/2,0,-wireframeHeight/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([wireframeWidth/2,0,-wireframeHeight/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([-wireframeWidth/2,0,wireframeHeight/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([wireframeWidth*1/6,0,wireframeHeight/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([-wireframeWidth*1/6,0,wireframeHeight/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([wireframeWidth*1/6,0,-wireframeHeight/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
                translate([-wireframeWidth*1/6,0,-wireframeHeight/2]){
                    cube([holeDiameter,depth+extraDeep,holeDiameter],true);
                }
            }
        }
        // White hole wireframe extra Infill
        translate([0,holeDepth,0]){
            cube([whiteHoleWidth,depth-holeDepth,whiteHoleHeight],true);
        }
    }
    // Main hole
    translate([holeRightBias/2,0,0]){
        cube([holeWidth,depth+extraDeep,holeHeight], true);
    }
}
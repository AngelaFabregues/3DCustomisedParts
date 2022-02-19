whiteHoleWidth=93;
wireframeWidth=86;
holeWidth=72;
whiteHoleHeight=47;
wireframeHeight=40;
holeHeight=28;
holeRightBias=5;

wireframeDepth=4;
whiteHoleDepth=6;

extra=0.5; // to help adjusting pieces
extraDeep=20; //hole to help with differences
holeDiameter=5+2*extra; // screw supports diameter with help adjusting

module screwHole(width, depth){
    translate([width,0,depth]){
        cube([holeDiameter,wireframeDepth+extraDeep,holeDiameter],true);
    }
}

module wireframe(width,height, depth){
    hingeWidth=5;
    hingeDepth=1;
    difference(){
        union(){
            //black hole wireframe
            translate([0,-depth/2,0]){
                cube([width,depth,height],true);
            }
        }
        union(){
            // screw holes
            screwHole(-width/2,height/2);
            screwHole(-width/2,-height/2);
            screwHole(width/2,height/2);
            screwHole(width/2,-height/2);
            screwHole(width/2,0);
            screwHole(-width/2,0);
            screwHole(width/6,height/2);
            screwHole(width/6,-height/2);
            screwHole(-width/6,-height/2);
            screwHole(-width/6,height/2);
     
            // Hinge
            translate([-width/2+holeDiameter/2+holeRightBias,-depth+hingeDepth/2,0]){
                cube([hingeWidth,hingeDepth+1,holeHeight],true);
            }
        }
    }
}

difference(){
    union(){
        wireframe(wireframeWidth,wireframeHeight,wireframeDepth);
        // White hole wireframe extra Infill
        translate([0,whiteHoleDepth/2,0]){
            cube([whiteHoleWidth,whiteHoleDepth,whiteHoleHeight],true);
        }
    }
    // Main hole
    translate([holeRightBias/2,0,0]){
        cube([holeWidth,extraDeep,holeHeight], true);
    }
}
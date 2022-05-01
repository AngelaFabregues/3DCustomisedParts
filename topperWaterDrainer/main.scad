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
        }
    }
}

module roundCornersLandscape(w,h,d,rd,rp){
    l=5;
    roundDiameter=w/rd;
    roundPosition=w/rp;
    union(){
        difference(){
            translate([0,0,0]){
                cube([w,d,h],true);
            }
            union(){
                translate([roundPosition,0,0]){
                    rotate([90,90,180]){
                        cylinder(d+l, roundDiameter,roundDiameter,true);
                    }
                }
                translate([-roundPosition,0,0]){
                    rotate([90,90,180]){
                        cylinder(d+l, roundDiameter,roundDiameter,true);
                    }
                }
                translate([0,0,0]){
                    cube([w/2,d+l,h],true);
                }
            }
        }
        difference(){
            translate([0,0,0]){
                cube([w+l,d,h+l],true);
            }
            translate([0,0,0]){
                cube([w,d+l,h],true);
            }
        }
    }
}

difference(){
    union(){
        wireframe(wireframeWidth,wireframeHeight,wireframeDepth);
        translate([0,whiteHoleDepth/2,0]){
            difference(){
                // White hole wireframe extra Infill
                cube([whiteHoleWidth,whiteHoleDepth,whiteHoleHeight],true);
                roundCornersLandscape(whiteHoleWidth, whiteHoleHeight, whiteHoleDepth+1,3,4);
            }
        }
    }
    union(){
        // Main hole
        translate([holeRightBias/2,0,0]){
            cube([holeWidth+2*extra,extraDeep,holeHeight+2*extra], true);
        }
        // Hinge
        hingeWidth=5;
        hingeDepth=6;
        translate([-wireframeWidth/2+holeDiameter/2+holeRightBias-extra,-wireframeDepth+hingeDepth/2+extra,0]){
            cube([hingeWidth+2*extra,hingeDepth+1+extra,holeHeight+2*extra],true);
        }
    }
}
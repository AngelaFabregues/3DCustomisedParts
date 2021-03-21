// Coding 75min.

nozzle=0.4;
layerHeight=0.2;

outsideWidth=23;
outsideHeigth=23;
outsideLength=5;  // Testing ready
//outsideLength=60; // Production ready
barDiameter=15;
emptyDiff=0.1;
extra=10;
hornWidth=3;
hornHeight=3;
    
difference(){
    translate([0,0,0]){
        cube([outsideWidth,outsideLength,outsideHeigth],true);
    }
    union(){
        translate([0,0,(outsideHeigth/2)-(hornHeight/2)-(emptyDiff/2)+(extra/2)]){
            cube([outsideWidth-(2*hornWidth)-(2*emptyDiff),outsideLength+extra,hornHeight+emptyDiff+extra],true);
        }
        translate([0,(outsideLength+extra)/2,-(outsideHeigth/2)+barDiameter/2]){
            rotate([90,0,0]){
                cylinder(outsideLength+extra,barDiameter/2+2*emptyDiff,barDiameter/2+2*emptyDiff);
            }
        }
    }
}
nozzle=0.4;
layerHeight=0.2;
holeExtra=0.1;

width = 43;
height = 3; // multiple of layerHeight
border = 5*nozzle; // multiple of nozzle
extra = 10;
carpetHeight = 1; // multiple of layerHeight

thickness=border+holeExtra-nozzle; // thickness - holeExtra must be multiple of nozzle.

totalWidth=width+(2*border);

$fn=100;
difference(){
    union(){
        cube([width+(2*border),width+(2*border),height+carpetHeight],false);
        //dalt
        translate([totalWidth/2-0.5*thickness,totalWidth,0]){
            cube([2*thickness,thickness,height+carpetHeight]);
        }
        //dreta
        translate([totalWidth,totalWidth/2-1.5*thickness,0]){
            cube([thickness,2*thickness,height+carpetHeight]);
        }
        //baix
        translate([totalWidth/2-1.5*thickness,-thickness,0]){
            cube([2*thickness,thickness,height+carpetHeight]);
        }
        // esquerra
        translate([-thickness,totalWidth/2-(0.5*thickness),0]){
            cube([thickness,2*thickness,height+carpetHeight]);
        }
    }
    union(){
        translate([border,border,carpetHeight]){
            cube([width,width,height+extra],false);
            translate([separation,totalWidth,0]){
                anchor(separation);
            }
        }
        union(){
            holeSize=width/6;
            startOffset=totalWidth/4;
            endOffset=3*startOffset;
            //dalt esquerra
            translate([startOffset,startOffset,-extra]){
                cylinder(height+carpetHeight+2*extra,holeSize,holeSize);
            }
            //baix esquerra
            translate([startOffset,endOffset,-extra]){
                cylinder(height+carpetHeight+2*extra,holeSize,holeSize);
            }
            //dalt dreta
            translate([endOffset,startOffset,-extra]){
                cylinder(height+carpetHeight+2*extra,holeSize,holeSize);
            }
            //baix dreta
            translate([endOffset,endOffset,-extra]){
                cylinder(height+carpetHeight+2*extra,holeSize,holeSize);
            }
        }
        //dalt
        translate([totalWidth/2-1.5*thickness-holeExtra,totalWidth-thickness,-extra]){
            cube([2*thickness+2*holeExtra,thickness+2*holeExtra,height+carpetHeight+3*extra]);
        }
        //dreta
        translate([totalWidth-thickness,totalWidth/2-0.5*thickness-holeExtra,-extra]){
            cube([thickness+2*holeExtra,2*thickness+2*holeExtra,height+carpetHeight+3*extra]);
        }
        //baix
        translate([totalWidth/2-0.5*thickness-holeExtra,-2*holeExtra,-extra]){
            cube([2*thickness+2*holeExtra,thickness+2*holeExtra,height+carpetHeight+3*extra]);
        }
        //esquerra
        translate([-2*holeExtra,totalWidth/2-1.5*thickness-holeExtra,-extra]){
            cube([thickness+2*holeExtra,2*thickness+2*holeExtra,height+carpetHeight+3*extra]);
        }
    }
}
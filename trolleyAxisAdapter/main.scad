width=25; // x
depth=80; // y
height=50; // z
hole=22;
extra=0.5;
extraHole=5;

difference(){
    translate([-width/2,0,-height/2]){
        cube([width,depth,height]);
    }
    translate([0,-extraHole, 0]){
        rotate([90,90,180]){
            cylinder(depth+2*extraHole, hole/2+extra,hole/2+extra);
        }
    }
 }
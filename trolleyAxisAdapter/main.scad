width=25; // x
depth=80; // y
height=50; // z
hole=25; // 25 i 20
extra=0.5;
extraHole=5;
limit=2;

difference(){
    union(){
        translate([-width/2,0,-height/2]){
            cube([width,depth,height]);
        }
        translate([-(width/2+limit),-limit,-(height/2+limit)]){
            cube([width+(2*limit),limit,height+(2*limit)]);
        }
    }
    translate([0,-(extraHole+limit), 0]){
        rotate([90,90,180]){
            cylinder(depth+limit+(2*extraHole), hole/2+extra,hole/2+extra);
        }
    }
 }
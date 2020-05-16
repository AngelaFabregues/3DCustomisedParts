width=62; // x
depth=29; // y
height=10; // z
holeWidth=20;

extra=0.5;
extraHole=10;
f=2;
g=2;
h=2;
i=2;

difference(){
    // A
    cube([width+(2*g),depth+holeWidth+f,height]);
    // B + C
    union(){
        translate([g-extra,holeWidth-extra,-extraHole/2]){
            //B
            cube([width+(2*extra),depth+(2*extra),height+extraHole]);
        }
        translate([g+h-extra,holeWidth/2,-extraHole/2]){
            //C
            cube([width-(2*i)+(2*extra),depth+(2*extra)+holeWidth/2+extraHole,height+extraHole]);
        }
    }
}
width=6.2; // x
depth=2.9; // y
height=1; // z
holeWidth=2;

extra=0.05;
extraHole=1;
f=0.2;
g=0.2;
h=0.2;
i=0.2;

difference(){
    // A
    cube([width+(2*g),depth+holeWidth+f,height]);
    // B + C
    union(){
        translate([g-extra,2-extra,-extraHole/2]){
            //B
            cube([width+(2*extra),depth+(2*extra),height+extraHole]);
        }
        translate([g+h-extra,1,-extraHole/2]){
            //C
            cube([width-(2*i)+(2*extra),depth+(2*extra)+1+extraHole,height+extraHole]);
        }
    }
}
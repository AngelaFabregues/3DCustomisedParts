width=62; // x
depth=29; // y
height=10; // z
holeDepth=18;
extraHoleDepth=0; // from 0 at the bottom to 5 at top

extra=0.5;
extraHole=10;
f=2;
g=2;
h=2;
i=holeDepth/2;

difference(){
    // A
    union(){
        cube([width+(2*g),depth+holeDepth+f,height]);
        translate([0,-extraHoleDepth,0]){
            cube([width+(2*g),extraHoleDepth+extraHole,height]);
        }
    }
    // B + C + E
    union(){
        translate([g-extra,holeDepth-extra,-extraHole/2]){
            //B
            cube([width+(2*extra),depth+(2*extra),height+extraHole]);
        }
        translate([g+i-extra,holeDepth/2-extra,-extraHole/2]){
            //C
            cube([width-(2*i)+(2*extra),holeDepth/2+(2*extra),height+extraHole]);
        }
        translate([g+h-extra,depth+holeDepth+f-(extraHole/2),-extraHole/2]){
            //E
            cube([width-(2*h)+(2*extra),extraHole,height+extraHole]);
        }
    }
}
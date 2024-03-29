tubeDiameter=41; //40.5 is too few
tubeThighness=5;
stopperExtraThigness=3;
stopperTopHeight=5;
stopperBottomHeight=5;
depth=25;

// Main tube
difference(){
    cylinder(depth, tubeDiameter/2,tubeDiameter/2,true);
    cylinder(2*depth, tubeDiameter/2-tubeThighness,tubeDiameter/2-tubeThighness,true);
}
// Stopper bottom
translate([0,0,(depth+stopperBottomHeight)/2]){
    cylinder(stopperBottomHeight, tubeDiameter/2+stopperExtraThigness,tubeDiameter/2+stopperExtraThigness,true);
}

// Stopper top
translate([0,0,(depth+stopperTopHeight)/2+stopperBottomHeight]){
    cylinder(stopperTopHeight, tubeDiameter/2+stopperExtraThigness,tubeDiameter/2+stopperExtraThigness-stopperTopHeight,true);
}

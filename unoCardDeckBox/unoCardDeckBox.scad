printerWallThickness=0.4;

cardW=56; // card width
cardH=87; // card height
deckH=34; // card deck height
boxE=1; //box empty space between card and box wall
boxT=2*printerWallThickness; //box thickness

/*
Card deck box for cards that are size x+y and a deck that is z height.
e is the empty space left between the card deck and the box walls.
t is the thickness of the wall.
*/
module box(x,y,z,e,t){
    limit=50;
    difference(){
        cube([x+2*(e+t),y+2*(e+t),z+t]);
        translate([t,t,t]){
            cube([x+2*e,y+2*e,limit]);
        }
    }
}
//box(cardW,cardH,deckH,boxE,boxT);

/*
Lid for the card deck box.
*/
module boxLid(x,y,z,e,t){
    translate([-(t+e),-(t+e),-t]){
        box(x+2*(t+e),y+2*(t+e),z+t,e,t);
    }
}
//boxLid(cardW,cardH,deckH,boxE,boxT);

/*
Card deck box tunned for the UNO H20 game.
*/
module unoBox(x,y,z,e,t){
    difference(){
        box(x,y,z,e,t);
        // remove walls
        o=1;
        union(){
            translate([-o,-o,t]){
                cube([x/2+o,x/2+o,z+o]);
            }
            translate([t+e+x/2+2*o,t+e+y-x/2+2*o,t]){
                cube([x/2+o,x/2+o,z+o]);
            }
        }
    }
    // horns
    hornD=4;
    hornCardW=11;
    hornCardH=13;
    translate([hornCardW+e+t,hornCardH+e+t,0]){
        cylinder(z,hornD,hornD/2);
    }
    translate([x+e+t-hornCardW,y+e+t-hornCardH,0]){
        cylinder(z,hornD,hornD/2);
    }    
}

unoBox(cardW,cardH,deckH,boxE,boxT);
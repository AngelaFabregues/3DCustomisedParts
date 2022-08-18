cardW=60; // card width
cardH=100; // card height
deckH=30; // card deck height
boxE=1; //box empty space between card and box wall
boxT=1; //box thighness

/*
Card deck box for cards that are size x+y and a deck that is z height.
e is the empty space left between the card deck and the box walls.
t is the thighness of the wall.
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

/*
Lid for the card deck box.
*/
module boxLid(x,y,z,e,t){
    translate([-(t+e),-(t+e),-t]){
        box(x+2*(t+e),y+2*(t+e),z+t,e,t);
    }
}

//boxLid(cardW,cardH,deckH,boxE,boxT);

//box(cardW,cardH,deckH,boxE,boxT);

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
    hornD=5;
    hornCardW=10;
    hornCardH=10;
    translate([hornCardW+e+t,hornCardH+e+t,0]){
        cylinder(z,hornD,hornD/2);
    }
    translate([x+e+t-hornCardW,y+e+t-hornCardH,0]){
        cylinder(z,hornD,hornD/2);
    }    
}

unoBox(cardW,cardH,deckH,boxE,boxT);
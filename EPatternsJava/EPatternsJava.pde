
import processing.svg.*;

/* ~·~·~·~·~·~·~·~·~·~·~·;
# Every Pixel pattern;
# Code by Andrew Shapiro;
# ~·~·~·~·~·~·~·~·~·~·~·;
*/

int DOTS_NUMBER = 50;
int ROSETTE_SIZE = 8;
int PIXEL_SIZE = 8;
int PIXEL_GAP = 2;
boolean SAVE_SVG = true;


//from EPattern import EPattern;

void settings() 
{
    int side = ROSETTE_SIZE * 2 * (PIXEL_SIZE + PIXEL_GAP);
    size(side, side);  // canvas size
}

void setup() 
{
    pixelDensity(2);  // 2/1 - Retina/not
    frameRate(1);  // animation speed   
}

void draw() {
  
    int DOTS_NUMBER = 50;
    int ROSETTE_SIZE = 8;
    int PIXEL_SIZE = 8;
    int PIXEL_GAP = 2;
 
    background(255, 0);

    //if (SAVE_SVG) {
    //  hash_name = random.getrandbits(64);
    //  beginRecord(SVG, 'svg/' + str(hash_name) + ".svg");
    //}

    EPattern ep = new EPattern(DOTS_NUMBER, ROSETTE_SIZE, PIXEL_SIZE, PIXEL_GAP);
    ep.plot();

    //if SAVE_SVG:;
    //    endRecord();

    //noLoop()  // stop animation;
}
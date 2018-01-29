
import processing.svg.*;
import java.util.UUID;

/* ~·~·~·~·~·~·~·~·~·~·~·;
# Every Pixel pattern;
# Code by Andrew Shapiro;
# ~·~·~·~·~·~·~·~·~·~·~·;
*/

int PANEL_X = 6;
int PANEL_Y = 2;
int DOTS_NUMBER = 50;
int ROSETTE_SIZE = 8;
int PIXEL_SIZE = 8;
int PIXEL_GAP = 2;

int side = ROSETTE_SIZE * 2 * (PIXEL_SIZE + PIXEL_GAP);

boolean REGENERATE_PATTERN_ON_REDRAW = false;
boolean SAVE_SVG = true;
boolean SAVE_PNG = true;


void settings() 
{    
    size(PANEL_X * side, PANEL_Y * side);  // canvas size
}

void setup() 
{
    pixelDensity(2);  // 2/1 - Retina/not
    frameRate(1);  // animation speed   
}

void draw() {
  
    int PANEL_X = 6;
    int PANEL_Y = 2;
    int DOTS_NUMBER = 50;
    int ROSETTE_SIZE = 8;
    int PIXEL_SIZE = 8;
    int PIXEL_GAP = 2;
 
    background(255, 0);

    String hash_name = String.valueOf(UUID.randomUUID());
    if (SAVE_SVG) {
      beginRecord(SVG, "svg/" + hash_name + ".svg");
    }

    EPattern ep = new EPattern(DOTS_NUMBER, ROSETTE_SIZE, PIXEL_SIZE, PIXEL_GAP, REGENERATE_PATTERN_ON_REDRAW);
    
    for (int y = 0;  y < PANEL_Y; y++) 
    {
      pushMatrix();
      for (int x = 0;  x < PANEL_X; x++)
      {
        ep.plot();
        translate(side, 0);
      }
      popMatrix();
      translate(0, side);
    }
    
    if (SAVE_SVG)
        endRecord();
        
    if (SAVE_PNG)
      saveFrame("png/" + hash_name + ".png");

    //noLoop();  // stop animation
}
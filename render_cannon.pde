// CANNON
float cannon_x;
float cannon_y;
float cannon_size;

// BARREL
float barrel_x1;  // start of barrel coordinates
float barrel_y1;
PVector barrel_end;  // vectors to determine barrel location
PVector barrel_len;

// COLOUR
color cannon_blue = #1902F5;

PImage cannon;
PImage cannon2;


void setup_cannon() {

  /** Initialises variables for cannon
   */
  cannon = loadImage("cannon.png");
  cannon2 = loadImage("cannon2.png");
  cannon_x = width/2 + 5;   // coordinates for cannon
  cannon_y = height - 180;
  cannon_size = 80;

  barrel_x1 = width/2;   // Starting positions of barrel
  barrel_y1 = height - 175;
}



void render_cannon() {

  /** Draws the cannon to the screen.
   
   Sets the maximum value of the Y coordinate
   of the end of the barrel to the start of
   the barrel, so it cannot look down.
   Then sets up a vector that allows the barrel
   to track the mouse, and sets the maximum
   length to 25.
   Then draws the cannon and the barrel.
   */

  float mY = constrain(mouseY, 0, barrel_y1 - 10);   // Barrel can't track below barrel_y1

  barrel_end = new PVector(mouseX - barrel_x1, mY - barrel_y1);   // Barrel tracks mouse
  barrel_len = barrel_end.setMag(5);   // max length of barrel is 25
  //stroke(255);
  //fill(cannon_blue);
  //arc(cannon_x, cannon_y, cannon_size, cannon_size, radians(180), radians(360));  // CANNON
  
  stroke(255);
  line(barrel_x1, barrel_y1, barrel_x1 + barrel_len.x, barrel_y1 + barrel_len.y);  // BARREL
  
  image(cannon, cannon_x, cannon_y, cannon_size, cannon_size);
  image(cannon2, cannon_x -10, cannon_y, cannon_size, cannon_size);
}

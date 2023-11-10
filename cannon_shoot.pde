// SHOT
float[] shootX;   // ABM coordinates
float[] shootY;
int ammo = 45;

// TARGET
float[] targX;   //store mouse positions
float[] targY;

// LOGIC
float[] travel;   // Used as boolean, 1 = travelling. 0 = finished travelling
PVector shootDir;   //direction of shot
float shootSpeed = 1;
float[] shoot_explode;
float[] shoot_blow_up;

// COLOR
color red = #A01D1D;


void shoot_setup() {

  /** initialises variables for the ABM
   */

  shootX = new float[0];
  shootY = new float[0];

  travel = new float[0];
  shoot_explode = new float[0];
  shoot_blow_up = new float[0];

  targX = new float[0];
  targY = new float[0];
}


void cannon_shoot() {

  /** Facilitates movement and creation of cannon shot
   
   This function iterates over how many shots are in
   the air, and then checks if those particular shots
   are currently travelling. If not , it finds the vector
   between the target and the end of the cannon barrel,
   and creates a shot. It then checks if the length of
   the vector is greater than 0, and normalises the
   vector values between 0 and 1, multiplaying that by
   either ShootSpeed or Shootdir.mag(), whichever is
   smaller. Then the coordinates of the shot are
   incremented by the new values in the shootDir vector.
   Once it has finished travelling along its path, the
   variable travel is set to 0. 
   */

  strokeWeight(5);   // make shots larger
  fill(255);

  for (int i = 0; i < shootX.length; i++) {
    if (travel[i] != 0) {   // has shot finished travelling?

      shootDir = new PVector(targX[i] - shootX[i], targY[i] - shootY[i]);   // determine vector

      point(shootX[i], shootY[i]);

      if (shootDir.mag() > 0.0) {   // if length of vector is greater than 0

        shootDir.normalize();   // map values between 0 and 1
        shootDir.mult(min(shootSpeed, shootDir.mag()));   // multiply by whatever is smaller

        shootX[i] += shootDir.x; // increment by vector values
        shootY[i] += shootDir.y;

        if (shootX[i] >= targX[i] - 1 &&   // if the shot reaches the end of its path
          shootX[i] <= targX[i] + 1 &&
          shootY[i] >= targY[i] - 1 &&
          shootY[i] <= targY[i] + 1) {

          shoot_explode[i] = 1;
          travel[i] = 0;   // finished travelling
        }
      }
    }
    if (shoot_explode[i] == 1) {
      shoot_explode();
    }
  }
}



void mousePressed() {
  ammo_count();
  /** Stores a number of variables for cannon shot
   
   Upon mouse click, appends the arrays 'targ',
   'travel' and 'shoot' with their needed values.
   The current mouse position for 'targ', the
   boolean value for 'travel', and the coordinates
   of the end of the barrel for 'shoot'
   */
  if (mouseY <= (barrel_y1 + barrel_len.y)) {

    targX = append(targX, mouseX);   // store current mouse position as target
    targY = append(targY, mouseY);

    travel = append(travel, 1);  // shot is now travelling
    shoot_explode = append(shoot_explode, 0);  // shot is not exploding
    shoot_blow_up = append(shoot_blow_up, 3);

    shootX = append(shootX, barrel_x1 + barrel_len.x);   // start at end of barrel
    shootY = append(shootY, barrel_y1 + barrel_len.y);
  }
}




void shoot_explode() {
  for (int i = 0; i < shootX.length; i++) {
    if (travel[i] != 1 &&
      shoot_explode[i] != 0) {   // if bomb finished travelling, and has started exploding
      
      noStroke();
      fill(red);
      ellipse(shootX[i], shootY[i], shoot_blow_up[i], shoot_blow_up[i]);

      shoot_blow_up[i] += .5;

      if (shoot_blow_up[i] >= 100) {  // if bomb
        shoot_blow_up[i] = 0;
        shoot_explode[i] = 0;
      }
    }
  }
}

void ammo_count(){
  if ( ammo > 0){
  ammo -= 1;
  }
}

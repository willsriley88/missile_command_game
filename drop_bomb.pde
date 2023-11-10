import processing.sound.*;
SoundFile explosion;
int bombs_dropped = 0;
int bomb_amount = 40;
int [] bomb_travelling = new int [90];
int level_diff_calc = 80;
int level_difficulty = 2;

PImage bomb;
PImage bomb_exploded;
PImage [] graphic_bombs = new PImage [bomb_amount];

int counter = 0;
int [] bombs = new int [bomb_amount];

float [] bomb_x = new float [bomb_amount];
float [] bomb_y = new float [bomb_amount];
float[] x;
float[] y;
float[] bomb_blow_up;
float[] boolean_bomb;
float[] boolean_explode;


boolean bomb_shrink = false;

void setup_bomb() {
  x = new float[0];
  y = new float[0];

  for (i = 0; i < bomb_travelling.length; i++){
    bomb_travelling[i] = 1;
  }  
  explosion = new SoundFile(this, "explosion.mp3");
  
  imageMode(CENTER);
  bomb_exploded = loadImage("bomb_exploded.png");
  bomb = loadImage("bomb.png");
    
  boolean_bomb = new float[0];
  bomb_blow_up = new float[0];
  boolean_explode = new float[0];
}

void bomb_counter() {
  counter += 1;
  if (counter >= level_diff_calc) {
    x = append(x, random(50, width-100));
    y = append(y, 0);
    boolean_bomb = append(boolean_bomb, 1);
    bomb_blow_up = append(bomb_blow_up, 3);
    boolean_explode = append(boolean_explode, 0);
    counter = 0;
    bombs_dropped += 1;
  }else if (bombs_dropped >= bomb_amount){
    level_counter += .1;
    if (level_counter >= 30){
      level += 1;
      terrain_colour1 = 100;
      terrain_colour2 = 100;
      terrain_colour3 = 100;
      bg_colour1 = 100;
      bg_colour2 = 100;
      bg_colour3 = 255;
      bombs_dropped = 0;
      
      level_difficulty += 2;
      level_diff_calc /= 2;
      ammo = 40;
           if (level_counter >= 30 && level_counter < 30.1){
        for (i = 0; i < top_building.length; i ++){
          if (top_building[i] == 1 || bottom_building[i] == 1){
            update_score(50);
          }
        }
      }
      setup_buildings();
 
   
      for(i = 0; i < x.length; i++){
        boolean_bomb[i] = 0;
        x[i] = 0;
        y[i] = 0;
      }level_counter = 0;
    }
  }
}

void create_bomb() {
  for (int i = 0; i < x.length; i++) {
    if (boolean_bomb[i] != 0) {
      if (bombs_dropped < bomb_amount){
      image(bomb, x[i], y[i], 70, 60);
      y[i] += level_difficulty;

        if (y[i] >= height - 100) {
          boolean_explode[i] = 1;
          boolean_bomb[i] = 0; 
          explosion.play();
          //bomb_travelling[i]  = 1;
        }
      }
    }
    if (boolean_explode[i] == 1){
      bomb_explode();
    } 
  }
}

void bomb_explode() {
  for (int i = 0; i < x.length; i++) {
    if (boolean_bomb[i] != 1 &&
      boolean_explode[i] != 0) {
      image(bomb_exploded, x[i], y[i], bomb_blow_up[i], bomb_blow_up[i]);

      bomb_blow_up[i] += 1;

      if (bomb_blow_up[i] >= 200) {
        bomb_blow_up[i] = 0;
        boolean_explode[i] = 0;
        }
      }
  }
}

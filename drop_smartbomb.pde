import processing.sound.*;
SoundFile smart_bomb_spawn;
SoundFile smart_bomb_explosion;
int smart_bomb_amount;
int smart_counter;

PImage smart_bomb;
PImage smart_bomb_exploded;

float smart_x;
float smart_y;
float smart_bomb_blow_up;
float[] boolean_smart_bomb;
float[] boolean_smart_bomb_explode;

boolean smart_bomb_active;

void setup_smart_bomb() {
  smart_x = random(100, width-100);
  smart_y = 0;
  smart_counter = 1;
  smart_bomb_active = true;
  smart_bomb_blow_up = 1;
  smart_bomb_amount = 5;
  
  smart_bomb_explosion = new SoundFile(this, "smart_bomb_explosion.wav");
  smart_bomb_spawn = new SoundFile(this, "smart_bomb_spawn.wav");
  
  smart_bomb_exploded = loadImage("smart_bomb_exploded.png");
  smart_bomb = loadImage("smart_bomb.png");
    
}

void smart_bomb() {
  if (smart_bomb_amount != 0){
    smart_counter += 1;
    if(smart_counter == 350){
      smart_bomb_active = true;
      smart_bomb_spawn.play();
      smart_bomb_amount -= 1;
    }
    if (smart_counter >= 350) {
      image(smart_bomb, smart_x, smart_y, 70, 50);
      smart_y += level_difficulty;
      if(smart_counter >= 2000){
        smart_counter = 0;
        smart_y = 0;
        smart_bomb_active = true;
      }
    }
  }
}

boolean smart_bomb_explode(){
  if(smart_y == height - 100 && smart_bomb_active == true){
    smart_bomb_explosion.play();
  }
  if(smart_y >= height - 100 && smart_bomb_active == true){
    image(smart_bomb_exploded, smart_x, height - 110, smart_bomb_blow_up, smart_bomb_blow_up);
    smart_bomb_blow_up += 1;
    if(smart_bomb_blow_up >= 150){
      smart_bomb_active = false;
      smart_bomb_blow_up = 1;
    }
  }
  return true;
}

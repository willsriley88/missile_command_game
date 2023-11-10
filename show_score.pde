int score;

void show_score(){
  if (level == 1){
    textSize(20);
    fill(255,0,0);
    text("SCORE : " + str(score), 20, 50);
    
    textSize(20);
    fill(255,0,0);
    text("LEVEL : " + str(level), 20, 80);
    
    textSize(20);
    fill(255,0,0);
    text("AMMO : " + str(ammo), 20, 120);
    
  }else if (level == 2){
    textSize(20);
    fill(255,0,0);
    text("SCORE : " + str(score), 60, 50);
    
    textSize(20);
    fill(255,0,0);
    text("LEVEL : " + str(level), 60, 80);
    
    textSize(20);
    fill(255,0,0);
    text("AMMO : " + str(ammo), 60, 110);
  }
}

void update_score(int num){
   score += num;
}

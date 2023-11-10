void abm_collision_smart(){
  for (i = 0; i < shootX.length; i++){
    for (int j = 0; j < 2; j++){
      if (smart_x + 25 >= shootX[i] - 25 && smart_x - 25 <= shootX[i] + 25 &&
      smart_y + 25 >= shootY[i] - 25 && smart_y - 25 <= shootY[i] + 25 && smart_bomb_explode() == true
      && travel[i] == 1){
        smart_x = 900;
        smart_y = 900;
        update_score(25);
      }
    }
  }
}

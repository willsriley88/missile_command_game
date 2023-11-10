void abm_collision_detection(){
  for (i = 0; i < shootX.length; i++){
    for (int j = 0; j < x.length; j++){
      if (x[j] + 25 >= shootX[i] -25 && x[j] -25 <= shootX[i] + 25 &&
      y[j] + 25 >= shootY[i] -25 && y[j] - 25 <= shootY[i] + 25 && travel[i] == 1){
        x[j] = 900;
        y[j] = 900;
        update_score(25);
      }
    }
  }
}

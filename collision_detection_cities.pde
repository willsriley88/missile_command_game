void collision_city_top(){
  for (i = 0; i < buildings_top_x.length; i++){
    for (int j = 0; j < x.length; j++){
      if (x[j] + 15 >= buildings_top_x[i] - 15 && x[j] - 15 <= buildings_top_x[i] + 15 &&
      y[j] + 10 >= buildings_top_y[i] - 10 && y[j] - 10 <= buildings_top_y[i] + 10 && top_building[i] == 1){
        top_building[i] = 0;
        x[j] = 900;
        y[j] = 900;
      }
    }
  }
}

void collision_city_bottom(){
  for (i = 0; i < buildings_bottom_x.length; i++){
    for (int j = 0; j < x.length; j++){
      if (x[j] + 25 >= buildings_bottom_x[i] - 25 && x[j] + 25 <= buildings_bottom_x[i] + 25 &&
      y[j] + 10 >= buildings_bottom_y[i] - 10 && y[j] - 10 <= buildings_bottom_y[i] + 10 && top_building[i] == 0){
        bottom_building[i] = 0;
        x[j] = 900;
        y[j] = 900;
      }
    }
  }
}

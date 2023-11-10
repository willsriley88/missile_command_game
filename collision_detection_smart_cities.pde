void collision_smart_city_top(){
  for (i = 0; i < buildings_top_x.length; i++){
    for (int j = 0; j < x.length; j++){
      if (smart_x +50 >= buildings_top_x[i] - 50 && smart_x - 50 <= buildings_top_x[i] + 50 &&
      smart_y + 10 >= buildings_top_y[i] - 10 && smart_y - 10 <= buildings_top_y[i] + 10 && top_building[i] == 1){
        top_building[i] = 0;
      }
    }
  }
}

void collision_smart_city_bottom(){
  for (i = 0; i < buildings_bottom_x.length; i++){
    for (int j = 0; j < x.length; j++){
      if (smart_x + 50 >= buildings_bottom_x[i] - 50 && smart_x - 50 <= buildings_bottom_x[i] + 50 &&
      smart_y + 10 >= buildings_bottom_y[i] - 10 && smart_y - 10 <= buildings_bottom_y[i] + 10 && top_building[i] == 0){
        bottom_building[i] = 0;
      }
    }
  }
}

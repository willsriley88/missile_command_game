int ammo_x = 40;
int ammo_y = 0;
int [] ammo_set_x;
int [] ammo_set_y;
void ammo_setup(){
    ammo_set_x = new int [0];
    ammo_set_y = new int [0];
  for ( i = 0; i < 45; i ++){
    ammo_set_x = append(ammo_set_x, ammo_x); 
    ammo_set_y = append(ammo_set_y, ammo_y);
    ammo_x += 5;
    ammo_y += 5;
  }
}

void ammo_storage(){
  for (i = 0; i < 44; i ++);{
    fill(255);
    noStroke();
    rect((width / 2) - ammo_set_x[i], (height - 150) + ammo_set_y[i], 50, 50);
  }println(ammo_set_x[i]);
}

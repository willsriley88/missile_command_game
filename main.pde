int i = 0;

void setup() {
  cursor(CROSS);
  background(0);
  frameRate(60);
  size(800, 800);
  fill(0, 255, 0);
  score = 0;
  level_counter = 0;
  level = 1;
  
  setup_buildings();
  setup_terrain();

  setup_bomb();
  setup_smart_bomb();

  setup_cannon();
  shoot_setup();
  ammo_setup();

}

void draw() {
  background(bg_colour1, bg_colour2, bg_colour3);

  draw_buildings();
    
  if (level_counter < 30 && level < 3){
    smart_bomb();
    
    collision_city_top();
    collision_city_bottom();
    collision_smart_city_bottom();
    collision_smart_city_top();
    
    abm_collision_detection();
    abm_collision_smart();
    
    bomb_counter();
    create_bomb();
     
    smart_bomb_explode();
    show_score();
  }
  for (i = 0; i < 10; i ++) {    
    render_cannon();
    if (ammo > 0){
    cannon_shoot();
    }
  }

  fill(terrain_colour1, terrain_colour2, terrain_colour3);
  noStroke();
  rect(0, height-100, width, height);
  noStroke();
  rect(width*.45, 650, 85, 50);
  
  draw_terrain();  
  ammo_storage();
}

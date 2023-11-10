PImage building_top;
PImage building_bottom;
PImage tree;

String level_2;
String end_game;

float level_counter;
int level;
int [] top_building = new int[6];
int [] bottom_building = new int[6];
int terrain_colour1;
int terrain_colour2;
int terrain_colour3;
int bg_colour1;
int bg_colour2;
int bg_colour3;
int terrain_setter_x;
int terrain_setter_y;
int setter_bottom;
int setter_top;
int [] buildings_top_x = new int [6];
int [] buildings_top_y = new int [6];
int [] buildings_bottom_x = new int [6];
int [] buildings_bottom_y = new int [6];
int [] tree_x = new int [6];
int [] tree_y = new int [6];

void setup_buildings(){
  building_top = loadImage("castle_top.png");
  building_bottom = loadImage("castle_bottom.png");
  tree = loadImage("tree.png");
  setter_bottom = 100;
  setter_top = 100;
  for(i = 0; i < buildings_bottom_x.length - 2; i++){
    buildings_bottom_x[i] = setter_bottom;
    buildings_bottom_y[i] = height - 100;
    setter_bottom += 100;
  }
    
  for(i = 3; i < buildings_bottom_x.length; i++){
    buildings_bottom_x[i] = setter_bottom;
    buildings_bottom_y[i] = height - 100;
    setter_bottom += 100;
  }
  
   for(i = 0; i < buildings_top_x.length - 2; i++){
    buildings_top_x[i] = setter_top;
    buildings_top_y[i] = height - 150;
    setter_top += 100;
  }
    
  for(i = 3; i < buildings_top_x.length; i++){
    buildings_top_x[i] = setter_top;
    buildings_top_y[i] = height - 150;
    setter_top += 100;
  }
  
  for (i = 0; i < 6; i ++){
    top_building[i] = 1;
    bottom_building[i] = 1;
  }
}
void setup_terrain(){
  level_2 = "LEVEL 2";
  end_game = "GAME OVER";
  bg_colour1 = 0;
  bg_colour2 = 0;
  bg_colour3 = 0;
  terrain_colour1 = 0; 
  terrain_colour2 = 255;
  terrain_colour3 = 0;
  terrain_setter_y = height - 50;
  for(i = 0; i < tree_x.length; i++){
    terrain_setter_y += random(20);
    tree_x[i] = terrain_setter_x + 100;
    tree_y[i] = terrain_setter_y;
    terrain_setter_x += 120;
    terrain_setter_y -= random(20);
  }
}

void draw_buildings(){
  for(i = 0; i < buildings_bottom_x.length; i++){
     if (bottom_building[i] != 0){
        image(building_bottom, buildings_bottom_x[i], buildings_bottom_y[i], 50, 55);
     }
  }
  
  for(i = 0; i < buildings_top_x.length; i++){
     if (top_building[i] != 0){
       image(building_top, buildings_top_x[i], buildings_top_y[i], 50, 55);
     }
  }
  
}

void draw_terrain(){
   for(i = 0; i < buildings_bottom_x.length; i++){
    image(tree, tree_x[i], tree_y[i], 30, 30);
  }if(level_counter >= 20 && level ==1){
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(100);
    text(level_2,400, 400);
  }else if (level == 3){
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(100);
    text(end_game,400, 400);
      fill(255, 0, 0);
      textAlign(CENTER, TOP);
      textSize(100);
      text("SCORE:" + str(score),400, 400);
  }
}

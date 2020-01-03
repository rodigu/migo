
All_Bullets bullet_controller;
ArrayList<Enemy> level_enemies = new ArrayList<Enemy>();

PFont font_01;
PFont font_02;

int[] key_press = {0,0,0,0,0};

float stroke_weight = 3;

float base_size;
Player player_one;

void setup(){
  frameRate(60);
  font_01 = loadFont("font_01.vlw");
  font_02 = loadFont("font_02.vlw");
  if(height > width) base_size = width/10;
  else base_size = height/15;
  textFont(font_01, base_size);
  //fullScreen();
  size(500, 800);
  player_one = new Player(new PVector(width/2, height/2), loadImage("player.png"));
  bullet_controller = new All_Bullets();
}

void draw(){
  background(250);
  level01();
}


PFont font_01;
PFont font_02;

void setup(){
  font_01 = loadFont("font_01.vlw");
  font_02 = loadFont("font_02.vlw");
  textFont(font_02, width/20);
  fullScreen();
  noStroke();
}

void draw(){
  background(0);
  fill(200,0,0);
  text("MIKKOSAMA", width/2, height/2);
}

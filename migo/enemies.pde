class Enemy{
  float x, y, enemy_color, enemy_size;
  int life;
  String type;
  Enemy(float x_in, float y_in, float color_in, String type_in){
    x = x_in;
    y = y_in;
    enemy_color = color_in;
    type = type_in;
    if(type == "type_0"){
      life = 2;
      enemy_size = base_size/60;
      enemy_color = color(200, 0, 0);
    }
  }

  void update(){
    if(type == "type_0"){
      strokeWeight(stroke_weight);
      fill(enemy_color);
      rect(x - enemy_size/2, y - enemy_size/2, enemy_size, enemy_size, 5);
    }
  }

}

class All_Enemies{
  ArrayList<Enemy> level_enemies = new ArrayList<Enemy>();
}

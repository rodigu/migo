class Enemy{
  float enemy_size;
  PVector velocity;
  PVector position;
  color enemy_color;
  int life;
  String type;
  Enemy(PVector position_in, color color_in, String type_in){
    position = position_in;
    enemy_color = color_in;
    type = type_in;
    if(type == "type_0"){
      life = 2;
      enemy_size = base_size;
      enemy_color = color(200, 0, 0);
      velocity = new PVector(0, 5);
    }
  }

  void update(){
    if(type == "type_0"){
      strokeWeight(stroke_weight);
      stroke(0);
      fill(enemy_color);
      rect(position.x - enemy_size/2, position.y - enemy_size/2, enemy_size, enemy_size, 10);
      if(frameCount%60 == 0) shoot();
    }
  }

  void shoot(){
    bullet_controller.red_bullets.add(new Bullet(1,
      new PVector(position.x, position.y),
      new PVector(0, 10), enemy_size/10, enemy_color));
  }

}

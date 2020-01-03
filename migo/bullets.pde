class All_Bullets{
  ArrayList<Bullet> red_bullets = new ArrayList<Bullet>();
  ArrayList<Bullet> blue_bullets = new ArrayList<Bullet>();
  All_Bullets(){

  }

  void update(){
    for (int i = 0; i < blue_bullets.size(); i++){
      Bullet b = blue_bullets.get(i);
      b.display();
      if (b.position.y <= 0){
        blue_bullets.remove(i);
      }
    }
    for (int i = 0; i < red_bullets.size(); i++){
      Bullet b = red_bullets.get(i);
      b.display();
      if (b.position.y <= 0 || b.position.y >= height ||
        b.position.x <= 0 || b.position.x >= width){
        red_bullets.remove(i);
      }
    }

  }

  void collision_check(){
    
  }

}

class Bullet{
  PVector velocity;
  PVector position;
  float damage, bullet_size;
  color bullet_color;
  Bullet(float d, PVector position_in, PVector velocity_in,
         float size_in, color color_in){
    damage = d;
    position = position_in;
    velocity = velocity_in;
    bullet_color = color_in;
    bullet_size = size_in;
  }
  void display(){
    position.add(velocity);
    fill(bullet_color);
    strokeWeight(stroke_weight/3);
    rect(position.x - bullet_size/2, position.y, bullet_size, 2*bullet_size);
  }
}

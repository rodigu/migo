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
  float damage;
  String bullet_type;
  Bullet(float d, PVector position_in, PVector velocity_in, String bullet_type){
    damage = d;
    position = position_in;
    velocity = velocity_in;
    bullet_image = image_in;
    bullet_image.resize(int(base_size), int(base_size));
  }
  void display(){
    position.add(velocity);
    image(bullet_image, position.x - bullet_image.width/2,
          position.y - bullet_image.height/2);
  }
}

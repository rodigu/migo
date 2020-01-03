class All_Bullets{
  ArrayList<Bullet> red_bullets = new ArrayList<Bullet>();
  ArrayList<Bullet> blue_bullets = new ArrayList<Bullet>();
  All_Bullets(){

  }

  void update(){
    for (int i = 0; i < blue_bullets.size(); i++){
      Bullet b = blue_bullets.get(i);
      b.display();
      if (b.y <= 0){
        blue_bullets.remove(i);
      }
    }

  }

}

class Bullet{
  float damage, x, y, speed, bullet_size;
  color bullet_color;
  Bullet(float d, float xt, float yt, float speed_in, float size_in, color color_in){
    damage = d;
    x = xt;
    y = yt;
    speed = speed_in;
    bullet_size = size_in;
    bullet_color = color_in;
  }
  void display(){
    y += speed;
    fill(bullet_color);
    strokeWeight(stroke_weight/3);
    rect(x - bullet_size/2, y, bullet_size, 2*bullet_size);
  }
}

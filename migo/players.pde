class Player{
  float x, y, player_size = base_size/50, speed = 10;
  color player_color;
  int life = 3;
  Player(float x_in, float y_in, color color_in){
    x = x_in;
    y = y_in;
    player_color = color_in;
  }

  void update(){
    player_control();
    strokeWeight(stroke_weight);
    fill(player_color);
    triangle  (x, y - player_size*base_size,
               x - player_size*base_size/2, y + player_size*base_size/2,
               x + player_size*base_size/2, y + player_size*base_size/2);
    strokeWeight(stroke_weight/2);
    circle(x, y, player_size*20);
  }

  void player_control(){
    if(key_press[0] == 1) y -= speed;
    if(key_press[1] == 1) y += speed;
    if(key_press[2] == 1) x -= speed;
    if(key_press[3] == 1) x += speed;
    if(key_press[4] == 1 && frameCount%10 == 0) shoot();
  }

  void shoot(){
    bullet_controller.blue_bullets.add(new Bullet(-1, x, y, -2*speed, player_size*10,
      player_color));
  }
}

class Player{
  float player_size = base_size/50;
  PVector position;
  color player_color;
  int bullet_interval = 1;
  int life = 3;
  Player(PVector position_in, color color_in){
    position = position_in;
    player_color = color_in;
  }

  void update(){
    player_control();
    
  }

  void player_control(){
    position = new PVector(mouseX, mouseY);
    if((key_press[4] == 1 || mousePressed) && frameCount%bullet_interval == 0) shoot();
  }

  void shoot(){
    bullet_controller.blue_bullets.add( new Bullet(1,
      new PVector(position.x, position.y - player_size*base_size/2),
      new PVector(0, -40), loadImage("player.png")) );
  }
}

class Player{
  float player_size = base_size/50;
  PVector position;
  PImage player_image;
  int bullet_interval = 1;
  int life = 3;
  Player(PVector position_in, PImage image_in){
    position = position_in;
    player_image = image_in;
    player_image.resize(int(base_size), int(base_size));
  }

  void update(){
    player_control();
    image(player_image, position.x - player_image.width/2, position.y - player_image.height/2);
  }

  void player_control(){
    position = new PVector(mouseX, mouseY);
    if((key_press[4] == 1 || mousePressed) && frameCount%bullet_interval == 0) shoot();
  }

  void shoot(){
    bullet_controller.blue_bullets.add( new Bullet(1,
      new PVector(position.x, position.y - player_image.height/2),
      new PVector(0, -40), loadImage("player_bullet.png")) );
  }
}

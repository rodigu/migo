class Enemy{
  PImage enemy_image;
  PVector velocity;
  PVector position;
  color enemy_color;
  int life;
  String type;
  Enemy(PVector position_in, String type_in){
    position = position_in;
    type = type_in;
    String temp_image = "enemy_" + type_in + ".png";
    if(type == "0"){
      life = 2;
      enemy_image = loadImage(temp_image);
      velocity = new PVector(0, 5);
    }
  }

  void update(){
    if(type == "0"){
      image(enemy_image, position.x - enemy_image.width/2, position.y - enemy_image.width/2);
      if(frameCount%60 == 0) shoot();
    }
  }

  void shoot(){
    bullet_controller.red_bullets.add( new Bullet(1,
      new PVector(position.x, position.y),
      new PVector(0, 10), loadImage("enemy_0.png")) );
  }

}

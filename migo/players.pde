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
    //strokeWeight(stroke_weight);
    noStroke();
    fill(player_color);
    beginShape();
      vertex(position.x, position.y - player_size*base_size);
      //vertex(x - player_size*base_size/4, y);
      //vertex(x - player_size*base_size/2, y - player_size*base_size/4);
      vertex(position.x - player_size*base_size/2, position.y + player_size*base_size/2);
      vertex(position.x + player_size*base_size/2, position.y + player_size*base_size/2);
      //vertex(x + player_size*base_size/2, y - player_size*base_size/4);
      //vertex(x + player_size*base_size/4, y);
      //triangle  (x, y - player_size*base_size,
      //           x - player_size*base_size/2, y + player_size*base_size/2,
      //           x + player_size*base_size/2, y + player_size*base_size/2);
    endShape(CLOSE);
    strokeWeight(stroke_weight/2);
    stroke(0);
    circle(position.x, position.y, player_size*20);
  }

  void player_control(){
    position = new PVector(mouseX, mouseY);
    if((key_press[4] == 1 || mousePressed) && frameCount%bullet_interval == 0) shoot();
  }

  void shoot(){
    bullet_controller.blue_bullets.add(new Bullet(1,
      new PVector(position.x, position.y - player_size*base_size/2),
      new PVector(0, -40), player_size*5, player_color));
  }
}

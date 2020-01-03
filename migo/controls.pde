void keyPressed(){
  if(keyCode == UP) key_press[0] = 1;
  if(keyCode == DOWN) key_press[1] = 1;
  if(keyCode == LEFT) key_press[2] = 1;
  if(keyCode == RIGHT) key_press[3] = 1;
  if(key == ' ') key_press[4] = 1;
}
void keyReleased(){
  if(keyCode == UP) key_press[0] = 0;
  if(keyCode == DOWN) key_press[1] = 0;
  if(keyCode == LEFT) key_press[2] = 0;
  if(keyCode == RIGHT) key_press[3] = 0;
  if(key == ' ') key_press[4] = 0;
}

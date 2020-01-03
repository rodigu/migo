
void master_update(){
  bullet_controller.update();
  for(Enemy temp_enemy : level_enemies){
    temp_enemy.update();
  }
  player_one.update();
}

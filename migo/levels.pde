
int level_progress = 0;

void level01(){
  if(level_progress == 0){
    level_enemies.add(new Enemy(new PVector(0, 0), "0"));
    level_progress++;
  }

  master_update();

}

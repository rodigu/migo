
int level_progress = 0;

void level01(){
  if(level_progress == 0){
    level_enemies.add(new Enemy(new PVector(width/2, height/2), "0"));
    level_progress++;
  }

  master_update();

}

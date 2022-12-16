//This function draws the GAMEOVER screen.

void gameOver() {
  background(black);
  backToStart.show();
  money = 100;
  health = 100;
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  waveNumber = 0;

  textSize(75); 
  fill(255); 
  text("Game Over", width/2, 300); 

  if (backToStart.clicked) {
    mode = INTRO;
  }
}

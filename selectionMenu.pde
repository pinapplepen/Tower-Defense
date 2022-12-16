void selectionMenu() {

  background(0);
  fill(grass);
  text("easy", width/4, 100);
  fill(gold);
  text("normal", 3*width/4, 100);
  fill(red);
  text("hard", width/2, 400);

  springPlay.show();
  summerPlay.show();
  winterPlay.show();

  if (springPlay.clicked) {
    mode = PLAY;
    mapSelector = 0;
  }
  if (summerPlay.clicked) {
    mode = PLAY;
    mapSelector = 1;
  }
  if (winterPlay.clicked) {
    mode = PLAY;
    mapSelector = 2;
  }
}

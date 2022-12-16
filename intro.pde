//This function draws the INTRO screen.
int s = 100;
float currentSize = 0;

void intro() {



  introAnimation.show();

  start.show();

  //gName.show();
  //gName.animateText();
  //gName.goTogether();

  int s = 100;
  if (currentSize < s) {
    //delay
    currentSize = currentSize + 10;
  }

  textSize(currentSize);
  fill(black);
  text("Tower Defense", width/2, height/3);



  if (start.clicked) {
    mode = SELECTION;
  }
}

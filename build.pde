//This function draws the BUILD screen

void build() {
  drawMap();
  animateThings();
  drawPlayInterface();
  buttonClicks();



  textSize(50);
  fill(0);
  text("Build Mode", 400, height/2);

  //Build Menu Rectangle
  fill(buildMenu);
  strokeWeight(0);
  rect(1000+13, height/2, 400, 800); //+13 offset strokeWeight
  if (broke > 0) {
    text("Error: No money", 400, 200);
    broke --;
  }


  //Buttons
  backFromBuild.show();
  watchTower.show();
  ballista.show();
  conscripts.show();
  gas.show();
  deathRayPrototype.show();

  text("Gold: " + money, 1100, 700);
}

void buttonClicks() {
  if (backFromBuild.clicked) {
    mode = PLAY;
  }

  if (watchTower.clicked && money >= 100) {
    towers.add(new Tower(0, 0, 0, 30, 0));
  } else if (watchTower.clicked && money < 100) {
    broke = 100;
  }
  if (ballista.clicked&& money >= 100) {
    towers.add(new Tower(0, 0, 0, 30, 1));
  } else if (ballista.clicked && money < 100) {
    broke = 100;
  }
  if (conscripts.clicked&& money >= 150) {
    towers.add(new Tower(0, 0, 0, 150, 2));
  } else if (conscripts.clicked && money < 150) {
    broke = 100;
  }
  if (gas.clicked&& money >= 200) {
    towers.add(new Tower(0, 0, 0, 30, 3));
  } else if (gas.clicked && money < 200) {
    broke = 100;
  }
  if (deathRayPrototype.clicked&& money >= 300) {
    towers.add(new Tower(0, 0, 0, 30, 4));
  } else if (deathRayPrototype.clicked && money < 300) {
    broke = 100;
  }
}

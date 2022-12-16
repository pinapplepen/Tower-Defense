//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {

  final int PLACING = 0;
  final int PLACED  = 1;

  float x, y;
  int coolUp, threshold;
  int towerMode;
  int towerType;
  int urMum = 0;
  int i = 0;

  Tower(float _x, float _y, int _coolUp, int _threshold, int _towerType) {
    x = _x;
    y = _y;
    coolUp = _coolUp; //changing variable
    threshold = _threshold; //how long in between shots
    towerMode = PLACING;
    towerType = _towerType;
  }


  void show() {
    stroke(black);
    strokeWeight(4);
    fill(blue);

    if (towerType == 0) {
      arrowTower();
    } else if (towerType == 1) {
      ballistaTower();
    } else if (towerType == 2) {
      conscriptTower();
    } else if (towerType == 3) {
      gasTower();
    } else if (towerType == 4) {
      deathRay();
    }
  }

  void arrowTower() {

    if (towerMode == PLACED) {
      square(x, y, 20);  //draw tower at xy
    } else if (towerMode == PLACING) {
      square(mouseX, mouseY, 20);  //draw tower at mouse xy
      if (mousePressed && mouseX < 800-13 && mouseY > 150+13) { //pressed inside the game space
        towerMode = PLACED;
        money = money - 100;
        x = mouseX;
        y = mouseY;
      }
    }
  }

  void ballistaTower() {
    if (towerMode == PLACED) {
      square(x, y, 20);  //draw tower at xy
      rect(x, y, 50, 10);
      rect(x, y, 10, 50);
    } else if (towerMode == PLACING) {
      square(mouseX, mouseY, 20);  //draw tower at mouse xy
      rect(mouseX, mouseY, 50, 10);
      rect(mouseX, mouseY, 10, 50);

      if (mousePressed && mouseX < 800-13 && mouseY > 150+13) { //pressed inside the game space
        towerMode = PLACED;
        money = money - 100;
        x = mouseX;
        y = mouseY;
      }
    }
  }

  void conscriptTower() {
    if (towerMode == PLACED) {
      circle(x+40, y, 30);
      circle(x, y, 30);
      circle(x-40, y, 30);
    } else if (towerMode == PLACING) {
      circle(mouseX+40, mouseY, 30);
      circle(mouseX, mouseY, 30);
      circle(mouseX-40, mouseY, 30);   //draw tower at mouse xy
      if (mousePressed && mouseX < 800-13 && mouseY > 150+13) { //pressed inside the game space
        towerMode = PLACED;
        money = money - 150;
        x = mouseX;
        y = mouseY;
      }
    }
  }

  void gasTower() {
    if (towerMode == PLACED) {
      triangle(x + 20, y, x - 20, y, x, y - 40);
      triangle(x + 20, y - 20, x - 20, y - 20, x, y + 20);
    } else if (towerMode == PLACING) {
      triangle(mouseX + 20, mouseY, mouseX - 20, mouseY, mouseX, mouseY - 40);
      triangle(mouseX + 20, mouseY - 20, mouseX - 20, mouseY - 20, mouseX, mouseY + 20);
      if (mousePressed && mouseX < 800-13 && mouseY > 150+13) { //pressed inside the game space
        towerMode = PLACED;
        money = money - 200;
        x = mouseX;
        y = mouseY;
      }
    }
  }

  void deathRay() {
    if (towerMode == PLACED) {
      rect(x, y, 5, 15);
      rect(x, y, 15, 5);
    } else if (towerMode == PLACING) {
      rect(mouseX, mouseY, 5, 15);
      rect(mouseX, mouseY, 15, 5);
      if (mousePressed && mouseX < 800-13 && mouseY > 150+13) { //pressed inside the game space
        towerMode = PLACED;
        money = money - 300;
        x = mouseX;
        y = mouseY;
      }
    }
  }


  void act() {



    if (towerType == 0) {
      coolUp++;
      if (coolUp >= threshold) {
        coolUp = 0;
        bullets.add(new Bullet(x, y, 0, -10, 1, 0)); //up
        bullets.add(new Bullet(x, y, 0, 10, 1, 0)); //down
        bullets.add(new Bullet(x, y, -10, 0, 1, 0)); // left
        bullets.add(new Bullet(x, y, 10, 0, 1, 0)); // right
      }
    } else if (towerType == 1) {
    } else if (towerType == 2) {
      coolUp++;
      if (coolUp >= threshold) {
        coolUp = 0;
        bullets.add(new Bullet(x-40, y, 0, -10, 1, 0)); //up
        bullets.add(new Bullet(x, y, 0, -10, 1, 0)); //up
        bullets.add(new Bullet(x+40, y, 0, -10, 1, 0)); //up

        bullets.add(new Bullet(x-40, y, 0, 10, 1, 0)); //down
        bullets.add(new Bullet(x, y, 0, 10, 1, 0)); //down
        bullets.add(new Bullet(x+40, y, 0, 10, 1, 0)); //down
      }
    } else if (towerType == 3) {

      // coolUp++;
      //if (coolUp >= threshold) {
      //  coolUp = 0;
      //  bullets.add(new Bullet(x, y, 0, 0, 1, 3)); //up

      coolUp++;
      urMum++;
      if (coolUp >= 300) {

        bullets.add(new AoE_Ring(x, y));
        coolUp = 0;
      }

      //if (urMum >= 1000) {

      //  while(i > bullets.size()){
      //  bullets.remove(i);
      //  urMum = 0;
      //  i++;
      //  }

      //}
    } else if (towerType == 4) {

      coolUp++;
      if (coolUp >= threshold && laserBullets < 1) {
        coolUp = 0;
        bullets.add(new Bullet(x, y, 0, -10, 1, 4)); //up
        laserBullets++;
        println("laserbullets is now:"+ laserBullets);
      }
    }
  }
}

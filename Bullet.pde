//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.

class Bullet {
  float x, y, vx, vy, d;
  float hp;
  int bulletType;

  Bullet(float _x, float _y, float _vx, float _vy, float _hp, int _bulletType) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 15; //diameter of bullet
    hp = _hp;
    bulletType = _bulletType;
  }

  void show() {

    if (bulletType == 0) {
      stroke(black);
      strokeWeight(4);
      fill(blue);
      circle(x, y, d);
    }
    if (bulletType == 1) {
    }
    if (bulletType == 2) {
      stroke(black);
      strokeWeight(3);
      fill(blue);
      circle(x, y, d);
    }
    if (bulletType == 3) {
      fill(gasGreen, 120);
      circle(x, y, d);

      //while (d < 1000) {
      //  d = d + 1;
      //}
      //if (d >= 1000){
      //d = 0;
      //}
    }
    if (bulletType == 4) {
      if (mobs.size() > 0) {
        Mob myMob = mobs.get(0);
        stroke(25);
        line(myMob.x, myMob.y, x, y);
      }
    }
  }
  int counterthing = 0;
  void act() {


    if (bulletType == 0) { //==================================================
      x = x+vx;
      y = y+vy;

      if (x > 800 - d/2 - 13|| y > height + d/2 || x < 0 - d/2 || y < 150 + d/2 + 13) { //13 is compensating for strokeweight (25)
        hp = 0;
      }
    }
    if (bulletType == 1) { //===================================================
    }
    if (bulletType == 2) { //=================================================
      x = x+vx;
      y = y+vy;

      //why is this code unecessary???
      //if (x > 800 - d/2 - 13|| y > height + d/2 || x < 0 - d/2 || y < 150 + d/2 + 13){ //13 is compensating for strokeweight (25)
      // hp = 0;
      // }
    }
    if (bulletType == 3) {//======================================================
      //if (d > 200) {
      //hp = hp -1;
      //}

      //while (300 > counterthing){
      //  counterthing ++;
      //}
      //hp = 0;
    }
    if (bulletType == 4) {//====================================================
      if (mobs.size() > 0) {
        Mob myMob = mobs.get(0);
        myMob.hp = myMob.hp - 0.05;
      }
    }
  }
}

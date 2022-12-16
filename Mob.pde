//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob { //Mob HP, Size, Speed


  float x, y, vx, vy, d;
  float hp;
  int type;


  /*
  1 = Default
   2 = Fat
   3 = Speedy
   
   
   */


  Mob(float _x, float _y, float _vx, float _vy, int _type, float _d, float _hp) {

    x = _x;
    y = _y + 150;


    vx = _vx;
    vy = _vy;

    d = _d;
    hp = _hp;
    type = _type;
  }

  void show() {


    if (type == 1) {
      fill(black);
      strokeWeight(3);
      fill(defaultMob);
      circle(x, y, d);
      fill(red);
      rect(x, y + d, hp*15, 8);
    }

    if (type == 2) {
      fill(black);
      strokeWeight(3);
      fill(bigMob);
      circle(x, y, d);
      fill(black);
      rect(x, y + d, hp*15/2, 8); // hp bar divide by 2, should decrease half as slowly
    }

    if (type == 3) {
      fill(black);
      strokeWeight(3);
      fill(speedMob);
      circle(x, y, d);
      fill(red);
      rect(x, y + d + 10, hp*15, 8); //add extra 10 to y because hp bar is touching the circle
    }
  }

  void act() {

    x = x +vx;
    y = y+vy;


    //Reach the end
    if (x > 800 - d/2) { //right side of play, lose one castle hp
      if (type == 1) {
        health = health - 5;
        hp = 0;
      }

      if (type == 2) {
        health = health - 20;
        hp = 0;
      }

      if (type == 3) {
        health = health - 15;
        hp = 0;
      }
    }
    //Change Direction
    if (mapSelector == 0) {
      int i = 0;
      while (i < nodes.length) {
        if (dist(nodes[i].x, nodes[i].y + 150, x, y) < 1 && type == 1 && nodes[i].map == 0) {

          vx = nodes[i].dx;
          vy = nodes[i].dy;
        } else if (dist(nodes[i].x, nodes[i].y + 150, x, y) < 1 && type == 2 && nodes[i].map == 0) {

          vx = nodes[i].dx;
          vy = nodes[i].dy * 0.5;
        } else if (dist(nodes[i].x, nodes[i].y + 150, x, y) < 1 && type == 3 && nodes[i].map == 0) {

          vx = nodes[i].dx*2;
          vy = nodes[i].dy*2;
        }
        i++;
      }
    }
    if (mapSelector == 1) {
      int i = 0;
      while (i < nodes.length) {
        if (dist(nodes[i].x, nodes[i].y + 150, x, y) < 1 && type == 1 && nodes[i].map == 1) {

          vx = nodes[i].dx;
          vy = nodes[i].dy;
        } else if (dist(nodes[i].x, nodes[i].y + 150, x, y) < 1 && type == 2 && nodes[i].map == 1) {

          vx = nodes[i].dx;
          vy = nodes[i].dy * 0.5;
        } else if (dist(nodes[i].x, nodes[i].y + 150, x, y) < 1 && type == 3 && nodes[i].map == 1) {

          vx = nodes[i].dx*2;
          vy = nodes[i].dy*2;
        }
        i++;
      }
    }

    //If distane from bullet xy to my mob's xy is less, both lose some hp
    int i = 0;
    i = 0;
    while (i < bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (myBullet.bulletType == 0 || myBullet.bulletType == 2) { //Normal Bullets
        if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
          hp = hp - 1;
          myBullet.hp = myBullet.hp - 1;
        }
      }

      if (myBullet.bulletType == 3) { //Gas Tower Bullets
        if (dist(myBullet.x, myBullet.y, x, y) < 100 + myBullet.d/2) {
          hp = hp - 0.005;
          //myBullet.hp = myBullet.hp - 0.003;
        }
      }
      i++;
    }
  }
}

//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.

class AoE_Ring extends Bullet {
  float timer;

  AoE_Ring(float _x, float _y) {
    super(_x, _y, 0, 0, 1, 3);
    timer = 150;
    d = 200;
  }

  void act() {
    timer--;
    if (timer <= 0 ) {
      hp--;
      println("HP -1");
    }
  }
}

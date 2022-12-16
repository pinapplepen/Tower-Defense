//Nodes are invisible objects that we place on the map
//to direct the flow of mobs. When a mob collides with
//a node object, it will change direction according to
//the node's instructions.

class Node {
  int x, y, dx, dy, map;

  Node(int _x, int _y, int _dx, int _dy, int _map) {
    x = _x;
    y = _y;
    dx = _dx;
    dy = _dy;
    map = _map;
  }

  void show() {
    fill(red);
    stroke(red);
    pushMatrix();
    translate(0, 150);
    circle(x, y, 30);
    line(x, y, x+dx*50, y+dy*50);
    popMatrix();
  }
}

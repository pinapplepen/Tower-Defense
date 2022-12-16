void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && mousePressed == false) {
    mouseReleased = true;
    wasPressed = false;
  }
}

class dText {

  int x, y, s, d, d2;
  float c;

  String str, str2;
  PFont f;

  dText(String _str, int _x, int _y, int _s, PFont _f) {

    str = _str;
    x = _x;
    y = _y;
    s = _s;
    f = _f;
  }

  dText(String _str, int _x, int _y, int _s, float _c, PFont _f) {
    str = _str;
    x = _x;
    y = _y;
    s = _s; //Max Size
    c = _c; //Change in size
    f = _f;
  }

  dText(String _str, String _str2, int _x, int _y, int _s, int _d, int _d2, PFont _f) {
    str = _str;
    str2 = _str2;
    x = _x;
    y = _y;
    s = _s;
    d = _d;
    d2 = _d2;
    f = _f;
  }

  void show() {
    textFont(f);
    textSize(s);
    text(str, x, y);
  }

  void goTogether() {
    int start = 0;
    int start2 = width;

    while (start < x) {
      text(str, start, y);
      start++;
    }


    while (start2 > y) {
      text(str2, start2, y);
      start--;
    }
  }


  void animateText() {
    textFont(f);

    float currentSize = 0;

    while (currentSize < s) {
      //delay
      currentSize = currentSize + c;
      textSize(currentSize);
      text(str, x, y);
    }

    if (currentSize >= s) {
      currentSize = 0;
    }
  }
}

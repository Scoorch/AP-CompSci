class Rain {
  float x, y, v;
  boolean f1;

  Rain(float tx, float ty) {
    x = tx;
    y = ty;

    v = random(3, 8);
    f1 = true;
  }

  void show() {
    if (f1) {

      f1 = false;
    }

    stroke(#7487B7);
    line(x, y, x, y + 10);
  }

  void fall() {
    y += v;
    if (y > height) {
      for (int i = 0; i < myRain.length; i ++) {
        if (myRain[i] == this) { // makes current blank to be used again
          myRain[i] = null;
        }
      }
    }
  }
}

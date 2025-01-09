class Rain {
  float x, y, v;
  boolean f1;

  Rain() {
    v = random(3, 8);
    f1 = true;
  }

  void show(float tx, float ty) {
    if (f1) {
      x = tx;
      y = ty;
      f1 = false;
    }
    
    stroke(0, 0, 255);
    line(x, y, x, y + 10);
  }

  void fall() {
  }
}

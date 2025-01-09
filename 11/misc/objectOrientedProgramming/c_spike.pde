class Spike {
  float x, y, w;

  Spike() {
    stroke(0);
    fill(255);
    
    x = random(0, width);
    y = random(0, height);
    w = random(5, 150);
  }

  void show() {
    ellipse(x, y, w, w/3);
  }

  void grow() {
    if (w > 1) {
      y -= 2;
      w -= 1;
    }
  }
}

class Ripple {
  float x, y, h, s, b, size, alpha;

  Ripple() {
    noFill();
    
    x = random(width);
    y = random(height);
    h = random(255);
    //s = random(255);
    //b = random(255);
    size = random(200);
  }

  void show() {
    alpha = map(size, 0, 200, 255, 0);
    stroke(h, 255, 255, alpha);
    ellipse(x, y, size, size/2);
  }

  void act() {
    size += 3;
    if (size >= 200) {
      //x = random(width);
      //y = random(height);
      x = mouseX;
      y = mouseY;
      h = random(255);
      //s = random(255);
      //b = random(255);

      size = 0;
    }
  }
}

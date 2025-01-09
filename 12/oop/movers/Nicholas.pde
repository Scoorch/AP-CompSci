class Nicholas {

  // instance variables
  float x, y;
  float potato = random(0, 360);

  // constructor
  Nicholas() {
    x = width/2;
    y = height/2;
  }
  
  // behavior
  void show() {
    colorMode(HSB, 360, 100, 100);
    stroke(potato, 100, 100);
    strokeWeight(1);
    fill(potato, 100, 100);
    circle(x, y, 1);
    //stroke(random(0, 260), 100, 100);
    //strokeWeight(1);
    //fill(random(0, 260), 100, 100);
    //circle(x, y, 1);
  }
  
  void act() {
    x += random(-2, 2);
    y += random(-2, 2);
    if (x > width) {
      x -= 3;
    }
    if (x < 0) {
      x += 3;
    }
    if (y > height) {
      y -= 3;
    }
    if (y < 0) {
      y += 3;
    }
  }
}

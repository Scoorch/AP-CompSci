class Mover {

  // instance variables
  float x, y;
  float potato; // color
  float freeze = 99;
  float eggplant;

  // constructor
  Mover(float bean, boolean c) {
    x = width/2;
    y = height/2;
      potato = bean; // initial color
    if (c == false) {
      freeze = 0;
    }
  }

  // behavior
  void show(boolean f, boolean s) {
    colorMode(HSB, 360, 100, 100);
    if (f == true) { // flashing colors on/off
      potato = random(0, 360);
    }
    if (s == true) { // random size on/off
      eggplant = random(0, 100);
    } else {
      eggplant = 50;
    }
    stroke(0);
    strokeWeight(1);
    fill(potato, freeze, 99);
    circle(x, y, eggplant);
    //stroke(random(0, 260), 100, 100);
    //strokeWeight(1);
    //fill(random(0, 260), 100, 100);
    //circle(x, y, 1);
  }

  void act() {
    x += random(-1, 1);
    y += random(-1, 1);
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

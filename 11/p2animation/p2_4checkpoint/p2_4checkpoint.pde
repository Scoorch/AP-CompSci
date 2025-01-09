// Trevor Chen
// 2-2
// 23/2/15

int x, y;

void setup() {
  size(600, 600);
  x = 0;
  y = 0;
  strokeWeight(5);
}

void draw() {
  background(255);
  circle(x, y, 200);
  y += 1;
  x += 1;
  if (y > 700) {
    y = -100;
  }
  if (x > 700) {
    x = -100;
  }
}

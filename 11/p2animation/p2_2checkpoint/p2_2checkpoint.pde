// Trevor Chen
// 2-2
// 23/2/15

int x;

void setup() {
  size(600, 600);
  x = 700;
  strokeWeight(5);
}

void draw() {
  background(255);
  circle(x, 300, 200);
  x -= 1;
  if (x < -100) {
    x = 700;
  }
}

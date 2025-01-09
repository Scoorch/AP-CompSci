// Trevor Chen
// 2-2
// 23/2/15

int x, size;

void setup() {
  size(600, 600);
  x = 0;
  size = 0;
  strokeWeight(5);
}

void draw() {
  background(255);
  circle(x, 300, size);
  size += 1;
  x += 5;
  if (x > 700) {
    size = 0;
    x = 0;
  }
}

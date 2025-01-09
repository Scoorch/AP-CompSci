// Trevor Chen
// 2-2
// 23/2/15

int y1, y2;

void setup() {
  size(600, 600);
  y1 = 0;
  y2 = 700;
  strokeWeight(5);
}

void draw() {
  background(255);
  circle(150, y1, 200);
  circle(450, y2, 200);
  y1 += 1;
  y2 -= 1;
  if (y1 > 700) {
    y1 = -100;
    y2 = 700;
  }
}

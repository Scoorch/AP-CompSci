// Trevor Chen
// 2-2
// 23/2/15

int size;

void setup() {
  size(600, 600);
  size = 0;
  strokeWeight(5);
}

void draw() {
  background(255);
  circle(300, 300, size);
  size += 1;
  if (size > 850) {
    size = 0;
  }
}

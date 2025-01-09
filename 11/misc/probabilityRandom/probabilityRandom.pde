// Trevor Chen
//2-2
//22/2/28

int p1, p2, p3, p4;

void draw() {
  int steps = (int)random(1, 4);
  for (float i = 0; i < steps; i++) {
    if (steps == 1) {
      p1 += 1;
    } else {
      if (steps == 2) {
        p2 += 1;
      } else {
        if (steps == 3) {
          p3 += 1;
        } else {
          p4 += 1;
        }
      }
    }
  }
  println("p1:", p1, "p2:", p2, "p3:", p3, "p4:", p4); // " for multi chars ' for single
}

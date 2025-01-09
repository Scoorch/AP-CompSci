float[] bx = new float[3];
float[] by = new float[3];

void button(float x, float y, int a) {
  bx[a] = x;
  by[a] = y;
  strokeWeight(1);
  if (dist(mouseX, mouseY, bx[a], by[a]) <= 50) {
    stroke(255); // tactile
  } else {
    stroke(0);
  }
  fill(200);
  circle(x, y, 100);
}
void mouseReleased() {
  if (dist(mouseX, mouseY, bx[0], by[0]) <= 50) {
    if (mode == 0) {
      mode ++;
      background(255);
      timer = timerR;
    } else if (mode == 2) {
      life = 3;
      score = 0;
      mode = -1;
    }
  }

  if (dist(mouseX, mouseY, bx[1], by[1]) <= 50) {
    if (mode == 0) {
      mode ++;
      background(255);
      cFont = 1;
      timer = timerR-2;
    }
  }

  if (dist(mouseX, mouseY, bx[2], by[2]) <= 50) {
    if (mode == 0) {
      mode ++;
      background(255);
      cFont = 2;
      timer = timerR-4;
    }
  }
}

float bx, by;

void button(float x, float y) {
  bx = x;
  by = y;
  if (dist(mouseX, mouseY, bx, by) <= 50) {
    stroke(0);
  } else {
    noStroke();
  }
  fill(255, 150);
  circle(x, y, 100);
}
void mousePressed() {
  if (dist(mouseX, mouseY, bx, by) <= 50) {
    if (mode < 2) {
      mode ++;
    } else {
      mode = 0;
    }
  }
}

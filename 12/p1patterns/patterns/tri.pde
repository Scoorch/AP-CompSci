void tri() {
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < height; i += 10) {
    for (int j = 0; j < width; j += 10) {
      int ir = 90*int(random(0, 2));
      tri(5+j, 5+i, ir, int(random(0, 360)), int(random(0, 101)), int(random(50, 101)));
      tri(5+j, 5+i, ir+180, int(random(0, 360)), int(random(0, 101)), int(random(50, 101)));
    }
  }
}

void tri(float x, float y, float r, float h, float s, float b) {
  fill(h, s, b);
  pushMatrix();
  translate(x, y);
  rotate(radians(r));
  triangle(-5, -5, 5, -5, -5, 5);
  popMatrix();
}

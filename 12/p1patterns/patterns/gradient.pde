float c = 0;

void gradient() {
  smooth(1);
  colorMode(RGB, 255, 255, 255);
  for (int i = 0; i < height; i++) {
    c = map(i, 0, height, 0, 255);

    stroke(0);
    strokeWeight(1);
    fill(c, 0, 255-c);
    ellipse(width/2, 900-i, width, 900-i);
  }
  c = 0;
}

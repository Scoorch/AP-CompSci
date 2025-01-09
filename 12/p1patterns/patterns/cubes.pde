boolean offset = false;
float rotation = 0;
int transparency = 0;

void cubes() {
  noStroke();
  background(#0095D5);
  colorMode(RGB, 255, 255, 255, 255);
  for (int i = 0; i < 3; i ++) {
    for (int j = 0; j < height; j += 85.7) {
      for (int k = 0; k < width + 100; k += 100) {
        if (offset == false) {
          diamond(k, j, rotation);
        } else {
          diamond(k-50, j, rotation);
        }
      }
      offset = !offset;
    }
    offset = false;
    rotation += 60;
    transparency -= 1;
  }
  rotation = 0;
  transparency = 3;
}

void diamond(float x, float y, float r) {
  fill(255, 255, 255, map(transparency, 1, 3, 0, 255));
  pushMatrix();
  translate(x, y);
  rotate(radians(r));
  quad(0, 0, 50, -28.6, 100, 0, 50, 28.6);
  //triangle(1000, 1500, 1500, 1215, 1500, 1785); // equilateral triangle
  popMatrix();
}

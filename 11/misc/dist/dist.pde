size(600, 600);
stroke(20);

// aka dist(x1, y1, x2, y2);
float pythagorean(float x1, float y1, float x2, float y2) {
  float dx = abs(x1 - x2);
  float dy = abs(y1 - y2);
  return(sqrt(dx * dx + dy * dy));
}

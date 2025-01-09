void setup() {
  size(400, 400, P3D);
  background(0);
  noStroke();
}
void draw() {
  //directionalLight(126, 126, 126, 0, 0, -1);
  lightFalloff(0.0, 0.010, 0.0);
  ambientLight(0, 255, 0, width, 308, -21);
  ambientLight(0, 0, 255, 79, 170, -8);
  translate(128, 200, 0);
  rotateY(PI/5);
  box(160);
  translate(240, 0, 0);
  sphere(120);
}

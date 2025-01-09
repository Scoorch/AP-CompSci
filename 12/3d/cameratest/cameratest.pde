void setup() {
  size(400, 400, P3D);
  noFill();
}
void draw() {
  background(255);
  beginCamera();
  pushMatrix();
 
  camera();
  translate(0, -2, 0);
  rotateX(0);
  endCamera();
  popMatrix();
  box(100);
  translate(200, 0, 0);
  rotateY(0);
  box(180);
}

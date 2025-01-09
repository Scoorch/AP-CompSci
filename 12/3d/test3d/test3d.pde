//Trevor Chen
//24/5/24
//2-4

float rotX, rotY, rotZ, tempx, tempy, tempz;

void setup() {
  fullScreen(P3D);
  rotX = radians(tempx);
  rotY = radians(5);
  rotZ = radians(5);
}

void draw() {
  background(255);
  spher(width/2+200, height/2+100, 300, 0, 100);
  cube(width/2-200, height/2-100, 300, 0, 100, 100);
  cube(width/2-200, height/2-100, 300, 0, 100, 0);
}

void spher(float tX, float tY, float tZ, float c, float s) {
  pushMatrix();
  translate(tX, tY, tZ);
  noFill();
  stroke(c, 50);
  rotateX(rotX);
  rotateY(rotY);
  rotateZ(rotZ);
  sphere(s);
  popMatrix();
}

void cube(float tX, float tY, float tZ, float c, float s, float o) {
  pushMatrix();
  translate(tX, tY, tZ);
  noFill();
  stroke(c, 50);
  rotateX(rotX);
  rotateY(rotY);
  rotateZ(rotZ);
  translate(o, o, o);
  box(s, s, s); // w h d
  popMatrix();
}

void mouseDragged() {
  rotX += (pmouseY - mouseY)*.02;
  rotY += (pmouseX - mouseX)*.02;
}

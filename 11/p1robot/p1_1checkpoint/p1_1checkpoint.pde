// Trevor Chen
//2-2
//22/2/27

color beige = #fdf0d5;
color red = #c1121f;
color black = #000000;
color blue = #669bbc;

void setup() {
  size(800, 600);
}

void draw() {
  background(beige);
  face(200, 100);
}

void face(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  skin();
  hair();
  eye(100, 200);
  eye(300, 200);
  mouth();
  popMatrix();
}

void skin() {
  fill(blue);
  stroke(black);
  strokeWeight(3);
  rect(0, 0, 400, 400);
}

void hair() {
  strokeWeight(25);
  int x = 0;
  while (x <= 400) {
    line(x, -50, x, 50);
    x += 50;
  }
  strokeWeight(3);
}

void eye(int x, int y) {
  fill(beige);
  ellipse(x, y, 100, 50);
  fill(red);
  circle(x, y, 50);
  fill(black);
  circle(x, y, 25);
}

void mouth() {
  fill(beige);
  rect(100, 250, 200, 100);
  line(100, 300, 300, 300);
  line(150, 250, 150, 350);
  line(200, 250, 200, 350);
  line(250, 250, 250, 350);
}

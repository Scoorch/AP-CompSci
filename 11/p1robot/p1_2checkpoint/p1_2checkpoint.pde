// Trevor Chen
//2-2
//22/2/27

color beige = #fdf0d5;
color red = #c1121f;
color black = #000000;
color blue = #669bbc;

void setup() {
  size(800, 600);
  background(beige);
  
  //float steps = random(20);
  //for (float i = 0; i < steps; i++) {
  //  face(random(0, 600), random(0, 600), random(0.25, 1));
  //}
  
  int x, y;
  x = 50;
  y = 30;
  while ( y < 600 ) {
    face(x, y, 0.25);
    x += 150;
    if (x >= 800) {
      x = 50;
      y += 150;
    }
  }
}

void draw() {
  
}

void face(float x, float y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  
  skin();
  hair();
  eye(100, 150, random(-20, 20), random(-50, 50));//, random(.5, 1.5));
  eye(300, 150, random(-20, 20), random(-50, 50));//, random(.5, 1.5));
  mouth();
  popMatrix();
}

void skin() {
  fill(random(0, 255), random(0, 255), random(0, 255));
  stroke(black);
  strokeWeight(3);
  rect(0, 0, 400, 400);
}

void hair() {
  stroke(random(0, 255), random(0, 255), random(0, 255));
  strokeWeight(25);
  int x = 0;
  while (x <= 400) {
    line(x, -50, x, 50);
    x += 50;
  }
  strokeWeight(3);
}

void eye(int x, int y, float rx, float ry/*, float s*/) {
  pushMatrix();
  //scale(s);
  stroke(random(0, 255), random(0, 255), random(0, 255));
  fill(beige);
  ellipse(x + rx, y + ry, 100, 50);
  fill(random(0, 255), random(0, 255), random(0, 255));
  circle(x + rx, y + ry, 50);
  fill(black);
  circle(x + rx, y + ry, 25);
  popMatrix();
}

void mouth() {
  stroke(random(0, 255), random(0, 255), random(0, 255));
  fill(beige);
  rect(100, 250, 200, 100);
  line(100, 300, 300, 300);
  line(150, 250, 150, 350);
  line(200, 250, 200, 350);
  line(250, 250, 250, 350);
}

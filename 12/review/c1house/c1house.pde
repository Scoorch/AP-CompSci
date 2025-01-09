//Trevor Chen
//2-4
//24/2/6
float time;
int dayFlop;
float sunY = 450;

void setup() {
  size(800, 600);
  time = 0;
}
void draw() {
  noStroke();
  fill(255);
  rect(0, 0, width, height);
  if (dayFlop == 0) {
    if (sunY >= -50) {
      fill(50);
    } else {
      dayFlop = 1;
      sunY = height-150;
      fill(200);
    }
  } else {
    if (sunY >= -50) {
      fill(0, 0, 200, 100);
    } else {
      dayFlop = 0;
      sunY = height-150;
      fill(50);
    }
  }
  rect(0, 0, width, 350);
  if (dayFlop == 1) fill(255, 255, 0);
  else fill(255);
  circle(40, sunY, 50);
  sunY -= 1;
  println(sunY);
  fill(0, 150, 0);
  rect(0, 350, width, height-350);
  house(1);
}
void house(float scale) {
  stroke(1);
  pushMatrix();
  scale(scale);
  body();
  roof();
  windows();
  door();
  popMatrix();
}

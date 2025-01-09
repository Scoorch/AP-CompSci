//Trevor
//23/2/12
//2-4

float frameMin = 60;
int mode = 0;

void setup() {
  fullScreen(P2D);
  noStroke();
}

void draw() {
  println("frame rate: "+frameRate);
  if (frameRate < frameMin) {
    frameMin = frameRate;
  }
  println("frame minimum: "+frameMin);
  if (mode == 0) {
    cubes();
  } else if (mode == 1) {
    gradient();
  } else {
    tri();
  }
  button(width/2, height-150);
}

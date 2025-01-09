//Trevor Chen
//2-2
//23/3/7

float startX, startY, nichodainter;

void setup() {
  nichodainter = 0;
  
  size(600, 600);
  stroke(#402C00);
  strokeWeight(10);
  
  startX = 300;
  startY = 600;
  branch(300, 600, 2);
  
  
}

void branch(float x, float y, int lr) {
  if (sqrt((y - startY) * (y - startY) + sqrt((x - startX) * (x - startX)))) {
    noStroke();
    fill(#00C901);
    circle(x, y, 50);
    stroke(#402C00);
    return;
  }

  float tempX, tempY;
  
  tempX = random(10 + nichodainter, 30 + nichodainter);
  tempY = random(40, 60);
  
  if (lr == 0) { // left branch
    line(x, y, x - tempX, y - tempY);
    bSeqNeg(x, y, tempX, tempY);
  } else if (lr == 1) { // right branch
    line(x, y, x + tempX, y - tempY);
    bSeqPos(x, y, tempX, tempY);
  } else { // initial trunk
    line(x, y, x + tempX, y - tempY);
    line(x, y, x - tempX, y - tempY);
    bSeqTrunk(x, y, tempX, tempY);
  }
  nichodainter += 1;
  println(nichodainter);
}

void bSeqNeg(float x, float y, float tempX, float tempY) {
  int tempRan = (int)random(0, 5);
  if (tempRan == 0 || tempRan == 1) {
    branch(x - tempX, y - tempY, 0);
  } else if (tempRan == 2 || tempRan == 3) {
    branch(x - tempX, y - tempY, 1);
  } else {
    branch(x - tempX, y - tempY, 0);
    branch(x - tempX, y - tempY, 1);
  }
}
  
void bSeqPos(float x, float y, float tempX, float tempY) {
  int tempRan = (int)random(0, 5);
  if (tempRan == 0 || tempRan == 1) {
    branch(x + tempX, y - tempY, 0);
  } else if (tempRan == 2 || tempRan == 3) {
    branch(x + tempX, y - tempY, 1);
  } else {
    branch(x + tempX, y - tempY, 0);
    branch(x + tempX, y - tempY, 1);
  }
}

void bSeqTrunk(float x, float y, float tempX, float tempY) {
  int tempRan1 = (int)random(0, 5);
  if (tempRan1 == 0 || tempRan1 == 1) {
    branch(x - tempX, y - tempY, 0);
  } else if (tempRan1 == 2 || tempRan1 == 3) {
    branch(x - tempX, y - tempY, 1);
  } else {
    branch(x - tempX, y - tempY, 0);
    branch(x - tempX, y - tempY, 1);
  }
  int tempRan2 = (int)random(0, 3);
  if (tempRan2 == 0 || tempRan2 == 1) {
    branch(x + tempX, y - tempY, 0);
  } else if (tempRan2 == 2 || tempRan2 == 3) {
    branch(x + tempX, y - tempY, 1);
  } else {
    branch(x - tempX, y - tempY, 0);
    branch(x - tempX, y - tempY, 1);
  }
}

  // Trevor Chen
// 2-2
// 23/3/10

color dgr = 80; // dark grey
color lgr = 150; // light grey
color red = #CE0606;
color grn = #0FA718;
color blu = #0619BC;
color brn = #895C01;

void setup() {
  size(800, 600);
  background(10);
  
  colorMode(HSB);
  starSeq(-10, 810, -10, 280);
  colorMode(RGB);
  noStroke();
  fill(#0AC615);
  ellipse(700, 1200, 1000, 2000);
  pushMatrix();
  scale(.5);
  treeSeq(1200, 1600, 450, 800, 30); // back trees
  popMatrix();
  noStroke();
  fill(#18DB23);
  ellipse(200, 1000, 2000, 1500); // hill covers back trees
  treeSeq(0, 400, 250, 600, 40); // front trees
  houseSeq(400, 600, 300, 500);
}

void starSeq(float x1, float x2, float y1, float y2) {
  int steps = (int)random(3, 30);
  for (int i = 1; i < steps; i += 1) {
    float cRandS = random(0, 100); // random value for saturation of color
    float cRandB = random(0, 100); // brightness
    fill(40, 255 - cRandS, 255); // color here for random on each
    stroke(40, 255 - cRandS, 255);
    star(random(x1, x2), random(y1, y2));
  }
}

void star(float x, float y) {
  pushMatrix();
  translate(x, y);
  rect(-5, -5, 10, 10);
  for (int i = 0; i < 4; i += 1)  {
    triangle(-5, -5, 0, -20, 5, -5);
    rotate(HALF_PI);
  }
  popMatrix();
}

void tree(float x, float y) {
  trunk(x, y);
  branchSeq(x, y);
}

void treeSeq(float x1, float x2, float y1, float y2, float max) { // between x1 and x2, y1 and y2
  stroke(brn);
  int steps = (int)random(3, max);
  for (int i = 1; i < steps; i += 1) {
    tree(random(x1, x2), random(y1, y2));
  }
}


void trunk(float x, float y) {
  strokeWeight(8);
  line(x, y, x - 5 + random(0, 10), y + random(20, 30));
}

void branchSeq(float x, float y) {
  int steps = (int)random(3, 5);
  for (int i = 1; i < steps; i += 1) {
    branch(x, y);
  }
}

void branch(float x, float y) {
  strokeWeight(5);
  float eX = x - 40 + random(0, 80);
  float eY = y - random(30, 40);
  line(x, y, eX, eY);
  leaf(eX, eY);
}

void leaf(float x, float y) {
  noStroke();
  fill(grn);
  ellipse(x, y, random(20, 30), random(5, 20));
  stroke(brn);
}

void houseSeq(float x1, float x2, float y1, float y2) {
  stroke(0);
  strokeWeight(1);
  float yR = (y2 - y1)/10;
  while (yR <= y2 - y1) {
    int steps = (int)random(0, 1);
    for (int i = 0; i <= steps; i += 1) {
      house(random(x1, x2), yR + y1 + (y2 - y1)/10, random(30, 40), random(20, 30));
      println(i);
    }
    yR += (y2 - y1)/10;
  }
}

void house(float x, float y, float w, float h) {
  fill(dgr);
  roof(x, y, w);
  int c = (int)random(0, 3);
  if (c == 0) {
    fill(lgr);
  } else {
    if (c == 1) {
      fill(red);
    } else {
      fill(blu);
    }
  }
  walls(x, y, w, h);
  fill(255);
  window(x, y, w, h);
  window(x + w/2, y, w, h);

  door(x, y, w, h);
  fence(x, y, w, h);
}

// house functions
void roof(float x, float y, float w) {
  float hang = random(5, 10);
  triangle(x - hang, y, x + w/2, y - random (20, 70), x + hang + w, y);
}

void walls(float x, float y, float w, float h) {
  rect(x, y, w, h);
}

void window(float x, float y, float w, float h) {
  float wX = random(0, w/4); // offset from side
  float wY = random(0, h/4); // offset from top
  float wW = random(w/8, w/4); // window width
  float wH = random(h/8, h/4); // window height
  rect(x + wX, y + wY, wW, wH);
  line(x + wX + wW/2, y + wY, x + wX + wW/2, y + wY + wH);
  line(x + wX, y + wY + wH/2, x + wX + wW, y + wY + wH/2);
}

void door(float x, float y, float w, float h) {
  pushMatrix();
  translate(random(0, 3 * w/4), h - h/3);
  rect(x, y, w/4, h/3);
  int dLR = (int)random(0, 2); // doorknob on left/right side
  if (dLR == 0) {
    dLR = 0;
  } else {
    dLR = 2;
  }
  circle(x + (3 - dLR) * w/16, y + h/6, w/16); // offset of doorknob from edge of door
  popMatrix();
}

void fence(float x, float y, float w, float h) { // fence post width and distances messed up when small but whatever, also windows
  rect(x - (w - w/8)/5, y + h + h/7, w + 2 * ((w - w/8)/5), h/7);
  for (float i = -(w - w/8)/5; i <= w + w/5 - w/8; i += (w - w/8)/5) {
    rect(x + i, y + h - h/7, w/8, h/7 * 5);
  }
}

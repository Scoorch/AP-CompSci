//Trevor Chen
//2-2
//22/3/3

float tempX1, tempY1, tempX2, tempY2, bN;
void setup() {
  size(800, 600);
  translate(400, 500);
  tree();
}

void tree() {
  stroke(#644100);
  strokeWeight(20);
  strokeJoin(ROUND);
  bN = 1;
  
  trunk();
  branchSeq();
}

void branchSeq() {
  if (branchNum() == 0) {
    branch();
    branch();
  } else {
    branch();
  }
  bN += .5;
}

void trunk() {
  tempX1 = random(-5, 5);
  tempY1 = random(-50, -70);
  line(0, 0, tempX1, tempY1);
  tempX2 = tempX1 + random(-15, 15);
  tempY2 = tempY1 + random(-50, -70);
  //println(tempY1);
}
void branch() {
  println(branchD());
  line(tempX1, tempY1, tempX2, tempY2);
  if (branchD() == 0) {
    line(tempX1, tempY1, tempX2 * -1, tempY2);
    tempX1 = tempX2; // branch end linking
    tempY1 = tempY2;
    tempX2 = tempX2 + (((int)random(0, 2) == 0) ? random(-40, -30): random(30, 40)); // nicho is smort sometimes, SHORTHAND IF STATEMENT: <if this> ? <then> : <output>
    tempY2 = tempY2 + random(-50, -70);
    branchSeq();
  } else {
    tempX1 = tempX2; // branch end linking
    tempY1 = tempY2;
    tempX2 = tempX2 + (((int)random(0, 2) == 0) ? random(-40, -30): random(30, 40)); // nicho is smort sometimes, SHORTHAND IF STATEMENT: <if this> ? <then> : <output>
    tempY2 = tempY2 + random(-50, -70);
  }
}

int branchNum() { // % for more branches
  return (int)random(0, bN);
}

int branchD() { // % for double branches from 1 point
  return (int)random(0, 2);
  
}

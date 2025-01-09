//Trevor Chen
//2-2
//23/4/3

int press1, pressStart1, pressSeq1, bX1, bY1, squish1, tactile1; // is button pressed, sequence start (separate so sequence is over frames of draw), squish sequence, button x, y, amount squished, if hovered
int press2, pressStart2, pressSeq2, bX2, bY2, squish2, tactile2;

color mC1 = #A674C9; // main color for button 1
color tC1 = #C08DE5; // tactile color for button 1
color topC1; // top color for button 1
color sC1 = #712CA0; // shadow color fot button 1
color mC2 = #74C9B3;
color tC2 = #8DE5CE;
color topC2;
color sC2 = #2CA082;

void setup() {
  size(800, 600);
  pressSeq2 = 0;
  pressSeq1 = 0;
  squish1 = 2; // amound per stage button moves when pressed
  squish2 = 2; 
  bX1 = 200;
  bY1 = 300;
  bX2 = 600;
  bY2 = 300;
}

void draw() {
  if (press1 == 1) { //  this could have been inside each button but oops too late and lazy
    background(#D3B4E8);
  } else if (press2 == 1) {
    background(#B4E8DB);
  } else {
    background(#B4C2E8);
  }
  
  button1();
  button2();
  
}

void button1() {
  // squishy button 1
  if (dist(bX1 - squish1 * 6, bY1 - squish1 * 6, mouseX, mouseY) <= 100) {
    topC1 = tC1; // top color becomes tactile color
  } else {
    topC1 = mC1; // top color becomes non tactile (main) color
  }
  
  // goes up 1/5 every frame of draw, to slow down movement to be seen, only when button is pressed
  if (pressStart1 == 1 && pressSeq1 <= 5) { 
    pressSeq1 += 1;
    println(pressSeq1);
  } else if (pressStart1 == 0 && pressSeq1 >= 0) { // when button released button unpresses over frames of draw
    pressSeq1 -= 1;
    println(pressSeq1);
  }
  
  // i realize i couldve put multiplication of squish to be related to pressSeq, and made pressSeq into a function, but tooooooooooo lateeeeeeeeeeee ;D
  if (pressSeq1 <= 0) {
    stroke(0);
    circle(bX1 - squish1 * 6, bY1 - squish1 * 6, 200);
    fill(sC1);
    circle(bX1, bY1, 200);
    fill(topC1);
    noStroke();
    circle(bX1 - squish1 * 6, bY1 - squish1 * 6, 199);
  } else if (pressSeq1 == 1) {
    stroke(0);
    circle(bX1 - squish1 * 5, bY1 - squish1 * 5, 200);
    fill(sC1);
    circle(bX1, bY1, 200);
    fill(topC1);
    noStroke();
    circle(bX1 - squish1 * 5, bY1 - squish1 * 5, 199);
  } else if (pressSeq1 == 2) {
    stroke(0);
    circle(bX1 - squish1 * 4, bY1 - squish1 * 4, 200);
    fill(sC1);
    circle(bX1, bY1, 200);
    fill(topC1);
    noStroke();
    circle(bX1 - squish1 * 4, bY1 - squish1 * 4, 199);
  } else if (pressSeq1 == 3) {
    stroke(0);
    circle(bX1 - squish1 * 3, bY1 - squish1 * 3, 200);
    fill(sC1);
    circle(bX1, bY1, 200);
    fill(topC1);
    noStroke();
    circle(bX1 - squish1 * 3, bY1 - squish1 * 3, 199);
  } else if (pressSeq1 == 4) {
    stroke(0);
    circle(bX1 - squish1 * 2, bY1 - squish1 * 2, 200);
    fill(sC1);
    circle(bX1, bY1, 200);
    fill(topC1);
    noStroke();
    circle(bX1 - squish1 * 2, bY1 - squish1 * 2, 199);
  } else if (pressSeq1 >= 5) {
    stroke(0);
    circle(bX1 - squish1, bY1 - squish1, 200);
    fill(sC1);
    circle(bX1, bY1, 200);
    fill(topC1);
    noStroke();
    circle(bX1 - squish1, bY1 - squish1, 199);
  }
}

void button2() {
  // squishy button 2
  
  if (dist(bX2 - squish1 * 6, bY2 - squish1 * 6, mouseX, mouseY) <= 100) {
    topC2 = tC2;
  } else {
    topC2 = mC2;
  }
  
  if (pressStart2 == 1 && pressSeq2 <= 5) {
    pressSeq2 += 1;
    println(pressSeq2);
  } else if (pressStart2 == 0 && pressSeq2 >= 0) {
    pressSeq2 -= 1;
    println(pressSeq2);
  }
  
  if (pressSeq2 <= 0) {
    stroke(0);
    circle(bX2 - squish2 * 6, bY2 - squish2 * 6, 200);
    fill(sC2);
    circle(bX2, bY2, 200);
    fill(topC2);
    noStroke();
    circle(bX2 - squish2 * 6, bY2 - squish2 * 6, 199);
  } else if (pressSeq2 == 1) {
    stroke(0);
    circle(bX2 - squish2 * 5, bY2 - squish2 * 5, 200);
    fill(sC2);
    circle(bX2, bY2, 200);
    fill(topC2);
    noStroke();
    circle(bX2 - squish2 * 5, bY2 - squish2 * 5, 199);
  } else if (pressSeq2 == 2) {
    stroke(0);
    circle(bX2 - squish2 * 4, bY2 - squish2 * 4, 200);
    fill(sC2);
    circle(bX2, bY2, 200);
    fill(topC2);
    noStroke();
    circle(bX2 - squish2 * 4, bY2 - squish2 * 4, 199);
  } else if (pressSeq2 == 3) {
    stroke(0);
    circle(bX2 - squish2 * 3, bY2 - squish2 * 3, 200);
    fill(sC2);
    circle(bX2, bY2, 200);
    fill(topC2);
    noStroke();
    circle(bX2 - squish2 * 3, bY2 - squish2 * 3, 199);
  } else if (pressSeq2 == 4) {
    stroke(0);
    circle(bX2 - squish2 * 2, bY2 - squish2 * 2, 200);
    fill(sC2);
    circle(bX2, bY2, 200);
    fill(topC2);
    noStroke();
    circle(bX2 - squish2 * 2, bY2 - squish2 * 2, 199);
  } else if (pressSeq2 >= 5) {
    stroke(0);
    circle(bX2 - squish2, bY2 - squish2, 200);
    fill(sC2);
    circle(bX2, bY2, 200);
    fill(topC2);
    noStroke();
    circle(bX2 - squish2, bY2 - squish2, 199);
  }
}

void mousePressed() {
  if (dist(bX1 - squish1 * 6, bY1 - squish1 * 6, mouseX, mouseY) <= 100 ) { // b1
    press1 = 1;
    pressStart1 = 1;
    println(pressStart1);
  }
  
  if (dist(bX2 - squish2 * 6, bY2 - squish2 * 6, mouseX, mouseY) <= 100 ) { // b2
    press2 = 1;
    pressStart2 = 1;
    println(pressStart2);
  }
}

void mouseReleased() {
  if (press1 == 1) { // b1
    println(pressStart1);
    pressStart1 = 0;
    press1 = 0;
  }
  
  if (press2 == 1) { // b2
    println(pressStart2);
    pressStart2 = 0;
    press2 = 0;
  }
}

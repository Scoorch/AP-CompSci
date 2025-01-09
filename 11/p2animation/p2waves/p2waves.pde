// Trevor Chen
// 2-2
// 23/2/15

int angleSky, cycleDN, cloud1X, cloud2X, cloud3X, cloud4X, w1X1, w1X2, pause;
float bang, bvel, bacc, by, byvel, byacc;
void setup() {
  size(600, 600, P2D);
  angleSky = 230; // angle of sun/moon
  cycleDN = 0; // day(0)/night(1) cycle
  cloud1X = 0; // cloud1 X pos
  cloud2X = 200; // cloud2 X pos
  cloud3X = 350; // cloud3 X pos
  cloud4X = 450; // cloud4 X pos
  w1X1 = 0; // wave1 X pos for 1st wave in sequence
  w1X2 = -414; // wave2 X pos for 2nd wave in sequence
  bang = 0; // bang pow (boat angle)
  bvel = 0; // boat velocity
  bacc = 0; // boat acceleration
  pause = 0; // temp pause button
}

void draw() {
  // temp pause for looking at details of stuff without it moving
  if (keyPressed && key == 'p' || key == 'P') {
    if (pause == 0) {
      pause = 1;
    }
  }
  if (keyPressed && key == 'o' || key == 'O') {
    if (pause == 1) {
      pause = 0;
    }
  }
  println(pause);
  if (pause == 1) {
    return;
  }
  angleSky += 1;
  cloud1X += 2;
  cloud2X += 5;
  cloud3X += 3;
  cloud4X += 4;
  w1X1 += 1;
  w1X2 += 1;
  
  noStroke();
  background(200);
  
  if (angleSky > 315) {
    angleSky = 225;
    cycleDN += 1;
  }
  if (cycleDN > 1) { // flipflop
    cycleDN = 0;
  }
  if (cycleDN == 0) { // remove sky fill
    fill(#F6FF05, 100);
  } else {
    fill(100, 100); 
  }
  if (cloud1X > 700) {
    cloud1X = -100;
  }
  if (cloud2X > 700) {
    cloud2X = -100;
  }
  if (cloud3X > 700) {
    cloud3X = -100;
  }
  if (cloud4X > 700) {
    cloud4X = -100;
  }
  
  // sky
  pushMatrix();
  translate(300, 550);
  pushMatrix();
  rotate(radians(angleSky));
  arc(0, 0, 1250, 1250, radians(-45), radians(45)); // same time sky
  if (cycleDN == 1) {
    fill(#F6FF05, 100);
  } else {
    fill(100, 100);
  }
  arc(0, 0, 1250, 1250, radians(45), radians(315)); // opposite time sky, could be 4 wedges but too lazy to make another angle variable
  popMatrix();

  // sun/moon
  pushMatrix();
  rotate(radians(angleSky));
  if (cycleDN == 0) {
    fill(#F6FF05);
  } else {
    fill(255);
  }
  circle(500, 0, 50);
  fill(230, 255 * cycleDN);
  circle(508, -5, 15); // dark spots
  circle(507, -2, 10);
  circle(512, 7, 8);
  circle(493, -12, 5);
  circle(487, 3, 12);
  arc(492, 23, 25, 25, radians(209), radians(364));
  noFill();
  stroke(230, 255 * cycleDN);
  strokeWeight(2);
  arc(500, 0, 48, 48, radians(80), radians(139)); // smoothener line
  noStroke();
  popMatrix();
  popMatrix();
  
  // clouds
  fill(255);
  ellipse(cloud1X, 150, 50, 30);
  ellipse(cloud1X + 10, 140, 40, 40);
  ellipse(cloud1X + 25, 140, 60, 30);
  ellipse(cloud2X, 170, 50, 30);
  ellipse(cloud2X + 30, 180, 60, 40);
  ellipse(cloud2X + 50, 190, 30, 15);
  ellipse(cloud2X + 70, 180, 40, 20);
  ellipse(cloud3X, 65, 30, 10);
  ellipse(cloud3X + 5, 70, 30, 25);
  ellipse(cloud3X + 20, 75, 35, 15);
  ellipse(cloud4X, 250, 55, 25);
  ellipse(cloud4X + 10, 235, 50, 20);
  ellipse(cloud4X + 20, 245, 60, 25);
  ellipse(cloud4X + 40, 250, 45, 20);
  ellipse(cloud4X + 60, 240, 40, 15);
  
  // waves
  fill(#081E95);
  rect(0, 380, 600, 300);
  pushMatrix();
  scale(1.5); // DOES NOT AFFECT SIZE OF OBJECT JUST VISUAL REPRESENTATION for example in this case the edge of the wave chain is 414 not 621
  waveSeq(0, #0420CB);
  popMatrix();
  pushMatrix();
  scale(2);
  waveSeq(-50, #1329E5);
  popMatrix();
  
  // boat setup
  bacc = random(-0.1, 0.1);
  bvel += bacc; // more inbetween steps the smoother it is for some reason idk
  bang += bvel;
  if (bang > 20) {
    bang = 20;
    bvel = -.5;
  }
  if (bang <-20) {
    bang = -20;
    bvel = .5;
  }
  byacc = random(-0.1, 0.1);
  byvel += byacc;
  by += byvel;
  if (by > 25) {
    by = 25;
    byvel = -.5;
  }
  if (by <-25) {
    by = -25;
    byvel = .5;
  }
  
  // boat
  fill(#935B01);
  stroke(#5F3B01);
  strokeWeight(10);
  strokeCap(PROJECT); // square stroke doesnt reach end of fill, fill peeks out which is extremely annoying
  pushMatrix();
  translate(200, 450);
  rotate(radians(bang));
  arc(0, 0 + by/5, 150, 100, radians(0), radians(180));
  strokeCap(ROUND);
  line(-75, 0 + by/5, 75, 0 + by/5);
  line(20, 0 + by/5, 20, -100 + by/5);
  strokeWeight(2);
  line(-70, 14 + by/5, 70, 14 + by/5);
  line(-65, 24 + by/5, 65, 24 + by/5);
  line(-55, 34 + by/5, 55, 34 + by/5);
  line(-40, 44 + by/5, 40, 44 + by/5);
  noStroke();
  fill(255);
  triangle(-60, -10 + by/5, 15, -10 + by/5, 15, -100 + by/5);
  arc(56, 24 + by/5, 240, 263, radians(195), radians(250), OPEN);
  popMatrix();
  
  // more waves
  pushMatrix();
  scale(2.5);
  waveSeq(-75, #133EE5);
  popMatrix();
  pushMatrix();
  scale(3);
  waveSeq(-90, #1550E3);
  popMatrix();
  pushMatrix();
  scale(3.5);
  waveSeq(-100, #165EF5);
  popMatrix();
  
  
}

void waveSeq(int offsetY, color wc1) {
  for (int i = 0; i < 9; i++) { // i++ same as i += 1
    fill(wc1);
    wave(i*46 + w1X1, offsetY);
  
    if (w1X1 > 414) {
      w1X1 = -414;
    }
  }
  for (int i = 0; i < 9; i++) { // i++ same as i += 1
    fill(wc1);
    wave(i*46 + w1X2, offsetY);

    if (w1X2 > 414) {
      w1X2 = -414;
    }
  }
}

void wave(int waveX, int waveY) {
  beginShape();
  pushMatrix();
  translate(waveX, waveY);
  vertex(0, 274);
  vertex(4, 273);
  vertex(8, 271);
  vertex(9, 270);
  vertex(14, 266);
  vertex(22, 259);
  vertex(25, 257);
  vertex(30, 255);
  vertex(35, 255);
  vertex(40, 258);
  vertex(35, 262);
  vertex(33, 265);
  vertex(33, 269);
  vertex(35, 272);
  vertex(38, 273);
  vertex(48, 274);
  vertex(48, 300);
  vertex(0, 300);
  endShape();
  popMatrix();
}

// Trevor Chen
// 2-2
// 23/2/15

int angleSky, cycleDN, cloud1X, cloud2X, cloud3X, cloud4X, stageTFM;
float  lerpDiff;
void setup() {
  size(600, 600);
  angleSky = 230; // angle of sun/moon
  cycleDN = 0; // day(0)/night(1) cycle
  lerpDiff = 29.997; // difference between colors for human/werewolf with lerpcolor
  stageTFM = 9; // stage of transformation of human/werewolf for physical features, waits for end of day/night
  cloud1X = 0; // cloud1 X pos
  cloud2X = 200; // cloud2 X pos
  cloud3X = 350; // cloud3 X pos
  cloud4X = 450; // cloud4 X pos
}

void draw() {
  angleSky += 1;
  cloud1X += 2;
  cloud2X += 5;
  cloud3X += 3;
  cloud4X += 4;
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

  pushMatrix();
  rotate(radians(angleSky));
  if (cycleDN == 0) {
    fill(#F6FF05);
  } else {
    fill(255);
  }
  circle(500, 0, 50); // sun/moon
  popMatrix();
  popMatrix();
  fill(255); // clouds
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
  // background 
  fill(lerpColor(#52B706, #3A8604, lerpDiff/150));
  circle(550, 900, 1200);
  fill(lerpColor(#56C404, #3A8604, lerpDiff/200));
  circle(100, 700, 700);
  fill(lerpColor(#55CE00, #3A8604, lerpDiff/300));
  circle(300, 700, 600);

  
  // human/werewolf
  if (cycleDN == 0) { // static when middle of day/night, transforms only at ends
    if (angleSky > 300) {
      stageTFM += 1;
      lerpDiff += 3.333;
    } else {
      if (angleSky < 240) {
        stageTFM -= 1;
        lerpDiff -= 3.333;
      } else {
        lerpDiff = 0;
      }
    }
  } else {
    if (angleSky > 300) {
      stageTFM -= 1;
      lerpDiff -= 3.333;
    } else {
      if (angleSky < 240) {
        stageTFM += 1;
        lerpDiff += 3.333;
      }
    }
  }
  println("tfm:", stageTFM, "lerp:", lerpDiff, "DN:", cycleDN, "sky:", angleSky);
  fill(red(lerpColor(#FFD86C, 150, lerpDiff/300)), green(lerpColor(#FFD86C, 150, lerpDiff/300)), blue(lerpColor(#FFD86C, 150, lerpDiff/300))); // lerpColor on its own makes the fill transparent
  triangle(280, 290, 300, 290, 280, 282 - stageTFM); // ears
  triangle(320, 290, 300, 290, 320, 282 - stageTFM);
  rect(295, 325, 10, 10);
  beginShape(); // head, not ellipse because I want to change face shape for werewolf
  vertex(290, 270);
  vertex(310, 270);
  vertex(320, 280);
  vertex(325, 290);
  vertex(325 + stageTFM/10, 310 - stageTFM/15);
  vertex(320, 320 - stageTFM/5);
  vertex(310, 330); //
  vertex(300, 330 + stageTFM/10);
  vertex(290, 330); //
  vertex(280, 320 - stageTFM/5);
  vertex(275 - stageTFM/10, 310 - stageTFM/15);
  vertex(275, 290);
  vertex(280, 280);
  vertex(290, 270);
  endShape();
  rect(280, 335, 40, 70); // body
  stroke(red(lerpColor(#FFD86C, 200, lerpDiff/300)), green(lerpColor(#FFD86C, 200, lerpDiff/300)), blue(lerpColor(#FFD86C, 200, lerpDiff/300)));
  strokeWeight(14);
  line(280, 342, 270, 365); // arms
  line(320, 342, 330, 365);
  strokeWeight(12);
  line(332, 368, 332, 385);
  line(268, 368, 268, 385);
  strokeWeight(20);
  line(291, 405, 280, 430); // legs
  line(309, 405, 320, 430);
  strokeWeight(15);  
  line(280, 430, 280 + stageTFM/6, 460 - stageTFM/3);
  line(280 + stageTFM/6, 460 - stageTFM/3, 278, 460);
  line(278, 460, 275, 460);
  line(320, 430, 320 - stageTFM/6, 460 - stageTFM/3);
  line(320 - stageTFM/6, 460 - stageTFM/3, 322, 460);
  line(322, 460, 325, 460);
  noStroke();
  rect(280, 405, 40, 15);
  fill(50, 270 - 9 * stageTFM);
  arc(300, 300, 55, 65, radians(-150), radians(-30), OPEN); // hair
  fill(255);
  pushMatrix();
  translate(290, 295);
  rotate(radians(stageTFM));
  arc(0, 1, 13 + stageTFM/10, 10, radians(-180), radians(0)); // l eye
  arc(0, -1, 13 + stageTFM/10, 10, radians(0), radians(180));
  stroke(0);
  strokeWeight(2);
  arc(0, -1, 15, 15, radians(255), radians(285), OPEN); // l eyebrow
  noStroke();
  popMatrix();
  pushMatrix();
  translate(310, 295);
  rotate(radians(-stageTFM));
  arc(0, 1, 13 + stageTFM/10, 10, radians(-180), radians(0)); // r
  arc(0, -1, 13 + stageTFM/10, 10, radians(0), radians(180));
  stroke(0);
  arc(0, -1, 15, 15, radians(255), radians(285), OPEN);
  popMatrix();
  stroke(100);
  fill(#EAA3D9);
  line(288, 313, 312, 313); // mouth
  arc(300, 308, 27, 27, radians(30), radians(150), OPEN);
  noStroke();
  fill(255);
  triangle(294, 314, 290, 314, 292, 314 + stageTFM/6); // top teeth
  triangle(294, 314, 300, 314, 297, 314 + stageTFM/5);
  triangle(306, 314, 300, 314, 303, 314 + stageTFM/5);
  triangle(306, 314, 310, 314, 308, 314 + stageTFM/6);
  triangle(292, 318, 297, 320, 295, 319 - stageTFM/10); //
  triangle(297, 320, 303, 320, 300, 320 - stageTFM/6);
  triangle(308, 318, 303, 320, 305, 319 - stageTFM/10);
  fill(red(lerpColor(0, #FF0000, lerpDiff/100)), green(lerpColor(0, #FF0000, lerpDiff/100)), blue(lerpColor(0, #FF0000, lerpDiff/100)));
  circle(290, 295, 5); // pupils
  circle(310, 295, 5);
  fill(#EAEAEA, 270 - 9 * stageTFM);
  beginShape(); // shirt, not making shirt and body combined because lerpcolor wont make same shade of grey
  vertex(275, 335);
  vertex(325, 335);
  vertex(340, 360);
  vertex(325, 370);
  vertex(322, 365);
  vertex(322, 405);
  vertex(278, 405);
  vertex(278, 365);
  vertex(275, 370);
  vertex(260, 360);
  vertex(275, 335);
  endShape();
  fill(#3A4586, -15 + 9 * stageTFM);
  beginShape(); // loincloth
  vertex(280, 405);
  vertex(320, 405);
  vertex(318, 415);
  vertex(310, 412);
  vertex(305, 435);
  vertex(302, 433);
  vertex(298, 440);
  vertex(294, 428);
  vertex(290, 430);
  vertex(280, 405);
  endShape();
  fill(#0C21A5, 270 - 9 * stageTFM);
  beginShape(); // shorts
  vertex(280, 405);
  vertex(320, 405);
  vertex(330, 420);
  vertex(307, 430);
  vertex(300, 422);
  vertex(293, 430);
  vertex(270, 420);
  vertex(280, 405);
  endShape();
}

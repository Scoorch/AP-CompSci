int press1, pressStart1, pressSeq1, squish1, tactile1; // button taken from p4 checkpoint, adapted to be rect
int press2, pressStart2, pressSeq2, squish2, tactile2;
float mrewindbg; // music rewind bg
color mC1 = #A674C9; // main color for button 1, only 1 button color though
color tC1 = #C08DE5; // tactile color
color topC1; // top color for
color sC1 = #712CA0; // shadow color

void iSetup() {
  pressSeq1 = 0;
  squish1 = 2;

  pressSeq2 = 0;
  squish2 = 2;
}

void intro() {
  option.rewind();
  backg.play();
  mrewindbg += 1;
  println(mrewindbg);
  if (mrewindbg >= 8460) { // 2:21 = 141s = ~8460 frames
    backg.rewind();
    mrewindbg = 0;
  }

  background(0, 12, 12);

  textSize(150);
  fill(rainbowhell, 12, 6);
  text("BRAINCELL", 402, 202); // specifically nicholas's braincells :)
  text("POPPER", 402, 322);
  //text("tempplschange", 402, 202);
  fill(rainbowhell, 12, 12);
  text("BRAINCELL", 400, 200);
  text("POPPER", 400, 320);
  //text("tempplschange", 400, 200);
  if (rainbowhell < 12) {
    rainbowhell += 1;
  } else {
    rainbowhell = 0;
  }
  textSize(48);

  button1(300, 500);

  button2(300, 650);
}

void button1(float bX1, float bY1) {
  // squishy button 1
  if (mouseX >= 288 && mouseX <= 488 && mouseY >= 488 && mouseY <= 588) {
    topC1 = tC1;
  } else {
    topC1 = mC1;
  }

  // visual squish
  if (pressStart1 == 1 && pressSeq1 <= 5) {
    pressSeq1 += 1;
  }

  noStroke();
  fill(sC1);
  rect(bX1, bY1, 200, 100, 20); // bottom
  stroke(sC1);
  strokeWeight(40);
  line(bX1 - squish1 * (6 - pressSeq1) + 180, bY1 - squish1 * (6 - pressSeq1) + 20, bX1 + 179, bY1 + 20); // for some reason theres a small indent still
  line(bX1 - squish1 * (6 - pressSeq1) + 20, bY1 - squish1 * (6 - pressSeq1) + 80, bX1 + 20, bY1 + 79);
  fill(topC1);
  noStroke();
  rect(bX1 - squish1 * (6 - pressSeq1), bY1 - squish1 * (6 - pressSeq1), 200, 100, 20); // top
  fill(0);
  text("nichoisdumb", bX1 - squish1 * (6 - pressSeq1) + 100, bY1 - squish1 * (6 - pressSeq1) + 50);
}

void button2(float bX2, float bY2) {
  // squishy button 2
  if (mouseX >= 288 && mouseX <= 488 && mouseY >= 638 && mouseY <= 738) {
    topC1 = tC1;
  } else {
    topC1 = mC1;
  }

  // visual squish
  if (pressStart2 == 1 && pressSeq2 <= 5) {
    pressSeq2 += 1;
  }

  noStroke();
  fill(sC1);
  rect(bX2, bY2, 200, 100, 20); // bottom
  stroke(sC1);
  strokeWeight(40);
  line(bX2 - squish2 * (6 - pressSeq2) + 180, bY2 - squish2 * (6 - pressSeq2) + 20, bX2 + 179, bY2 + 20); // for some reason theres a small indent still
  line(bX2 - squish2 * (6 - pressSeq2) + 20, bY2 - squish2 * (6 - pressSeq2) + 80, bX2 + 20, bY2 + 79);
  fill(topC1);
  noStroke();
  rect(bX2 - squish2 * (6 - pressSeq2), bY2 - squish2 * (6 - pressSeq2), 200, 100, 20); // top
  fill(0);
  text("Options", bX2 - squish1 * (6 - pressSeq2) + 100, bY2 - squish2 * (6 - pressSeq2) + 50);
}

void introPress() {
  if (mouseX >= 288 && mouseX <= 500 && mouseY >= 488 && mouseY <= 600) { // g
    press1 = 1;
    pressStart1 = 1;
  }

  if (mouseX >= 288 && mouseX <= 500 && mouseY >= 638 && mouseY <= 750) { // o
    press2 = 1;
    pressStart2 = 1;
  }
}

void introRelease() {
  if (press1 == 1) { // game
    press1 = 0;
    pressSeq1 = 0;
    pressStart1 = 0;
    gSetup();
    mode = GAME;
  }

  if (press2 == 1) { // option
    press2 = 0;
    pressSeq2 = 0;
    pressStart2 = 0;
    circX = 500;
    mode = OPTIONS;
  }
}

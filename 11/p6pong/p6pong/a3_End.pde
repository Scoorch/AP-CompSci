void end() {
  backg.pause();
  lose.play();
  lbackg.play();
  mrewindlbg += 1;
  if (mrewindlbg >= 2520) {
    lbackg.rewind();
    mrewindlbg = 0;
  }

  background(#7fb581);
  fill(4, 12, 7);
  rect(width/2 - 10, 0, 20, height);
  rect(200, 600, 400, 150, 20);
  textSize(100);
  if (lWin) {
    text("YOU", 200, 300);
    text("WIN", 200, 400);
    text("YOU", 600, 300);
    text("LOSE", 600, 400);
  } else {
    text("YOU", 200, 300);
    text("LOSE", 200, 400);
    text("YOU", 600, 300);
    text("WIN", 600, 400);
  }
  fill(#7fb581);
  text("AGAIN?", 400, 675);
}

void endReleased() {
  if (mouseX >= 200 && mouseX <= 600 && mouseY >= 600 && mouseY <= 750);
  mode = INTRO;
  backg.rewind();
  lbackg.rewind();
  lbackg.pause();

  // paddlesetup
  padLX = 0;
  padLY = height/2;
  padLD = 150;

  padRX = width;
  padRY = height/2;
  padRD = 150;

  //ballsetup
  ballX = width/2;
  ballY = height/2;
  ballD = 80;
  ballVX = random(4, 6);
  ballVY = random(3, 5);
  if ((int)random(0, 2) == 0) {
    stdirX = -1;
  } else {
    stdirX = 1;
  }
  if ((int)random(0, 2) == 0) {
    stdirY = -1;
  } else {
    stdirY = 1;
  }

  introS = 0;
  scoreL = 0;
  scoreR = 0;
  scoreLim = 5;
  pauseOpacity = 0;
  lWin = false;
}

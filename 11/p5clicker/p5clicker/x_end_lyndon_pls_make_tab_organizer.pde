float mrewindlbg;

void end() {
  backg.pause();
  lose.play();
  lbackg.play();
  mrewindlbg += 1;
  if (mrewindlbg >= 2520) {
    lbackg.rewind();
    mrewindlbg = 0;
  }
  
  background(9, 12, 12);

  textSize(100);
  fill(0, 12, 6);
  text("GAME OVER :(", 402, 402);
  fill(0, 12, 12);
  text("GAME OVER :(", 400, 400);

  textSize(50);
  fill(0, 12, 6);
  text("Score: " + score, 402, 482);
  fill(0, 12, 12);
  text("Score: " + score, 400, 480);

  fill(0, 12, 6);
  text("Highscore: " + highscore, 402, 532);
  fill(0, 12, 12);
  text("Highscore: " + highscore, 400, 530);

  textSize(60);
  if (mouseX >= 298 && mouseX <= 500 && mouseY >= 570 && mouseY <= 630) {  // WHY NOT SYMMETRICAL off by 1 pixel
    fill(0, 12, 6);
    text("Continue!", 402, 602);
    fill(0, 12, 12);
    text("Continue!", 400, 600);
  } else {
    fill(0, 12, 6);
    text("Continue?", 402, 602);
    fill(0, 12, 12);
    text("Continue?", 400, 600);
  }
}

void endClicks() {
  
}

void endPress() {
  if (mouseX >= 310 && mouseX <= 490 && mouseY >= 570 && mouseY <= 630) {
    mode = INTRO;
    backg.rewind();
    lbackg.rewind();
    lbackg.pause();
  }
}

void endRelease() {
}

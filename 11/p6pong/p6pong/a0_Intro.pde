void intro() {
  backg.play();
  mrewindbg += 1;
  if (mrewindbg >= 8460) { // 2:21 = 141s = ~8460 frames
    backg.rewind();
    mrewindbg = 0;
  }

  background(10, 7, 12);

  fill(4, 7, 12);
  textSize(150);
  text("pong!", 400, 200);

  noStroke();
  if (mouseX >= 100 && mouseX <= 350 && mouseY >= 600 && mouseY <= 700) {
    stroke(0);
  }
  rect(100, 600, 250, 100, 20);
  noStroke();
  if (mouseX >= 500 && mouseX <= 750 && mouseY >= 600 && mouseY <= 700) {
    stroke(0);
  }
  rect(500, 600, 250, 100, 20);
  noStroke();

  fill(10, 7, 12);
  textSize(50);
  if (introS == 0) {
    text("1v1", 225, 650);
    text("Dumb AI", 625, 650);
  } else {
    text("First to 5", 225, 650);
    text("Unlimited", 625, 650);
  }
}

void introReleased() {
  if (introS == 0) {
    if (mouseX >= 100 && mouseX <= 350 && mouseY >= 600 && mouseY <= 700) {
      introS = 1;
    }
    if (mouseX >= 500 && mouseX <= 750 && mouseY >= 600 && mouseY <= 700) {
      mode = GAME;
      scoreLim = -1;
      ai = true;
    }
  } else {
    if (mouseX >= 100 && mouseX <= 350 && mouseY >= 600 && mouseY <= 700) {
      mode = GAME;
      scoreLim = 5;
    }
    if (mouseX >= 500 && mouseX <= 750 && mouseY >= 600 && mouseY <= 700) {
      mode = GAME;
      scoreLim = -1;
    }
  }
}

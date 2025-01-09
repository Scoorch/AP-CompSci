
void game() {
  mrewindbg += 1;
  if (mrewindbg >= 8460) {
    backg.rewind();
    mrewindbg = 0;
  }
  
  background(10, 4, 10);
  
  fill(5, 12, 8);
  rect(width/2 - 10, 0, 20, height);
  
  textSize(50);
  text(scoreL, 200, 200);
  text(scoreR, 600, 200);
  
  if (ai) AI();

  ballY = min(ballY, height);
  ballY = max(ballY, 0);

  if (scoreL == scoreLim) {
    lWin = true;
    mode = END;
  } else if (scoreR == scoreLim) {
    lWin = false;
    mode = END;
  }

  if (reset2) { // flip flop to wait out 1 frame of draw before delay
    delay(1500);

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

    ballVX = random(4, 6) * stdirX;
    ballVY = random(3, 5) * stdirY;
    reset2 = false;
    reset1 = false;
  }
  if (reset1) {
    ballX = 400;
    ballY = 400;
    ballVX = 0;
    ballVY = 0;
    reset2 = true;
  }

  circle(padLX, padLY, padLD);

  circle(padRX, padRY, padRD);

  // ball
  circle(ballX, ballY, ballD);

  // paddle movement
  if (wKey == true) {
    padLY -= 12;
  }
  if (sKey == true) {
    padLY += 12;
  }
  if (upKey == true) {
    padRY -= 12;
  }
  if (downKey == true) {
    padRY += 12;
  }

  // ball movement
  ballX += ballVX;
  ballY += ballVY;

  if (ballX <= 0 - ballD && reset1 == false) {
    lifeloss.play();
    scoreR += 1;
    reset1 = true;
  }
  if (ballX >= width + ballD && reset1 == false) {
    lifeloss.play();
    scoreL += 1;
    reset1 = true;
  }

  if (ballY <= 0 + ballD/2 || ballY >= height - ballD/2) {
    ballVY *= -1;
    click.rewind();
    click.play();
  }

  if (dist(padLX, padLY, ballX, ballY) <= padLD/2 + ballD/2) {
    rmult = random(6, 8);
    ballVX = (ballX - padLX)/rmult;
    ballVY = (ballY - padLY)/rmult;
    click.rewind();
    click.play();
  }
  if (dist(padRX, padRY, ballX, ballY) <= padRD/2 + ballD/2) {
    rmult = random(6, 8);
    ballVX = (ballX - padRX)/rmult;
    ballVY = (ballY - padRY)/rmult;
    click.rewind();
    click.play();
  }
}

void gameReleased() {
}

void AI() {
  if (padRY >= ballY + 8) {
    padRY -= 8;
  } else if (padRY > ballY) {
    padRY = ballY;
  }
  if (padRY <= ballY - 8) {
    padRY += 8;
  } else if (padRY < ballY) {
    padRY = ballY;
  }
}

void mouseReleased() {
  if (mode == INTRO) {
    introReleased();
  } else if (mode == GAME) {
    gameReleased(); // unused
  } else if (mode == PAUSE) {
    pauseReleased(); // unused
  } else if (mode == END) {
    endReleased();
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') wKey = true;
  if (key == 's' || key == 'S') sKey = true;
  if (ai == false) {
    if (keyCode == UP) upKey = true;
    if (keyCode == DOWN) downKey = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') wKey = false;
  if (key == 's' || key == 'S') sKey = false;
  if (ai == false) {
    if (keyCode == UP) upKey = false;
    if (keyCode == DOWN) downKey = false;
  }
  if (keyCode == ' '  && mode == GAME) {
    mode = PAUSE;
  } else if (keyCode == ' '  && mode == PAUSE) {
    mode = GAME;
    pauseOpacity = 0;
    backg.play();
  }
}
